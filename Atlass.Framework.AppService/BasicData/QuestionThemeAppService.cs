using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.BasicData
{
    public class QuestionThemeAppService
    {
        private readonly IFreeSql Sqldb;
        public QuestionThemeAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public BootstrapGridDto Getdata(BootstrapGridDto param)
        {
            var query = Sqldb.Queryable<question_theme>().OrderBy(s => s.sort_num)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList();
            param.rows = query;
            param.total = total;
            return param;
        }



       public void SaveTheme(question_theme dto)
        {
            if (dto.id == 0)
            {
                dto.insert_time = DateTime.Now;
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<question_theme>().SetSource(dto).IgnoreColumns(s => new { s.insert_time }).ExecuteAffrows();
            }
        }

        public question_theme GetModel(int id)
        {
            return Sqldb.Select<question_theme>().Where(s => s.id == id).First();
        }

        public void DelByIds(int id)
        {
            //var idsArry = ids.StrToIntArray();
            Sqldb.Delete<question_theme>().Where(s => s.id==id).ExecuteAffrows();
        }
    }
}
