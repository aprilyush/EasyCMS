using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.Cms
{
    public class cms_ip_manager
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }

        /// <summary>
        /// 开始ip
        /// </summary>
        public string start_ip { get; set; }
        /// <summary>
        /// 结束ip
        /// </summary>
        public string end_ip { get; set; }
        /// <summary>
        /// 开始ip的值
        /// </summary>
        public long start_ip_val { get; set; }
        /// <summary>
        /// 结束ip的值
        /// </summary>
        public long end_ip_val { get; set; }
        /// <summary>
        /// 启用限制 0-不限制，1-限制
        /// </summary>
        public int limit_enable { get; set; }
        public string remark { get; set; }

        [Column(CanUpdate = false)]
        public DateTime create_time { get; set; }
        [Column(CanUpdate = false)]
        public string create_by { get; set; }

        public DateTime update_time { get; set; }
        public string update_by { get; set; }
    }
}
