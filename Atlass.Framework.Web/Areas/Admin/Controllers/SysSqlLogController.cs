﻿//------------------------------------------------------------------------------
// 作者：Generated by easycms
// 时间：2021/4/30 9:02:19
//------------------------------------------------------------------------------
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using System;



namespace Atlass.Framework.Web.Areas.Admin.Controllers
{    
    /// <summary>
     /// sql执行日志
     ///</summary>
    [Area("Admin")]
    public class SysSqlLogController : BaseController

    {
        private readonly SysSqlLogAppService sysSqlLogApp;

        public SysSqlLogController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            sysSqlLogApp = service.GetRequiredService<SysSqlLogAppService>();
        }

        /// <summary>
        ///  列表页面
        /// </summary>
        /// <param name="dto"></param>
        [HttpGet]
        [RequirePermission("system:sqllog:view")]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        ///获取数据列表
        /// </summary>
        /// <param name="param"></param>
        [HttpPost]
        [RequirePermission("system:sqllog:view")]
        public ActionResult GetPageList(DataTableDto param)
        {
            string tableName = RequestHelper.GetPostString("tableName", "");
            string logDate= RequestHelper.GetPostString("logDate", "");
            var data = sysSqlLogApp.GetPageList(param, tableName, logDate.ToDate());
            return Json(data);
        }

        /// <summary>
        ///表单页面
        /// </summary>
        [HttpGet]
        [RequirePermission("system:sqllog:add,system:sqllog:edit")]
        public ActionResult Form(string id)
        {
            ViewBag.Id = id;

            return View();
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>

        [HttpPost]
        [RequirePermission("system:sqllog:add,system:sqllog:edit")]
        public ActionResult SaveData(sys_sql_log dto)
        {
            var result = new ResultAdaptDto();

            sysSqlLogApp.Save(dto, RequestHelper.AdminInfo());
            result.status = true;
            return Json(result);
        }

        /// <summary>
        ///获取数据详情
        /// </summary>
        ///<param name="id"></param>
        [HttpGet]
        [RequirePermission("system:sqllog:add,system:sqllog:edit")]
        public ActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            var data = sysSqlLogApp.GetModel(id);
            if (data != null)
            {
                result.data.Add("model", data);
            }

            return Json(result);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:sqllog:delete")]
        public ActionResult RemoveAll(string ids)
        {
            sysSqlLogApp.RemoveAll(ids);
            return Success();
        }

        [HttpGet]
        [RequirePermission("system:sqllog:clear")]
        public IActionResult ClearTable()
        {
            sysSqlLogApp.ClearTable();
            return Success();
        }
    }
}