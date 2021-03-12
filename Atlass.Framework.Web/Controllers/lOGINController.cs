using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.Web.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Controllers
{
    public class LoginController : Controller
    {
        private readonly SysUserAppService _userApp;
        private readonly SysRoleAppService _roleApp;
        private readonly IAtlassRequest RequestHelper;
        public LoginController(SysUserAppService userApp, SysRoleAppService roleApp, IAtlassRequest AtlassRequestHelper)
        {
            _userApp = userApp;
            _roleApp = roleApp;
            RequestHelper = AtlassRequestHelper;
        }
        public IActionResult Index()
        {

            if (RequestHelper.IsAdminLoggin())
            {
                return Redirect("/admin/Home/Index");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Loginon(LoginDto loginModel)
        {
            if (string.IsNullOrEmpty(loginModel.uname))
            {
                ModelState.AddModelError("err", "用户名不能为空");
            }
            if (string.IsNullOrEmpty(loginModel.pwd))
            {
                ModelState.AddModelError("err", "密码不能为空");
            }
            try
            {
                var user = _userApp.LoginValidate(loginModel.uname.Trim(), loginModel.pwd.Trim());
                var loginUserDto = new LoginUserDto();
                if (user != null)
                {
                    loginUserDto.Id = user.id;
                    loginUserDto.LoginName = user.login_name;
                    loginUserDto.UserName = user.user_name;
                    loginUserDto.IsSuper = user.is_super==1;
                    loginUserDto.DeptId = user.dept_id;
                    loginUserDto.Avatar = user.user_avatar;
                    loginUserDto.RoleId = user.role_id;
                    loginUserDto.DeptName = user.dept_name;
                    loginUserDto.Gender = user.gender;
                    loginUserDto.Phone = user.mobile_phone;
                    loginUserDto.Email = user.email;
                    if (user.role_id > 0)
                    {
                        sys_role role = _roleApp.GetRoleById(user.role_id);
                        if (role != null)
                        {
                            loginUserDto.RoleCode = role.role_code;
                            loginUserDto.RoleName = role.role_name;
                        }
                    }
                   
                    //设置cookie
                    // FormsAuthentication.SetAuthCookie(loginUserDto.AccountName, false);
                    string claimstr = loginUserDto.ToJson();
                    RequestHelper.SetCookie(claimstr);

                    return Redirect("/admin/Home/Index");
                }
                ModelState.AddModelError("err", "用户名或密码错误");
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                ModelState.AddModelError("err", "登录异常");
            }

            return View("Index", loginModel);
        }

        /// <summary>
        /// 网站初始化访问
        /// </summary>
        /// <returns></returns>
        public ActionResult Init()
        {
            return Content("InitOk");
        }

        public ActionResult GetIp()
        {
            string ip = RequestHelper.GetClientIp();
            return Content(ip);
        }
        public ActionResult LogOff()
        {

            //HttpContext.SignOutAsync(LoginCookieDto.CookieScheme);
            RequestHelper.RemoveCookie();
            return RedirectToAction("Index", "Login");
        }
    }
}