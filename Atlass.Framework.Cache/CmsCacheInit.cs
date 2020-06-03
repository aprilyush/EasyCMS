using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using Atlass.Framework.Models.CmsSet;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Cache
{
    public static class CmsCacheInit
    {
        public static void Init()
        {
            var sqlDb = FreesqlDbInstance.GetInstance();
            var templates = sqlDb.Select<cms_template>().ToList();
            var channels = sqlDb.Select<cms_channel>().ToList();

           
            templates.ForEach(s =>
            {
                TemplateManagerCache.AddTemplate(s);
            });

            channels.ForEach(s =>
            {
                if (s.link_type == 1&&string.IsNullOrEmpty(s.channel_href))
                {
                    var firstId = sqlDb.Select<cms_content>().Where(a => a.channel_id == s.id).OrderByDescending(a=> a.id).First(a =>a.id);
                    if (firstId > 0)
                    {
                        s.channel_href = $"/news/{s.id}/{firstId}";
                    }
                }
                ChannelManagerCache.AddChannel(s);
            });

            ///站点设置
            var site = sqlDb.Select<cms_site>().OrderBy(s => s.id).First();
            if (site == null)
            {
                site = new cms_site();
                site.site_name = "EasyCMS内容发布系统";
                site.site_favicon = "/favicon.ico";
                site.site_logo = "/static/images/logo.png";
            }
            SiteManagerCache.SetSiteInfo(site);
        }
    }
}
