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

namespace Atlass.Framework.Web.Areas.BasicData
{
    [Area("BasicData")]
    public class QuestionThemeController : BaseController
    {
        private readonly QuestionThemeAppService _themeApp;
        public QuestionThemeController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _themeApp = service.GetRequiredService<QuestionThemeAppService>();
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
            var data = _themeApp.Getdata(param);
            return Content(data.ToJson());
        }


        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public ActionResult Save(question_theme dto)
        {
            var user = RequestHelper.AdminInfo();
            dto.insert_id = user.Id;
            _themeApp.SaveTheme(dto);
            return Success("保存成功");
        }

        public ActionResult GetModel(int id)
        {
            if (id==0)
            {
                return Error("数据不存在");
            }
            var result = new ResultAdaptDto();
            var data = _themeApp.GetModel(id);
            result.data.Add("model", data);
            return Content(result.ToJson());
        }
        public ActionResult DeleteById(int id)
        {
            if (id == 0)
            {
                return Error("删除失败");
            }
            _themeApp.DelByIds(id);
            return Success("删除成功");
        }
    }
}