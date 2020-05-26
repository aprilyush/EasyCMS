using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.CmsSet;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
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
        public IActionResult Index()
        {
            return View();
        }


        public IActionResult GetModel()
        {
            var result = new ResultAdaptDto();
            var model = _siteApp.GetModel();
            result.data.Add("model", model);
            return Content(result.ToJson());
        }
    }
}
