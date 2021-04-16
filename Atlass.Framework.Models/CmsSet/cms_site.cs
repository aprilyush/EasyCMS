using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models
{
    public class cms_site
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        /// <summary>
        /// 站点名称
        /// </summary>
        public string site_name { get; set; }
        /// <summary>
        /// 网站LOGO
        /// </summary>
        public string site_logo { get; set; }
        /// <summary>
        /// 地址栏图标
        /// </summary>
        public string site_favicon { get; set; }
        /// <summary>
        /// 网站网址
        /// </summary>
        public string site_url { get; set; }
        /// <summary>
        /// SEO标题
        /// </summary>
        public string site_title { get; set; }
        /// <summary>
        /// SEO关键词
        /// </summary>
        public string site_keyword { get; set; }
        /// <summary>
        /// SEO描述
        /// </summary>
        public string site_description { get; set; }
        /// <summary>
        /// 版权信息
        /// </summary>
        public string site_copyright { get; set; }
        /// <summary>
        /// 备案号
        /// </summary>
        public string site_icp { get; set; }
    }
}
