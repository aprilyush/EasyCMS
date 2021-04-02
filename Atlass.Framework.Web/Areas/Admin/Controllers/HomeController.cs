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

        private readonly SysRoleAppService roleApp;
        public HomeController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            roleApp = service.GetRequiredService<SysRoleAppService>();
        }
        public IActionResult Index()
        {
            if (!RequestHelper.IsAdminLoggin())
            {
                return Redirect("/login/index");
            }
            var userDto = RequestHelper.AdminInfo();

            ViewBag.Id = userDto.Id.ToString();
            ViewBag.AccountName = userDto.LoginName;
            ViewBag.UserName = userDto.UserName;
            ViewData.Model = roleApp.GetNaviMenu(userDto);
            return View();
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