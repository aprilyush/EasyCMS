using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using Altas.Framework.AppService;
using Altas.Framework.Common;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Altas.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;

namespace Altas.Framework.Admin
{
    public class SysRoleController : BaseController
    {
        private readonly SysRoleAppService _roleApp;

        public SysRoleController(SysRoleAppService roleApp)
        {
            _roleApp = roleApp;
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        /// <summary>
        /// 数据列表
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        //[HttpPost]
        public ActionResult GetData(BootstrapGridDto param)
        {
            var data=new BootstrapGridDto();

            data = _roleApp.GetData(param);
            return Content(data.ToJson());
        }

        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveData(sys_role dto)
        {
            if (dto.id == 0)
            {
                _roleApp.InsertRoleData(dto);
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
        public ActionResult GetRoleByIds(string id)
        {
            var result=new ResultAdaptDto();
            var data=_roleApp.GetRoleById(id);
            result.data.Add("model",data);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
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
        public ActionResult SetRoleAuth(string id)
        {
            ViewBag.Id = id;
            return View();
        }
        public ActionResult SetRoleAuthNew(string id,string roleName)
        {
            ViewBag.Id = id;
            ViewBag.RoleName = roleName;
            return View();
        }

        /// <summary>
        /// 获取权限菜单
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public ActionResult GetRoleAuthById(string roleId)
        {
            var result = new ResultAdaptDto();
            ////result.statusCodeCode=JuiJsonEnum.Ok;
            //result.Data = _roleApp.GetRoleAuthMenu(roleId);

            return Content(result.ToJson());
        }

        /// <summary>
        /// 权限菜单ztree
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public ActionResult GetRoleMenuTree(string roleId)
        {
            var result = new ResultAdaptDto();
            
            var data = _roleApp.GetRoleMenuTree(roleId);

            result.data.Add("roleMenu",data);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 保存权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveRoleAuth(string roleId, string ids)
        {
            var result = new ResultAdaptDto();
            ////result.statusCodeCode = JuiJsonEnum.Ok;
            _roleApp.SaveRoleAuth(roleId,ids);

            return Content(result.ToJson());
        }


        public ActionResult GetRoleMenuButton(string menuId)
        {
            var result = new ResultAdaptDto();
            //result.statusCode = true;
            //result.Data=_roleApp.GetOperateByRole(menuId);

            return Content(result.ToJson());
        }
	}
}