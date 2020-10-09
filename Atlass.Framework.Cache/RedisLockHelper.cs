using CSRedis;
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
            RedisHelper.Del(_lockKey);
        }

        /// <summary>
        /// set : key存在则失败,不存在才会成功,并且过期时间5秒
        /// </summary>
        /// <param name="lockVal"></param>
        /// <returns></returns>
        public static bool SetLock(string lockId)
        {
            var success = RedisHelper.Set(_lockKey, lockId, expireSeconds: 5, exists: RedisExistence.Nx);
            return success;
        }

        /// <summary>
        /// 业务处理完后,释放锁.
        /// </summary>
        /// <param name="lockId"></param>
        public static void ReleaseLock(string lockId)
        {
            RedisHelper.Eval(_luaScript, _lockKey, lockId);
        }
    }
}
