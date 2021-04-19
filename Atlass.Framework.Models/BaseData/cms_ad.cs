using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.BaseData
{
    public class cms_ad
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        /// <summary>
        /// 广告标题
        /// </summary>
        public string ad_title { get; set; }
        /// <summary>
        /// 链接
        /// </summary>
        public string ad_href { get; set; }
        /// <summary>
        /// 广告图片
        /// </summary>
        public string ad_image { get; set; }
        /// <summary>
        /// 状态 0-禁用，1-正常
        /// </summary>
        public int enable_status { get; set; }
        public int image_width { get; set; } = 100;
        public int image_height { get; set; } = 100;

        [Column(CanUpdate =false)]
        public DateTime create_time { get; set; }
        [Column(CanUpdate = false)]
        public string create_by { get; set; }

        public DateTime update_time { get; set; }
        public string update_by { get; set; }
    }
}
