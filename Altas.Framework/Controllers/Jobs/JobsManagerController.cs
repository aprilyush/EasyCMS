using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Altas.Framework.AppService.Jobs;
using Altas.Framework.Common;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Altas.Framework.ViewModels.Common;
using Atlas.Framework.Jobs;
using Atlas.Framework.Jobs.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Altas.Framework.Controllers.Jobs
{
    /// <summary>
    /// BaseController
    /// </summary>
    public class JobsManagerController :BaseController
    {
        private readonly JobsManagerAppService _jobsManagerApp;
        public JobsManagerController(JobsManagerAppService jobsManagerApp)
        {
            _jobsManagerApp = jobsManagerApp;
        }
        public IActionResult Index()
        {
            return View();
        }


        public ActionResult GetData(BootstrapGridDto param)
        {
            var data = new BootstrapGridDto();
            data = _jobsManagerApp.GetData(param);
            return Content(data.ToJson());
        }


        public ActionResult GenTaskId()
        {
            var id = IdWorkerHelper.GenObjectId();
            var result = new ResultAdaptDto();
            result.data.Add("taskId", id);
            return Data(result);
        }

        public ActionResult InitAllTask()
        {
            JobManager.AddTask(new DemoJob());
            var ret=JobManager.InitJobs();

            if (!ret)
            {
                return Content("初始化失败");
            }
            var jobsList = JobManager._JobInfos;
            if (jobsList.Count > 0)
            {
                _jobsManagerApp.InitAllJobs(jobsList);
            }
          
            return Content("初始化完成");
        }
        public ActionResult Test()
        {
            throw new Exception("人为异常");
            return Content("错误action");
        }
    }
}