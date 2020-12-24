using Atlass.Framework.Core.Visit;
using Atlass.Framework.Core.Web;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Core.Base
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class IPFilterAttribute: ActionFilterAttribute
    {
        private readonly IAtlassRequest RequestHelper;
        public IPFilterAttribute(IAtlassRequest atlassReuqest)
        {
            RequestHelper = atlassReuqest;
        }
        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (context == null)
            {
                throw new ArgumentNullException("filterContext");
            }

            //访问记录 
            var visit = RequestHelper.Visit();
            VisitQueueInstance.Add(visit);

            var inWriteList = IPHelper.InWriteList(RequestHelper.GetClientIp());
            if (!inWriteList)
            {
                context.Result = new RedirectResult("/404.html");
            }
            //允许AllowAnonymous匿名访问
            var controllerActionDescriptor = context.ActionDescriptor as ControllerActionDescriptor;
            if (controllerActionDescriptor != null)
            {

                var isDefined = controllerActionDescriptor.ControllerTypeInfo.GetCustomAttributes(inherit: true)
                    .Any(a => a.GetType().Equals(typeof(AllowAnonymousAttribute)));

                if (isDefined)
                {

                }
            }


            await base.OnActionExecutionAsync(context, next);
        }
    }
}
