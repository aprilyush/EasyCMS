using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.Models.doctor;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.Wx;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Consulting
{
    public class PayChartAppService
    {
        private readonly IFreeSql Sqldb;
        public PayChartAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param, string stime, string etime, LoginUserDto user)
        {
            if (user.IsSuper)
            {
                var query = Sqldb.Select<pay_chart>();
                if (!string.IsNullOrEmpty(stime))
                {
                    var startTime = stime.ToDate().ToString("yyyyMM").ToInt();
                    query = query.Where(s => s.year_num >= startTime);
                }
                if (!string.IsNullOrEmpty(etime))
                {
                    var endTime = etime.ToDate().ToString("yyyyMM").ToInt();
                    query = query.Where(s => s.year_num <= endTime);
                }
                var data = query.OrderByDescending(s => s.year_num)
                    .Count(out long total)
                    .Page(param.page, param.limit)
                    .ToList(s=>new PayChartListDto { 
                      id=s.id,expert_id=s.expert_id,
                      expert_openid=s.expert_openid,money_num=s.money_num,year_num=s.year_num
                    });

                if (data.Count > 0)
                {
                    var expertIds = data.Select(s => s.expert_id).Distinct().ToList();
                    var experts = Sqldb.Select<expert_info>().Where(s => expertIds.Contains(s.id))
                        .ToList(s => new DicKeyStrDto { id = s.id, name = s.expert_name });
                    data.ForEach(s =>
                    {
                        s.expertName = experts.Where(a => a.id == s.expert_id).Select(a => a.name).FirstOrDefault();
                        s.totalFee = decimal.Round(s.money_num / 100, 2);
                        string yearNum = s.year_num.ToString();
                        s.yearNumString = yearNum.Substring(0, 4) + "年" + yearNum.Substring(4) + "月";
                    });
                }
                param.total = total;
                param.rows = data;
                return param;
            }

            var query2 = Sqldb.Select<pay_chart, user_ref_expert>()
                .InnerJoin((p, u) => p.expert_id == u.expert_id)
                .Where((p, u) => u.user_id == user.Id);
            if (!string.IsNullOrEmpty(stime))
            {
                var startTime = stime.ToDate().ToString("yyyyMMdd").ToInt();
                query2 = query2.Where((p, u) => p.year_num >= startTime);
            }
            if (!string.IsNullOrEmpty(etime))
            {
                var endTime = etime.ToDate().ToString("yyyyMMdd").ToInt();
                query2 = query2.Where((p, u) => p.year_num < endTime);
            }

            var data2 = query2.OrderByDescending((p, u) => p.year_num)
                    .Count(out long total2)
                    .Page(param.page, param.limit)
                    .ToList((p, u) => new PayChartListDto
                    {
                        id = p.id,
                        expert_id = p.expert_id,
                        expert_openid =p.expert_openid,
                        money_num =p.money_num,
                        year_num =p.year_num
                    });
            if (data2.Count > 0)
            {
                var expertIds = data2.Select(s => s.expert_id).Distinct().ToList();
                var experts = Sqldb.Select<expert_info>().Where(s => expertIds.Contains(s.id))
                    .ToList(s => new DicKeyStrDto { id = s.id, name = s.expert_name });
                data2.ForEach(s =>
                {
                    s.expertName = experts.Where(a => a.id == s.expert_id).Select(a => a.name).FirstOrDefault();
                    s.totalFee = decimal.Round(s.money_num / 100, 2);
                    string yearNum = s.year_num.ToString();
                    s.yearNumString = yearNum.Substring(0, 4) + "年" + yearNum.Substring(4) + "月";
                });
            }
            param.total = total2;
            param.rows = data2;
            return param;
        }

        /// <summary>
        /// 结算
        /// </summary>
        /// <param name="id"></param>
        public void PayToDoctor(int id)
        {
            var pay = Sqldb.Select<pay_chart>().Where(s => s.id == id).First();
            if (pay == null)
            {
                return;
            }
            if (pay.end == 1)
            {
                return;
            }

            Sqldb.Update<pay_chart>().Set(s => s.end, 1).Where(s => s.id == id).ExecuteAffrows();
        }
    }
}
