using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SysDepartmentController : BaseController
    {
        private readonly SysDepartmentAppService _deptApp;
        public SysDepartmentController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _deptApp = service.GetRequiredService<SysDepartmentAppService>();
        }
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult GetData()
        {
            var data = _deptApp.GetData();
            return Content(data.ToJson());
        }

        public IActionResult Form(int id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public ActionResult Save(sys_department dto)
        {
            var user = RequestHelper.AdminInfo();
            dto.insert_id = user.Id;
            dto.insert_time = DateTime.Now;
            _deptApp.SaveDepartment(dto);
            return Success("保存成功");
        }

        [HttpGet]
        public IActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
           
          
            if (id > 0)
            {
                var model = _deptApp.GetModel(id);
                result.data.Add("model", model);
            }
            var depts = _deptApp.GetDepartTree();
            result.data.Add("depts", depts);
            return Data(result);
        }
        [HttpGet]
        public IActionResult DeleteById(int id)
        {
            _deptApp.DeleteById(id);
            return Success("删除成功");
        }
    }
}