using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.Work
{
    public class work_notice
    {
        [Column(IsPrimary = true, IsIdentity = true)]
        public int id { get; set; }
        public string n_title { get; set; }
        /// <summary>
        /// 截止日期
        /// </summary>
        public DateTime n_time { get; set; }
        public string n_content { get; set; }
        public DateTime insert_time { get; set; }
        public long insert_id { get; set; }
        public string nick_name { get; set; }
        public int total_depts { get; set; }
        /// <summary>
        /// 已签收
        /// </summary>
        public int received_count { get; set; }


        public string dept_ids { get; set; }
        [Column(IsIgnore = true)]
        public int is_check { get; set; }


        /// <summary>
        /// 未签收
        /// </summary>
        [Column(IsIgnore = true)]
        public int unreceived_count { get; set; }
    }
}
