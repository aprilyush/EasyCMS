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
        public static List<Jobs> _AbsJobs { get; set; }
        // public Action<string> OnComplete{ get; set; }
        //public Action<string,Exception> OnError { get; set; }
        static JobManager()
        {
            _JobInfos = new List<hangfire_jobs>();
            _Jobs = new List<IJob>();
            _AbsJobs = new List<Jobs>();
        }


        public static void AddTask(IJob ijob)
        {
            _JobInfos.Add(ijob.JobInfo);
            _Jobs.Add(ijob);
        }
        /// <summary>
        /// 移除某个任务
        /// </summary>
        /// <param name="id"></param>
       public static void RemoveJob(string id)
        {
            RecurringJob.RemoveIfExists(id);
        }

        public static void ExcuteJob(string id)
        {
            RecurringJob.Trigger(id);
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
                        job.OnComplete += OnComplete;
                        job.OnError += OnError;
                        RecurringJob.AddOrUpdate(job.TaskId, () => job.Excute(), job.CronExpression,null, "demo_queue");
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


        public static void Add(Jobs job)
        {
            _JobInfos.Add(job.JobInfo);
            _AbsJobs.Add(job);
        }

        /// <summary>
        /// 初始化所有任务
        /// </summary>
        public static bool AbsInitJobs()
        {
            try
            {
                if (_AbsJobs.Count > 0)
                {
                    foreach (var job in _AbsJobs)
                    {
                        job.OnComplete += OnComplete;
                        job.OnError += OnError;
                        RecurringJob.AddOrUpdate(job.TaskId, () => job.Excute(), job.CronExpression, null, "demo_queue");
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
        private static void OnComplete(string jobId)
        {
            LogNHelper.Info($"任务完成回调，任务ID:{jobId}");
        }
        /// <summary>
        /// 任务完成回调
        /// </summary>
        private static void OnError(string jobId,Exception ex)
        {
            LogNHelper.Info($"任务异常回调，任务ID:{jobId}，异常信息:{ex.Message}");
        }
    }
}
