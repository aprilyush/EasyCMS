using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Consulting;
using Atlass.Framework.AppService.Doctor;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Doctor.Controllers
{
    /// <summary>
    /// 快捷回复
    /// </summary>
    [Area("Doctor")]
    public class QuickInfoController : BaseController
    {
        private readonly QuestionInfoAppService _infoApp;

        private QuickInfoAppService _quickInfoApp;

        public QuickInfoController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _quickInfoApp = service.GetRequiredService<QuickInfoAppService>();
            _infoApp= service.GetRequiredService<QuestionInfoAppService>();


        }
        public IActionResult Index()
        {
            var user = RequestHelper.AdminInfo();
            var data = _infoApp.ExpertList(user);
            data.Insert(0, new DicKeyStrDto() { pid = "", name = "请选择" });
            ViewBag.ExpertList = new SelectList(data, "pid", "name");
            return View();
        }
        public IActionResult Init()
        {

            _quickInfoApp.Init();

            return Success("初始化成功");
        }

        public ActionResult GetData(BootstrapGridDto param)
        {
            string expertId = RequestHelper.GetQueryString("expertId", "");
            int qtype = RequestHelper.GetQueryInt("qtype");
            var user = RequestHelper.AdminInfo();
            var data = _quickInfoApp.GetData(param, expertId, qtype, user);
            return Content(data.ToJson());
        }

        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            var user = RequestHelper.AdminInfo();
            var data = _infoApp.ExpertList(user);
            data.Insert(0, new DicKeyStrDto() { pid = "", name = "请选择" });
            ViewBag.ExpertList = new SelectList(data, "pid", "name");
            return View();
        }

        public ActionResult SaveData(quick_reply dto,string images)
        {
            _quickInfoApp.SaveData(dto, images);

            return Success("添加成功");
        }
        public ActionResult DeleteById(string id)
        {
            _quickInfoApp.DeleteById(id);
            return Success("删除成功");
        }

        public ActionResult GetDataById(string id)
        {
            var result = new ResultAdaptDto();

            var model = _quickInfoApp.GetDataById(id);
            result.data.Add("model", model);

            return Content(result.ToJson());
        }
    }
}