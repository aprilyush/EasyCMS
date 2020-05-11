using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.Doctor
{
    public class BannerAppService
    {
        private readonly IFreeSql Sqldb;
        public BannerAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public BootstrapGridDto GetList(BootstrapGridDto dto)
        {
           
            var query = Sqldb.Queryable<banner_info>().OrderBy(s => s.banner_sort)
                .Count(out long total)
                .Page(dto.page, dto.limit)
                .ToList();
            dto.rows = query;
            dto.total = total;
            return dto;
        }
        public void Save(banner_info dto)
        {
            dto.banner_href = dto.banner_href ?? string.Empty;
            if (dto.id == 0)
            {
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<banner_info>().SetSource(dto).ExecuteAffrows();
            }
        }

        public void DeleteById(int id)
        {
            Sqldb.Delete<banner_info>().Where(s => s.id == id).ExecuteAffrows();
        }

        public banner_info GetModel(int id)
        {
            return Sqldb.Select<banner_info>().Where(s => s.id == id).OrderBy(s => s.id).First();
        }
    }
}
