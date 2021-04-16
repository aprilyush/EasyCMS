using Atlass.Framework.Core.DI;
using Atlass.Framework.DbContext;
using Atlass.Framework.ViewModels;
using FreeSql;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Extensions
{
    public static class AtlassAutofacDIService
    {
        public static void AddFreeSql(this IServiceCollection service)
        {
            var freeSql = GlobalContext.DefaultDbConfig;
            service.AddSingleton<IFreeSql>(f =>
            {
                return DbInstanceFactory.GetInstance(freeSql.DataType, freeSql.MasterConnection);
            });


            //注入当前用户 利用了缓存查询当前用户信息
            //service.AddScoped<CurrentUser>(f => f.GetRequiredService<IHttpContextAccessor>().HttpContext?.User?.GetCurrentUser(f));
            //使用类库Scrutor做发现注入类库和服务
            //service.AddServer(typeof(IRepKey));
            //service.AddServer(typeof(IDeviceAppService));
            //service.TryAddScoped<IRequestHelper, RequestHelper>();
        }

        /// <summary>
        /// Scrutor注入使用
        /// </summary>
        /// <param name="service"></param>
        /// <param name="type"></param>
        private static void AddServer(this IServiceCollection service, Type type)
        {
            //程序入口程序集
            //var entryAssembly = Assembly.GetEntryAssembly();
            ////再获取程序入口程序集的引用程序集
            //var referencedAssemblies = entryAssembly.GetReferencedAssemblies().Select(Assembly.Load);
            ////合并这些程序集
            //var assemblies = new List<Assembly> { entryAssembly }.Concat(referencedAssemblies);
            //service.Scan(s =>
            //{
            //    //扫描所有程序集通过接口找相关实现
            //    s.FromAssemblies(assemblies).AddClasses(classes => classes.AssignableTo(type))
            //        .AsImplementedInterfaces()
            //        .WithScopedLifetime()
            //        ;//这里使用了Scope周期 可以使用 WithLifetime(ServiceLifetime.Singleton)传入其他生命周期来灵活配置

            //});
        }
    }
}
