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
        public IActionResult Index()
        {
            return View();
        }

        public ActionResult GetData(BootstrapGridDto dto)
        {

            var log_type = RequestHelper.GetQueryString("log_type", "0").ToInt();
            var log_summary = RequestHelper.GetQueryString("log_summary", "");
            var data = _logApp.GetList(dto, log_type, log_summary);
            return Json(data);
        }

        public IActionResult Detail(int id)
        {
            ViewBag.Id = id;
            return View();
        }

        public ActionResult GetDataById(int id)
        {
            var result = new ResultAdaptDto();

            var model = _logApp.GetModel(id);
            result.data.Add("model", model);
            return Content(result.ToJson());
        }

        public ActionResult DelByIds(string ids)
        {

            _logApp.DelByIds(ids);
            return Success();
        }

        public IActionResult ClearTable()
        {
            _logApp.ClearTable();
            return Success();
        }
    }
}