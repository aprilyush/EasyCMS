using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.BasicData;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.BasicData.Controllers
{
    [Area("BasicData")]
    public class HotQuestionController : BaseController
    {
        private readonly HotQuestionAppService _hotApp;
        public HotQuestionController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _hotApp = service.GetRequiredService<HotQuestionAppService>();
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
            var data = _hotApp.Getdata(param);
            return Content(data.ToJson());
        }


        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public ActionResult Save(hot_question dto,string hot_image)
        {
            var user = RequestHelper.AdminInfo();
            dto.insert_id = user.Id;
            _hotApp.SaveTheme(dto, hot_image);
            return Success("保存成功");
        }

        public ActionResult GetModel(string id)
        {
            if (id.EmptyId())
            {
                return Error("数据不存在");
            }
            var result = new ResultAdaptDto();
            var data = _hotApp.GetModel(id);
            var images = _hotApp.GetRefImages(id);
            result.data.Add("model", data);
            result.data.Add("images", images);
            return Content(result.ToJson());
        }
        public ActionResult DeleteById(string id)
        {
            if (id.EmptyId())
            {
                return Error("删除失败");
            }
            _hotApp.DelByIds(id);
            return Success("删除成功");
        }
    }
}