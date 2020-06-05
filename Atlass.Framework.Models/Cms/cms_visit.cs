using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models
{
    public class cms_visit
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        public string ip { get; set; }
        public string browser { get; set; }
        public DateTime visit_time { get; set; }
    }
}
