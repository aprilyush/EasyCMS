using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Consulting;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Areas.Consulting.Controllers
{
    [Area("Consulting")]
    public class PatientController : BaseController
    {
        private readonly PatientAppService _patientApp;
        public PatientController(PatientAppService patientApp,IAtlassReuqestHelper reuqestHelper)
        {
            RequestHelper = reuqestHelper;
            _patientApp = patientApp;
        }
        public IActionResult Index()
        {
            return View();
        }

        public ActionResult GetData(BootstrapGridDto param)
        {
            string patientName = RequestHelper.GetQueryString("patientName", "");
            string patientOpenId = RequestHelper.GetQueryString("patientOpenId");
            var data = _patientApp.Getdata(param, patientOpenId, patientName);
            return Content(data.ToJson());
        }

        public IActionResult Detail(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        public IActionResult GetModel(string id)
        {
            var result = new ResultAdaptDto();
            var model = _patientApp.GetModel(id);
            result.data.Add("model", model);
            return Content(result.ToJson());
        }
    }
}