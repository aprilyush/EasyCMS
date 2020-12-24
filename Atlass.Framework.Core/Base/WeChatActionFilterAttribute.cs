using Atlass.Framework.Core.Web;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Core.Base
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class WeChatActionFilterAttribute: ActionFilterAttribute
    {
        private readonly IAtlassRequest ReuqestHelper;
        public WeChatActionFilterAttribute(IAtlassRequest atlassReuqest)
        {
            ReuqestHelper = atlassReuqest;
        }
        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (context == null)
            {
                throw new ArgumentNullException("filterContext");
            }
            var openId = ReuqestHelper.OpenId();
            if (string.IsNullOrEmpty(openId))
            {
                context.Result = new RedirectResult("/Home/Auth");
                //context.HttpContext.Response.WriteAsync("<script>top.location.href = '/Login/Index';</script>");
                //return;

            }
            await base.OnActionExecutionAsync(context, next);
        }
    }
}
