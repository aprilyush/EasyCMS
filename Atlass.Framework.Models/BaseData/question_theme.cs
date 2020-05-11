using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models
{
    /// <summary>
    /// 咨询主题设置
    /// </summary>
    public class question_theme
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        public string theme_name { get; set; }
        public int sort_num { get; set; }
        public  long insert_id { get; set; }
        public DateTime insert_time { get; set; }
    }
}
