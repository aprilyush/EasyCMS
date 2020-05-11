using Atlass.Framework.Models.BaseData;
using System;

namespace Atlass.Framework.Cache
{
    public class WeiXinCacheHelper
    {
        private const string PreKey = "{WeiXin}:";

        /// <summary>
        /// 首页总量统计
        /// </summary>

        public static weixin_set GetPushMessage()
        {
            string key = $"{PreKey}PushMessage";
            var data = RedisHelper.Get<weixin_set>(key);
            return data;
        }


        /// <summary>
        /// 首页总量统计
        /// </summary>

        public static void SetPushMessage(weixin_set dto)
        {
            string key = $"{PreKey}PushMessage";
            int expireSecond = 30 * 24 * 60*60;
            RedisHelper.Set(key, dto, expireSecond);
        }
    }
}
