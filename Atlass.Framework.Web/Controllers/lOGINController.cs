using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Common;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.Web.Models;
using IP2Region.Ex;
using IPTools.Core;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Controllers
{
    public class LoginController : Controller
    {
        private readonly SysUserAppService _userApp;
        private readonly SysRoleAppService _roleApp;
        private readonly IAtlassRequest RequestHelper;
        private readonly LoginInfoAppService loginInfoApp;
        public LoginController(IServiceProvider service)
        {
            _userApp = service.GetRequiredService<SysUserAppService>();
            _roleApp = service.GetRequiredService<SysRoleAppService>();
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            loginInfoApp=service.GetRequiredService<LoginInfoAppService>();
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
                login_info loginInfo = new login_info();
                var userAgent = RequestHelper.UserAgent();
                if (userAgent != null)
                {
                    loginInfo.login_name = loginModel.uname.Trim();
                    loginInfo.browser = userAgent.Browser;
                    loginInfo.device_info = userAgent.Device;
                    loginInfo.osinfo = userAgent.OS;
                    loginInfo.request_ip = userAgent.Ip;
                    loginInfo.request_time = DateTime.Now;
                    if (NetHelper.IsIntranetIP(loginInfo.request_ip))
                    {
                        loginInfo.real_address = "本地局域网";
                    }
                    else
                    {
                        var ipInfo=IpTool.Search(loginInfo.request_ip);
                        if (ipInfo != null)
                        {
                            loginInfo.real_address =$"{ipInfo.Province}-{ipInfo.City}";
                        }
                        //string filePath = AppDomain.CurrentDomain.BaseDirectory + @"data\ip2region.db";
                        //DbSearcher dbSearcher = new DbSearcher(filePath);
                        //var dataBlock = dbSearcher.BtreeSearch("120.195.209.125");
                        //loginInfo.real_address = dataBlock.ToString();
                    }
                 
                }
                var user = _userApp.LoginValidate(loginModel.uname.Trim(), loginModel.pwd.Trim());
                var loginUserDto = new LoginUserDto();
                if (user != null)
                {
                    if (user.user_avatar.IsEmpty())
                    {
                        user.user_avatar = "/ui/images/profile.jpg";
                    }
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

                    //插入登录信息
                    loginInfo.login_status = 1;
                    loginInfo.login_message = "登录成功";
                    loginInfoApp.InsertLoginInfo(loginInfo);

                    //设置cookie
                    // FormsAuthentication.SetAuthCookie(loginUserDto.AccountName, false);
                    string claimstr = loginUserDto.ToJson();
                    RequestHelper.SetCookie(claimstr);


                    return Redirect("/admin/Home/Index");
                }

                //插入登录信息
                loginInfo.login_message = "用户名或密码错误";
                loginInfoApp.InsertLoginInfo(loginInfo);
                ModelState.AddModelError("err", "用户名或密码错误");
            }
            catch (Exception e)
            {
                LoggerHelper.Exception(e);
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
            //throw new Exception("自定义500页面异常");
            return Content("InitOk");
        }

        [RequirePermission("login:getip")]
        public ActionResult GetIp()
        {
            string ip = RequestHelper.GetClientIp();
            return Content(ip);
        }




        [Route("login/error/{statusCode}")]
        [HttpGet]
        public IActionResult Error(int statusCode)
        {
            string viewName = "NotFind";
            ResultAdaptDto result = new ResultAdaptDto();
            switch (statusCode)
            {
                case 401:
                    viewName = "NoPermission";
                    result.message = "抱歉，没有操作权限";
                    break;
                case 404:
                    viewName = "NotFind";
                    result.message = "请求不存在，禁止访问";
                    break;
                case 500:
                    viewName = "InternalError";
                    result.message = "系统异常，请稍后再试";
                    break;
            }

            Response.StatusCode = statusCode;
            if (RequestHelper.IsAjax())
            {
                return Json(result);
            }

           
            return View(viewName);
        }

        /// <summary>
        /// 401 无权限
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult NoPermission()
        {
            return View();
        }
        /// <summary>
        /// 404内部异常
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult NotFind()
        {
            return View();
        }

        /// <summary>
        /// 500内部异常
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult InternalError()
        {
            return View();
        }
       

        /// <summary>
        /// 锁屏幕
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("#")]
        public IActionResult Lock()
        {
            var user = RequestHelper.AdminInfo();
            ViewData.Model = user;
            return View();
        }

        /// <summary>
        /// 解锁
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("#")]
        public IActionResult UnLock(string password)
        {
            var result = new ResultAdaptDto();
            result.status = false;
            if (password.IsEmpty())
            {
                result.message = "密码不能为空";
                return Json(result);
            }
            var loginUser = RequestHelper.AdminInfo();
            var user = _userApp.GetUserById(loginUser.Id);
            if (user == null)
            {
                result.statusCode = 403;
                return Json(result);
            }
            if (user.pass_word != password.Trim())
            {
                result.message = "密码错误";
                return Json(result);
            }
            result.status = true;
            return Json(result);
        }

        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult LogOut()
        {

            //HttpContext.SignOutAsync(LoginCookieDto.CookieScheme);
            RequestHelper.RemoveCookie();
            return RedirectToAction("Index", "Login");
        }
    }
}