using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.AppService.Doctor;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Doctor.Controllers
{
    /// <summary>
    /// 首页banner图片
    /// </summary>
    [Area("Doctor")]
    public class BannerController : BaseController
    {
        private readonly BannerAppService _bannerApp;

        public BannerController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _bannerApp = service.GetRequiredService<BannerAppService>();
        }

        public IActionResult Index(int id)
        {
            ViewBag.Id = id;
            return View();
        }

        public ActionResult List()
        {
            return View();
        }
        public ActionResult GetList(BootstrapGridDto dto)
        {
            var data = _bannerApp.GetList(dto);
            return Content(data.ToJson());
        }
        public ActionResult Save(banner_info dto)
        {
            _bannerApp.Save(dto);

            return Success("保存成功");
        }

        public ActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            var model = _bannerApp.GetModel(id);
            result.data.Add("model", model);

            return Content(result.ToJson());
        }

        public ActionResult DeleteById(int id)
        {
            _bannerApp.DeleteById(id);
            return Success("删除成功");
        }
    }
}