using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Cache;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Generate;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Controllers.Cms
{
    
    public class ContentController : CmsController
    {

        private readonly GenerateAppService _contentApp;
        public ContentController(IServiceProvider service)
        {
            _contentApp = new GenerateAppService();
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



            //GenerateContent gen = new GenerateContent();
            //var ret = gen.GenerateContentHtml(channelId,id);
            //if (!ret.genStatus)
            //{
            //    return Redirect("/404.html");
            //}
            GenerateService generate = new GenerateService();
            var ret = generate.GenerateHtml(id, 0, 0);

            if (!ret.Status)
            {
                return Redirect("/404.html");
            }
            return Html(ret.Html);
        }


        /// <summary>
        /// 栏目页面
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        [Route("channel/{channelId:int}/{page:int?}")]
        [ResponseCache(Duration = 30, VaryByQueryKeys = new string[] { "channelId", "page" })]
        public IActionResult Channel(int channelId,int page=1)
        {
            //GenerateChannel generateChannel = new GenerateChannel();
            //var ret = generateChannel.GenerateChannelHtml(channelId, page);

            GenerateService generate = new GenerateService();
            var ret=generate.GenerateHtml(0, channelId, page);

            if (!ret.Status)
            {
                return Redirect("/404.html");
            }
            return Html(ret.Html);
        }
        public IActionResult GenerateHome()
        {
            //GenerateHome gen = new GenerateHome();
            //gen.GenerateHomeHtml();

            GenerateService generate = new GenerateService();
            generate.GenerateHtml(0, 0,0);
            var result = new ResultAdaptDto();
            return Json(result);
        }

        public IActionResult GetChannelTree()
        {
            GenerateAppService genData = new GenerateAppService();
            var channelTree = genData.GetChannelTree();
            return Json(channelTree);
        }

        public IActionResult Visit()
        {
            return Content("");
        }
    }
}