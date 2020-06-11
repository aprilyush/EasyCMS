using Atlass.Framework.Models;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

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
                model.site_name = "EasyCMS内容发布系统";
                model.site_favicon = "/favicon.ico";
                model.site_logo = "/static/images/logo.png";
            }
            return model;

        }


        public cms_site SaveSite(cms_site dto)
        {
            dto.site_name = dto.site_name ?? "";
            dto.site_logo = dto.site_logo ?? "/static/images/logo.png";
            dto.site_favicon = dto.site_favicon ?? "/favicon.ico";
            dto.site_url = dto.site_url ?? "";
            dto.site_title = dto.site_title ?? "";
            dto.site_keyword = dto.site_keyword ?? "";
            dto.site_description = dto.site_description ?? "";
            dto.site_copyright = dto.site_copyright ?? "";
            dto.site_icp = dto.site_icp ?? "";
            if (dto.id == 0)
            {
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<cms_site>().SetSource(dto).ExecuteAffrows();
            }
            return dto;
        }
    }
}
