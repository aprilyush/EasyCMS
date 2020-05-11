using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.Models.doctor;
using Atlass.Framework.ViewModels.Api;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Api
{
    public class ApiUserAppService
    {
        private readonly IFreeSql Sqldb;
        public ApiUserAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        /// <summary>
        /// 获取个人信息
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        public wx_user GetPatientInfo(string openId)
        {
            var user = Sqldb.Select<wx_user>().Where(s => s.open_id == openId).First();
            if (user == null)
            {
                user = new wx_user();
                user.open_id = openId;
            }
            return user;
        }
        //是否是医生
        public bool IsDoctor(string openId)
        {
            var count = Sqldb.Select<expert_info>().Where(s => s.open_id == openId).Count();
            if (count > 0)
            {
                return true;
            }
            return false;
        }
        /// <summary>
        /// 保存个人信息
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateUserInfo(wx_user dto)
        {
            var user = Sqldb.Select<wx_user>().Where(s => s.open_id == dto.open_id).First();
            if (string.IsNullOrEmpty(dto.nick_name))
            {
                dto.nick_name = "匿名";
            }
            dto.national = dto.national ?? "";
            dto.job_name = dto.job_name ?? "";
            dto.province = dto.province ?? "";
            dto.city = dto.city ?? "";
            dto.open_id = dto.open_id.Trim();
            if (user == null)
            {
                dto.create_time = DateTime.Now;
                dto.id = IdWorkerHelper.GenObjectId();
                dto.avatar_url = "";
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<wx_user>().SetSource(dto).IgnoreColumns(s => new { s.create_time, s.avatar_url })
                    .Where(s=>s.id==user.id)
                    .ExecuteAffrows();
            }
        }

        /// <summary>
        /// 咨询问题统计
        /// </summary>
        /// <param name="openid"></param>
        /// <returns></returns>
        public List<ApiQuestionChartDto> QuestionChart(string openid)
        {
            var expertTime = Sqldb.Select<expert_info>()
                .Where(s => s.open_id == openid).OrderBy(s => s.insert_time).First(s => s.insert_time);
            var questionHistory = Sqldb.Select<question_chart>()
                .Where(s => s.expert_openid == openid).ToList();

            var startTime = new DateTime(expertTime.Year, expertTime.Month, 1);
            var nowTime = DateTime.Now;
            var yearDiff = nowTime.Year - startTime.Year;
            var year = startTime.Year;
            var list = new List<ApiQuestionChartDto>();
            for(int i = 0; i <= yearDiff; i++)
            {
                if (i>0)
                {
                    startTime = new DateTime(expertTime.Year + i, 1, 1);
                }
                var model = new ApiQuestionChartDto();
                model.year = startTime.Year;
               
                var endTime = new DateTime(startTime.Year, 12, 1);
                var stimeInt = startTime.ToString("yyyyMM").ToInt();
                var endTimeInt = endTime.ToString("yyyyMM").ToInt();
                var questions = questionHistory.Where(s => s.year_num >= stimeInt && s.year_num <= endTimeInt)
                    .OrderBy(s=>s.year_num).ToList();
                foreach(var q in questions)
                {
                    var item = new ApiQuestionChartMonthDto();
                    item.month = q.year_num.ToString().Substring(4)+"月";
                    item.questionCount = q.question_count;
                    model.questionCount += q.question_count;
                    model.items.Add(item);
                }
                list.Add(model);
            }

            return list;
        }

        /// <summary>
        /// 打赏统计
        /// </summary>
        /// <param name="openid"></param>
        /// <returns></returns>
        public (string unpayedMoney, List<ApiRewardDto> chart) PayChart(string openid)
        {
            var expertTime = Sqldb.Select<expert_info>()
                .Where(s => s.open_id == openid).OrderBy(s => s.insert_time).First(s => s.insert_time);
            var payHistory = Sqldb.Select<pay_chart>()
                .Where(s => s.expert_openid == openid).ToList();

            var startTime = new DateTime(expertTime.Year, expertTime.Month, 1);
            var nowTime = DateTime.Now;
            var yearDiff = nowTime.Year - startTime.Year;
            var year = startTime.Year;
            var list = new List<ApiRewardDto>();
            decimal unPayedMoney = 0;
            for (int i = 0; i <= yearDiff; i++)
            {
                if (i > 0)
                {
                    startTime = new DateTime(expertTime.Year + i, 1, 1);
                }
                var model = new ApiRewardDto();
                model.year = startTime.Year;
                model.payed = 1;
                var endTime = new DateTime(startTime.Year, 12, 1);
                var stimeInt = startTime.ToString("yyyyMM").ToInt();
                var endTimeInt = endTime.ToString("yyyyMM").ToInt();
                var questions = payHistory.Where(s => s.year_num >= stimeInt && s.year_num <= endTimeInt)
                    .OrderBy(s => s.year_num).ToList();
                decimal totalFee = 0;
                foreach (var q in questions)
                {
                    var item = new ApiRewardMonthDto();
                    item.month = q.year_num.ToString().Substring(4) + "月";
                    item.totalMoney = decimal.Round(q.money_num / 100,2).ToString();
                    item.payed = q.end;
                    totalFee += q.money_num;
                    if (q.end == 0)
                    {
                        unPayedMoney += q.money_num;
                        model.payed = 0;
                    }
                    model.items.Add(item);
                }
                model.totalMoney = decimal.Round(totalFee / 100, 2).ToString();
                list.Add(model);
            }
            string unPayedMoneyStr = decimal.Round(unPayedMoney / 100, 2).ToString();
            return (unPayedMoneyStr, list);
        }


        /// <summary>
        /// 用户评价
        /// </summary>
        /// <param name="openId"></param>
        /// <param name="page"></param>
        /// <param name="psize"></param>
        /// <returns></returns>
        public List<CommentListDto> CommentList(string openId,int page,int psize)
        {
            string emptId = IdWorkerHelper.GenOId();
            var list = Sqldb.Select<expert_question>()
                .Where(s => s.expert_id == openId && s.pid == emptId && s.has_patient_remark == 1)
                .OrderByDescending(s => s.comment_time)
                .Page(page,psize)
                .ToList(s => new CommentListDto
                {
                    id = s.id,
                    content = s.qcontent,
                    expertId = s.expert_oid,
                    expertOpenId = s.expert_id,
                    commentTime = s.comment_time,
                    star=s.star_num,
                    isAnonymous=s.is_anonymous,
                    patientOpenId=s.insert_id,
                    comment=s.patient_remark
                });
            if (list.Count > 0)
            {
                var expertIds = list.Select(s => s.expertId).Distinct().ToList();
                var experts = Sqldb.Select<expert_info>().Where(s => expertIds.Contains(s.id))
                    .Select(s => new CommentListDto { id = s.id, expertName = s.expert_name, expertTitle = s.expert_title }).ToList();

                var patientIds= list.Where(s=>s.isAnonymous==0).Select(s => s.patientOpenId).Distinct().ToList();
                var patients = new List<CommentListDto>();
                if (patientIds.Count > 0)
                {
                    patients = Sqldb.Select<wx_user>().Where(s => patientIds.Contains(s.open_id))
                         .Select(s => new CommentListDto { patientOpenId = s.open_id, patientName = s.nick_name }).ToList();
                }


                foreach(var s in list)
                {
                    var expert = experts.Where(a => a.id == s.expertId).FirstOrDefault();
                    if (expert != null)
                    {
                        s.expertName = expert.expertName;
                        s.expertTitle = expert.expertTitle;
                    }
                    if (s.isAnonymous == 1)
                    {
                        s.patientName = "匿名";
                        continue;
                    }
                    s.patientName = patients.Where(a => a.patientOpenId == s.patientOpenId).Select(a => a.patientName).FirstOrDefault();
                }

            }

            return list;

        }
    }
}
