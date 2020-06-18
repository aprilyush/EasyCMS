using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.BasicData;
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
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _adApp = service.GetRequiredService<AdAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }


        public IActionResult Form(int id)
        {
            ViewBag.Id = id;

            return View();
        }
        public IActionResult GetData(BootstrapGridDto dto)
        {
            var data = _adApp.GetData(dto);
            return Data(data);
        }
        public IActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            var model = _adApp.GetModel(id);
            result.data.Add("model", model);
            return Data(result);
        }

        public IActionResult Save(cms_ad dto)
        {
            dto.insert_id = RequestHelper.AdminInfo().Id;
            _adApp.Save(dto);
            return Success("数据保存成功");
        }
        public IActionResult DeleteById(int id)
        {
            _adApp.DeleteById(id);
            return Success("删除成功");
        }

        public IActionResult Ban(int id)
        {
            _adApp.Ban(id);
            return Success("删除成功");
        }

    }
}
