using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.Wx;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Consulting
{
    public class PayHistoryAppService
    {
        private readonly IFreeSql Sqldb;
        public PayHistoryAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param,string stime,string etime,LoginUserDto user)
        {
            if (user.IsSuper)
            {
                var query = Sqldb.Select<pay_history>();
                if (!string.IsNullOrEmpty(stime))
                {
                    var startTime = stime.ToDate();
                    query = query.Where(s => s.pay_time >= startTime);
                }
                if (!string.IsNullOrEmpty(etime))
                {
                    var endTime = etime.ToDate().AddDays(1);
                    query = query.Where(s => s.pay_time < endTime);
                }
                var data = query.OrderByDescending(s => s.time_end)
                    .Count(out long total)
                    .Page(param.page, param.limit)
                    .ToList();

                param.total = total;
                param.rows = data;
                return param;
            }

            var query2 = Sqldb.Select<pay_history, user_ref_expert>()
                .InnerJoin((p, u) => p.expert_did == u.expert_id)
                .Where((p, u) => u.user_id == user.Id);
            if (!string.IsNullOrEmpty(stime))
            {
                var startTime = stime.ToDate();
                query2 = query2.Where((p, u) =>p.pay_time >= startTime);
            }
            if (!string.IsNullOrEmpty(etime))
            {
                var endTime = etime.ToDate().AddDays(1);
                query2 = query2.Where((p, u) =>p.pay_time < endTime);
            }

            var data2 = query2.OrderByDescending((p, u) => p.time_end)
                    .Count(out long total2)
                    .Page(param.page, param.limit)
                    .ToList((p, u)=>p);

            param.total = total2;
            param.rows = data2;
            return param;
        }

        /// <summary>
        /// 获取问题超时规格
        /// </summary>
        /// <returns></returns>
        public question_timeline GetTimeline()
        {
            var model = Sqldb.Queryable<question_timeline>().OrderBy(s => s.id).First();
            if (model == null)
            {
                model = new question_timeline();
                model.qcount = 3;
                model.qhours = 24;
            }

            return model;
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="model"></param>
        public void SaveTimeline(question_timeline model)
        {
            if (model.id == 0)
            {
                Sqldb.Insert(model).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<question_timeline>(model).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 支付导出
        /// </summary>
        /// <param name="stime"></param>
        /// <param name="etime"></param>
        /// <returns></returns>
        public List<PayHistoryExportDto> GetOutList(DateTime stime, DateTime etime)
        {
            etime = etime.AddDays(1);
            var query = Sqldb.Queryable<pay_history>().Where(s => s.pay_time > stime && s.pay_time < etime).ToList();
            var list = new List<PayHistoryExportDto>();
            if (query.Any())
            {
                foreach (var q in query)
                {
                    var model = new PayHistoryExportDto();
                    model.Ename = q.expert_name;
                    model.OpenId = q.openid;
                    model.OrderId = q.out_trade_no;
                    model.PayTime = q.pay_time.ToString("yyyy-MM-dd HH:mm:ss");
                    model.PayCount = q.total_fee.ToString();
                    list.Add(model);
                }
            }

            return list;
        }
    }
}
