using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Altas.Framework.Core.Web
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AuthorizeFilterAttribute: ActionFilterAttribute
    {
        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (context == null)
            {
                throw new ArgumentNullException("filterContext");
            }

            //获取访问路径
            //var path = filterContext.HttpContext.Request.Path.ToLower();

            //// 通过Forms验证的方式获取用户信息
            //if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            //{
            //    filterContext.Result = new RedirectResult("/Login/Index");
            //}

            var userCookie = CookieHelper.ExistUserCookie();
            if (!userCookie)
            {
                context.Result = new RedirectResult("/Login/Index");
                //context.HttpContext.Response.WriteAsync("<script>top.location.href = '/Login/Index';</script>");
                //return;
               
            }

            await base.OnActionExecutionAsync(context, next);
        }
    }
}
