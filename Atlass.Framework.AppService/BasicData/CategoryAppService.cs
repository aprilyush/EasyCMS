using Atlass.Framework.Models.question;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.BasicData
{
    public class CategoryAppService
    {
        private readonly IFreeSql Sqldb;
        public CategoryAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public BootstrapGridDto Getdata(BootstrapGridDto param)
        {
            var query = Sqldb.Queryable<share_category>().OrderBy(s => s.sort_num)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList();
            param.rows = query;
            param.total = total;
            return param;
        }



        public void SaveTheme(share_category dto)
        {
            if (dto.id == 0)
            {
                dto.insert_time = DateTime.Now;
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<share_category>().SetSource(dto).IgnoreColumns(s => new { s.insert_time }).ExecuteAffrows();
            }
        }

        public share_category GetModel(int id)
        {
            return Sqldb.Select<share_category>().Where(s => s.id == id).First();
        }

        public void DelByIds(int id)
        {
            //var idsArry = ids.StrToIntArray();
            Sqldb.Delete<share_category>().Where(s => s.id == id).ExecuteAffrows();
        }
    }
}
