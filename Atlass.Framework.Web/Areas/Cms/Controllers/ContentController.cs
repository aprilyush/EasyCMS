using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Cms;
using Atlass.Framework.Cache;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Generate;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Cms.Controllers
{
    [Area("Cms")]
    public class ContentController : BaseController
    {
        private readonly ContentAppService _contentApp;
        public ContentController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _contentApp = service.GetRequiredService<ContentAppService>();

        }


        /// <summary>
        /// 文章页面
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:content:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 文章数据
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:content:view")]
        [HttpPost]
        public IActionResult GetData(DataTableDto dto)
        {
            int channelId = RequestHelper.GetPostInt("channelId");
            int status = RequestHelper.GetPostInt("status",-1);
            int contentProperty = RequestHelper.GetPostInt("contentProperty",0); //0-全部，1-置顶，2-推荐
            string title = RequestHelper.GetPostString("title");
            var data = _contentApp.GetData(dto, channelId, title,status,contentProperty);
            return Json(data);
        }


        /// <summary>
        /// 文章表单
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:content:add,cms:content:edit")]
        [HttpGet]
        public ActionResult Form(int id)
        {
            int channelId = RequestHelper.GetQueryInt("channelId");
            if (channelId > 0)
            {
                var channel = ChannelManagerCache.GetChannel(channelId);
                ViewBag.ChannelName = channel.channel_name;
            }
            else
            {
                ViewBag.ChannelName = "";
            }
            ViewBag.Id = id;

            return View();
        }


        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [RequirePermission("cms:content:add,cms:content:edit")]
        [HttpPost]
        public IActionResult Save(cms_content dto)
        {
            _contentApp.SaveContent(dto, RequestHelper.AdminInfo());
            //生成文章
            //GenerateContent generate = new GenerateContent();
            //generate.CreateHtml((int)contentId);
            return Success("保存成功");
        }


        /// <summary>
        /// 获取文章信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("cms:content:add,cms:content:edit")]
        [HttpGet]
        public IActionResult GetModel(int id)
        {

            var result = new ResultAdaptDto();
            if (id > 0)
            {
                var model = _contentApp.GetDataById(id);
                result.data.Add("model", model);
            }

            //var channels = _contentApp.ChannelZtree();
            //result.data.Add("channels", channels);
            return Json(result);
        }

        /// <summary>
        /// 删除文章
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [RequirePermission("cms:content:delete")]
        [HttpGet]
        public IActionResult DeleteById(string ids)
        {
            _contentApp.DelByIds(ids);
            return Success("删除成功");
        }

        /// <summary>
        /// 置顶
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [RequirePermission("cms:content:top")]
        [HttpGet]
        public IActionResult SetTop(string ids)
        {
            _contentApp.SetTop(ids);
            return Success("删除成功");
        }

        /// <summary>
        /// 推荐
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [RequirePermission("cms:content:recomend")]
        [HttpGet]
        public IActionResult SetRecomend(string ids)
        {
            _contentApp.SetRecomend(ids);
            return Success("删除成功");
        }
        
    }
}