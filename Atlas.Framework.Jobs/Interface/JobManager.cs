using Altas.Framework.Common.NLog;
using Altas.Framework.Models;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlas.Framework.Jobs.Interface
{
    public class JobManager
    {
        public static List<hangfire_jobs> _JobInfos { get; set; }
        public static List<IJob> _Jobs { get; set; }

        public Action<bool> CompleteCallBack { get; set; }
        static JobManager()
        {
            _JobInfos = new List<hangfire_jobs>();
            _Jobs = new List<IJob>();
        }


        public static void AddTask(IJob ijob)
        {
            _JobInfos.Add(ijob.JobInfo);
            _Jobs.Add(ijob);
        }

        /// <summary>
        /// 初始化所有任务
        /// </summary>
        public static bool InitJobs()
        {
            try
            {
                if (_Jobs.Count > 0)
                {
                    foreach (var job in _Jobs)
                    {
                        RecurringJob.AddOrUpdate(job.TaskId, () => job.Excute(), job.CronExpression,null, "demo_queue");

                        //job.OnCompleteCallback=
                    }
                }
                return true;
                // CompleteCallBack?.Invoke(true);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
                return false;
            }
        }


        /// <summary>
        /// 任务完成回调
        /// </summary>
        private void JobCompleteReceive()
        {

        }
    }
}
