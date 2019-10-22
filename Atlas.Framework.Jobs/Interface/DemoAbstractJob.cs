using Altas.Framework.Common;
using Altas.Framework.Common.NLog;
using Altas.Framework.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlas.Framework.Jobs.Interface
{
    public class DemoAbstractJob:Jobs
    {
        public DemoAbstractJob()
        {
            JobInfo = new hangfire_jobs();
            JobInfo.id = "5daeaec11b4663319c53cc06";
            JobInfo.job_name = "写日志2";
            JobInfo.cron_expression = CronHelper.MinuteInterval(1);
            JobInfo.job_note = "每一分钟写一次测试日志2";
            JobInfo.send_email = 1;
            JobInfo.email = "461733078@qq.com";
            JobInfo.excute_status = 1;
            JobInfo.job_status = 1;
            JobInfo.create_time = DateTime.Now;
            JobInfo.last_time = JobInfo.create_time;

            TaskId = JobInfo.id;
            CronExpression = JobInfo.cron_expression;
        }

        public override void Excute()
        {
            try
            {
                LogNHelper.Info($"DemoAbstractJob 执行任务ID为{JobInfo.id}的测试任务");
                OnComplete?.Invoke(JobInfo.id);
            }
            catch (Exception ex)
            {
                OnError?.Invoke(JobInfo.id, ex);
            }

        }
    }
}
