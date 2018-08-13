using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Altas.Framework.AppService;
using Altas.Framework.Common;
using Altas.Framework.Core.Web;
using Microsoft.AspNetCore.Mvc;
using Altas.Framework.Models;

namespace Altas.Framework.Controllers
{
    public class HomeController : BaseController
    {
        private readonly SysMenuAppService _menuApp;

        public HomeController(SysMenuAppService menuApp)
        {
            _menuApp = menuApp;
        }
        public IActionResult Index()
        {
            var user = CookieHelper.GetUserLoginCookie();
            if (user != null)
            {
                var userDto = user.ToObject<LoginUserDto>();
                ViewBag.Id = userDto.Id.ToString();
                ViewBag.AccountName = userDto.AccountName;
                ViewBag.UserName = userDto.RealName;
            }
            return View();
        }
        public async Task<ActionResult> GetRoleMenu()
        {
            var user = CookieHelper.GetUserLoginCookie();
            var userDto = user.ToObject<LoginUserDto>();
            var result = new ResultAdaptDto();
            var menu = await _menuApp.GetRoleMenu();
            //var status = GetStatusDic();
            result.data.Add("menu", menu);
            result.data.Add("user", userDto);
           // result.data.Add("status", status);
            return Content(result.ToJson());
        }
        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
