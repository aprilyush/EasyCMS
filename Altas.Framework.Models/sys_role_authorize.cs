using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SqlSugar;

namespace Altas.Framework.Models
{


    public class sys_role_authorize
    {
        [SugarColumn(IsPrimaryKey = true)]
        public long id { get; set; }
        public long role_id { get; set; }

        public long menu_id { get; set; }

        public long menu_pid { get; set; }

        public string create_person { get; set; }
        public DateTime create_time { get; set; }
    }
}
