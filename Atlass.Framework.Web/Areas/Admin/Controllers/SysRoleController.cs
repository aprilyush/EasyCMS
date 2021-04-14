using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Altas.Framework.Admin
{
    [Area("Admin")]
    public class SysRoleController : BaseController
    {
        private readonly SysRoleAppService _roleApp;

        public SysRoleController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _roleApp = service.GetRequiredService<SysRoleAppService>();
        }
        /// <summary>
        /// 角色列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:role:view")]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 数据列表
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("system:role:view")]
        public ActionResult GetData(DataTableDto param)
        {
            string roleName = RequestHelper.GetPostString("roleName", "");
            string roleCode = RequestHelper.GetPostString("roleCode", "");
            var data = _roleApp.GetData(param, roleName, roleCode);
            return Json(data);
        }

        /// <summary>
        /// 角色表单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:role:add,system:role:edit")]
        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }



        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("system:role:add,system:role:edit")]
        public ActionResult SaveData(sys_role dto)
        {
            if (dto.id == 0)
            {
                _roleApp.InsertRoleData(dto,RequestHelper.AdminInfo());
            }
            else
            {
                _roleApp.UpdateRoleData(dto);
            }

            return Success();
        }

        /// <summary>
        /// 获取单个数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:role:edit")]
        public ActionResult GetRoleByIds(string id)
        {
            var result=new ResultAdaptDto();
            var data=_roleApp.GetRoleById(id.ToInt64());
            result.data.Add("model",data);
            return Json(result);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:role:delete")]
        public ActionResult DelRoleByIds(string ids)
        {
            _roleApp.DelRoleByIds(ids);

            return Success("删除成功");
        }

        /// <summary>
        /// 设置角色权限
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:role:permission")]
        public ActionResult SetPermission(string id,string roleName)
        {
            ViewBag.Id = id;
            ViewBag.RoleName = roleName;
            return View();
        }

        /// <summary>
        /// 权限菜单ztree
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        [RequirePermission("system:role:permission")]
        public ActionResult GetPermissions(string roleId)
        {
            var result = new ResultAdaptDto();
            
            var data = _roleApp.GetPermissions(roleId.ToInt64());

            result.data.Add("permsList", data);
            return Json(result);
        }
        /// <summary>
        /// 保存权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("system:role:permission")]
        public ActionResult SavePermissions(string roleId, string ids)
        {
            var result = new ResultAdaptDto();
            ////result.statusCodeCode = JuiJsonEnum.Ok;
            _roleApp.SavePermissions(roleId.ToInt64(),ids,RequestHelper.AdminInfo());

            return Json(result);
        }

        /// <summary>
        /// 获取前台按钮权限
        /// </summary>
        /// <returns></returns>
        [RequirePermission("#")]
        public ActionResult GetButtonPermission()
        {
            string author = RequestHelper.GetQueryString("author");
            if (author.IsEmpty()||author!="easycms")
            {
                return Error("请求权限失败");
            }

            LoginUserDto loginUserDto = RequestHelper.AdminInfo();
            ResultAdaptDto result = new ResultAdaptDto();
            var buttonTags = _roleApp.GetButtonPermissionList(loginUserDto.RoleId);
            result.Add("isAdmin", loginUserDto.IsSuper);
            result.Add("buttonPermissions", buttonTags);
            return Json(result);
        }

    }
}