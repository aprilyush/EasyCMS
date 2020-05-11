using Atlass.Framework.Common.NLog;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.Jobs
{
    public class ScoreJob:IJob
    {
        /// <summary>
        ///计算超时任务
        /// </summary>
        public void Excute(string wxAppId, string taskId)
        {
            try
            {
                var Sqldb = FreesqlDbInstance.GetInstance();
                var nowTime = DateTime.Now;
                var etime = new DateTime(nowTime.Year, nowTime.Month, nowTime.Day);
                var stime = etime.AddDays(-7);
                var ftime = stime.AddDays(-2);
                long count = Sqldb.Select<expert_question>()
                    .Where(s => s.star_num == 0 && s.insert_time > ftime && s.insert_time <= stime)
                    .OrderBy(s => s.id).Count();

                long times = count / 50;
                long remainCount = count % 50;
                if (remainCount > 0)
                {
                    times = times + 1;
                }
                for (int i = 1; i <= times; i++)
                {
                    var questions = Sqldb.Queryable<expert_question>()
                        .Where(s => s.star_num == 0 && s.insert_time > ftime && s.insert_time <= stime)
                        .OrderBy(s => s.id)
                        .Select(s => new { id = s.id, openid = s.expert_id,expertId=s.expert_oid })
                        .Page(i, 50).ToList();
                    var expertIds = questions.Select(s => s.expertId).Distinct().ToList();
                    var experts = Sqldb.Select<expert_info>().Where(s => expertIds.Contains(s.id))
                        .ToList(s => new expert_info { id = s.id, open_id = s.open_id, 
                            expert_count = s.expert_count, star_score = s.star_score });
                    if (questions.Count>0)
                    {
                        foreach (var expert in experts)
                        {
                            try
                            {
                                var qids = questions.Where(s => s.expertId == expert.id).Select(s => s.id).ToList();
                                int qcount = qids.Count;
                                if (qcount > 0)
                                {
                                    int totalCount = expert.expert_count + qcount;
                                    decimal totalNum = decimal.Round(expert.expert_count / (decimal)2.5, 1);
                                    decimal totalStar = expert.star_score * totalNum;
                                    decimal newStar = Math.Round((totalStar + (5 * qcount)) / (totalNum + qcount), 1);
                                    expert.star_score = newStar;
                                    expert.expert_count = totalCount;

                                    Sqldb.Transaction(()=> {
                                        var affrows = Sqldb.Update<expert_question>().Set(s => new expert_question()
                                        {
                                            round_end = true,
                                            star_num = 5
                                        }).Where(s => qids.Contains(s.id)).ExecuteAffrows();
                                        if (affrows < 1)
                                            throw new Exception("更新问题评分失败");

                                        affrows = Sqldb.Update<expert_info>().Set(s => new expert_info()
                                        {
                                            expert_count = totalCount,
                                            star_score = expert.star_score
                                        }).Where(s => s.id == expert.id).ExecuteAffrows();
                                        if (affrows < 1)
                                            throw new Exception("更新专家评分失败");
                                    });
                                  
                                }
                            }
                            catch (Exception e)
                            {
                                LogNHelper.Exception(e);
                            }
                        }
                    }

                }
                Sqldb.Update<hangfire_task>().Set(s => s.excute_time ,DateTime.Now)
                    .Where(s => s.id == taskId).ExecuteAffrows();
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }
        }
    }
}
