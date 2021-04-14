using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Cache
{

    /// <summary>
    /// 角色权限缓存
    /// </summary>
    public class PermissionCache
    {
        /// <summary>
        /// 角色首页菜单缓存
        /// </summary>
        public static ConcurrentDictionary<long, List<sys_menu>> MenuPermissions = new ConcurrentDictionary<long, List<sys_menu>>();
        /// <summary>
        /// 前台按钮权限缓存
        /// </summary>
        public static ConcurrentDictionary<long, List<RoleButtonPermissionDto>> FrontOperates = new ConcurrentDictionary<long, List<RoleButtonPermissionDto>>();

        /// <summary>
        /// 后台RequirePermissionAttribute使用的菜单和操作权限标识判断
        /// </summary>
        public static ConcurrentDictionary<long, List<string>> OperatePermissions = new ConcurrentDictionary<long, List<string>>();
       

        /// <summary>
        /// 添加首页菜单权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="menusTags"></param>
        public static void AddMenuPermission(long roleId,List<sys_menu> menusTags)
        {
            MenuPermissions[roleId] = menusTags;
        }

        /// <summary>
        /// 移除角色的首页菜单权限
        /// </summary>
        /// <param name="roleId"></param>
        public static void RemoveMenuPermission(long roleId)
        {
            MenuPermissions.TryRemove(roleId, out List<sys_menu> menuTags);
        }

        /// <summary>
        /// 获取首页菜单权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public static List<sys_menu> GetMenuPermission(long roleId)
        {
            if (MenuPermissions.ContainsKey(roleId))
            {
                return MenuPermissions[roleId];
            }
            return null;
        }

        /// <summary>
        /// 添加后台权限过滤操作权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="menusTags"></param>
        public static void AddOperatePermission(long roleId, List<string> menusTags)
        {
            OperatePermissions[roleId] = menusTags;
        }

        /// <summary>
        /// 移除后台权限过滤的操作权限
        /// </summary>
        /// <param name="roleId"></param>
        public static void RemoveOperatePermission(long roleId)
        {
            OperatePermissions.TryRemove(roleId, out List<string> operateTags);
        }

        /// <summary>
        /// 获取后台权限过滤操作权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public static List<string> GetOperatePermission(long roleId)
        {
            if (OperatePermissions.ContainsKey(roleId))
            {
                return OperatePermissions[roleId];
            }
            return null;
        }


        /// <summary>
        /// 添加前台按钮操作权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="menusTags"></param>
        public static void AddFrontOperatesPermission(long roleId, List<RoleButtonPermissionDto> menusTags)
        {
            FrontOperates[roleId] = menusTags;
        }

        /// <summary>
        /// 移除前台按钮操作的权限
        /// </summary>
        /// <param name="roleId"></param>
        public static void RemoveFrontOperatesPermission(long roleId)
        {
            FrontOperates.TryRemove(roleId, out List<RoleButtonPermissionDto> operateTags);
        }

        /// <summary>
        /// 获取前台按钮操作权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public static List<RoleButtonPermissionDto> GetFrontOperatesPermission(long roleId)
        {
            if (FrontOperates.ContainsKey(roleId))
            {
                return FrontOperates[roleId];
            }
            return null;
        }


        /// <summary>
        /// 移除全部权限
        /// </summary>
        /// <param name="roleId"></param>
        public static void RemoveAllPermission(long roleId)
        {
            RemoveMenuPermission(roleId);
            RemoveFrontOperatesPermission(roleId);
            RemoveOperatePermission(roleId);
        }
    }
}
