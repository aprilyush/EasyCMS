using Atlass.Framework.Common;
using Atlass.Framework.Common.Html;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.Models.BaseData;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.Wx;
using Microsoft.Extensions.DependencyInjection;
using Snowflake.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Doctor
{
    public class QuickInfoAppService
    {
        private readonly IFreeSql Sqldb;
        public QuickInfoAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 获取数据列表
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param, string id, int qtype,LoginUserDto user)
        {
            List<quick_reply> data = new List<quick_reply>();
            long total = 0;
            if (user.IsSuper)
            {
                data = Sqldb.Select<quick_reply>()
               .Where(s => s.qtype == qtype)
               .WhereIf(!string.IsNullOrEmpty(id), s => s.expert_id == id)
               .OrderByDescending(s => s.id)
               .Count(out total)
               .Page(param.page, param.limit)
               .ToList();
            }
            else
            {
                data = Sqldb.Select<quick_reply,user_ref_expert>()
                    .InnerJoin((q,u)=>q.expert_id==u.expert_id)
               .Where((q, u) =>u.user_id==user.Id&& q.qtype == qtype)
               .WhereIf(!string.IsNullOrEmpty(id), (q, u) =>q.expert_id == id)
               .OrderByDescending((q, u) =>q.id)
               .Count(out total)
               .Page(param.page, param.limit)
               .ToList();
            }
           

            if (data.Count > 0)
            {
                var experIds = data.Select(s => s.expert_id).Distinct().ToList();
                var experts= Sqldb.Select<expert_info>().Where(s => experIds.Contains(s.id)).ToList(s =>
                 new DicKeyStrDto()
                 {
                     id = s.id,
                     name = s.expert_name
                 });
                data.ForEach(s =>
                {
                    s.expertName = experts.Where(a => a.id == s.expert_id).Select(a => a.name).FirstOrDefault();
                    s.qcontent = s.qcontent.NoHTML(40);
                });
            }
            param.total = total;
            param.rows = data;

            return param;
        }

        public void Init()
        {
            var list = Sqldb.Select<quick_reply>().ToList();
            Dictionary<string, string> dic = new Dictionary<string, string>();
            foreach(var q in list)
            {
                q.id = IdWorkerHelper.GenObjectId();
                if (dic.ContainsKey(q.insert_id))
                {
                    string expert = dic[q.insert_id];
                    q.expert_id = expert;
                    //Sqldb.Update<quick_reply>().Set(s => s.expert_id == expert).Where(s => s.id == q.id).ExecuteAffrows();
                }
                else
                {
                    var expert = Sqldb.Select<expert_info>().Where(s => s.open_id == q.insert_id).OrderBy(s => s.id).First(s => s.id);
                    if (expert != null)
                    {
                        dic.Add(q.insert_id, expert);
                        q.expert_id = expert;
                        // Sqldb.Update<quick_reply>().Set(s => s.expert_id == expert).Where(s => s.id == q.id).ExecuteAffrows();
                    }
                }
            }

            Sqldb.Ado.ExecuteNonQuery("truncate table quick_reply");
            Sqldb.Insert(list).ExecuteAffrows();
        }


        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="quickImages"></param>
        public void SaveData(quick_reply dto,string quickImages)
        {
            if (dto.id.EmptyId())
            {
                var expert = Sqldb.Select<expert_info>().Where(s => s.id == dto.expert_id)
              .First(s => new DicKeyStrDto { id = s.open_id, name = s.expert_name });
                if (expert == null)
                {
                    throw new Exception($"专家信息不存在{dto.expert_id}");
                }
                dto.insert_id = expert.id;
            }

            var images = new List<hot_question_image>();
            if (!string.IsNullOrEmpty(quickImages))
            {
                var imgArrary = quickImages.Split(',');
                foreach (var url in imgArrary)
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
                Sqldb.Update<quick_reply>()
                    .SetSource(dto).IgnoreColumns(s => new { s.expert_id, s.insert_id, s.insert_time, s.qtype }).ExecuteAffrows();
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
        /// <summary>
        /// 获取详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public HotQuestionDto GetDataById(string id)
        {
                var model = Sqldb.Select<quick_reply>().Where(s => s.id == id)
                    .First(s => new HotQuestionDto { id = s.id, hot_title = s.qtitle, summary_info = s.qcontent,url=s.expert_id });
                if (model != null)
                {
                    model.images = Sqldb.Select<hot_question_image>()
                        .Where(s => s.pid == id).ToList(s => s.image_url);
                }
                return model;
            
        }
        public void DeleteById(string id)
        {
            var quick = Sqldb.Select<quick_reply>().Where(s => s.id == id).Select(s => s.id).First();
            if (!quick.EmptyId())
            {
                var images = Sqldb.Select<hot_question_image>()
                    .Where(s => s.pid == quick).ToList(s => s.id);
                if (images.Count > 0)
                {
                    Sqldb.Delete<hot_question_image>().Where(s => images.Contains(s.id)).ExecuteAffrows();
                }
                Sqldb.Delete<quick_reply>().Where(s => s.id == id).ExecuteAffrows();
            }
        }
    }
}
