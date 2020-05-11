using Atlass.Framework.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class QuestionDetailDto
    {
        public string id { get; set; }
        public string pid { get; set; }
        /// <summary>
        /// 标题
        /// </summary>
        public string qtitle { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string qcontent { get; set; }
        /// <summary>
        /// 咨询时间
        /// </summary>
        public DateTime qtime { get; set; }
        public string patientOpenId { get; set; }
        public string patientName { get; set; }
        /// <summary>
        /// 图片
        /// </summary>
        public List<question_imgs> qimgs { get; set; }
        /// <summary>
        /// 专家id
        /// </summary>
        public string expertId { get; set; }
        /// <summary>
        /// 专家openid
        /// </summary>
        public string expertOpenId { get; set; }
        /// <summary>
        /// 专家名称
        /// </summary>
        public string expertName { get; set; }
        /// <summary>
        /// 职位
        /// </summary>
        public string postion { get; set; }
        /// <summary>
        /// 首次回复
        /// </summary>
        public DateTime replyTimeOne { get; set; }

        public string repContentOne { get; set; }
        /// <summary>
        /// 追加回复
        /// </summary>
        public DateTime replyTimeTwo { get; set; }

        public string repContentTwo { get; set; }

        /// <summary>
        /// 回合次数
        /// </summary>
        public int total { get; set; }
        /// <summary>
        /// 当前问题回复次数
        /// </summary>
        public int replyCount { get; set; }

        /// <summary>
        /// 剩余追问次数
        /// </summary>
        public int remainCount { get; set; }

        /// <summary>
        /// 是否回合结束
        /// </summary>
        public bool qend { get; set; }

        /// <summary>
        /// 评分
        /// </summary>
        public int star_num { get; set; }
        public bool pay { get; set; }
        public int pay_money { get; set; }

        public  bool round_end { get; set; }
        public int hasPatientComment { get; set; }
        public string patientComment { get; set; }
        public DateTime commentTime { get; set; }
    }

    public class QuestionDetailHistoryDto
    {
        public QuestionDetailDto baseQuestion { get; set; }
        public List<QuestionDetailDto> extraQuestions { get; set; }
    }
}
