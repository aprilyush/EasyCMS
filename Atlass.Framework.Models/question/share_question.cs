using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.question
{
    public class share_question
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }

        /// <summary>
        /// 分享标题
        /// </summary>
        public string share_title { get; set; }
        /// <summary>
        /// 问题id
        /// </summary>
        public string question_id { get; set; }
        /// <summary>
        /// 问题标题
        /// </summary>
        public string question_title { get; set; }
        /// <summary>
        /// 分享状态 0-待审，1-通过，2-拒绝
        /// </summary>
        public int share_status { get; set; }
        /// <summary>
        /// 分享分类
        /// </summary>
        public int share_category { get; set; }
        /// <summary>
        /// 分享时间
        /// </summary>
        public DateTime share_time { get; set; }
        /// <summary>
        /// 点击量
        /// </summary>
        public int hit_count { get; set; }


        [Column(IsIgnore =true)]
        public string categoryName { get; set; }
    }
}
