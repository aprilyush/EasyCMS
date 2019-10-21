using Altas.Framework.Common;
using Altas.Framework.Common.NLog;
using Altas.Framework.Models;
using System;
using System.Collections.Generic;
using System.Text;
using Hangfire;
namespace Atlas.Framework.Jobs
{
    public class DemoJob:IJob
    {
        public string TaskId { get; set; }
        public string CronExpression { get; set; }
        public Action<string> OnCompleteCallback { get; set; }

        public hangfire_jobs JobInfo { get; set; }


        
        public DemoJob()
        {
            JobInfo = new hangfire_jobs();
            JobInfo.id = "5dad40031b46632a24823333";
            JobInfo.job_name = "写日志";
            JobInfo.cron_expression = CronHelper.MinuteInterval(1);
            JobInfo.job_note = "每一分钟写一次测试日志";
            JobInfo.send_email = 1;
            JobInfo.email = "461733078@qq.com";
            JobInfo.excute_status = 1;
            JobInfo.job_status = 1;
            JobInfo.create_time = DateTime.Now;
            JobInfo.last_time = JobInfo.create_time;

            TaskId = JobInfo.id;
            CronExpression = JobInfo.cron_expression;
        }


        public void Excute()
        {
            LogNHelper.Info($"执行任务ID为{JobInfo.id}的测试任务");
        }
    }
}
