
using Atlass.Framework.DbContext;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Extensions
{
    public static class GlobalVariableExtensions
    {
        public static IServiceCollection AddGlobalVariable(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<FreeSqlConfig>(configuration.GetSection("FreeSqlConfig"));
            //GlobalVariableModel.BackUpHost = configuration.GetSection("BackupHost").Value;
            services.AddHttpContextAccessor();
            services.TryAddSingleton<IActionContextAccessor, ActionContextAccessor>();
            services.AddFreeSql();
            ChangeToken.OnChange(() => configuration.GetReloadToken(), () =>
            {
                //GlobalVariableModel.BackUpHost = configuration.GetSection("BackupHost").Value;
                services.Configure<FreeSqlConfig>(configuration.GetSection("FreeSqlConfig"));
                var freeSql = configuration.GetSection("FreeSqlConfig").Get<FreeSqlConfig>();
                if (freeSql.MasterConnetion != FreesqlDbInstance.FreeSqlConfig.MasterConnetion)
                {
                    services.RemoveAll<IFreeSql>();
                    services.AddFreeSql();
                    FreesqlDbInstance.FreeSqlConfig = freeSql;
                }

            });

            
            return services;
        }
    }
}
