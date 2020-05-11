using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Consulting;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Areas.Consulting.Controllers
{
   
    [Area("Consulting")]
    public class PayChartController : BaseController
    {
        private readonly PayChartAppService _chartApp;
        public PayChartController(PayChartAppService chartApp, IAtlassReuqestHelper atlassReuqest)
        {
            RequestHelper = atlassReuqest;
            _chartApp = chartApp;
        }
        public IActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public ActionResult GetData(BootstrapGridDto dto)
        {
            string stime = RequestHelper.GetQueryString("stime");
            string etime = RequestHelper.GetQueryString("etime");
            var user = RequestHelper.AdminInfo();
            var data = _chartApp.GetData(dto, stime, etime, user);
            return Content(data.ToJson());
        }


        public ActionResult Pay(int id)
        {
            _chartApp.PayToDoctor(id);
            return Success("结算成功");
        }
    }
}