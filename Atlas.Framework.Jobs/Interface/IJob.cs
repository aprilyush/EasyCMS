using Altas.Framework.Models;
using System;
using Hangfire;

namespace Atlas.Framework.Jobs
{
    public interface IJob
    {
        /// <summary>
        /// 任务Id
        /// </summary>
        string TaskId { get; set; }
        ///// <summary>
        ///// 时间周期
        ///// </summary>
        //int TimeInterval { get; set; }
        /// <summary>
        /// 表达式
        /// </summary>
        string CronExpression { get; set; }
        /// <summary>
        /// 完成回调
        /// </summary>
        Action<string> OnCompleteCallback { get; set; }
        /// <summary>
        /// 任务执行
        /// </summary>
        //[Queue("demoQueue")]
        void Excute();

        /// <summary>
        /// 返回任务实体
        /// </summary>
        /// <returns></returns>
        hangfire_jobs JobInfo { get; set; }
    }
}
