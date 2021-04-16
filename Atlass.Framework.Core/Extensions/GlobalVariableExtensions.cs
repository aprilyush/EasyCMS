
using Atlass.Framework.DbContext;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.YmlConfigs;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.Core.Extensions
{
    public static class GlobalVariableExtensions
    {
        public static IServiceCollection AddGlobalVariable(this IServiceCollection services, IConfiguration configuration)
        {

            services.AddHttpContextAccessor();
            services.TryAddSingleton<IActionContextAccessor, ActionContextAccessor>();


            ReadDbConfig(configuration);

            //freesql
            services.AddFreeSql();
            DbInstanceFactory.dbConfig = GlobalContext.DefaultDbConfig;

            ChangeToken.OnChange(() => configuration.GetReloadToken(), () =>
            {
                //GlobalVariableModel.BackUpHost = configuration.GetSection("BackupHost").Value;
                ReadDbConfig(configuration);

                if (GlobalContext.DefaultDbConfig.MasterConnection != DbInstanceFactory.dbConfig.MasterConnection)
                {
                    services.RemoveAll<IFreeSql>();
                    services.AddFreeSql();
                    DbInstanceFactory.dbConfig = GlobalContext.DefaultDbConfig;
                }

            });

            
            return services;
        }

        /// <summary>
        /// 读取数据库配置
        /// </summary>
        /// <param name="configuration"></param>
        private static void ReadDbConfig(IConfiguration configuration)
        {
            //获取数据库连接
            var dbConfigs = configuration.GetSection("DbConfigs").Get<List<DbConfigsDto>>();
            var defaultDbConfig = dbConfigs.Where(s => s.Enable == true).FirstOrDefault();
            if (defaultDbConfig == null)
            {
                throw new Exception("请设置数据库连接");

            }
            GlobalContext.DbConfigs = dbConfigs;
            GlobalContext.DefaultDbConfig = defaultDbConfig;

        }
    }
}
