using System;
using System.Collections.Generic;
using System.Linq;
using Atlass.Framework.AppService;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Altas.Framework.Admin
{
    [Area("Admin")]
    public class SysUserController : BaseController
    {
        private readonly SysUserAppService _userApp;
        private readonly SysDepartmentAppService _deptApp;

        public SysUserController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _userApp = service.GetRequiredService<SysUserAppService>();
            _deptApp = service.GetRequiredService<SysDepartmentAppService>();
        }

        /// <summary>
        /// 用户列表页面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 用户表单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            var role = _userApp.GetRoleList();
            role.Insert(0,new sys_role(){id = 0,role_name = "请选择"});
            ViewBag.RoleList = new SelectList(role, "id", "role_name");
            return View();
        }

        /// <summary>
        /// 获取所有用户
        /// </summary>
        /// <returns></returns>
        public ActionResult GetAllUser()
        {
            var data = _userApp.GetAllUser();
            return Json(data);
        }

        /// <summary>
        /// 数据表格
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetData(BootstrapGridDto param)
        {
            //var data = new DataGridEx();

            string loginName = RequestHelper.GetPostString("loginName");
            string userName = RequestHelper.GetPostString("userName");
            string phone = RequestHelper.GetPostString("phone");
            var data=_userApp.GetData(param, loginName, userName, phone);

            return Json(data);
            
        }

        /// <summary>
        /// 用户提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveData(sys_user dto,string refExperts)
        {
            var exist = _userApp.CheckUserName(dto.login_name, dto.id);
            if (exist)
            {
                return Error("用户名已存在");
            }

            dto.pass_word = Encrypt.DesEncrypt(dto.pass_word.Trim());
            if (dto.id == 0)
            {
                _userApp.InsertData(dto,RequestHelper.AdminInfo(), refExperts);
            }
            else
            {
                _userApp.UpdateData(dto, refExperts);
            }

            return Success();
        }

        /// <summary>
        /// 单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetUserById(string id)
        {
            var result=new ResultAdaptDto();

            if (!id.EmptyId())
            {
                var user = _userApp.GetUserById(id.ToInt64());
                result.data.Add("model", user);
            }
            var depts = _deptApp.GetDepartTree();
            result.data.Add("depts", depts);
            return Json(result);
        }
        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult DelUserByIds(string ids)
        {
            _userApp.DelUserByIds(ids);

            return Success("删除成功");
        }

        /// <summary>
        /// 个人资料
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Profile(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        /// <summary>
        /// 更新个人资料
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpdateProfile(sys_user dto)
        {
            dto.pass_word = Encrypt.DesEncrypt(dto.pass_word.Trim());
            _userApp.UpdateProfile(dto);
            return Success("修改成功");
        }


        /// <summary>
        /// 用户选择
        /// </summary>
        /// <returns></returns>
        public IActionResult UserSelect()
        {
            return View();
        }
    }
}