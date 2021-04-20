using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.model
{
    public class cms_channel
    {       /// <summary>
            /// 站点名称
            /// </summary>
        public string site_name { get; set; } = "EasyCMS-易思内容管理系统";
        /// <summary>
        /// 网站LOGO
        /// </summary>
        public string site_logo { get; set; } = "EasyCMS-易思内容管理系统logo";
        /// <summary>
        /// 地址栏图标
        /// </summary>
        public string site_favicon { get; set; } = "EasyCMS-易思内容管理系统favicon";
        /// <summary>
        /// 网站网址
        /// </summary>
        public string site_url { get; set; } = "http://cms.atlass.com";
        /// <summary>
        /// SEO标题
        /// </summary>
        public string site_title { get; set; } = "EasyCMS站点 -  Powered by cms.atlass.com";
        /// <summary>
        /// SEO关键词
        /// </summary>
        public string site_keyword { get; set; } = "CMS,内容管理系统，企业建站，新闻发布，EasyCMS";
        /// <summary>
        /// SEO描述
        /// </summary>
        public string site_description { get; set; } = "EasyCMS内容管理系统，企业建站首选，基于.net core开源免费高性能，新闻发布系统";
        /// <summary>
        /// 版权信息
        /// </summary>
        public string site_copyright { get; set; } = "Copyright © 2012-2020 EasyCMS. 易思CMS 版权所有";
        /// <summary>
        /// 备案号
        /// </summary>
        public string site_icp { get; set; } = "苏ICP备17017410号-2";
    }
}
