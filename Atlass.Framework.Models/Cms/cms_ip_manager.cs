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

        public string start_ip { get; set; }
        public string end_ip { get; set; }
        public long start_ip_val { get; set; }
        public long end_ip_val { get; set; }
        public bool enable { get; set; }
        public bool back_limit { get; set; }
        public bool front_limit { get; set; }
        public string remark { get; set; }
    }
}
