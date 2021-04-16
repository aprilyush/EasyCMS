using Atlass.Framework.ViewModels.YmlConfigs;
using FreeRedis;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Cache
{

    /// <summary>
    /// redis工厂
    /// </summary>
    public class RedisFactory
    {
        /// <summary>
        /// redis客户端
        /// </summary>
        private static RedisClient redisClient;

        /// <summary>
        /// 使用前必须初始化
        /// </summary>
        /// <param name="redisConfig"></param>
        public static void Init(RedisConfigDto redisConfig)
        {
            string conn = $"{redisConfig.Host},password={redisConfig.Password},prefix={redisConfig.PreKey},name={redisConfig.ConnectionName},defaultDatabase={redisConfig.Db},min poolsize={redisConfig.MinPoolSize},max poolsize={redisConfig.MaxPoolSize}";
            redisClient = new RedisClient(conn);
            redisClient.Serialize = obj => JsonConvert.SerializeObject(obj);
            redisClient.Deserialize = (json, type) => JsonConvert.DeserializeObject(json, type);

        }


        /// <summary>
        /// 获取redis客户端
        /// </summary>
        /// <returns></returns>
        public static RedisClient GetRedisClient()
        {
            return redisClient;
        }
    }
}
