using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Atlass.Framework.Core.Middleware
{
    /// <summary>
    ///  Request.Body 启用倒带功能
    /// </summary>
    public class AtlassHttpRequestMiddleware
    {
        private readonly RequestDelegate _next;
        public AtlassHttpRequestMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public Task Invoke(HttpContext httpContext)
        {
            httpContext.Request.EnableBuffering();
            return _next(httpContext);
        }
    }
}
