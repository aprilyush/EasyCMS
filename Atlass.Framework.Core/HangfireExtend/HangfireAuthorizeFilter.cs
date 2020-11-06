using Hangfire.Dashboard;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.HangfireExtend
{
    public class HangfireAuthorizeFilter: IDashboardAuthorizationFilter
    {
        public bool Authorize(DashboardContext context)
        {
            return true;
        }
    }
}
