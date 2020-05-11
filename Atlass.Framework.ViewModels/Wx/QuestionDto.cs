using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
public class QuestionDto
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
        /// 专家
        /// </summary>
        public string expert_id { get; set; }

        public string imgs { get; set; }
        public string pid { get; set; }
        public DateTime hight_risk_time { get; set; }
        public string nick_name { get; set; }
        public int gender { get; set; }
        public int sexual_orientation { get; set; }
        public int birth_year { get; set; }

        public string province { get; set; }
        public string city { get; set; }
        public string paient_openid { get; set; }
    }
}
