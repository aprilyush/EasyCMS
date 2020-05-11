using Atlass.Framework.Cache;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models.BaseData;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Jobs.Data
{
    public class MessageSetData
    {
        public static  weixin_set GetModel()
        {
            var model = WeiXinCacheHelper.GetPushMessage();
            if (model == null)
            {
                var sql = FreesqlDbInstance.GetInstance();
                model = sql.Select<weixin_set>().OrderBy(s => s.id).First();
                if (model == null)
                {
                    throw new Exception("请设置模板消息");
                }

            }
            WeiXinCacheHelper.SetPushMessage(model);
            return model;
        }
    }
}
