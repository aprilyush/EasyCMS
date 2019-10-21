using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Altas.Framework.Common.NLog;
using Altas.Framework.Core.AltasDbContext;
using Altas.Framework.Core.AutofacInjectModule;
using Altas.Framework.Core.Web;
using Altas.Framework.Middlerware.Exception;
using Altas.Framework.ViewModels;
using Atlas.Framework.Jobs.Interface;
using Autofac;
using Hangfire;
using Hangfire.Redis;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using NLog.Web;
using StackExchange.Redis;

namespace Altas.Framework
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public Startup(IConfiguration configuration)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("configs/appsettings.json", optional: true, reloadOnChange: true);
            //Configuration = configuration;
            Configuration = builder.Build();
        }

        

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => false;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });


            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            //扩展httpcontext
            //services.AddHttpContextAccessor();
            services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            #region 获取配置项
            //services.AddDbContext<IAltasDbContext,MySqlDbContext>(opts =>
            //{
            //    opts.
            //})

            #endregion

            #region hangfire配置
            string redisConn = this.Configuration.GetSection("redisConn:redisConnStr").Value;
            string redisPwd = this.Configuration.GetSection("redisConn:redisPwd").Value;
            var hgOpts = ConfigurationOptions.Parse(redisConn);
            hgOpts.AllowAdmin = true;
            hgOpts.Password = redisPwd;

            var _redisContext = ConnectionMultiplexer.Connect(hgOpts);
            services.AddHangfire(x => x.UseRedisStorage(_redisContext, new RedisStorageOptions()
            {
                Prefix = "{altas}:{jobs}:"
            }));
            #endregion
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, IApplicationLifetime appLifetime)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();
            //nlog日志配置文件
            env.ConfigureNLog("configs/nlog.config");
            #region 自定义中间件
            app.UseMiddleware(typeof(AltasExceptionMiddlerware));
            #endregion
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
                routes.MapRoute(name: "areaRoute",
                    template: "{area:exists}/{controller=DeviceData}/{action=Index}/{id?}");
            });

            //扩展HttpContext
            app.UseStaticHttpContext();



            #region 解决Ubuntu Nginx 代理不能获取IP问题
            //app.UseForwardedHeaders(new ForwardedHeadersOptions
            //{
            //    ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
            //});
            #endregion

            //启动hangfire服务和面板
            app.UseHangfireServer(new BackgroundJobServerOptions
            {
                Queues = new[] { "default", "demo_queue" }
            });
            app.UseHangfireDashboard("/hangfire", new DashboardOptions()
            {
                Authorization = new[] { new HangfireAuthorizeFilter() }
            });

            //应用程序启动后
            appLifetime.ApplicationStarted.Register(() => {
                try
                {
                 
                    GlobalParamsDto.WebRoot = env.WebRootPath;
                    SugarDbConn.DbConnectStr = this.Configuration.GetSection("DbConn:mysqlConn").Value;   //为数据库连接字符串赋值
                    GlobalParamsDto.RpcUname = this.Configuration.GetSection("RpcUser:Username").Value;
                    GlobalParamsDto.RpcPwd = this.Configuration.GetSection("RpcUser:Password").Value;
                }
                catch (Exception e)
                {
                    LogNHelper.Exception(e);
                }
            });
        }

        public void ConfigureContainer(ContainerBuilder builder)
        {
            try
            {
                builder.RegisterModule(new AutofacModule());
            }
            catch (Exception e)
            {
               LogNHelper.Exception(e);
            }

        }
    }
}
