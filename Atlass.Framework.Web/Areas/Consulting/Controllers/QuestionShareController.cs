using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Consulting;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models.question;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Atlass.Framework.Web.Areas.Consulting.Controllers
{

    [Area("Consulting")]
    public class QuestionShareController : BaseController
    {
        private readonly QuestionShareAppService _shareApp;

        public QuestionShareController(QuestionShareAppService infoApp, IAtlassReuqestHelper reuqestHelper)
        {
            RequestHelper = reuqestHelper;
            _shareApp = infoApp;
        }
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetData(BootstrapGridDto param)
        {
            //string id = RequestHelper.GetQueryString("id", "");
            //string stime = RequestHelper.GetQueryString("stime", "");
            //string etime = RequestHelper.GetQueryString("etime", "");
            var data = _shareApp.GetData(param);
            return Content(data.ToJson());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Form(int id)
        {
            ViewBag.Id = id;
            var categorys = _shareApp.GetCategory();
            ViewBag.Categorys = new SelectList(categorys, "id", "name");
            return View();
        }


        public ActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            var model = _shareApp.GetModel(id);
            result.data.Add("model", model);
            return Content(result.ToJson());
        }

        [HttpPost]
        public ActionResult Set(share_question dto)
        {
            _shareApp.Set(dto);
            return Success("设置成功");
        }

        public ActionResult DeleteById(int id)
        {
            _shareApp.DeleteById(id);
            return Success("删除成功");
        }
    }
}