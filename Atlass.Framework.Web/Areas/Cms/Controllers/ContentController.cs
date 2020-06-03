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
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _contentApp = service.GetRequiredService<ContentAppService>();

        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetData(BootstrapGridDto dto)
        {
            int channelId = RequestHelper.GetQueryInt("channelId");
            var data = _contentApp.GetData(dto, channelId);
            return Data(data);
        }

        public ActionResult Form(int id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public IActionResult Save(cms_content dto)
        {
            dto.sub_title = dto.sub_title ?? "";
            dto.summary = dto.summary ?? "";
            dto.content = dto.content ?? "";
            dto.author = dto.author ?? "";
            dto.source = dto.source??"";
            dto.content_href = dto.content_href ?? "";
            dto.cover_image = dto.cover_image??"";
            var user = RequestHelper.AdminInfo();
           
            if (dto.id == 0)
            {
                dto.dept_id = user.DepartmentId;
                dto.insert_id = user.Id;
                if (dto.insert_time == DateTime.MinValue)
                {
                    dto.insert_time = DateTime.Now;

                }
                
                long contentId=_contentApp.Insert(dto);
                ChannelManagerCache.SetChannelLink(dto.channel_id, (int)contentId);
                //生成文章
                //GenerateContent generate = new GenerateContent();
                //generate.CreateHtml((int)contentId);
            }
            else
            {
                dto.update_id = dto.insert_id;
                dto.update_time = dto.insert_time;
                _contentApp.Update(dto);
                
                //生成文章
                // GenerateContent generate = new GenerateContent();
                //generate.CreateHtml(dto.id);
            }

            return Success("保存成功");
        }


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
            return Data(result);
        }


        public IActionResult DeleteById(int id)
        {
            _contentApp.DelByIds(id);
            return Success("删除成功");
        }
    }
}