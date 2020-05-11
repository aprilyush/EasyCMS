using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.doctor
{
    public class question_chart
    {
        [Column(IsPrimary = true, IsIdentity = true)]
        public int id { get; set; }
        public string expert_id { get; set; }
        public string expert_openid { get; set; }
        /// <summary>
        /// 201904
        /// </summary>
        public int year_num { get; set; }
        /// <summary>
        /// 金钱单位分
        /// </summary>
        public int question_count { get; set; }
        /// <summary>
        /// 上一次计算时间
        /// </summary>
        public DateTime last_time { get; set; }
    }
}
