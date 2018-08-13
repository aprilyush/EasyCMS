using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SqlSugar;

namespace Altas.Framework.Models
{

    public class sys_dictionary
    {
        [SugarColumn(IsPrimaryKey = true)]
        public long id { get; set; }

        public string dic_name { get; set; }

        public string dic_value { get; set; }

        public long parent_id { get; set; }

        public string dic_code { get; set; }

        public int sort_num { get; set; }

        public string create_person { get; set; }

        public DateTime create_time { get; set; }

        public string remark { get; set; }
    }
}
