using Atlass.Framework.Common.NLog;
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
                var result = new { status = false, msg = "System error!",Exception=context.Exception };
                context.Result = new ContentResult
                {
                    Content =JsonConvert.SerializeObject(result),
                    StatusCode = StatusCodes.Status500InternalServerError,
                    ContentType = "text/html;charset=utf-8"
                };
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
