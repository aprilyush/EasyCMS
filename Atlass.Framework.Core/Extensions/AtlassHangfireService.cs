using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.HangfireExtend;
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
            string redisConn = configuration.GetSection("redisConn:redisConnStr").Value;
            string redisPwd = configuration.GetSection("redisConn:redisPwd").Value;
            //var hgOpts = ConfigurationOptions.Parse(redisConn);
            //hgOpts.AllowAdmin = true;
            //hgOpts.Password = redisPwd;

          //  var _redisContext = ConnectionMultiplexer.Connect(hgOpts);


            //hangfire
            //  
            try
            {
                //Version=3;Pooling=true;FailIfMissing=false;
                string filePath = AppDomain.CurrentDomain.BaseDirectory + @"data\hangfire.db";
                string connection = $"Data Source ={filePath};Mode=ReadWriteCreate;Cache=Shared";
                //LogNHelper.Info(connection);

                GlobalStateHandlers.Handlers.Add(new SucceededStateExpireHandler(30));
                services.AddHangfire(x => x.UseLogProvider(new CustomLogProvider())
                .UseSQLiteStorage(connection));

            }
            catch(Exception ex)
            {
                LogNHelper.Exception(ex);
            }

            try
            {
                string pre_name = "{easy_cms}:";
                //redis缓存初始化
                var csredis = new CSRedis.CSRedisClient($"{redisConn},password={redisPwd},defaultDatabase=0,poolsize=20,ssl=false,writeBuffer=10240,prefix={pre_name}");
                RedisHelper.Initialization(csredis);
            }
            catch(Exception ex)
            {
                LogNHelper.Exception(ex);
            }


            return services;
        }
    }
}
