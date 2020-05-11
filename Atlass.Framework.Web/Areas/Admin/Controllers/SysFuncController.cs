using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Altas.Framework.Admin
{
    [Area("Admin")]
    public class SysFuncController : BaseController
    {
        private readonly SysFuncAppService _funcApp;

        public SysFuncController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _funcApp = service.GetRequiredService<SysFuncAppService>();
        }
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }


        public ActionResult GetData(BootstrapGridDto param)
        {
            var data=new BootstrapGridDto();
            data = _funcApp.GetData(param);
            return Content(data.ToJson());
        }


        public JsonResult SaveData(sys_operate dto)
        {
            if (dto.id == 0)
            {
                _funcApp.InsertFunc(dto);
            }
            else
            {
                _funcApp.UpdateFunc(dto);
            }
            return Json("");
        }


        public ActionResult GetDataById(string id)
        {
            var result=new ResultAdaptDto();
            //result.Data = _funcApp.GetDataById(id);
            ////result.statusCodeCode=JuiJsonEnum.Ok;

            return Content(result.ToJson());
        }


        public ActionResult DelByIds(string ids)
        {
            _funcApp.DelByIds(ids);

            return Success("删除成功");
        }
	}
}