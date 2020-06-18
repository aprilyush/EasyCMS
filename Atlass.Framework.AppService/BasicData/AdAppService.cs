using Atlass.Framework.Models.BaseData;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.BasicData
{
    public class AdAppService
    {
        private readonly IFreeSql Sqldb;
        public AdAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public BootstrapGridDto GetData(BootstrapGridDto dto)
        {
            var query = Sqldb.Select<cms_ad>()
                .OrderByDescending(s => s.id)
                .Count(out long total)
                .Page(dto.page, dto.limit)
                .ToList();
            dto.rows = query;
            dto.total = total;
            return dto;
        }

        public void Save(cms_ad dto)
        {
            dto.ad_href = dto.ad_href ?? "";
            dto.image_height = dto.image_height < 0 ? 100 : dto.image_height;
            dto.image_width = dto.image_width < 0 ? 100 : dto.image_width;
            dto.insert_time = DateTime.Now;
            if (dto.id == 0)
            {
               
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<cms_ad>().SetSource(dto).ExecuteAffrows();
            }
        }

        public cms_ad GetModel(int id)
        {
            return Sqldb.Select<cms_ad>().Where(s => s.id == id).First();
        }


        public void DeleteById(int id)
        {
            Sqldb.Delete<cms_ad>().Where(s => s.id == id).ExecuteAffrows();
        }

        public void Ban(int id)
        {
            Sqldb.Update<cms_ad>().Set(s=>s.ad_status,0).Where(s => s.id == id).ExecuteAffrows();
        }
    }
}
