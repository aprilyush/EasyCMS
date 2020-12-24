using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Cms;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Visit;
using Atlass.Framework.Models.Cms;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Cms.Controllers
{

    [Area("Cms")]
    public class IpManagerController : BaseController
    {
        private readonly IpManagerAppService _ipManagerApp;
        public IpManagerController(IServiceProvider service)
        {
            _ipManagerApp = service.GetRequiredService<IpManagerAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Form(int id)
        {
            return View();
        }

        [HttpGet]
        public IActionResult GetData(BootstrapGridDto dto)
        {
            var data = _ipManagerApp.GetList(dto);
            return Data(data);
        }

        [HttpPost]
        public IActionResult Save(cms_ip_manager dto)
        {
         
            if (!IPHelper.IsIP(dto.start_ip))
            {
                return Error("起始IP地址错误");
            }
            if (!IPHelper.IsIP(dto.end_ip))
            {
                return Error("结束IP地址错误");
            }
            dto.start_ip_val = IPHelper.IPValue(dto.start_ip);
            dto.end_ip_val = IPHelper.IPValue(dto.end_ip);
            long id = _ipManagerApp.SaveData(dto);
            if (id > 0)
            {
                dto.id = (int)id;
                if (dto.enable)
                {
                    IPHelper.AddIpRange(dto);
                }

            }
            else
            {
                if (dto.enable)
                {
                    IPHelper.AddIpRange(dto);
                }
                else
                {
                    IPHelper.RemoveIpRange(dto.id);
                }

            }
            return Success("保存成功");

        }

        [HttpGet]
        public IActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            var model = _ipManagerApp.GetModel(id);
            result.data.Add("model", model);
            return Data(result);
        }

        [HttpGet]
        public IActionResult DeleteByIds(string ids)
        {
            var idsList = _ipManagerApp.DeleteByIds(ids);
            //foreach (var id in idsList)
            //{
            //    IPHelper.RemoveIpRange(id);
            //}
            return Success("删除成功");
        }
    }
}