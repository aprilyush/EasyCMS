using Atlass.Framework.Core.HangfireExtend;
using Hangfire;
using Hangfire.Redis;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;
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
            var hgOpts = ConfigurationOptions.Parse(redisConn);
            hgOpts.AllowAdmin = true;
            hgOpts.Password = redisPwd;

            var _redisContext = ConnectionMultiplexer.Connect(hgOpts);


            //hangfire
            GlobalStateHandlers.Handlers.Add(new SucceededStateExpireHandler(30));
            services.AddHangfire(x => x.UseLogProvider(new CustomLogProvider())
            .UseRedisStorage(_redisContext, new RedisStorageOptions()
            {
                Prefix = "{doctorPlatform}:{auto_job}:"
            }));
            string pre_name = "{doctorPlatform}:{app}:";
            //redis缓存初始化
            var csredis = new CSRedis.CSRedisClient($"{redisConn},password={redisPwd},defaultDatabase=0,poolsize=50,ssl=false,writeBuffer=10240,prefix={pre_name}");
            RedisHelper.Initialization(csredis);

            return services;
        }
    }
}
