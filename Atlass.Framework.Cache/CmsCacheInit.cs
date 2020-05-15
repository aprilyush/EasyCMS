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
            var sqlDb = FreesqlDbInstance.GetInstance();
            var templates = sqlDb.Select<cms_template>().ToList();
            var channels = sqlDb.Select<cms_channel>().ToList();

            templates.ForEach(s =>
            {
                TemplateManagerCache.AddTemplate(s);
            });

            channels.ForEach(s =>
            {
                ChannelManagerCache.AddChannel(s);
            });
        }
    }
}
