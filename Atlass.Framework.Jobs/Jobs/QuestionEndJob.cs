using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.DbContext;
using Atlass.Framework.Jobs.Message;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Jobs
{
    public class QuestionEndJob: IJob
    {
        public void Excute(string wxAppId, string taskId)
        {
            try
            {
                var Sqldb = FreesqlDbInstance.GetInstance();

                var stime = DateTime.Now.AddHours(-24);
                var ftime = stime.AddDays(-1);
                string emptyId = IdWorkerHelper.GenOId();
                var questions = Sqldb.Select<expert_question>()
                    .Where(s => s.pid == emptyId && s.qend == false && s.insert_time > ftime && s.insert_time <= stime)
                    .OrderBy(s => s.id)
                    .Select(s => new { id = s.id, openid = s.insert_id }).ToList();
                int count = questions.Count;
                if (count > 0)
                {
                    //专家id
                    //int totalPage = count / 10;
                    //int remain = count % 10;
                    //totalPage += remain;


                    try
                    {
                        foreach (var q in questions)
                        {
                            Task.Factory.StartNew(() => MessagePush.End(wxAppId, q.openid, q.id, "您24小时内未进行追问,咨询已终止。"));
                        }

                        var ids = questions.Select(s => s.id).Distinct().ToList();
                        Sqldb.Transaction(() =>
                        {
                           var affrows = Sqldb.Update<expert_question>().Set(s => s.qend, true)
                          .Where(s => ids.Contains(s.id))
                          .ExecuteAffrows();
                            if (affrows < 1)
                                throw new Exception("更新主问题失败");
                            affrows=Sqldb.Update<expert_question>().Set(s => s.qend, true)
                                .Where(s => ids.Contains(s.pid))
                                .ExecuteAffrows();
                            if (affrows < 1)
                                throw new Exception("更新追问问题失败");
                        });

                    }
                    catch (Exception e)
                    {
                        LogNHelper.Exception(e);
                    }
                }
                Sqldb.Update<hangfire_task>().Set(s => s.excute_time, DateTime.Now)
                      .Where(s => s.id == taskId).ExecuteAffrows();
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }

        }

    }
}
