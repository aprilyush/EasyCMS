using Atlass.Framework.Cache;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core.HangfireExtend;
using Atlass.Framework.ViewModels.YmlConfigs;
using Hangfire;
using Hangfire.Heartbeat;
using Hangfire.LiteDB;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Extensions
{
    public static class EasyHangfireService
    {
        public static IServiceCollection AddAtlassHangfire(this IServiceCollection services, IConfiguration configuration)
        {
            var redis = configuration.GetSection("RedisConfig").Get<RedisConfigDto>();

            var crontab = configuration.GetSection("Crontab").Get<CrontabConfigDto>();
            GlobalContext.RedisConfig = redis;
            GlobalContext.CrontabConfigDto = crontab;
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
                if (crontab.Enable)
                {
                    string filePath = AppDomain.CurrentDomain.BaseDirectory + @"data\hangfire_lite.db";
                    //string connection = $"Data Source ={filePath};Mode=ReadWriteCreate;Cache=Shared";
                    //LoggerHelper.Info(connection);
                    string liteConnection = $"Filename={filePath};Connection=direct";
                    GlobalStateHandlers.Handlers.Add(new SucceededStateExpireHandler(30));
                    services.AddHangfire(x => x.UseLogProvider(new CustomLogProvider())
                     .UseLiteDbStorage(liteConnection, null)
                     .UseHeartbeatPage(checkInterval: TimeSpan.FromSeconds(crontab.CheckInterval)));
                }
            }
            catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

           


            return services;
        }
    }
}
