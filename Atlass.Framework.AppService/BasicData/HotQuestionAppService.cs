using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.Models.BaseData;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.BasicData
{
    public class HotQuestionAppService
    {
        private readonly IFreeSql Sqldb;
        public HotQuestionAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public BootstrapGridDto Getdata(BootstrapGridDto param)
        {
            var query = Sqldb.Queryable<hot_question>()
                .OrderByDescending(s=>s.is_top)
                .OrderByDescending(s => s.hit_count)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList();
            param.rows = query;
            param.total = total;
            return param;
        }



        public void SaveTheme(hot_question dto, string hot_image)
        {

            var images = new List<hot_question_image>();
            if (!string.IsNullOrEmpty(hot_image))
            {
                var imgArrary = hot_image.Split(',');
                foreach(var url in imgArrary)
                {
                    var image = new hot_question_image();
                    image.image_url = url;
                    images.Add(image);
                }
            }
            if (dto.id.EmptyId())
            {
                dto.id = IdWorkerHelper.GenObjectId();
                dto.insert_time = DateTime.Now;
               Sqldb.Insert(dto).ExecuteAffrows();
                if (images.Count > 0)
                {
                    images.ForEach(s =>
                    {
                        s.pid = dto.id;
                    });
                    Sqldb.Insert(images).ExecuteAffrows();
                }
            }
            else
            {
                var imageList = Sqldb.Select<hot_question_image>().Where(s => s.pid == dto.id).ToList(s => s.id);
                if (imageList.Count > 0)
                {
                    Sqldb.Delete<hot_question_image>().Where(s => imageList.Contains(s.id)).ExecuteAffrows();
                }
                Sqldb.Update<hot_question>()
                    .SetSource(dto).IgnoreColumns(s => new { s.insert_time }).ExecuteAffrows();
                if (images.Count > 0)
                {
                    images.ForEach(s =>
                    {
                        s.pid = dto.id;
                    });
                    Sqldb.Insert(images).ExecuteAffrows();
                }
            }
        }

        public hot_question GetModel(string id)
        {
            return Sqldb.Select<hot_question>().Where(s => s.id == id).First();
        }
        public List<string> GetRefImages(string id)
        {
            return Sqldb.Select<hot_question_image>().Where(s => s.pid == id).ToList(s=>s.image_url);
        }
        public void DelByIds(string id)
        {
            //var idsArry = ids.StrToIntArray();
            Sqldb.Delete<hot_question>().Where(s => s.id == id).ExecuteAffrows();
        }
    }
}
