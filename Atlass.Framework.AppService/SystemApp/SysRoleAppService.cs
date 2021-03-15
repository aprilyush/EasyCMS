using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Enum;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.AppService
{
    public class SysRoleAppService
    {
        private readonly IFreeSql Sqldb;
        public SysRoleAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 角色表格
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param)
        {
          
            var query = Sqldb.Queryable<sys_role>()
                .OrderBy(s => s.role_sort)
                .Count(out long total)
                .Page(param.page, param.limit).ToList();

            param.total = total;
            param.rows = query;

            return param;
        }

        /// <summary>
        /// 获取权限下拉
        /// </summary>
        /// <returns></returns>
        public List<ZtreeSelInt64Dto> GetRoleSelect()
        {
            var query = Sqldb.Queryable<sys_role>()
                .Where(s => s.role_status == DataStatusConstant.ENABLE)
                 .OrderBy(s => s.role_sort)
                 .ToList(s => new ZtreeSelInt64Dto { id = s.id, name = s.role_name });
            return query;
        }

        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        public void InsertRoleData(sys_role dto,LoginUserDto UserCookie)
        {
            dto.role_code = dto.role_code ?? string.Empty;
            dto.id = IdHelper.NewId();
            dto.create_person = UserCookie.LoginName;
            dto.create_time=DateTime.Now;
            Sqldb.Insert(dto).ExecuteAffrows();

        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateRoleData(sys_role dto)
        {
            dto.role_code = dto.role_code ?? string.Empty;

            Sqldb.Update<sys_role>().SetSource(dto).IgnoreColumns(s => new {s.create_person, s.create_time }).ExecuteAffrows();
        }

        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_role GetRoleById(long id)
        {
            return Sqldb.Queryable<sys_role>().Where(s => s.id == id).First();
        }

        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="ids"></param>
        public void DelRoleByIds(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idsArray = ids.SplitToArrayInt64();

                Sqldb.Delete<sys_role>().Where(s=> idsArray.Contains(s.id)).ExecuteAffrows();
                Sqldb.Delete<sys_role_authorize>().Where(s => idsArray.Contains(s.role_id)).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 获取角色菜单权限
        /// </summary>
        /// <param name="roleid"></param>
        /// <returns></returns>
        public List<sys_menu> GetRoleAuthMenu(long roleid)
        {
           var data=
                Sqldb.Select<sys_menu, sys_role_authorize>()
                     .LeftJoin((m, r) => m.id == r.menu_id)
                    .Where((m,r)=> r.role_id == roleid)
                    .ToList((m, r) => m);

            return data;
        }

        public List<ZtreeDto> GetRoleMenuTree(long roleid)
        {
            //所有菜单
            var menu = Sqldb.Queryable<sys_menu>().OrderBy(s => s.menu_sort).ToList(s => new ZtreeDto()
            {
                id = s.id.ToString(),
                name = s.menu_name,
                pId = s.parent_id.ToString()
            });

            var func =
                Sqldb.Select<sys_operate, sys_menu>()
                     .LeftJoin((o, m) => o.menu_id == m.id)

                     .ToList((o, m) => new ZtreeDto()
                    {
                        id = o.id.ToString(),
                        pId = o.menu_id.ToString(),
                        name = o.func_title
                    });
            menu.AddRange(func);
            //所有权限
            var role =
                Sqldb.Queryable<sys_role_authorize>()
                    .Where(s => s.role_id == roleid)
                    .ToList(s => new{s.menu_id,s.menu_pid});

            //判断是否有权限
            if (role.Any())
            {
                foreach (var item in menu)
                {
                    var isok = role.Where(s => s.menu_id == item.id.ToInt64() &&s.menu_pid == item.pId.ToInt64()).Count();

                    if (isok > 0)
                    {
                        item.checkstate =true;
                    }
                }
            }


            return menu;
        }
        /// <summary>
        /// 保存权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="ids"></param>
        public void SaveRoleAuth(long roleId, string ids,LoginUserDto UserCookie)
        {
            Sqldb.Delete<sys_role_authorize>().Where(s => s.role_id ==roleId).ExecuteAffrows();

            if (!string.IsNullOrEmpty(ids))
            {
                var list = new List<sys_role_authorize>();

                //var menuIds = ids.Split(',');
                var menuIds = ids.ToObject<List<ZtreeDto>>();
                foreach (var mid in menuIds)
                {
                    mid.pId = mid.pId ?? "0";
                    var model=new sys_role_authorize();
                    model.id = IdHelper.NewId();
                    model.role_id = roleId.ToInt64();
                    model.menu_id = mid.id.ToInt64();
                    model.menu_pid = mid.pId.ToInt64();
                    model.create_time = DateTime.Now;
                    model.create_person = UserCookie.LoginName;
                    list.Add(model);
                }


                if (list.Any())
                {
                    Sqldb.Insert(list).ExecuteAffrows();
                }
            }

        }

        /// <summary>
        /// 根据权限获取操作按钮
        /// </summary>
        /// <param name="menuId"></param>
        /// <returns></returns>
        public List<sys_operate> GetOperateByRole(long menuId, LoginUserDto UserCookie)
        {
            var list=new List<sys_operate>();
            if (UserCookie.IsSuper)
            {
                list =
                    Sqldb.Select<sys_operate, sys_menu_ref_operate>()
                         .LeftJoin((f, m) => f.id == m.operate_id && m.menu_id == menuId)
                        .ToList((f, m) => f).ToList();
            }
            else
            {
                list =
                   Sqldb.Select<sys_operate, sys_role_authorize>()
                   .LeftJoin((f, r) => f.id == r.menu_id)
                   .Where((f,r)=>r.role_id==UserCookie.RoleId&&r.menu_pid == menuId)
                       .ToList((f, m) => f);
            }

            return list;
        }
    }
}
