using Atlass.Framework.Models.CmsSet;
using EasyCaching.Core;
using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace Atlass.Framework.Cache
{
    public static class SiteManagerCache
    {
        private static cms_site Site;
        private static IEasyCachingProvider _provider;
        public static cms_site GetSiteInfo()
        {
            return RedisHelper.Get<cms_site>("site");
        }
        public static void SetSiteInfo(cms_site siteInfo)
        {
            RedisHelper.Set("site", siteInfo);
         
        }
    }
}
