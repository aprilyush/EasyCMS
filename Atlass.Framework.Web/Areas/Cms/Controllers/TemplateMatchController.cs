using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Cms;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Cms.Controllers
{
    [Area("Cms")]
    public class TemplateMatchController : BaseController
    {
        private readonly CmsTemplateAppService _tempApp;

        public TemplateMatchController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _tempApp = service.GetRequiredService<CmsTemplateAppService>();

        }
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 匹配列表
        /// </summary>
        /// <returns></returns>
        public IActionResult MatchList()
        {
            var ret = _tempApp.MatchList();
            var result = new ResultAdaptDto();
            result.data.Add("list", ret.matchs);
            result.data.Add("templates", ret.templates);
            return Data(result);
        }

        /// <summary>
        /// 设置模板匹配
        /// </summary>
        /// <param name="channelId"></param>
        /// <param name="templateId"></param>
        /// <param name="channelType"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult SetMatch(int channelId,int templateId,int channelType)
        {
            _tempApp.SetMatch(channelId, templateId, channelType);
            var ret = _tempApp.MatchList();
            var result = new ResultAdaptDto();
            result.data.Add("list", ret.matchs);
            return Data(result);
        }
    }
}