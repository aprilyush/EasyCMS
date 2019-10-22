using Altas.Framework.Common.NLog;
using Altas.Framework.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlas.Framework.Jobs.Interface
{
    public abstract class Jobs
    {
        public string TaskId { get; set; }
        public string CronExpression { get; set; }
        public Action<string> OnComplete { get; set; }
        public Action<string, Exception> OnError { get; set; }
        public hangfire_jobs JobInfo { get; set; }

        public virtual void Excute()
        {
            try
            {
                LogNHelper.Info($"执行任务ID为{JobInfo.id}的测试任务");
                OnComplete?.Invoke(JobInfo.id);
            }
            catch (Exception ex)
            {
                OnError?.Invoke(JobInfo.id, ex);
            }

        }
    }
}
