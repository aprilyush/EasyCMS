using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.Cms
{
    public class CmsTemplateAppService
    {
        private readonly IFreeSql Sqldb;
        public CmsTemplateAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public BootstrapGridDto GetData(BootstrapGridDto dto ,int pid)
        {
            var query = Sqldb.Select<cms_template>()
                      .WhereIf(pid > 0, s => s.pid == pid)
                      .OrderByDescending(s => s.id)
                      .Count(out long total)
                      .Page(dto.page,dto.limit)
                      .ToList(s => new cms_template
                      {
                          id=s.id,template_name=s.template_name,
                          template_file=s.template_file,
                          is_default=s.is_default
                      });

            dto.total = total;
            dto.rows = query;
            return dto;
        }

        public void InsertTemplate(cms_template dto)
        {
            var count = Sqldb.Select<cms_template>().Where(s => s.pid == dto.pid && s.is_default == 1).Count();
            if (count == 0)
            {
                dto.is_default = 1;
            }

            Sqldb.Insert(dto).ExecuteAffrows();
        }

        public void UpdateTemplate(cms_template dto)
        {
            var oldTemp=Sqldb.Select<cms_template>()
                .Where(s=>s.id==dto.id).First(s => new cms_template
                {
                    id = s.id,
                    template_name = s.template_name,
                    template_file = s.template_file,
                    is_default = s.is_default
                });
            if (oldTemp == null)
            {
                return;
            }
            dto.is_default = oldTemp.is_default;
            Sqldb.Update<cms_template>().SetSource(dto).IgnoreColumns(s => new { s.insert_id, s.insert_time }).ExecuteAffrows();

        }
        public cms_template GetModel(int id)
        {
            if (id == 0)
            {
                return new cms_template();
            }
            var model = Sqldb.Select<cms_template>().Where(s => s.id == id).First();
            if (model == null)
            {
                model = new cms_template();
            }
            return model;
        }


        public string DeleteById(int id)
        {
            var temp = Sqldb.Select<cms_template>().Where(s => s.id == id).First(s => s.template_file);
            if (!string.IsNullOrEmpty(temp))
            {
                Sqldb.Delete<cms_template>().Where(s => s.id == id).ExecuteAffrows();
                return temp;
            }
            return null;
        }
        public List<ZtreeSelIntDto> TemplateCategory()
        {
            var list = new List<ZtreeSelIntDto>();
            list.Insert(0, new ZtreeSelIntDto { id = 1, name = "首页模板" });
            list.Insert(1, new ZtreeSelIntDto { id = 2, name = "栏目模板" });
            list.Insert(2, new ZtreeSelIntDto { id = 3, name = "内容模板" });
            list.Insert(3, new ZtreeSelIntDto { id = 4, name = "单页模板" });
            return list;
        }
        public List<ZtreeSelIntDto> TemplateZtree()
        {
            var list = Sqldb.Select<cms_template>().ToList(s => new ZtreeSelIntDto
            {
                id = s.id,
                name = s.template_name,
                pId = s.pid,
                title=s.template_file

            });
            list.Insert(0, new ZtreeSelIntDto { id = 1, name = "首页模板" });
            list.Insert(1, new ZtreeSelIntDto { id = 2, name = "栏目模板" });
            list.Insert(2, new ZtreeSelIntDto { id = 3, name = "内容模板" });
            list.Insert(3, new ZtreeSelIntDto { id = 4, name = "单页模板" });
            return list;
        }
    }
}
