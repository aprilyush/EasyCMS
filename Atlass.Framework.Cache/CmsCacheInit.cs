using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Cache
{
    public static class CmsCacheInit
    {
        public static void Init()
        {
            var sqlDb = DbInstanceFactory.GetInstance();
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
            //上传设置
            var uploadSet = sqlDb.Select<cms_upload_set>().OrderBy(s => s.id).First();
            if (uploadSet == null)
            {
                uploadSet = new cms_upload_set();
            }
            SiteManagerCache.SetUploadInfo(uploadSet);
        }
    }
}
