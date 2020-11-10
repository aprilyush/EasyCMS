using System;
using System.Collections.Generic;
using System.Text;
using FreeSql;
using FreeSql.DataAnnotations;

namespace Atlass.Framework.Models.Admin
{
    public class easy_log
    {
        [Column(IsIdentity =true)]
        public int id { get; set; }
        public string log_summary { get; set; }
        [Column(StringLength = -1)]
        public string log_message { get; set; }
        /// <summary>
        /// 1-info,2-debug,3-warn,4-error
        /// </summary>
        public int log_type { get; set; }
        public DateTime log_time { get; set; }
    }
}
