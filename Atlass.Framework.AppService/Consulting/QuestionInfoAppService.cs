using Atlass.Framework.Common;
using Atlass.Framework.Common.Html;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.Wx;
using Mapster;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Consulting
{
    public class QuestionInfoAppService
    {
        private readonly IFreeSql Sqldb;
        public QuestionInfoAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param, string id, string stime, string etime, LoginUserDto user)
        {
            var list = new List<expert_question>();
            long total = 0;
            if (user.IsSuper)
            {
                var query = Sqldb.Select<expert_question>()
                .WhereIf(!string.IsNullOrEmpty(id), s => s.expert_oid == id);

                if (!string.IsNullOrEmpty(stime))
                {
                    DateTime starttime = stime.ToDate();
                    query = query.Where(s => s.insert_time >= starttime);
                }
                if (!string.IsNullOrEmpty(etime))
                {
                    DateTime endtime = etime.ToDate().AddDays(1);
                    query = query.Where(s => s.insert_time < endtime);
                }
                list = query.OrderByDescending(s => s.insert_time)
                    .Count(out total)
                    .Page(param.page, param.limit).ToList();

            }
            else
            {
                var query2 = Sqldb.Select<expert_question, user_ref_expert>()
              .InnerJoin((q, e) => q.expert_oid == e.expert_id)
              .Where((q, e) => e.user_id == user.Id)
               .WhereIf(!string.IsNullOrEmpty(id), (q, e) => q.expert_oid == id);

                if (!string.IsNullOrEmpty(stime))
                {
                    DateTime starttime = stime.ToDate();
                    query2 = query2.Where((q, e) => q.insert_time >= starttime);
                }
                if (!string.IsNullOrEmpty(etime))
                {
                    DateTime endtime = etime.ToDate().AddDays(1);
                    query2 = query2.Where((q, e) => q.insert_time < endtime);
                }
                list = query2.OrderByDescending((q, e) => q.insert_time)
                    .Count(out long total2)
                    .Page(param.page, param.limit).ToList();
            }

            var data = new List<QuestionDetailInfoDto>();
            if (list.Count > 0)
            {
                data = list.Adapt<List<QuestionDetailInfoDto>>();

                var patientIds = data.Select(s => s.insert_id).Distinct().ToList();
                var patients = Sqldb.Select<wx_user>().Where(s => patientIds.Contains(s.id))
                    .ToList(s => new DicKeyStrDto { id = s.id, name = s.nick_name });

                data.ForEach(s =>
                {
                    s.patient_name = patients.Where(a => a.id == s.insert_id).Select(a => a.name).FirstOrDefault();
                    if (s.patient_name.IsEmpty())
                    {
                        s.patient_name = "匿名";
                    }

                    s.resp_content_one = s.resp_content_one.NoHTML(0);
                   // s.resp_content_two = s.resp_content_two.NoHTML(0);
                });
            }
          
            param.total = total;
            param.rows = data;
            return param;
        }

        /// <summary>
        /// 获取问题
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public QuestionDetailInfoDto GetQuestion(string id)
        {
            var model = new QuestionDetailInfoDto();
            var question= Sqldb.Queryable<expert_question>().Where(s => s.id == id).First();
            if (question != null)
            {
                model = question.Adapt<QuestionDetailInfoDto>();
                model.expertHeader = Sqldb.Select<expert_info>().Where(s => s.id == question.expert_oid).First(s => s.head_url);
                var timeDiff = model.insert_time - model.highrisk_time;
                model.highrisk_day=timeDiff.Days<0?1:timeDiff.Days;
            }

            return model;
        }
        /// <summary>
        /// 关联的问题
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pid"></param>
        /// <returns></returns>
        public List<ReqQuestionDto> GetRefQuestions(string id, string pid)
        {
            string emptyId = IdWorkerHelper.GenOId();
            if (pid == emptyId)
            {
                return Sqldb.Select<expert_question>().Where(s => s.pid == id)
                    .ToList(s => new ReqQuestionDto { id = s.id, question_title = s.qtitle,question_time=s.insert_time });
            }

            var allQuestions = Sqldb.Select<expert_question>().Where(s => s.id == pid|| s.pid == pid)
                    .ToList(s => new ReqQuestionDto { id = s.id, question_title = s.qtitle, question_time = s.insert_time });
            return allQuestions.Where(s => s.id != id).ToList();
        }

        public void UpdateAdminRemark(string id,string content)
        {
            Sqldb.Update<expert_question>().Set(s => s.admin_remark, content)
                .Where(s => s.id == id).ExecuteAffrows();
        }
        /// <summary>
        /// 获取患者信息
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        public wx_user GetPatient(string openId)
        {
            var user= Sqldb.Select<wx_user>().Where(s => s.open_id == openId).First();
            if (user == null)
            {
                user = new wx_user();
            }
            return user;
        }
        /// <summary>
        /// 获取问题对于的图片
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public QuestionDetailImagesDto GetImages(string id)
        {
            var allImages= Sqldb.Queryable<question_imgs>().Where(s => s.pid == id).ToList();
            var model = new QuestionDetailImagesDto();
            model.QuestionImages = allImages.Where(s => s.img_type == 0).Select(s=>s.img_url).ToList();
            model.ResponseImages= allImages.Where(s => s.img_type == 1&&s.up_number==1).Select(s => s.img_url).ToList();
            model.ResponseImagesTwo = allImages.Where(s => s.img_type ==1 && s.up_number ==2).Select(s => s.img_url).ToList();
            return model;
        }

        /// <summary>
        /// 专家下拉列表
        /// </summary>
        /// <returns></returns>
        public List<DicKeyStrDto> ExpertList(LoginUserDto user)
        {
            if (user.IsSuper)
            {
                var data = Sqldb.Select<expert_info>()
                    .Where(s => s.is_delete == 0 && s.is_show == true).ToList(s =>
               new DicKeyStrDto()
               {
                   id = s.open_id,
                   name = s.expert_name,
                   pid = s.id
               });
                return data;
            }

            var data2= Sqldb.Select<expert_info,user_ref_expert>()
                .InnerJoin((q,u)=>q.id==u.expert_id)
                .Where((q, u) =>u.user_id==user.Id&&q.is_delete == 0 && q.is_show == true).ToList((q, u) =>
              new DicKeyStrDto()
              {
                  id = q.open_id,
                  name = q.expert_name,
                  pid = q.id
              });
            return data2;

        }

        /// <summary>
        /// 导出内容
        /// </summary>
        /// <param name="id"></param>
        /// <param name="stime"></param>
        /// <param name="etime"></param>
        /// <returns></returns>
        public List<QuestionExport> GetExportList(string id, DateTime stime, DateTime etime)
        {
            etime = etime.AddDays(1);
            var questions = Sqldb.Queryable<expert_question>()
                .WhereIf(id != "0", s => s.expert_id == id)
                .Where(s => s.insert_time > stime && s.insert_time < etime)
                .OrderByDescending(s => s.id)
                .ToList();
            var list = new List<QuestionExport>();
            if (questions.Any())
            {
                var minTime = TimeHelper.MinDateTime();
                foreach (var q in questions)
                {
                    var model = new QuestionExport();
                    model.Name = q.expert_name;
                    model.Qtime = q.insert_time.ToString("yyyy-MM-dd HH:mm");
                    model.Qcontent = q.qcontent;
                 
                    model.ReplyTime = q.resp_time_one > minTime ? q.resp_time_one.ToString("yyyy-MM-dd HH:mm") : "";
                    model.ReplyContentOne = q.resp_content_one;
                    model.ReplyTimeTwo = q.resp_time_two > minTime ? q.resp_time_two.ToString("yyyy-MM-dd HH:mm") : "";
                    model.ReplyContentTwo = q.resp_content_two;
                    model.RountNum = q.serial_num;
                    model.Star = q.star_num;
                    model.PayMoney = q.pay_money;
                    model.Openid = q.insert_id;
                    list.Add(model);
                }
            }
            return list;
        }
    }
}
