using Atlass.Framework.AppService.Work;
using Atlass.Framework.Core.Base;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace Atlass.Framework.Web.Controllers
{
    public class HomeChartController : BaseController
    {
        private readonly HomeChartAppService _homeChartApp;
        public HomeChartController(IServiceProvider service)
        {
            _homeChartApp = service.GetRequiredService<HomeChartAppService>();
        }

        [RequirePermission("#")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [RequirePermission("#")]
        [HttpGet]
        public IActionResult GetChart()
        {
            var model = _homeChartApp.GetCmsSummary();
            var result = new ResultAdaptDto();
            result.Add("model", model);

            return Json(result);
        }
    }
}
