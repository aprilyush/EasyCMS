using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.CmsSet;
using Atlass.Framework.Cache;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.BasicData.Controllers
{
    [Area("BasicData")]
    public class UploadSetController : BaseController
    {

        private readonly UploadSetAppService _uploadSetApp;
        public UploadSetController(IServiceProvider service)
        {
            _uploadSetApp = service.GetRequiredService<UploadSetAppService>();
        }

        [HttpGet]
        [RequirePermission("site:uploadset:view")]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [RequirePermission("site:uploadset:view")]
        public IActionResult GetModel()
        {
            var result = new ResultAdaptDto();
            var model = _uploadSetApp.GetModel();
            result.data.Add("model", model);
            return Json(result);
        }


        [HttpPost]
        [RequirePermission("site:uploadset:view")]
        public IActionResult Save(cms_upload_set dto)
        {
            var upload = _uploadSetApp.SaveSite(dto);
            SiteManagerCache.SetUploadInfo(upload);
            return Success("设置成功");
        }
    }
}
