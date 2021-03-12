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

        /// <summary>
        /// 部门首页
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 部门数据
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult GetList()
        {
            var data = _deptApp.GetData();
            return Json(data);
        }
        /// <summary>
        /// 部门表单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IActionResult Form(int id)
        {
            ViewBag.Id = id;
            return View();
        }

        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Save(sys_dept dto)
        {
            var user = RequestHelper.AdminInfo();

            _deptApp.SaveDepartment(dto,RequestHelper.AdminInfo());
            return Success("保存成功");
        }
        /// <summary>
        /// 获取部门数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
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
            result.data.Add("ztreeData", depts);
            return Json(result);
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult DeleteById(int id)
        {
            _deptApp.DeleteById(id);
            return Success("删除成功");
        }

        /// <summary>
        /// 部门下拉数据
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult GetDeptZtree()
        {
            ResultAdaptDto ret = new ResultAdaptDto();
            var depts = _deptApp.GetDepartTree();
            ret.data.Add("ztreeData", depts);
            return Json(ret);
        }
    }
}