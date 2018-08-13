using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Altas.Framework.AppService;
using Altas.Framework.Common;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Altas.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;


namespace Altas.Framework.Admin
{
    public class SysFuncController : BaseController
    {
        private readonly SysFuncAppService _funcApp;

        public SysFuncController(SysFuncAppService funcApp)
        {
            _funcApp = funcApp;
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