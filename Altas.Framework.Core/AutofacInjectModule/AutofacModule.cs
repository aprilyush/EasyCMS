using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using Altas.Framework.Core.AltasDbContext;
using Autofac;

namespace Altas.Framework.Core.AutofacInjectModule
{
    public class AutofacModule: Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {

            //领养AppService注入
            builder.RegisterAssemblyTypes(Assembly.Load("Altas.Framework.AppService"))
                .Where(t => t.Name.EndsWith("AppService")).AsSelf().InstancePerLifetimeScope();
            //api服务注入
        
            //dbcontext注入
            builder.RegisterType<MySqlDbContext>().As<IAltasDbContext>().InstancePerLifetimeScope();
        }
    }
}
