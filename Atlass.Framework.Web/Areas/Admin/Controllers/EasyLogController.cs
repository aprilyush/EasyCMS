using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class EasyLogController : BaseController
    {
        private readonly EasyLogAppService _logApp;
        public EasyLogController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _logApp = service.GetRequiredService<EasyLogAppService>();
        }


        [RequirePermission("system:log:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [RequirePermission("system:log:view")]
        [HttpPost]
        public ActionResult GetData(DataTableDto dto)
        {

            var log_type = RequestHelper.GetQueryString("logType", "0").ToInt();
            var log_summary = RequestHelper.GetQueryString("log_summary", "");
            var logDate = RequestHelper.GetQueryString("logDate", TimeHelper.FormatDate(DateTime.Now,"0"));
            var data = _logApp.GetList(dto, log_type, log_summary, logDate.ToDate());
            return Json(data);
        }

        [HttpGet]
        [RequirePermission("system:log:view")]
        public IActionResult Detail(int id)
        {
            ViewBag.Id = id;
            return View();
        }
        [HttpGet]
        [RequirePermission("system:log:view")]
        public ActionResult GetDataById(int id)
        {
            var result = new ResultAdaptDto();

            var model = _logApp.GetModel(id);
            result.data.Add("model", model);
            return Content(result.ToJson());
        }


        [HttpGet]
        [RequirePermission("system:log:delete")]
        public ActionResult DelByIds(string ids)
        {

            _logApp.DelByIds(ids);
            return Success();
        }

        [HttpGet]
        [RequirePermission("system:log:clear")]
        public IActionResult ClearTable()
        {
            _logApp.ClearTable();
            return Success();
        }
    }
}