using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Enum;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
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

            //移除全部权限
            PermissionCache.RemoveAllPermission(roleId);

        }

        /// <summary>
        /// 首页导航菜单全部
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public List<sys_menu> GetNaviMenu(LoginUserDto user)
        {

            //int total = 0;
            List<sys_menu> menus = new List<sys_menu>();
            if (user.IsSuper)
            {
                menus = Sqldb.Queryable<sys_menu>().OrderBy(s => s.menu_sort).ToList();
            }
            else
            {
                //获取权限缓存
                menus = PermissionCache.GetMenuPermission(user.RoleId);

                if (menus != null)
                {
                    return menus;
                }
                menus = Sqldb.Select<sys_menu, sys_role_authorize>()
                .InnerJoin((m, r) => m.id == r.menu_id)
                .Where((m, r) => r.role_id == user.RoleId)
                .OrderBy((m, r) => m.menu_sort)
                .ToList((m, r) => m);
            }

            if (menus.Count > 0)
            {
                List<string> roleTags = new List<string>();
                List<sys_menu> tops = menus.Where(s => s.parent_id == 0).ToList();
                tops.ForEach(menu =>
                {
                    menu.tab_id = CommHelper.GetMenuTabId(menu.menu_url.ToLower());
                    var sons = menus.Where(s => s.parent_id == menu.id).ToList();
                    sons.ForEach(son =>
                    {
                        son.tab_id = CommHelper.GetMenuTabId(son.menu_url.ToLower());
                        var sons2 = menus.Where(s => s.parent_id == son.id).ToList();
                        sons2.ForEach(s => {
                            s.tab_id = CommHelper.GetMenuTabId(s.menu_url.ToLower());
                        });
                        son.children = sons2;
                    });
                    menu.children = sons;
                });

                if (tops.Count > 0)
                {   // 设置权限缓存
                    PermissionCache.AddMenuPermission(user.RoleId, tops);
                }
                return tops;
            }
            return menus;
        }


        /// <summary>
        /// 获取前台按钮权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public List<RoleButtonPermissionDto> GetButtonPermissionList(long roleId)
        {
           
            List<RoleButtonPermissionDto> permissionList = PermissionCache.GetFrontOperatesPermission(roleId);
            if (permissionList != null)
            {
                return permissionList;
            }

            permissionList=new List<RoleButtonPermissionDto>();

            //菜单权限
            var menus = Sqldb.Select<sys_menu, sys_role_authorize>()
                .InnerJoin((m, r) => m.id == r.menu_id)
                .Where((m, r) => r.role_id == roleId && m.role_tag != "#")
                .ToList((m, r) => m);

            List<string> roleTags = new List<string>();

            if (menus.Count > 0)
            {
                //按钮权限
                var buttonRoleTags = Sqldb.Select<sys_operate, sys_role_authorize>()
                    .InnerJoin((o, r) => o.id == r.menu_id)
                    .Where((o, r) => r.role_id == roleId)
                    .ToList((o, r) => o);

                foreach (sys_menu menu in menus)
                {
                    //菜单权限标识
                    roleTags.Add(menu.role_tag.ToLower());

                    RoleButtonPermissionDto model = new RoleButtonPermissionDto();
                    model.menuId = CommHelper.GetMenuTabId(menu.menu_url.ToLower());
                    List<sys_operate> buttons = buttonRoleTags.Where(s => s.menu_id == menu.id).ToList();
                    foreach (sys_operate button in buttons)
                    {
                        model.add(button.role_tag.ToLower());
                        //操作权限标识
                        roleTags.Add(button.role_tag.ToLower());
                    }
                    permissionList.Add(model);
                }

            }

            //添加缓存
            if (permissionList.Count > 0)
            {
                PermissionCache.AddFrontOperatesPermission(roleId,permissionList);
            }
            if (roleTags.Count > 0)
            {
                PermissionCache.AddOperatePermission(roleId, roleTags);
            }
            return permissionList;
        }


        /// <summary>
        /// 获取菜单和操作权限字符串
        /// </summary>
        /// <param name="roleId"></param>
        public bool  HasPermission(long roleId,string permissionTags)
        {
            if (roleId == 0)
            {
                return false;
            }

            string[] permissionTagsArray = permissionTags.ToLower().Split(',');
            var permissionList = PermissionCache.GetOperatePermission(roleId);
            if (permissionList != null)
            {
                var tag = permissionList.Where(s => permissionTagsArray.Contains(s)).FirstOrDefault();
                if (tag == null)
                {
                    return false;
                }
                return true;
            }

            //没缓存的化直接取数据
            var menus = Sqldb.Select<sys_menu, sys_role_authorize>()
                .InnerJoin((m, r) => m.id == r.menu_id)
                .Where((m, r) => r.role_id == roleId)
                .ToList((m, r) => m.role_tag);
            
            var buttonRoleTags = Sqldb.Select<sys_operate, sys_role_authorize>()
                  .InnerJoin((o, r) => o.id == r.menu_id)
                  .Where((o, r) => r.role_id == roleId)
                  .ToList((o, r) => o.role_tag);

            List<string> roleTags = new List<string>();
            if (menus.Count > 0)
            {
                foreach(var menu in menus)
                {
                    if (menu.IsEmpty() || menu == "#")
                    {
                        continue;
                    }
                    roleTags.Add(menu);
                }
            }
            if (buttonRoleTags.Count > 0)
            {
                foreach (var btag in buttonRoleTags)
                {
                    if (btag.IsEmpty() || btag == "#")
                    {
                        continue;
                    }
                    roleTags.Add(btag);
                }
            }

            if (roleTags.Count > 0)
            {
                PermissionCache.AddOperatePermission(roleId, roleTags);

                var tag = roleTags.Where(s => permissionTagsArray.Contains(s)).FirstOrDefault();
                if (tag == null)
                {
                    return false;
                }
                return true;
            }

            return false;
        }
    }
}
