using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.question
{
    public class serial_totals
    {
        [Column(IsPrimary  = true, IsIdentity = true)]
        public int id { get; set; }
        public int serial_num { get; set; }
    }
}
