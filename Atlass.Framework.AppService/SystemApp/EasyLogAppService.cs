using Atlass.Framework.Common;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.SystemApp
{
    public class EasyLogAppService
    {
        private readonly IFreeSql Sqldb;
        public EasyLogAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public BootstrapGridDto GetList(BootstrapGridDto param, int logType, string log_summary)
        {
            
            var query = Sqldb.Select<easy_log>()
                .WhereIf(logType > 0, s => s.log_type == logType)
                .WhereIf(!string.IsNullOrEmpty(log_summary), s => s.log_summary == log_summary)
                .OrderByDescending(s => s.id).Count(out long total).Page(param.page, param.limit).ToList();
            param.total = total;
            param.rows = query;
            return param;
        }


        public easy_log GetModel(int id)
        {
            return Sqldb.Queryable<easy_log>().Where(s => s.id == id).First();
        }

        public void DelByIds(string ids)
        {
            var idsArray = ids.SplitToArrayInt();
            Sqldb.Delete<easy_log>().Where(s => idsArray.Contains(s.id)).ExecuteAffrows();
        }
    }
}
