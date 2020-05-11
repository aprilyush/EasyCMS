using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Doctor;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Doctor.Controllers
{
    /// <summary>
    /// 专家分类
    /// </summary>
    [Area("Doctor")]
    public class ExpertDicController : BaseController
    {
        private readonly ExpertDicAppService _expertApp;

        public ExpertDicController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _expertApp = service.GetRequiredService<ExpertDicAppService>();
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
            var data = _expertApp.GetData(param);
            return Content(data.ToJson());
        }


        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public ActionResult Save(expert_dic dto)
        {
            if (string.IsNullOrEmpty(dto.id))
            {
                _expertApp.InsertData(dto);
            }
            else
            {
                _expertApp.UpdateData(dto);
            }
            return Success("保存成功");
        }

        public ActionResult GetDataById(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Error("数据不存在");
            }
            var result = new ResultAdaptDto();
            var data = _expertApp.GetDataById(id.Trim());
            result.data.Add("model", data);
            return Content(result.ToJson());
        }
        public ActionResult DeleteById(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Error("删除失败");
            }
            _expertApp.DeleteById(id.Trim());
            return Success("删除成功");
        }
    }
}