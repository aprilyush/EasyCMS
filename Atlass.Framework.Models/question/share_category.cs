using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.question
{
    public class share_category
    {
     
        public int id { get; set; }
        public string category_name { get; set; }
        public int sort_num { get; set; }
        public DateTime insert_time { get; set; }
        public long insert_id { get; set; }
    }
}
