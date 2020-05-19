using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Cache;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Generate;
using Atlass.Framework.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Controllers.Cms
{
    public class ContentController : CmsController
    {

        private readonly GenerateContentAppService _contentApp;
        public ContentController(IServiceProvider service)
        {
            _contentApp = new GenerateContentAppService();
        }

        /// <summary>
        /// 文章详情
        /// </summary>
        /// <param name="channelId"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [Route("news/{channelId:int}/{id:int}")]
        public IActionResult Index(int channelId,int id)
        {
            if (id == 0)
            {
                return Redirect("/404.html");
            }

          
            var template = ChannelManagerCache.GetContentTemplate(channelId);
            if (template == null)
            {
                return Redirect("/404.html");
            }
            var content = _contentApp.GetContentInfo(id);
            if (content == null)
            {
                return Redirect("/404.html");
            }
            GenerateContent gen = new GenerateContent();
            var ret = gen.GenerateContentHtml(content, template);
            if (!ret.genStatus)
            {
                return Redirect("/404.html");
            }
            return Html(ret.contentHtml);
        }


        /// <summary>
        /// 栏目页面
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        [Route("news/{channelId:int}")]
        public IActionResult Channel(int channelId)
        {
            GenerateChannel generateChannel = new GenerateChannel();
            var ret = generateChannel.GenerateChannelHtml(channelId);
            if (!ret.genStatus)
            {
                return Redirect("/404.html");
            }
            return Html(ret.contentHtml);
        }


        public IActionResult GenerateHome()
        {
            GenerateHome gen = new GenerateHome();
            gen.GenerateHomeHtml();
            return Content("ok");
        }
    }
}