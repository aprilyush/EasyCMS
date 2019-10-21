using SqlSugar;
using System;
using System.Collections.Generic;
using System.Text;

namespace Altas.Framework.Models
{
    /// <summary>
    /// 定时任务表
    /// </summary>
    public class hangfire_jobs
    {
        [SugarColumn(IsPrimaryKey =true)]
        public string id { get; set; }
        /// <summary>
        /// 任务名称
        /// </summary>
        public string job_name { get; set; }
        /// <summary>
        /// 任务表达式
        /// </summary>
        public string cron_expression { get; set; }
        /// <summary>
        /// 任务描述
        /// </summary>
        public string job_note { get; set; }
        /// <summary>
        /// 是否发送邮件 0-不发，1-发
        /// </summary>
        public int send_email { get; set; }
        /// <summary>
        /// 邮箱地址
        /// </summary>
        public string email { get; set; }

        /// <summary>
        /// 执行状态，停止-0,正常-1,暂停-2
        /// </summary>
        public int job_status { get; set; }
        /// <summary>
        /// 执行结果，成功-1,异常-2
        /// </summary>
        public int excute_status { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime create_time { get; set; }
        /// <summary>
        /// 最近一次执行时间
        /// </summary>
        public DateTime last_time { get; set; }
    }
}
