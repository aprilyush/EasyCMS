using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.Models.doctor;
using Atlass.Framework.ViewModels.Api;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Jobs
{
    public class PayChartJob : IJob
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
                var list = new List<pay_chart>();
                foreach (var expert in experts)
                {
                    var payChartHistory = Sqldb.Select<pay_chart>()
                        .Where(s => s.expert_id == expert.id && s.last_time > expert.insert_time)
                        .OrderByDescending(s => s.year_num).First();
                    if (payChartHistory == null)
                    {
                        //如果不存在 需要重新计算
                        InitAll(Sqldb, expert);
                    }
                    else
                    {
                        if (payChartHistory.end == 1)
                        {
                            continue;
                        }
                        // var nowMonth = new DateTime(nowTime.Year, nowTime.Month, 1);
                        var expertTime = payChartHistory.last_time;
                        var stime = new DateTime(expertTime.Year, expertTime.Month, 1);
                        var yearNum = stime.ToString("yyyyMM").ToInt();
                        var lastTimeStart = stime.ToString("yyyyMMddHHmmss").ToInt64();
                        var lastTimeEnd= stime.AddMonths(1).ToString("yyyyMMddHHmmss").ToInt64();

                        var totalFee = Sqldb.Select<pay_history>()
                            .Where(s => s.time_end >= lastTimeStart && s.time_end < lastTimeEnd && s.expert_did == expert.id)
                            .Sum(s => s.total_fee);

                        payChartHistory.money_num =totalFee;
                        payChartHistory.last_time = nowTime;
                        list.Add(payChartHistory);
                    }
                }

                if (list.Count > 0)
                {
                    Sqldb.Update<pay_chart>().SetSource(list).UpdateColumns(s => new { s.money_num, s.last_time }).ExecuteAffrows();
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

                var list = new List<pay_chart>();
                while (startTime < nowTime)
                {
                    var timeEndStart = startTime.ToString("yyyyMMddHHmmss").ToInt64();
                    var timeEnd = startTime.AddMonths(1).ToString("yyyyMMddHHmmss").ToInt64();
                    var money = SqlDb.Select<pay_history>()
                        .Where(s => s.time_end >= timeEndStart && s.time_end < timeEnd && s.expert_did == expert.id)
                        .Sum(s => s.total_fee);
                    var model = new pay_chart();
                    model.expert_openid = expert.open_id;
                    model.expert_id = expert.id;
                    model.money_num = money;
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

        /// <summary>
        /// 遗漏补缺
        /// </summary>
        /// <param name="SqlDb"></param>
        /// <param name="expert"></param>
        private void PatchChart(IFreeSql SqlDb, ExpertDetailDto expert, DateTime startTime)
        {

        }
    }
}
