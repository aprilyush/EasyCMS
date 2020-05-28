using Atlass.Framework.Models.CmsSet;
using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace Atlass.Framework.Cache
{
    public static class SiteManagerCache
    {
        private static cms_site Site { get; set; }
        public static cms_site GetSiteInfo()
        {
            return Site;
        }
        public static void SetSiteInfo(cms_site site)
        {
            Site = site;
        }
    }
}
