
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Cache
{
    /// <summary>
    /// https://www.cnblogs.com/refuge/p/13774008.html
    /// </summary>
    public class RedisLockHelper
    {
        private readonly static string _lockKey = "lockKey";
        private readonly static string _luaScript = "if redis.call('get', KEYS[1]) == ARGV[1] then return redis.call('del', KEYS[1]) else return 0 end";//释放锁的redis脚本

        /// <summary>
        /// //测试前,先把锁删了.
        /// </summary>
        public static void DeleteLock()
        {
            var redisClient = RedisFactory.GetRedisClient();
            redisClient.Del(_lockKey);
        }

        /// <summary>
        /// set : key存在则失败,不存在才会成功,并且过期时间5秒
        /// </summary>
        /// <param name="lockVal"></param>
        /// <returns></returns>
        public static bool SetLock(string lockId)
        {
            var redisClient = RedisFactory.GetRedisClient();
            //var success = redisClient.Set(_lockKey, lockId, expireSeconds: 5, exists: RedisExistence.Nx);
            // var success = redisClient.Set(_lockKey, lockId, expireSeconds: 5, exists: false);
            //return success;
            return false;
        }

        /// <summary>
        /// 业务处理完后,释放锁.
        /// </summary>
        /// <param name="lockId"></param>
        public static void ReleaseLock(string lockId)
        {
            var redisClient = RedisFactory.GetRedisClient();
            redisClient.Eval(_luaScript, new string[] { _lockKey }, lockId);
        }
    }
}
