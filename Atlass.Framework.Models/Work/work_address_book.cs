using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models
{
    public class work_address_book
    {
        [Column(IsPrimary= true, IsIdentity = true)]
        public int id { get; set; }

        /// <summary>
        /// 姓名
        /// </summary>
        public string real_name { get; set; }
        /// <summary>
        /// 部门
        /// </summary>
        public int dept_id { get; set; }
        public string department_name { get; set; }
        /// <summary>
        /// 工号
        /// </summary>
        public string work_number { get; set; }
        /// <summary>
        /// 职位
        /// </summary>
        public string work_job { get; set; }
        /// <summary>
        /// 内线
        /// </summary>
        public string inner_tel { get; set; }
        /// <summary>
        /// 个人电话
        /// </summary>
        public string mobile { get; set; }

        /// <summary>
        /// 住址
        /// </summary>
        public string address { get; set; }
        /// <summary>
        /// 个人资料
        /// </summary>
        public string profile { get; set; }

        public int sort_num { get; set; }
        public DateTime insert_time { get; set; }
    }
}
