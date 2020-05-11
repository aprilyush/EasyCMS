using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.Models.doctor;
using Atlass.Framework.ViewModels.Api;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Jobs
{
    /// <summary>
    /// 咨询问题统计
    /// </summary>
    public class QuestionChartJob:IJob
    {
        public void Excute(string wxAppId, string taskId)
        {
            try
            {
                var nowTime = DateTime.Now;
                var Sqldb = FreesqlDbInstance.GetInstance();

                var experts = Sqldb.Select<expert_info>().Where(s => s.is_delete == 0).ToList(s => new ExpertDetailDto
                {
                    id = s.id,
                    open_id = s.open_id,
                    insert_time = s.insert_time
                });
                string emptyId = IdWorkerHelper.GenOId();
                var list = new List<question_chart>();
                foreach (var expert in experts)
                {
                    var payChartHistory = Sqldb.Select<question_chart>()
                        .Where(s => s.expert_id == expert.id && s.last_time > expert.insert_time)
                        .OrderByDescending(s => s.year_num).First();
                    if (payChartHistory == null)
                    {
                        //如果不存在 需要重新计算
                        InitAll(Sqldb, expert);
                    }
                    else
                    {
                       
                        // var nowMonth = new DateTime(nowTime.Year, nowTime.Month, 1);
                        var expertTime = payChartHistory.last_time;
                        var stime = new DateTime(expertTime.Year, expertTime.Month, 1);
                        var yearNum = stime.ToString("yyyyMM").ToInt();
                        var lastTimeEnd = stime.AddMonths(1);

                        
                        var questionCount = Sqldb.Select<expert_question>()
                            .Where(s => s.insert_time >= stime && s.insert_time < lastTimeEnd && s.expert_oid == expert.id&&s.pid== emptyId)
                            .Count();

                        payChartHistory.question_count = (int)questionCount;
                        payChartHistory.last_time = nowTime;
                        list.Add(payChartHistory);
                    }
                }

                if (list.Count > 0)
                {
                    Sqldb.Update<question_chart>().SetSource(list)
                        .UpdateColumns(s => new { s.question_count, s.last_time }).ExecuteAffrows();
                }

                Sqldb.Update<hangfire_task>().Set(s => s.excute_time, DateTime.Now)
                   .Where(s => s.id == taskId).ExecuteAffrows();
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }

        }

        /// <summary>
        /// 完全没有的时候初始化
        /// </summary>
        /// <param name="SqlDb"></param>
        private void InitAll(IFreeSql SqlDb, ExpertDetailDto expert)
        {
            try
            {
                var expertTime = expert.insert_time;
                var nowTime = DateTime.Now;
                var endTime = new DateTime(nowTime.Year, nowTime.Month, 1);
                var startTime = new DateTime(expertTime.Year, expertTime.Month, 1);
                string emptyId = IdWorkerHelper.GenOId();
                var list = new List<question_chart>();
                while (startTime < nowTime)
                {
                    var timeEndStart = startTime;
                    var timeEnd = startTime.AddMonths(1);
                    var questionCount = SqlDb.Select<expert_question>()
                            .Where(s => s.insert_time >= timeEndStart && s.insert_time < timeEnd 
                            && s.expert_oid == expert.id && s.pid == emptyId)
                            .Count();
                    var model = new question_chart();
                    model.expert_openid = expert.open_id;
                    model.expert_id = expert.id;
                    model.question_count = (int)questionCount;
                    model.year_num = startTime.ToString("yyyyMM").ToInt();
                    model.last_time = DateTime.Now;
                    list.Add(model);

                    startTime = startTime.AddMonths(1);
                }
                if (list.Count > 0)
                {
                    SqlDb.Insert(list).ExecuteAffrows();
                }
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
        }
    }
}
