using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Atlass.Framework.Core.Web;
using Microsoft.AspNetCore.Http;

namespace Atlass.Framework.Core.Base
{

    /// <summary>
    /// 需要先注入容器，如果不想注入容器可以使用TypeFilterAttribute
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AtlassActionFilterAttribute: ActionFilterAttribute
    {
        private readonly IAtlassReuqestHelper RequestHelper;
        public AtlassActionFilterAttribute(IAtlassReuqestHelper atlassReuqest)
        {
            RequestHelper = atlassReuqest;
        }
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
            if (!RequestHelper.IsAdminLoggin())
            {
                // context.Result = new RedirectResult("/Login/Index");
                await context.HttpContext.Response.WriteAsync("<script>top.location.href = '/Login/Index';</script>");
                return;
            }
            await base.OnActionExecutionAsync(context, next);
        }
    }
}
