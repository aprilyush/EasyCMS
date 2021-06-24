using Atlass.Framework.Common.Log;
using Hangfire.Client;
using Hangfire.Common;
using Hangfire.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Atlass.Framework.Core.HangfireExtend
{
    /// <summary>
    /// 错过不执行 +执行log
    /// </summary>
    public class JobListenerAttribute: JobFilterAttribute, IClientFilter, IServerFilter
    {

        private ThreadLocal<DateTime> jobDate = new ThreadLocal<DateTime>();
        /// <summary>
        /// 设置逾期时间
        /// </summary>
        public TimeSpan MaxDelay { get; set; } = TimeSpan.FromMinutes(15);

        public void OnCreating(CreatingContext context)
        {
            if (context.Parameters.TryGetValue("RecurringJobId", out var recurringJobId) &&
                context.InitialState?.Reason == "Triggered by recurring job scheduler")
            {
                // the job being created looks like a recurring job instance,
                // and triggered by a scheduler (i.e. not manually) at that.

                var recurringJob = context.Connection.GetAllEntriesFromHash($"recurring-job:{recurringJobId}");

                if (recurringJob != null && recurringJob.TryGetValue("NextExecution", out var nextExecution))
                {
                    // the next execution time of a recurring job is updated AFTER the job instance creation,
                    // so at the moment it still contains the scheduled execution time from the previous run.

                    var scheduledTime = JobHelper.DeserializeDateTime(nextExecution);

                    if (DateTime.UtcNow > scheduledTime + MaxDelay)
                    {
                        // the job is created way later than expected
                        context.Canceled = true;
                    }
                }
            }
        }

        public void OnCreated(CreatedContext context)
        {
        }

        /// <summary>
        /// job执行监听
        /// </summary>
        /// <param name="filterContext"></param>
        public void OnPerforming(PerformingContext filterContext)
        {
            jobDate.Value = DateTime.Now;

        }

        public void OnPerformed(PerformedContext filterContext)
        {
            DateTime startTime = jobDate.Value;
            DateTime now = DateTime.Now;
            JobExcuteDto jobLog = new JobExcuteDto();

            Job job = filterContext.BackgroundJob.Job;
            var jobParams= job.Args[0] as Dictionary<string, string>;
            jobLog.JobId = jobParams["jobId"];
            jobLog.ExcuteTime = startTime;
            jobLog.EX = filterContext.Exception.InnerException;
            if (jobLog.EX != null)
            {
                jobLog.ExcuteResult = 1;
                filterContext.ExceptionHandled = true;
            }
            jobLog.ElapsedTime = (now - startTime).TotalMilliseconds;
            LoggerHelper.JobLog(jobLog);
        }
    }
}
