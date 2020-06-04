using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Serilog;
using Serilog.Events;

namespace Atlass.Framework.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Log.Logger = new LoggerConfiguration()
             .MinimumLevel.Debug()
             .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)//将Microsoft前缀的日志的最小输出级别改成Information
             .Enrich.FromLogContext()
             .WriteTo.File(Path.Combine(@"logs", "log-.txt"),
             rollingInterval: RollingInterval.Day,
             rollOnFileSizeLimit: true,
             fileSizeLimitBytes: 31457280)
             .CreateLogger();
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args)
        {
            return Host.CreateDefaultBuilder(args)
                .UseServiceProviderFactory(new AutofacServiceProviderFactory())
                    .ConfigureWebHostDefaults(webBuilder =>
                    {
                        webBuilder.UseSerilog()
                            .ConfigureLogging(logging =>
                            {
                                logging.SetMinimumLevel(LogLevel.None);

                            })
                            .UseKestrel((context, serverOptions) =>
                            {
                                serverOptions.AllowSynchronousIO = true;
                                //serverOptions.ListenAnyIP(context.Configuration.GetValue<int>("HostingPort"));
                            })
                            //.useii((context, serverOptions) =>
                            // {
                            //     serverOptions.AllowSynchronousIO = true;
                            //     //serverOptions.ListenAnyIP(context.Configuration.GetValue<int>("HostingPort"));
                            // })
                            .UseStartup<Startup>();
                    });
        }
    }
}
