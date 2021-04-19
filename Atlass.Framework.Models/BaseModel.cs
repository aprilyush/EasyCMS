using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Models
{
    public class BaseModel
    {
        [Column(CanUpdate = false)]
        public DateTime create_time { get; set; }
        [Column(CanUpdate = false)]
        public string create_by { get; set; }

        public DateTime update_time { get; set; }
        public string update_by { get; set; }
    }
}
