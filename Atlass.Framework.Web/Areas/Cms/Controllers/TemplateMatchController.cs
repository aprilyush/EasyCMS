using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Cms;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Cms.Controllers
{
    [Area("Cms")]
    public class TemplateMatchController : BaseController
    {
        private readonly CmsTemplateAppService _tempApp;

        private readonly ChannelAppService channelApp;

        public TemplateMatchController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _tempApp = service.GetRequiredService<CmsTemplateAppService>();

        }

        /// <summary>
        /// 匹配模板
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:templatematch:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 匹配模板
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:templatematch:view")]
        [HttpGet]
        public IActionResult MatchList()
        {
            var list = _tempApp.MatchList();
            return JsonEx(list);
        }

        /// <summary>
        /// 匹配模板
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:templatematch:match")]
        [HttpGet]
        public IActionResult Match(int channelId)
        {
            var templates = _tempApp.GetAllTemplates();
            var match = _tempApp.TemplateMatch(channelId);
            var channelTS = templates.Where(s => s.template_mode == 2).ToList();
            var contentTs = templates.Where(s => s.template_mode ==3).ToList();
            channelTS.Insert(0, new cms_template { id = 0, template_name = "默认模板" });
            contentTs.Insert(0, new cms_template { id = 0, template_name = "默认模板" });
            ViewBag.ChannelId = channelId;
            ViewBag.ChannelName = match.channel_name;
            ViewBag.ChannelTS = new SelectList(channelTS, "id", "template_name", match.channel_template);
            ViewBag.ContentTS = new SelectList(contentTs, "id", "template_name",match.content_template);
            return View();
        }

        /// <summary>
        /// 设置模板匹配
        /// </summary>
        /// <param name="channelId"></param>
        /// <param name="templateId"></param>
        /// <param name="channelType"></param>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("cms:templatematch:match")]
        public IActionResult SetMatch(int channelId,int templateChannelId,int templateContentId)
        {
            _tempApp.SetMatch(channelId, templateChannelId, templateContentId);
            return Success();
        }
    }
}