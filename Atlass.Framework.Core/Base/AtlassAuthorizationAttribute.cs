using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Web;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Base
{

    /// <summary>
    /// 需要先注入容器，如果不想注入容器可以使用TypeFilterAttribute
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true)]
    class AtlassAuthorizationAttribute: AuthorizeAttribute, IAuthorizationFilter
    {
        private readonly IAtlassRequest RequestHelper;
        public AtlassAuthorizationAttribute(IAtlassRequest atlassReuqest)
        {
            RequestHelper = atlassReuqest;
        }
        public void OnAuthorization(AuthorizationFilterContext filterContext)
        {
            //if (!ValidateToken(filterContext.HttpContext.Request.Headers["token"]))
            //{
            //    filterContext.Result = new UnauthorizedResult();
            //}
            IDictionary<string, string> RouteValues = filterContext.ActionDescriptor.RouteValues;
            string route = GetRouteInfo(RouteValues);

            LogNHelper.Info(route,"路由记录");

        }



        private string GetRouteInfo(IDictionary<string,string> routes)
        {
            StringBuilder  route =new StringBuilder();
            if (routes.ContainsKey("area"))
            {
               
                route.Append(routes["area"]);
                route.Append("_");
            }
            route.Append(routes["controller"]);
            route.Append("_");
            route.Append(routes["action"]);

            return route.ToString().ToLower();
        }
    }
}
