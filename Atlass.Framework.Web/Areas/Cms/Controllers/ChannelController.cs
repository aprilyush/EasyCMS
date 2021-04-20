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
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Cms.Controllers
{
    [Area("Cms")]
    public class ChannelController : BaseController
    {
        private readonly ChannelAppService _channelApp;
        public ChannelController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _channelApp=service.GetRequiredService<ChannelAppService>();

        }


        /// <summary>
        /// 栏目列表
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:channel:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 栏目列表
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:channel:view")]
        [HttpGet]
        public IActionResult GetData()
        {
            var data = _channelApp.GetData();
            return Json(data);
        }

        /// <summary>
        /// 栏目列表
        /// </summary>
        /// <returns></returns>
        [RequirePermission("cms:channel:add,cms:channel:edit")]
        [HttpGet]
        public ActionResult Form(int id)
        {
            ViewBag.Id = id;
            var subChannels = _channelApp.GetSubChannel(id);
            subChannels.Insert(0, new DicKeyDto { id = 0, name = "请选择子栏目链接" });
            ViewBag.SubChannels = new SelectList(subChannels, "id", "name");
            return View();
        }


        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="sub_channel"></param>
        /// <returns></returns>
        [RequirePermission("cms:channel:add,cms:channel:edit")]
        [HttpPost]
        public IActionResult Save(cms_channel dto,int sub_channel)
        {
            dto.channel_href = dto.channel_href ?? "";
            dto.channel_image = dto.channel_image ?? "";

            if (dto.link_type == 2)
            {
                if (sub_channel > 0)
                {
                    dto.channel_href = $"/channel/{sub_channel}";
                }
            }
            dto.update_by = RequestHelper.AdminInfo().LoginName;
            dto.update_time = DateTime.Now;
            if (dto.id == 0)
            {
                dto.create_by = dto.update_by;
                dto.create_time = DateTime.Now;
                dto= _channelApp.Insert(dto);
            }
            else
            {

                _channelApp.Update(dto);
            }
            ChannelManagerCache.AddChannel(dto);
            return Success("保存成功");
        }

        /// <summary>
        /// 获取栏目信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("cms:channel:add,cms:channel:edit")]
        [HttpGet]
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
            return Json(result);
        }

        /// <summary>
        /// 获取栏目信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("#")]
        [HttpGet]
        public IActionResult GetChannelTree()
        {

            var result = new ResultAdaptDto();
            var channels = _channelApp.ChannelZtree();
            channels.Insert(0, new ZtreeSelIntDto { id = 0, name = "首页" });
            result.data.Add("channels", channels);
            return Json(result);
        }

        /// <summary>
        /// 获取栏目信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("cms:channel:delete")]
        [HttpGet]
        public IActionResult DeleteById(int id)
        {
            _channelApp.DelByIds(id);
            ChannelManagerCache.RemoveChannel(id);
            return Success("删除成功");
        }
    }
}