using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.Admin
{
    public class hangfire_task
    {
        [Column(IsPrimary =true)]
        public string id { get; set; }
        public string task_name { get; set; }
        public string assembly_namespace { get; set; }
        public string class_name { get; set; }
        public string cron_express { get; set; }
        public DateTime excute_time { get; set; }
        public string remark { get; set; }
        /// <summary>
        /// 0-停止，1-运行中
        /// </summary>
        public int excute_status { get; set; }
    }
}
