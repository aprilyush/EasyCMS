using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SqlSugar;

namespace Altas.Framework.Models
{

    public class sys_operate
    {
        [SugarColumn(IsPrimaryKey = true)]
        public long id { get; set; }

        public string func_name { get; set; }
   
        public string func_cname { get; set; }

  
        public string func_icon { get; set; }


        public string func_class { get; set; }


        public int func_sort { get; set; }


        public string remark { get; set; }

        public string create_person { get; set; }


        public DateTime create_time { get; set; }


    }
}
