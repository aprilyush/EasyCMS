using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.Work
{
    public class work_notice_reply
    {
        [Column(IsPrimary = true, IsIdentity = true)]
        public int id { get; set; }
        public int notice_id { get; set; }
        public long user_id { get; set; }
        public string nick_name { get; set; }
        public DateTime reply_time { get; set; }

        public long dept_id { get; set; }
        public string dept_name { get; set; }
        /// <summary>
        /// 0-未签收，1-已签收
        /// </summary>
        public int reply_status { get; set; }
    }
}
