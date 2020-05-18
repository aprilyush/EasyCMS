using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.Cms
{
    public class cms_template_match
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        public int channel_id { get; set; }
        public int channel_template_id { get; set; }
        public int content_template_id { get; set; }
    }
}
