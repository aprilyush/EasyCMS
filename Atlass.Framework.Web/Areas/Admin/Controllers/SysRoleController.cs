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
        public ActionResult GetRoleByIds(string id)
        {
            var result=new ResultAdaptDto();
            var data=_roleApp.GetRoleById(id.ToInt64());
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
            
            var data = _roleApp.GetRoleMenuTree(roleId.ToInt64());

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
            _roleApp.SaveRoleAuth(roleId.ToInt64(),ids,RequestHelper.AdminInfo());

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