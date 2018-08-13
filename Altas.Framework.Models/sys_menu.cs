using System;
using System.Linq;
using System.Text;
using SqlSugar;

namespace Altas.Framework.Models
{

    public class sys_menu
    {

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        [SugarColumn(IsPrimaryKey = true)]
        public long id { get; set; }

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public string menu_name { get;set;}

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public string menu_url { get;set;}

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public int menu_sort { get;set;}

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public long parent_id { get; set; }

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:True
        /// </summary>
        public string remark { get;set;}

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public string create_person { get;set;}

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public DateTime create_time { get;set;}
        public int menu_level { get; set; }

        /// <summary>
        /// 0-模块,1-菜单
        /// </summary>
        public int menu_type { get; set; }
        public bool iframe { get; set; }

        public string menu_icon { get; set; }
    }
}
