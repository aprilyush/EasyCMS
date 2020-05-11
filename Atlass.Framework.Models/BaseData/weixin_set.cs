using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.BaseData
{
    public class weixin_set
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        /// <summary>
        /// 站点域名
        /// </summary>
        public string site_host { get; set; }
        /// <summary>
        /// 咨询成功模板id
        /// </summary>
        public string consulting_success { get; set; }
        /// <summary>
        /// 新诊单消息id
        /// </summary>
        public string new_question { get; set; }
        /// <summary>
        /// 反馈结果通知
        /// </summary>
        public string feed_back { get; set; }
        /// <summary>
        /// 咨询结束
        /// </summary>
        public string question_end { get; set; }
        /// <summary>
        /// 打赏通知
        /// </summary>
        public string pay_notice { get; set; }
    }
}
