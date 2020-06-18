using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.BaseData
{
    public class cms_ad
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        public string ad_title { get; set; }
        public string ad_href { get; set; }
        public string ad_image { get; set; }
        public int ad_status { get; set; }
        public int image_width { get; set; } = 100;
        public int image_height { get; set; } = 100;
        public DateTime insert_time { get; set; }
        public long insert_id { get; set; }
    }
}
