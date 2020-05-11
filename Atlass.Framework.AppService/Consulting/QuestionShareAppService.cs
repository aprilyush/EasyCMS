using Atlass.Framework.Models.question;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Consulting
{
    public class QuestionShareAppService
    {
        private readonly IFreeSql Sqldb;
        public QuestionShareAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public BootstrapGridDto GetData(BootstrapGridDto dto)
        {
            var list = Sqldb.Select<share_question>()
                .OrderByDescending(s => s.share_time)
                .Count(out long total)
                .Page(dto.page, dto.limit).ToList();

            if (list.Count > 0)
            {
                var categoryIds = list.Where(s=>s.share_category>0).Select(s => s.share_category).Distinct().ToList();
                if (categoryIds.Count > 0)
                {
                    var categorys = Sqldb.Select<share_category>().Where(s => categoryIds.Contains(s.id))
                    .ToList(s => new DicKeyDto { id = s.id, name = s.category_name }).ToList();
                    if (categorys.Count > 0)
                    {
                        list.ForEach(s =>
                        {
                            s.categoryName = categorys.Where(a => a.id == s.share_category).Select(a => a.name).FirstOrDefault();
                        });
                    }
                }
                
            }
            dto.total = total;
            dto.rows = list;
            return dto;
        }

        public List<DicKeyDto> GetCategory()
        {
            var list= Sqldb.Select<share_category>()
                .OrderBy(s=>s.sort_num)
                .ToList(s => new DicKeyDto { id = s.id, name = s.category_name });
            list.Insert(0, new DicKeyDto { id = 0, name = "请选择" });
            return list;
        }

        public share_question GetModel(int id)
        {
            var model = Sqldb.Select<share_question>().Where(s => s.id == id).First();
            return model;
        }

        public void Set(share_question dto)
        {
            Sqldb.Update<share_question>()
                .Set(s => s.share_title, dto.share_title)
                .Set(s => s.hit_count, dto.hit_count)
                .Set(s => s.share_status, dto.share_status)
                .Set(s => s.share_category, dto.share_category)
                .Where(s => s.id == dto.id).ExecuteAffrows();
        }


        public void DeleteById(int id)
        {
            Sqldb.Delete<share_question>().Where(s => s.id == id).ExecuteAffrows();
        }
    }
}
