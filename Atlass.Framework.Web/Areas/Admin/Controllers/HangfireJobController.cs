using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Jobs;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Hangfire;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Senparc.Weixin.Entities;

namespace Atlass.Framework.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HangfireJobController : BaseController
    {
        private readonly HangfireJobAppService _logApp;
        private SenparcWeixinSetting _wxSetting;
        public HangfireJobController(IServiceProvider service, IOptionsMonitor<SenparcWeixinSetting> senparcWeixinSetting)
        {
            _wxSetting = senparcWeixinSetting.CurrentValue;
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _logApp = service.GetRequiredService<HangfireJobAppService>();
        }

        [HttpGet]
        [RequirePermission("system:hangfire:view")]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [RequirePermission("system:hangfire:view")]
        public ActionResult GetData(DataTableDto dto)
        {
            var data = _logApp.GetList(dto);
            return Json(data);
        }


        [HttpGet]
        [RequirePermission("system:hangfire:add,system:hangfire:edit")]
        public IActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpGet]
        [RequirePermission("system:hangfire:view")]
        public ActionResult GetDataById(string id)
        {
            var result = new ResultAdaptDto();

            var model = _logApp.GetModel(id);
            result.data.Add("model", model);
            return Content(result.ToJson());
        }

        [HttpPost]
        [RequirePermission("system:hangfire:add,system:hangfire:edit")]
        public IActionResult Save(hangfire_task dto)
        {
            string id=_logApp.Save(dto);
            IJob job = ReflectionHelper.Instance<IJob>(dto.assembly_namespace.Trim(),dto.class_name.Trim());
            Dictionary<string, string> jobParams = new Dictionary<string, string>();
            jobParams.Add("jobId", dto.id);
            RecurringJob.AddOrUpdate(id,() => job.Excute(jobParams),dto.cron_express, TimeZoneInfo.Local);
            return Success("任务添加完成");

        }

        [HttpGet]
        [RequirePermission("system:hangfire:delete")]
        public ActionResult DelById(string id)
        {
            RecurringJob.RemoveIfExists(id);
           
            int affect=_logApp.DelByIds(id);
            return Success("任务删除成功");
        }

        /// <summary>
        /// 暂停
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        /// 
        [HttpGet]
        [RequirePermission("system:hangfire:pause")]
        public ActionResult Pause(string id)
        {
            RecurringJob.RemoveIfExists(id);

            int affect = _logApp.Pause(id);
            return Success("任务已暂停");
        }

        /// <summary>
        /// 继续
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:hangfire:resume")]
        public ActionResult Resume(string id)
        {

            var dto = _logApp.GetModel(id.Trim());
            if (dto == null)
            {
                return Error("任务启动失败");
            }
            IJob job = ReflectionHelper.Instance<IJob>(dto.assembly_namespace.Trim(), dto.class_name.Trim());
            Dictionary<string, string> jobParams = new Dictionary<string, string>();
            jobParams.Add("jobId", dto.id);
            RecurringJob.AddOrUpdate(id,() => job.Excute(jobParams), dto.cron_express,TimeZoneInfo.Local);
            _logApp.Resume(dto.id);
            return Success("任务启动成功");
        }

        [HttpGet]
        [RequirePermission("system:hangfire:excute")]
        public ActionResult ExcuteJob(string id)
        {
            RecurringJob.Trigger(id);
            return Success("任务开始执行");
        }

        /// <summary>
        /// 执行日志
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:hangfire:log")]
        public IActionResult Log(string jobId)
        {
            ViewBag.JobId = jobId;
            return View();
        }

        /// <summary>
        /// 执行日志
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("system:hangfire:log")]
        public IActionResult LogData(DataTableDto dto)
        {
            string jobId = RequestHelper.GetPostString("jobId");
            var data = _logApp.GetLogPageList(dto, jobId);
            return Json(data);
        }

        [HttpGet]
        [RequirePermission("system:hangfire:log")]
        public IActionResult ClearJobLog(string jobId)
        {
            if (jobId.IsEmptyId())
            {
                return Error("清除执行日志失败");
            }
            _logApp.ClearJobLog(jobId);
            return Success();
        }
    }
}