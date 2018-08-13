using System;
using System.Linq;
using System.Text;
using SqlSugar;

namespace Altas.Framework.Models
{
    public class sys_user
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
        public string account_name { get; set; }

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public string real_name { get; set; }

        public string pass_word { get; set; }
        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:True
        /// </summary>
        public string mobile_phone { get; set; }

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:True
        /// </summary>
        public string email { get; set; }

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:True
        /// </summary>
        public string fax { get; set; }

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public string create_person { get; set; }

        /// <summary>
        /// Desc:-
        /// Default:-
        /// Nullable:False
        /// </summary>
        public DateTime create_time { get; set; }

        public long province { get; set; }
        public int city { get; set; }
        public int county { get; set; }

        public bool is_super { get; set; }
        public long sys_role_id { get; set; }
        public int user_level { get; set; }
        public string remark { get; set; }
    }
}
