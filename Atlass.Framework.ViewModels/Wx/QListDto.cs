using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class QListDto
    {
        public string id { get; set; }
        /// <summary>
        /// 咨询标题
        /// </summary>
        public string qtitle { get; set; }
        /// <summary>
        /// 咨询内容
        /// </summary>
        public string qcontent { get; set; }
        /// <summary>
        /// 咨询时间
        /// </summary>
        public DateTime time { get; set; }
        public int replyCount { get; set; }
        /// <summary>
        /// 是否高亮
        /// </summary>
        public bool high_light { get; set; }
        /// <summary>
        /// 是否咨询结束
        /// </summary>
        public bool qend { get; set; }
        /// <summary>
        /// 专家名称
        /// </summary>
        public string expert_name { get; set; }
        /// <summary>
        /// 专家Id
        /// </summary>
        public string expertId { get; set; }

        /// <summary>
        /// 专家头衔
        /// </summary>
        public string expert_title { get; set; }
        /// <summary>
        /// 患者评价
        /// </summary>
        public string patientRemark { get; set; }
        public string patientOpenId { get; set; }
        public string patientName { get; set; }
    }
}
