using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.BasicData;
using Atlass.Framework.Cache;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models.BaseData;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.BasicData.Controllers
{
    [Area("BasicData")]
    public class AdController : BaseController
    {

        private readonly AdAppService _adApp;
        public AdController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _adApp = service.GetRequiredService<AdAppService>();
        }


        [RequirePermission("site:ad:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 数据列表
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [RequirePermission("site:ad:view")]
        [HttpPost]
        public IActionResult GetData(DataTableDto dto)
        {
            var data = _adApp.GetData(dto);
            return Json(data);
        }

        /// <summary>
        /// 表单页面
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("site:ad:add,site:ad:edit")]
        [HttpGet]
        public IActionResult Form(int id)
        {
            ViewBag.Id = id;

            return View();
        }

        [RequirePermission("site:ad:add,site:ad:edit")]
        [HttpGet]
        public IActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            var model = _adApp.GetModel(id);
            result.data.Add("model", model);
            return Json(result);
        }


        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [RequirePermission("site:ad:add,site:ad:edit")]
        [HttpPost]
        public IActionResult Save(cms_ad dto)
        {
          
            dto=_adApp.Save(dto,RequestHelper.AdminInfo());
            SiteManagerCache.AddAdvertising(dto);
            return Success("数据保存成功");
        }

        /// <summary>
        /// 删除广告
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("site:ad:delete")]
        [HttpGet]
        public IActionResult DeleteById(string ids)
        {
            if (ids.IsEmpty())
            {
                return Error("删除失败");
            }
           var idsArray= _adApp.DeleteById(ids);

            foreach(int adId in idsArray)
            {
                SiteManagerCache.RemoveAdvertising(adId);
            }
           
            return Success("删除成功");
        }


        /// <summary>
        /// 暂时禁用广告
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("site:ad:ban")]
        [HttpGet]
        public IActionResult Ban(int id)
        {
            _adApp.Ban(id);
            SiteManagerCache.RemoveAdvertising(id);
            return Success("删除成功");
        }

    }
}
