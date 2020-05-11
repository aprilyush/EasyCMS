using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.BaseData
{
    public class hot_question_image
    {
        [Column(IsPrimary = true, IsIdentity = true)]
        public int id { get; set; }
        public string pid { get; set; }
        public string image_url { get; set; }
    }
}
