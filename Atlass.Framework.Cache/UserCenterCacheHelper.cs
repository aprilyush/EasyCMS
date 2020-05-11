using Atlass.Framework.ViewModels.Api;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Cache
{
    public class UserCenterCacheHelper
    {
        private const string PreKey = "{UserCenter}:";
        /// <summary>
        /// 用户中心消息总量统计
        /// </summary>

        public static UserCenterChartDto GetUserCenterChart(string openId)
        {
            string key = $"{PreKey}{openId}";
            var data = RedisHelper.Get<UserCenterChartDto>(key);
            if (data == null)
            {
                data = new UserCenterChartDto();
                data.openId = openId;
            }
            return data;
        }


        /// <summary>
        /// 用户中心消息总量统计
        /// </summary>

        public static void SetUserCenterChart(UserCenterChartDto dto)
        {
            string key = $"{PreKey}{dto.openId}";
            int expireSecond = 30 * 24 * 60 * 60;
            RedisHelper.Set(key, dto, expireSecond);
        }
        
    }
}
