using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Autofac;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Atlass.Framework.Core.DI
{
    public class AtlassAutofacDI: Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            //builder.RegisterType<IActionResultExecutor<HtmlResult>,HtmlResultExecutor<HtmlResult>>().
            //领养AppService注入
            builder.RegisterAssemblyTypes(Assembly.Load("Atlass.Framework.AppService"))
                .Where(t => t.Name.EndsWith("AppService")).AsSelf().InstancePerLifetimeScope();
            //api服务注入

            //dbcontext注入
            //builder.RegisterType<MySqlDbContext>().As<IAltasDbContext>().InstancePerLifetimeScope();
            builder.RegisterType<AtlassReuqestHelper>().As<IAtlassReuqestHelper>().InstancePerLifetimeScope();


            builder.RegisterType<AtlassActionFilterAttribute>().AsSelf().InstancePerLifetimeScope();
            builder.RegisterType<IPFilterAttribute>().AsSelf().InstancePerLifetimeScope();
        }

    }

   
}
