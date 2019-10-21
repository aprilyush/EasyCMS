using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Altas.Framework.Common;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Altas.Framework.ViewModels;
using Altas.Framework.ViewModels.Common;
using Altas.Framework.AppService;
using Altas.Framework.Core.AltasDbContext;
using Altas.Framework.ViewModels.SystemApp;
using Animal.Adoption.Utils;
using Models;
using SqlSugar;

namespace Altas.Framework.AppService
{
    public class SysMenuAppService : BaseAppService
    {
        public SysMenuAppService(IAltasDbContext sqlContext)
            : base(sqlContext)
        {

        }

        /// <summary>
        /// 数据表格
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public List<sys_menu> GetMenuList(BootstrapGridDto param)
        {

            //int total = 0;
            var query = Sqldb.Queryable<sys_menu>().OrderBy(s=>s.menu_sort).ToList();
            return query;
        }

        /// <summary>
        /// 获取菜单表格
        /// </summary>
        /// <returns></returns>
        public List<sys_menu> GetMenuList()
        {
            var query = Sqldb.Queryable<sys_menu>()
               .OrderBy(s => s.menu_sort)
               .ToList();

            return query;
        }
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        public void AddMenu(sys_menu dto,string funcs)
        {

            dto.id = IdWorkerHelper.NewId();
            dto.create_time = DateTime.Now;
            dto.create_person = "admin";
            //dto.menu_icon = dto.menu_font;
            if (!string.IsNullOrEmpty(dto.menu_url))
            {
                dto.menu_type = 1;
            }
            if (dto.parent_id == 0)
            {
                dto.menu_level = 1;
            }
            else
            {
                dto.menu_level = Sqldb.Queryable<sys_menu>().Where(s => s.id == dto.parent_id).Select(s => s.menu_level)
                                     .First() + 1;
            }
            Sqldb.Insertable(dto).ExecuteCommand();

            //设置菜单下按钮
            if (dto.menu_type == 1 && !string.IsNullOrEmpty(funcs))
            {
                var funcArray = funcs.ToObject<List<SysFuncDto>>();
                var list = new List<sys_operate>();
                foreach (var func in funcArray)
                {
                    var funcModel = new sys_operate();
                    funcModel.menu_id = dto.id;
                    funcModel.func_cname = func.title;
                    funcModel.func_name = func.funcname;
                    funcModel.func_icon = func.icon;
                    funcModel.func_url = func.url;
                    funcModel.in_table = func.intable;
                    funcModel.func_sort = func.funcSort;
                    funcModel.id = func.id > 0 ? func.id : IdWorkerHelper.NewId();
                    list.Add(funcModel);
                }
                Sqldb.Insertable(list).ExecuteCommand();
            }

        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateMenu(sys_menu dto, string funcs)
        {

            if (!string.IsNullOrEmpty(dto.menu_url))
            {
                dto.menu_type = 1;
            }
            if (dto.parent_id == 0)
            {
                dto.menu_level = 1;
            }
            else
            {
                dto.menu_level = Sqldb.Queryable<sys_menu>().Where(s => s.id == dto.parent_id).Select(s => s.menu_level)
                                     .First() + 1;
            }
            Sqldb.Updateable(dto).IgnoreColumns(s => new { s.create_time, s.create_person }).ExecuteCommand();

            //设置菜单下按钮
            Sqldb.Deleteable<sys_operate>().Where(s => s.menu_id == dto.id).ExecuteCommand();
            if (dto.menu_type == 1 && !string.IsNullOrEmpty(funcs))
            {
                var funcArray = funcs.ToObject<List<SysFuncDto>>();
                var list = new List<sys_operate>();
                foreach (var func in funcArray)
                {
                    var funcModel = new sys_operate();
                    funcModel.menu_id = dto.id;
                    funcModel.func_cname = func.title;
                    funcModel.func_name = func.funcname;
                    funcModel.func_icon = func.icon;
                    funcModel.func_url = func.url;
                    funcModel.in_table = func.intable;
                    funcModel.func_sort = func.funcSort;
                    funcModel.id = func.id > 0 ? func.id : IdWorkerHelper.NewId();
                    list.Add(funcModel);
                }
                Sqldb.Insertable(list).ExecuteCommand();

            }
        }
        /// <summary>
        /// 单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_menu GetMenuById(string id)
        {

            return Sqldb.Queryable<sys_menu>().Where(s => s.id == SqlFunc.ToInt64(id)).First();
        }
        /// <summary>
        /// 获取菜单下按钮
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<SysFuncDto> GetMenuRefOpt(string id)
        {
            return
                Sqldb.Queryable<sys_operate>()
                    .Where(s => s.menu_id == SqlFunc.ToInt64(id))
                     .OrderBy(s => s.in_table)
                    .OrderBy(s => s.func_sort)
                    .Select(s => new SysFuncDto() { id = s.id, title = s.func_cname, funcname = s.func_name,
                        icon = s.func_icon, url = s.func_url, intable = s.in_table,funcSort=s.func_sort })
                    .ToList();
        }
        /// <summary>
        /// 模块导航
        /// </summary>
        /// <returns></returns>
        public List<sys_menu> GetTopMenuList()
        {

            var list = new List<sys_menu>();

            if (UserCookie.IsSuper)
            {
                list =
                    Sqldb.Queryable<sys_menu>()
                        .Where(s => s.parent_id==0)
                        .OrderBy(s => s.menu_sort)
                        .ToList();
            }
            else
            {
                list =
                    Sqldb.Queryable<sys_menu, sys_role_authorize>(
                        (m, r) => new object[] { JoinType.Inner, m.id == r.menu_id })
                        .Where((m, r) => r.role_id == UserCookie.SysRoleId && m.parent_id == 0)
                        .OrderBy((m, r) => m.menu_sort)
                        .Select((m, r) => m)
                        .ToList();
            }

            return list;


        }
        /// <summary>
        /// 根据权限获取菜单
        /// </summary>
        /// <returns></returns>
        public async Task<(List<RoleMenuDto>, List<RoleMenuDto>)> GetRoleMenu()
        {
            var list = new List<RoleMenuDto>();
            if (UserCookie.IsSuper)
            {
                list = await Sqldb.Queryable<sys_menu>().OrderBy(s => s.menu_sort).Select(s => new RoleMenuDto()
                {
                    id = s.id,
                    menu_name = s.menu_name,
                    menu_sort = s.menu_sort,
                    menu_url = s.menu_url,
                    parent_id = s.parent_id,
                    menu_type = s.menu_type,
                    menu_icon = s.menu_icon,
                   
                }).ToListAsync();

                var funcs = await Sqldb.Queryable<sys_operate>().OrderBy(m => m.func_sort).Select(m => new RoleMenuDto()
                {
                    id = m.id,
                    menu_name = m.func_cname,
                    func_name = m.func_name,
                    menu_url = m.func_url,
                    parent_id = m.menu_id,
                    menu_type = 3,
                    menu_icon = m.func_icon,
                    in_table = m.in_table,
                    menu_sort=m.func_sort
                }).ToListAsync();
                return (list, funcs);
            }
            else
            {
                list =
                    await Sqldb.Queryable<sys_menu, sys_role_authorize>(
                       (m, r) => new object[] { JoinType.Inner, m.id == r.menu_id })
                       .Where((m, r) => r.role_id == UserCookie.SysRoleId)
                       .OrderBy((m, r) => m.menu_sort)
                       .Select((m, r) => new RoleMenuDto()
                       {
                           id = m.id,
                           menu_name = m.menu_name,
                           menu_sort = m.menu_sort,
                           menu_url = m.menu_url,
                           parent_id = m.parent_id,
                           menu_type = m.menu_type,
                           menu_icon = m.menu_icon
                       }).ToListAsync();

                var funcs = await Sqldb.Queryable<sys_operate, sys_role_authorize>(
                            (m, r) => new object[] { JoinType.Inner, m.id == r.menu_id })
                        .Where((m, r) => r.role_id == UserCookie.SysRoleId)
                        .OrderBy((m, r) => m.func_sort)
                        .Select((m, r) => new RoleMenuDto()
                        {
                            id = m.id,
                            menu_name = m.func_cname,
                            //func_name = m.func_name,
                            menu_sort = m.func_sort,
                            menu_url = m.func_url,
                            parent_id = m.menu_id,
                            menu_type = 3,
                            menu_icon = m.func_icon,
                            in_table = m.in_table
                        }).ToListAsync();

                return (list, funcs);

            }
            return (list, new List<RoleMenuDto>()); ;
        }
        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="ids"></param>
        public void DelByIds(string ids)
        {
            try
            {
                if (!string.IsNullOrEmpty(ids))
                {
                    var idsArray = ids.Split(',');
                    long[] arri = idsArray.StrToLongArray();

                    Sqldb.Ado.BeginTran();
                    Sqldb.Deleteable<sys_menu>().In(idsArray).ExecuteCommand();
                    Sqldb.Deleteable<sys_operate>().Where(s => arri.Contains(s.menu_id)).ExecuteCommand();
                    Sqldb.Deleteable<sys_role_authorize>()
                        .Where(s => arri.Contains(s.menu_id) || arri.Contains(s.menu_pid))
                        .ExecuteCommand();
                    Sqldb.Ado.CommitTran();
                }
            }
            catch (Exception ex)
            {
                Sqldb.Ado.RollbackTran();
                throw ex;
            }

        }

        /// <summary>
        /// 删除操作
        /// </summary>
        /// <param name="funcId"></param>
        public void Delfunc(long funcId)
        {
            Sqldb.Deleteable<sys_operate>().Where(s => s.id == funcId).ExecuteCommand();
            Sqldb.Deleteable<sys_role_authorize>().Where(s => s.menu_id == funcId).ExecuteCommand();
        }

        public List<sys_operate> GetFuncSelList()
        {
            return Sqldb.Queryable<sys_operate>().OrderBy(s => s.func_sort).ToList();
        }



    }
}
