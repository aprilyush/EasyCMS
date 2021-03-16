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
        public DataTableDto GetData(DataTableDto param, string roleName, string roleCode)
        {
          
            var query = Sqldb.Queryable<sys_role>()
                .WhereIf(!roleName.IsEmpty(),s=>s.role_name.Contains(roleName))
               .WhereIf(!roleCode.IsEmpty(), s => s.role_code.Contains(roleCode))
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
            dto.id = IdHelper.NextId();
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
        /// 设置角色权限，获取对应角色权限
        /// </summary>
        /// <param name="roleid"></param>
        /// <returns></returns>
        public List<ZtreeSelInt64Dto> GetPermissions(long roleid)
        {
            //所有菜单
            var menu = Sqldb.Queryable<sys_menu>().OrderBy(s => s.menu_sort).ToList(s => new ZtreeSelInt64Dto()
            {
                id = s.id,
                name = s.menu_name,
                pId = s.parent_id
            });

            var func =
                Sqldb.Select<sys_operate, sys_menu>()
                     .LeftJoin((o, m) => o.menu_id == m.id)
                     .ToList((o, m) => new ZtreeSelInt64Dto()
                    {
                        id = o.id,
                        pId = o.menu_id,
                        name = o.func_title
                    });
            menu.AddRange(func);
            //所有权限
            var roleAuthors =
                Sqldb.Queryable<sys_role_authorize>()
                    .Where(s => s.role_id == roleid)
                    .ToList(s => new{s.menu_id,s.menu_pid});

            //判断是否有权限
            if (roleAuthors.Count>0)
            {
                Dictionary<long, long> dic = new Dictionary<long, long>();
                roleAuthors.ForEach(s =>
                {
                    dic.Add(s.menu_id, s.menu_pid);
                });

                foreach (var item in menu)
                {
                    if (dic.ContainsKey(item.id))
                    {
                        item.checkstate = true;
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
        public void SavePermissions(long roleId, string ids,LoginUserDto UserCookie)
        {
            Sqldb.Delete<sys_role_authorize>().Where(s => s.role_id ==roleId).ExecuteAffrows();

            if (!string.IsNullOrEmpty(ids))
            {
                var list = new List<sys_role_authorize>();

                //var menuIds = ids.Split(',');
                var menuIds = ids.ToObject<List<ZtreeSelInt64Dto>>();
                var nowTime = DateTime.Now;
                foreach (var mid in menuIds)
                {
                   
                    var model=new sys_role_authorize();
                    model.id = IdHelper.NextId();
                    model.role_id = roleId;
                    model.menu_id = mid.id;
                    model.menu_pid = mid.pId;
                    model.create_time = nowTime;
                    model.create_person = UserCookie.LoginName;
                    list.Add(model);
                }


                if (list.Any())
                {
                    Sqldb.Insert(list).ExecuteAffrows();
                }
            }

        }


    }
}
