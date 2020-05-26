using Atlass.Framework.Models.CmsSet;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.CmsSet
{
    public class SiteAppService
    {
        private readonly IFreeSql Sqldb;
        public SiteAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }
        public cms_site GetModel()
        {
            var model = Sqldb.Select<cms_site>().OrderBy(s => s.id).First();
            if (model == null)
            {
                model = new cms_site();
                model.site_favicon = "/favicon.ico";
                model.site_log = "/static/images/logo.png";
            }
            return model;

        }
    }
}
