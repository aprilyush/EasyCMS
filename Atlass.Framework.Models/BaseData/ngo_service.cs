using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.BaseData
{
    public class ngo_service
    {
        [Column(IsPrimary = true)]
        public string id { get; set; }
        /// <summary>
        /// 标题
        /// </summary>
        public string service_title { get; set; }
        /// <summary>
        /// 点击量
        /// </summary>
        public int sort_num { get; set; }
        /// <summary>
        /// 链接
        /// </summary>
        public string url { get; set; }
        public long insert_id { get; set; }
        public DateTime insert_time { get; set; }
    }
}
