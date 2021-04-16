using Atlass.Framework.Common.NLog;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models.Admin;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Jobs
{
    public class TestJob:IJob
    {
        public void Excute(string wxAppId, string taskId)
        {
            try
            {
                var Sqldb = DbInstanceFactory.GetInstance();
                var log = new easy_log();
                log.log_summary = "hangfireJob任务";
                log.log_message = DateTime.Now.ToString();
                log.log_type = 1;
                log.log_time = DateTime.Now;
                Sqldb.Insert(log).ExecuteAffrows();
                Sqldb.Update<hangfire_task>().Set(s => s.excute_time,DateTime.Now)
                    .Where(s => s.id == taskId).ExecuteAffrows();
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }

        }
    }
}
