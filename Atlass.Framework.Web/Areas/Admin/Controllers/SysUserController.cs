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
        private readonly PositionAppService _positionApp;
        private readonly SysDepartmentAppService _deptApp;
        private readonly SysRoleAppService _roleApp;

        public SysUserController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _userApp = service.GetRequiredService<SysUserAppService>();
            _deptApp = service.GetRequiredService<SysDepartmentAppService>();
            _positionApp = service.GetRequiredService<PositionAppService>();
            _roleApp = service.GetRequiredService<SysRoleAppService>();
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
            var roles = _roleApp.GetRoleSelect();
            var positions = _positionApp.GetPositionSelectList();
            ViewBag.RoleList = roles;
            ViewBag.Positions = new SelectList(positions,"id","name");
            return View();
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
        public ActionResult SaveData(sys_user dto,List<long> position)
        {
            var exist = _userApp.CheckUserName(dto.login_name, dto.id);
            if (exist)
            {
                return Error("用户名已存在");
            }


            _userApp.SaveData(dto, position, RequestHelper.AdminInfo());


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
        public ActionResult removeAll(string ids)
        {
            if (ids.IsEmpty())
            {
                return Error("删除失败");
            }
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
            var user = RequestHelper.AdminInfo();
            ViewData.Model = user;
            ViewBag.PostGroup = _positionApp.GetUserPositionName(user.Id);
            ViewBag.LoginIp = RequestHelper.GetClientIp();
            return View();
        }

        /// <summary>
        /// 更新个人资料
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpdateProfile()
        {
            long id = RequestHelper.GetPostInt64("id", 0);
            string userName = RequestHelper.GetPostString("userName", "");
            string mobilePhone = RequestHelper.GetPostString("mobilePhone", "");
            string email = RequestHelper.GetPostString("email", "");
            int gender = RequestHelper.GetPostInt("gender", 2);
            if (id == 0)
            {
                return Error("用户不存在");
            }
            var user = _userApp.GetUserById(id);
            if (user == null)
            {
                return Error("用户不存在");
            }
            _userApp.UpdateProfile(id, userName, mobilePhone, email, gender);
            LoginUserDto userCookie = RequestHelper.AdminInfo();
            userCookie.UserName = userName;
            userCookie.Phone = mobilePhone;
            userCookie.Email = email;
            userCookie.Gender = gender;


            string claimstr = userCookie.ToJson();
            RequestHelper.SetCookie(claimstr);
            return Success("修改成功");
        }
        /// <summary>
        /// 重置密码
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult ResetPassword()
        {
            string id = RequestHelper.GetQueryString("id", "0");
            string loginName = RequestHelper.GetQueryString("loginName", "");
            if (id == "0")
            {
                LoginUserDto userDto = RequestHelper.AdminInfo();
                id = userDto.Id.ToString();
                loginName = userDto.LoginName;
            }
            ViewBag.Id = id;
            ViewBag.loginName = loginName;
            return View();
        }

        /// <summary>
        /// 更新密码
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public IActionResult UpdatePassword()
        {
            long id = RequestHelper.GetPostInt64("id",0);
            String oldPassword = RequestHelper.GetPostString("oldPassword", "");
            String newPassword = RequestHelper.GetPostString("newPassword", "");
            String accountName = RequestHelper.GetPostString("loginName", "");
            ResultAdaptDto resultAdaptDto = _userApp.UpdatePassword(id, accountName, oldPassword, newPassword);
            return Json(resultAdaptDto);
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