using Atlass.Framework.Cache;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core.HangfireExtend;
using Atlass.Framework.ViewModels.YmlConfigs;
using Hangfire;
using Hangfire.Heartbeat;
using Hangfire.LiteDB;
using Hangfire.Storage.SQLite;
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
                    #region 使用sqlite存储
                    if (crontab.Storage == 0)
                    {
                        string filePath = AppDomain.CurrentDomain.BaseDirectory + @"data\hangfire_sqlite.db";
                        string connection = $"Data Source ={filePath};Mode=ReadWriteCreate;Cache=Shared";
                        //LoggerHelper.Info(connection);

                        GlobalStateHandlers.Handlers.Add(new SucceededStateExpireHandler(120));
                        services.AddHangfire(x => x.UseSimpleAssemblyNameTypeSerializer()
                                                   .UseRecommendedSerializerSettings()
                                                   //.UseSQLiteStorage(connection)
                                                   .UseSQLiteStorage()
                                                   .UseLogProvider<CustomLogProvider>(new CustomLogProvider())
                                                   .UseHeartbeatPage(checkInterval: TimeSpan.FromSeconds(crontab.CheckInterval)));
                    }

                    #endregion

                    #region 使用litedb存储
                    else
                    {
                        string liteFilePath = AppDomain.CurrentDomain.BaseDirectory + @"data\hangfire_lite.db";
                        //direct;shared
                        string liteConnection = $"Filename={liteFilePath};Connection=direct";
                        GlobalStateHandlers.Handlers.Add(new SucceededStateExpireHandler(30));

                        LiteDbStorageOptions liteDbStorageOptions = new LiteDbStorageOptions()
                        { QueuePollInterval = TimeSpan.FromSeconds(5), };

                        services.AddHangfire(config => config.UseLogProvider(new CustomLogProvider())
                                                   .UseLiteDbStorage(liteConnection, null)
                                                   .UseHeartbeatPage(checkInterval: TimeSpan.FromSeconds(crontab.CheckInterval)));
                    }

                    #endregion
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
