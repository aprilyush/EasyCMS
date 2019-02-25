using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Altas.Framework.AppService;
using Altas.Framework.Common;
using Altas.Framework.Common.NLog;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;

namespace Altas.Framework.Controllers
{
    public class LoginController : Controller
    {
        private readonly SysUserAppService _userApp;

        public LoginController(SysUserAppService userApp)
        {
            _userApp = userApp;
        }
        public IActionResult Index()
        {
            var user = CookieHelper.GetUserLoginCookie();
            if (user != null)
            {
                return Redirect("/Home/Index");
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
                    loginUserDto.AccountName = user.account_name;
                    loginUserDto.RealName = user.real_name;
                    loginUserDto.IsSuper = user.is_super;
                    loginUserDto.City = user.city;
                    loginUserDto.County = user.county;
                   
                    loginUserDto.UserLevel = user.user_level;
                    //if (user.account_name.ToLower() == "admin")
                    //{
                    //    loginUserDto.IsSuper = true; //user.IsSuper;
                    //}
                    //else
                    //{
                    //    loginUserDto.IsSuper = user.is_super; //user.IsSuper;
                    //}
                    loginUserDto.SysRoleId = user.sys_role_id;
                    //设置cookie
                    // FormsAuthentication.SetAuthCookie(loginUserDto.AccountName, false);
                    string claimstr = loginUserDto.ToJson();
                    CookieHelper.WriteLoginCookie(claimstr);

                    return Redirect("/Home");
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

        public ActionResult LogOff()
        {

            HttpContext.SignOutAsync(LoginCookieDto.CookieScheme);
            CookieHelper.RemoveCooke();
            return RedirectToAction("Index", "Login");
        }
    }
}