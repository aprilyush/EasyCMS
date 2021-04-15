using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.DI;
using Atlass.Framework.Core.Web;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Atlass.Framework.Core.Middleware
{
    public class GlobalExceptionFilter: IExceptionFilter, IAsyncExceptionFilter, IFilterMetadata
    {
        public void OnException(ExceptionContext context)
        {
            if (context.ExceptionHandled == false)
            {

               
                LogNHelper.Exception(context.Exception);

                //context.Result = new ContentResult
                //{
                //    Content =JsonConvert.SerializeObject(result),
                //    StatusCode = StatusCodes.Status500InternalServerError,
                //    ContentType = "text/html;charset=utf-8"
                //};


                context.HttpContext.Response.StatusCode = StatusCodes.Status500InternalServerError;
                //var requestHelper = AutofacUtil.GetScopeService<IAtlassRequest>();
                //if (requestHelper.IsAjax())
                //{
                //    var result = new { status = false, msg = "系统异常，请稍后再试" };
                //    context.Result = new JsonResult(result);
                    
                //}
                //else
                //{
                    
                //    context.Result = new RedirectResult("~/Login/InternalError");
                    
                //}
            }
            context.ExceptionHandled = true; //异常已处理了
        }

        public Task OnExceptionAsync(ExceptionContext context)
        {
            OnException(context);
            return Task.CompletedTask;
        }
    }
}
