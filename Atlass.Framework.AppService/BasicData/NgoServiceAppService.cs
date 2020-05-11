using Atlass.Framework.Common;
using Atlass.Framework.Models.BaseData;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.BasicData
{
    public class NgoServiceAppService
    {
        private readonly IFreeSql Sqldb;
        public NgoServiceAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public BootstrapGridDto Getdata(BootstrapGridDto param)
        {
            var query = Sqldb.Queryable<ngo_service>()
                .OrderBy(s => s.sort_num)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList();
            param.rows = query;
            param.total = total;
            return param;
        }



        public void Save(ngo_service dto)
        {
            if (dto.id.EmptyId())
            {
                dto.id = IdWorkerHelper.GenObjectId();
                dto.insert_time = DateTime.Now;
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                var imageList = Sqldb.Select<hot_question_image>().Where(s => s.pid == dto.id).ToList(s => s.id);
                if (imageList.Count > 0)
                {
                    Sqldb.Delete<hot_question_image>().Where(s => imageList.Contains(s.id)).ExecuteAffrows();
                }
                Sqldb.Update<ngo_service>()
                    .SetSource(dto).IgnoreColumns(s => new { s.insert_id,s.insert_time }).ExecuteAffrows();
            }
        }

        public ngo_service GetModel(string id)
        {
            return Sqldb.Select<ngo_service>().Where(s => s.id == id).First();
        }
        public List<string> GetRefImages(string id)
        {
            return Sqldb.Select<hot_question_image>().Where(s => s.pid == id).ToList(s => s.image_url);
        }
        public void DelByIds(string id)
        {
            //var idsArry = ids.StrToIntArray();
            Sqldb.Delete<ngo_service>().Where(s => s.id == id).ExecuteAffrows();
        }
    }
}
