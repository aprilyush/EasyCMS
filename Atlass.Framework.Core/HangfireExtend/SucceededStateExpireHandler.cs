using Hangfire.States;
using Hangfire.Storage;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.HangfireExtend
{
    public class SucceededStateExpireHandler: IStateHandler
    {
        public TimeSpan JobExpirationTimeout;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="jobExpirationTimeout"></param>
        /// <param name="timeSpanType"></param>
        public SucceededStateExpireHandler(int jobExpirationTimeout = 60)
        {
            JobExpirationTimeout = TimeSpan.FromMinutes(jobExpirationTimeout);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="timeSpanType">0-分钟，1-小时，2-天</param>
        /// <param name="jobExpirationTimeout"></param>
        public SucceededStateExpireHandler(int timeSpanType, int jobExpirationTimeout = 7)
        {
            if (timeSpanType == 0)
            {
                JobExpirationTimeout = TimeSpan.FromMinutes(jobExpirationTimeout);
            }
            else if (timeSpanType == 1)
            {
                JobExpirationTimeout = TimeSpan.FromHours(jobExpirationTimeout);
            }
            else if (timeSpanType == 2)
            {
                JobExpirationTimeout = TimeSpan.FromDays(jobExpirationTimeout);
            }

        }
        public string StateName => SucceededState.StateName;

        public void Apply(ApplyStateContext context, IWriteOnlyTransaction transaction)
        {
            context.JobExpirationTimeout = JobExpirationTimeout;
        }

        public void Unapply(ApplyStateContext context, IWriteOnlyTransaction transaction)
        {

        }
    }
}
