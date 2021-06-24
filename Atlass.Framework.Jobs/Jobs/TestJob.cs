using Atlass.Framework.Common.Log;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models.Admin;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

namespace Atlass.Framework.Jobs
{
    public class TestJob:IJob
    {
        public void Excute(Dictionary<string, string> jobParams)
        {
            JobExcuteDto jobLog = new JobExcuteDto();
            jobLog.JobId = jobParams["jobId"];
            jobLog.ExcuteTime = DateTime.Now;
            //开始监视代码运行时间
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Restart();

            var Sqldb = DbInstanceFactory.GetInstance();
            try
            {

                var log = new easy_log();
                log.log_summary = "hangfireJob任务";
                log.log_message = DateTime.Now.ToString();
                log.log_type = 1;
                log.log_time = DateTime.Now;
                Sqldb.Insert(log).ExecuteAffrows();
            }
            catch (Exception e)
            {
                //LoggerHelper.Exception(e);
                jobLog.EX = e;
                jobLog.ExcuteResult = 1;
            }

            stopwatch.Stop(); //  停止监视            
            jobLog.ElapsedTime = stopwatch.Elapsed.TotalMilliseconds;  //总秒数

            LoggerHelper.JobLog(jobLog);

        }
    }
}
