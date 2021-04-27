using Atlass.Framework.Cache;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core.HangfireExtend;
using Atlass.Framework.ViewModels.YmlConfigs;
using Hangfire;
using Hangfire.SQLite;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Extensions
{
    public static class AtlassHangfireService
    {
        public static IServiceCollection AddAtlassHangfire(this IServiceCollection services, IConfiguration configuration)
        {
            var redis = configuration.GetSection("RedisConfig").Get<RedisConfigDto>();

            GlobalContext.RedisConfig = redis;
            try
            {
                RedisFactory.Init(redis);
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }
            //hangfire
            try
            {
                //Version=3;Pooling=true;FailIfMissing=false;
                string filePath = AppDomain.CurrentDomain.BaseDirectory + @"data\hangfire.db";
                string connection = $"Data Source ={filePath};Mode=ReadWriteCreate;Cache=Shared";
                //LoggerHelper.Info(connection);

                GlobalStateHandlers.Handlers.Add(new SucceededStateExpireHandler(30));
                services.AddHangfire(x => x.UseLogProvider(new CustomLogProvider())
                .UseSQLiteStorage(connection));

            }
            catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

           


            return services;
        }
    }
}
