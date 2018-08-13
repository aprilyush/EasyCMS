using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SqlSugar;

namespace Altas.Framework.Models
{
    public class sys_role
    {
        [SugarColumn(IsPrimaryKey = true)]
        public long id { get; set; }
        public string role_name { get; set; }
        public string role_code { get; set; }

        public int sort { get; set; }
        public string remark { get; set; }
        public string create_person { get; set; }
        public DateTime create_time { get; set; }
        public bool role_super { get; set; }
    }
}
