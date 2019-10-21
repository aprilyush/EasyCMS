using Altas.Framework.Core.AltasDbContext;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Altas.Framework.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Altas.Framework.AppService.Jobs
{
    public class JobsManagerAppService:BaseAppService
    {
        public JobsManagerAppService(IAltasDbContext sqldb) : base(sqldb)
        {

        }


        public BootstrapGridDto GetData(BootstrapGridDto param)
        {
            int total = 0;
            var query = Sqldb.Queryable<hangfire_jobs>().OrderBy(s => s.id)
                .ToPageList(param.page, param.limit, ref total);
            param.rows = query;
            param.total = total;
            return param;
        }


        public void InitAllJobs(List<hangfire_jobs> jobs)
        {
            Sqldb.Insertable(jobs).ExecuteCommand();
        }
    }
}
