using System;
using System.Collections.Generic;
using System.Text;
using Altas.Framework.Common;
using Altas.Framework.Core.AltasDbContext;
using SqlSugar;

namespace Altas.Framework.Core.Web
{
    public class BaseAppService
    {
        protected readonly SqlSugarClient Sqldb;

        private readonly IAltasDbContext iSqlContext;

        protected LoginUserDto UserCookie;
        public BaseAppService(IAltasDbContext sqlContext)
        {
            UserCookie = GetUserCookie();
            iSqlContext = sqlContext;
            Sqldb = iSqlContext.DbInstance();
        }

        private LoginUserDto GetUserCookie()
        {
            var userClaims = CookieHelper.GetUserLoginCookie();
            if (userClaims != null)
                return userClaims.ToObject<LoginUserDto>();
            return new LoginUserDto();
        }
    }
}
