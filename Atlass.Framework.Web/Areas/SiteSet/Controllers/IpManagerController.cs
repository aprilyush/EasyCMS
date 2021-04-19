using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.CmsSet;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Visit;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Enum;
using Atlass.Framework.Models.Cms;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.SiteSet.Controllers
{

    [Area("SiteSet")]
    public class IpManagerController : BaseController
    {
        private readonly IpManagerAppService _ipManagerApp;
        public IpManagerController(IServiceProvider service)
        {
            _ipManagerApp = service.GetRequiredService<IpManagerAppService>();
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
        }


        /// <summary>
        /// 访问限制列表页
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:ip:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 访问限制列表
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:ip:view")]
        [HttpPost]
        public IActionResult GetData(DataTableDto dto)
        {
            var data = _ipManagerApp.GetList(dto);
            return Json(data);
        }

        /// <summary>
        /// 访问限制表单
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:ip:add,site:ip:edit")]
        [HttpGet]
        public IActionResult Form(int id)
        {
            return View();
        }

        /// <summary>
        /// 访问限制列表页
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:ip:add,site:ip:edit")]
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
            long id = _ipManagerApp.SaveData(dto,RequestHelper.AdminInfo());
            if (id > 0)
            {
                dto.id = (int)id;
                if (dto.limit_enable==DataStatusConstant.ENABLE)
                {
                    IPHelper.AddIpRange(dto);
                }

            }
            else
            {
                if (dto.limit_enable== DataStatusConstant.ENABLE)
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
        /// <summary>
        /// 访问限制列表页
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:ip:add,site:ip:edit")]
        [HttpGet]
        public IActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            var model = _ipManagerApp.GetModel(id);
            result.data.Add("model", model);
            return Json(result);
        }

        /// <summary>
        /// 访问限制列表页
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:ip:delete")]
        [HttpGet]
        public IActionResult DeleteByIds(string ids)
        {
            var idsList = _ipManagerApp.DeleteByIds(ids);
            foreach (var id in idsList)
            {
                IPHelper.RemoveIpRange(id);
            }
            return Success("删除成功");
        }


        /// <summary>
        /// 访问限制列表页
        /// </summary>
        /// <returns></returns>
        [RequirePermission("site:ip:ban")]
        [HttpGet]
        public IActionResult BanIp(string ids)
        {
            var idsList = _ipManagerApp.BanIp(ids);
            foreach (var id in idsList)
            {
                IPHelper.RemoveIpRange(id);
            }
            return Success();
        }
    }
}