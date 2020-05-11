using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class HotQuestionDto
    {
        public string id { get; set; }
        public string hot_title { get; set; }
        /// <summary>
        /// 点击量
        /// </summary>
        public int hit_count { get; set; }
        /// <summary>
        /// 置顶
        /// </summary>
        public bool is_top { get; set; }
        /// <summary>
        /// 链接
        /// </summary>
        public string url { get; set; }

        /// <summary>
        /// 图片
        /// </summary>
        public List<string> images { get; set; }

        public string qcontent { get; set; }
        public string summary_info { get; set; }
        public int qtype { get; set; }
    }
}
