using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Altas.Framework.Common;
using Altas.Framework.Common.NLog;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Altas.Framework.Core.Web
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class WebExceptionFilterAttribute: ExceptionFilterAttribute
    {
        public override void OnException(ExceptionContext context)
        {
            var ex = context.Exception;
            LogNHelper.Exception(ex);
            // 构建错误信息对象
            var result = new { statusCode = 300, msg = "服务内部异常,请联系管理员" };
            // 设置结果
            context.Result = new ContentResult
            {
                Content = result.ToJson(),
                StatusCode = StatusCodes.Status200OK,
                ContentType = "text/html;charset=utf-8"
            };
            context.ExceptionHandled = true;
        }

        public override Task OnExceptionAsync(ExceptionContext context)
        {
            OnException(context);
            return Task.CompletedTask;
        }
    }

    /// <summary>
    /// 在Startup里注册全局异常处理
    /// </summary>
    public class WebExceptionFilter : IExceptionFilter, IAsyncExceptionFilter, IFilterMetadata
    {
        public void OnException(ExceptionContext context)
        {
            if (context.ExceptionHandled == false)
            {
                LogNHelper.Exception(context.Exception);
                var result = new { statusCode = 300, msg = "服务内部异常,请联系管理员" };
                context.Result = new ContentResult
                {
                    Content = result.ToJson(),
                    StatusCode = StatusCodes.Status200OK,
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
