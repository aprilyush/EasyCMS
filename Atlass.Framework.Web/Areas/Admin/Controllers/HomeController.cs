using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Wx;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : BaseController
    {
        private readonly SysMenuAppService _menuApp;
        public HomeController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _menuApp = service.GetRequiredService<SysMenuAppService>();
        }
        public IActionResult Index()
        {
            if (!RequestHelper.IsAdminLoggin())
            {
                return Redirect("/login/index");
            }
            var userDto = RequestHelper.AdminInfo();

            ViewBag.Id = userDto.Id.ToString();
            ViewBag.AccountName = userDto.AccountName;
            ViewBag.UserName = userDto.RealName;
            ViewData.Model = _menuApp.GetNaviMenu();
            return View();
        }
        public async Task<ActionResult> GetRoleMenu()
        {
            var result = new ResultAdaptDto();
            var menu = await _menuApp.GetRoleMenu(RequestHelper.AdminInfo());
            result.data.Add("menu", menu.Item1);
            result.data.Add("funcs", menu.Item2);
            return Content(result.ToJson());
        }



        /// <summary>
        /// 首页统计
        /// </summary>
        /// <returns></returns>
        public ActionResult GetChart()
        {
            var result = new ResultAdaptDto();
            try
            {
                var user = RequestHelper.AdminInfo();
             
                result.data.Add("user", user);
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                result.status =false;
            }

            return Content(result.ToJson());
        }

        /// <summary>
        /// 皮肤切换
        /// </summary>
        /// <returns></returns>
        public ActionResult SwitchSkin()
        {
            return View();
        }
    }
}