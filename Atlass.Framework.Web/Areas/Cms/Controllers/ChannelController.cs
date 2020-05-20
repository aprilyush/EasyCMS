using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Cms;
using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Cms.Controllers
{
    [Area("Cms")]
    public class ChannelController : BaseController
    {
        private readonly ChannelAppService _channelApp;
        public ChannelController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _channelApp=service.GetRequiredService<ChannelAppService>();

        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetData()
        {
            var data = _channelApp.GetData();
            return Content(data.ToJson());
        }

        public ActionResult Form(int id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public IActionResult Save(cms_channel dto)
        {
            dto.channel_href = dto.channel_href ?? "";
            dto.channel_image = dto.channel_image ?? "";
            if (dto.id == 0)
            {
                dto.insert_id = RequestHelper.AdminInfo().Id;
                dto.insert_time = DateTime.Now;
                dto= _channelApp.Insert(dto);
            }
            else
            {
                _channelApp.Update(dto);
            }
            ChannelManagerCache.AddChannel(dto);
            return Success("保存成功");
        }


        public IActionResult GetModel(int id)
        {
           
            var result = new ResultAdaptDto();
            if (id > 0)
            {
                var model = _channelApp.GetDataById(id);
                result.data.Add("model", model);
            }

            var channels = _channelApp.ChannelZtree();
            result.data.Add("channels", channels);
            return Data(result);
        }

        /// <summary>
        /// 栏目数
        /// </summary>
        /// <returns></returns>
        public IActionResult GetChannelTree()
        {

            var result = new ResultAdaptDto();
            var channels = _channelApp.ChannelZtree();
            result.data.Add("channels", channels);
            return Data(result);
        }
        public IActionResult DeleteById(int id)
        {
            _channelApp.DelByIds(id);
            ChannelManagerCache.RemoveChannel(id);
            return Success("删除成功");
        }
    }
}