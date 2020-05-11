using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models
{
    public class hot_question
    {
        [Column(IsPrimary = true)]
        public string id { get; set; }
        /// <summary>
        /// 标题
        /// </summary>
        public string hot_title { get; set; }
        /// <summary>
        /// 点击量
        /// </summary>
        public int hit_count { get; set; }
        /// <summary>
        /// 置顶
        /// </summary>
        public bool is_top { get; set; }
        /// <summary>
        /// 链接
        /// </summary>
        public string url { get; set; }
        public long insert_id { get; set; }
        public DateTime insert_time { get; set; }
    }
}
