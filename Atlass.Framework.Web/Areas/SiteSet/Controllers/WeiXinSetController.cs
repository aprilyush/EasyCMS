using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.BasicData;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models.BaseData;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.BasicData.Controllers
{
    [Area("BasicData")]
    public class WeiXinSetController : BaseController
    {
        private readonly WeiXinSetAppService _weiXinSetApp;

        public WeiXinSetController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _weiXinSetApp = service.GetRequiredService<WeiXinSetAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetModel()
        {
            var result = new ResultAdaptDto();
            var model = _weiXinSetApp.GetModel();
            result.data.Add("model", model);
            return Content(result.ToJson());
        }

        [HttpPost]
        public IActionResult Save(weixin_set dto)
        {
            _weiXinSetApp.SaveSet(dto);

            return Success("保存成功");
        }
    }
}