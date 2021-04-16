using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.CmsSet;
using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.BasicData.Controllers
{
    [Area("BasicData")]
    public class SiteController : BaseController
    {

        private readonly SiteAppService _siteApp;
        public SiteController(IServiceProvider service)
        {
            _siteApp = service.GetRequiredService<SiteAppService>();
        }

        [RequirePermission("site:set:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 获取站点设置数据
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:set:view")]
        [HttpGet]
        public IActionResult GetSiteModel()
        {
            var result = new ResultAdaptDto();
            var model = _siteApp.GetModel();
            result.data.Add("model", model);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 保存站点设置
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("site:set:view")]
        public IActionResult SaveSite(cms_site dto)
        {
            var site=_siteApp.SaveSite(dto);
            SiteManagerCache.SetSiteInfo(site);
            return Success("保存成功");
        }

      
    }
}
