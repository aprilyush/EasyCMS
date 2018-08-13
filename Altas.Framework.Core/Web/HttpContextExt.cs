using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace Altas.Framework.Core.Web
{
  
        public static class HttpContextServiceExt
        {
            //public static void AddHttpContextAccessor(this IServiceCollection services)
            //{
            //    services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            //}

            public static IApplicationBuilder UseStaticHttpContext(this IApplicationBuilder app)
            {
                var httpContextAccessor = app.ApplicationServices.GetRequiredService<IHttpContextAccessor>();
                HttpContextExt.Configure(httpContextAccessor);
                return app;
            }

        }
        public static class HttpContextExt
        {
            // public static IServiceProvider ServiceProvider;
            private static IHttpContextAccessor _accessor;
            public static Microsoft.AspNetCore.Http.HttpContext Current => _accessor.HttpContext;
            internal static void Configure(IHttpContextAccessor accessor)
            {
                _accessor = accessor;
            }

            //static HttpContextExt()
            //{ }
            //public static void AddHttpContextAccessor(this IServiceCollection services)
            //{
            //    services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            //}
            //public static HttpContext Current
            //{
            //    get
            //    {
            //        object factory = ServiceProvider.GetService(typeof(Microsoft.AspNetCore.Http.IHttpContextAccessor));

            //        HttpContext context = ((IHttpContextAccessor)factory).HttpContext;
            //        return context;
            //    }
            //}
        }
    
}
