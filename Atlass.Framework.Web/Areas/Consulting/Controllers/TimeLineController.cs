using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Consulting;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Areas.Consulting.Controllers
{

    /// <summary>
    /// 咨询回合
    /// </summary>
    [Area("Consulting")]
    public class TimeLineController : BaseController
    {
        private PayHistoryAppService _payHistoryApp;

        public TimeLineController(PayHistoryAppService payHistoryApp)
        {
            _payHistoryApp = payHistoryApp;
        }
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 获取默认参数
        /// </summary>
        /// <returns></returns>
        public ActionResult GetDataById()
        {
            var result = new ResultAdaptDto();
            var model = _payHistoryApp.GetTimeline();
            result.data.Add("model", model);

            return Content(result.ToJson());
        }
        /// <summary>
        /// 保存数据
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveData(question_timeline dto)
        {
            dto.push_msg = dto.push_msg ?? string.Empty;
            _payHistoryApp.SaveTimeline(dto);
            return Success("保存成功");
        }


    }
}