using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.Consulting
{
    public class PatientAppService
    {
        private readonly IFreeSql Sqldb;
        public PatientAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public BootstrapGridDto Getdata(BootstrapGridDto param,string patientOpenId, string  patientName)
        {
            var query = Sqldb.Select<wx_user>()
                .WhereIf(!string.IsNullOrEmpty(patientOpenId),s=>s.open_id==patientOpenId)
                .WhereIf(!string.IsNullOrEmpty(patientName), s => s.nick_name == patientName)
                .OrderByDescending(s =>s.create_time)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList();
            param.rows = query;
            param.total = total;
            return param;
        }

        public wx_user GetModel(string id)
        {
            return Sqldb.Select<wx_user>().Where(s => s.id == id).First();
        }
    }
}
