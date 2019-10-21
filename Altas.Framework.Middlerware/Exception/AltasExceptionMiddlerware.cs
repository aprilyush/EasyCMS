using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Altas.Framework.Middlerware.Exception
{
    /// <summary>
    /// 异常处理中间件
    /// app.UseMiddleware(typeof(AltasExceptionMiddlerware));
    /// app.UseMvc();
    /// </summary>
    public class AltasExceptionMiddlerware
    {
        private readonly RequestDelegate _next;
        private readonly CustomExceptionHandlerOptions _options;

        public AltasExceptionMiddlerware(RequestDelegate next, IOptions<CustomExceptionHandlerOptions> options)
        {
            _next = next;
            _options = options.Value;
        }

        /// <summary>
        /// 异常分为两类 一类是客户端主动取消请求的错误，一类是系统异常错误
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (System.Exception ex)
            {
                //var logger = context.RequestServices.GetRequiredService<ILoggerFactory>()
                //    .CreateLogger<AltasExceptionHandlerMiddlerware>();
                if (context.RequestAborted.IsCancellationRequested && (ex is TaskCanceledException || ex is OperationCanceledException))
                {
                    var logger = context.RequestServices.GetRequiredService<ILoggerFactory>()
                 .CreateLogger<AltasExceptionMiddlerware>();
                    _options.OnRequestAborted?.Invoke(context, logger);
                }
                else
                {
                    //_options.OnException?.Invoke(context, logger, ex);

                    await HandleExceptionAsync(context, ex);
                }
            }
        }

        /// <summary>
        ///异常处理
        /// </summary>
        /// <param name="context"></param>
        /// <param name="exception"></param>
        /// <returns></returns>
        private static async Task HandleExceptionAsync(HttpContext context, System.Exception exception)
        {
            if (exception == null)
            {
                return;
            }

            await WriteExceptionAsync(context, exception).ConfigureAwait(false);
        }

        /// <summary>
        /// 写异常日志
        /// </summary>
        /// <param name="context"></param>
        /// <param name="exception"></param>
        /// <returns></returns>
        private static async Task WriteExceptionAsync(HttpContext context, System.Exception exception)
        {
            //返回友好的提示
            HttpResponse response = context.Response;


            response.ContentType = context.Request.Headers["Accept"];

            MiddleExcpetionRespone resp = new MiddleExcpetionRespone
            {
                StatusCode = 500,
                Message = exception.Message,
            };

            response.ContentType = "application/json";
            await response.WriteAsync(JsonConvert.SerializeObject(resp)).ConfigureAwait(false);
        }


    }

    public class MiddleExcpetionRespone{
        public int StatusCode { get; set; }
        public string Message { get; set; }
     }

    public class CustomExceptionHandlerOptions
    {
        public Func<HttpContext, ILogger, System.Exception, Task> OnException { get; set; } =
            async (context, logger, exception) => logger.LogError(exception, $"Request exception, requestId: {context.TraceIdentifier}");

        public Func<HttpContext, ILogger, Task> OnRequestAborted { get; set; } =
            async (context, logger) => logger.LogInformation($"Request aborted, requestId: {context.TraceIdentifier}");
    }
}
