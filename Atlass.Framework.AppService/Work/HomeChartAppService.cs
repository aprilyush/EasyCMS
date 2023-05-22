using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.Home;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.AppService.Work
{
    public class HomeChartAppService
    {
        private readonly IFreeSql Sqldb;
        public HomeChartAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public HomeChartDto GetCmsSummary()
        {

            var model = new HomeChartDto();
            model.channel_count = Sqldb.Select<cms_channel>().Count();
            model.content_count = Sqldb.Select<cms_content>().Count();

            return model;
        }

    }
}
