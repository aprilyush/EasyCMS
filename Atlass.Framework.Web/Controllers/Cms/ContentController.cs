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

        private readonly ContentAppService _contentApp;
        public ContentController(IServiceProvider service)
        {
            _contentApp = service.GetRequiredService<ContentAppService>();
        }
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
            var content = _contentApp.GetDataById(id);
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
    }
}