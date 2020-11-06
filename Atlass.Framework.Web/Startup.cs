using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Cache;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core;
using Atlass.Framework.Core.DI;
using Atlass.Framework.Core.Extensions;
using Atlass.Framework.Core.HangfireExtend;
using Atlass.Framework.Core.HostService;
using Atlass.Framework.Core.Middleware;
using Atlass.Framework.ViewModels;
using Autofac;
using EasyCaching.Core;
using EasyCaching.ResponseCaching;
using Hangfire;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Senparc.CO2NET;
using Senparc.CO2NET.RegisterServices;
using Senparc.Weixin;
using Senparc.Weixin.Entities;
using Senparc.Weixin.MP;
using Senparc.Weixin.RegisterServices;
using Senparc.Weixin.TenPay;

namespace Atlass.Framework.Web
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public Startup(IConfiguration configuration)
        {
            var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("configs/appsettings.json", optional: true, reloadOnChange: true);
            Configuration = builder.Build();
        }

       

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            // services.AddMvc().AddRazorRuntimeCompilation();
            services.AddScoped<IActionResultExecutor<HtmlResult>, HtmlResultExecutor<HtmlResult>>();
            services.AddControllersWithViews(option => {
                option.Filters.Add<GlobalExceptionFilter>();
            }).AddRazorRuntimeCompilation().AddNewtonsoftJson();

            services.AddEasyCaching(options =>
            {
                options.UseInMemory("eayscms");
            });
            services.AddEasyCachingResponseCaching("eayscms").AddResponseCompression();
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => false;
               // options.MinimumSameSitePolicy = SameSiteMode.None;
            });
            //设置大文件上传
            services.Configure<FormOptions>(options =>
            {
                options.MultipartBodyLengthLimit = 1024 * 1024 * 2000;
                options.MultipartHeadersCountLimit = 10;
            });
            //services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            //如果使用IIS进程内承载模型
            services.Configure<IISServerOptions>(option =>
            {
                option.AutomaticAuthentication = false;
            });
            #region 配置项注入
            services.AddMemoryCache();//使用本地缓存必须添加
            services.AddSession();//使用Session
            services.AddOptions();
            
            //备份地址
            services.AddGlobalVariable(Configuration);
            //services.AddFreeSql();
            #endregion


            #region hangfire配置
            services.AddAtlassHangfire(Configuration);
            #endregion
            //微信
            services.AddSenparcGlobalServices(Configuration)//Senparc.CO2NET 全局注册
              .AddSenparcWeixinServices(Configuration);//Senparc.Weixin 注册
            services.Configure<SenparcWeixinSetting>(Configuration.GetSection("SenparcWeixinSetting"));


            //日志服务
            services.AddHostedService<EasyLogHostedService>();

        }
        public void ConfigureContainer(ContainerBuilder builder)
        {
            try
            {
                builder.RegisterModule(new AtlassAutofacDI());
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }

        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, 
            IHostApplicationLifetime appLifetime, IOptions<Dictionary<string, string>> options,
            IOptions<SenparcSetting> senparcSetting, IOptions<SenparcWeixinSetting> senparcWeixinSetting)
        {
            //if (env.IsDevelopment())
            //{
            //    app.UseDeveloperExceptionPage();
            // //  app.AddRazorRuntimeCompilation();
            //}
            //else
            //{
            //    app.UseExceptionHandler("/Home/Error");
            //    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            //    app.UseHsts();
            //}
            app.UseCookiePolicy();
            app.UseHttpsRedirection();
            
            //添加新的媒体文件类型，静态文件路由
            app.UseAtlassDefaultFiles(options);

            app.UseRouting();
            #region 自定义中间件
            app.UseMiddleware<AtlassHttpRequestMiddleware>();
            //app.UseMiddleware(typeof(AtlassExceptionMiddlerware));
            #endregion
            app.UseAuthorization();
            app.UseSession();

            app.UseEasyCachingResponseCaching();


            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
                endpoints.MapControllerRoute(name: "areaRoute",
                  pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");
            });

            //启动hangfire服务和面板
            app.UseHangfireServer(new BackgroundJobServerOptions
            {
                Queues = new[] { "default"}
            });
          //  app.UseHangfireDashboard();
            app.UseHangfireDashboard("/hangfire", new DashboardOptions()
            {
                Authorization = new[] { new HangfireAuthorizeFilter() }
            });


            //关于 UseSenparcGlobal() 的更多用法见 CO2NET Demo：
            //https://github.com/Senparc/Senparc.CO2NET/blob/master/Sample/Senparc.CO2NET.Sample.netcore/Startup.cs
            IRegisterService register = RegisterService.Start(senparcSetting.Value)
                .UseSenparcGlobal();

            register.ChangeDefaultCacheNamespace("DefaultCO2NETCache");
            register.UseSenparcWeixin(senparcWeixinSetting.Value, senparcSetting.Value)

            #region 注册公众号（按需）
                //注册公众号（可注册多个）                                                -- DPBMARK MP
                .RegisterMpAccount(senparcWeixinSetting.Value, "doctor_platform_mp") // DPBMARK_END //注册最新微信支付版本（V3）（可注册多个）
                .RegisterTenpayV3(senparcWeixinSetting.Value, "doctor_platform_tenpay"); //记录到同一个 SenparcWeixinSettingItem 对象中
            #endregion

            //应用程序启动后
            appLifetime.ApplicationStarted.Register(() => {
                try
                {

                    GlobalParamsDto.WebRoot = env.WebRootPath;
                    //SugarDbConn.DbConnectStr = this.Configuration.GetSection("DbConn:mysqlConn").Value;   //为数据库连接字符串赋值
                    GlobalParamsDto.Host = this.Configuration.GetSection("WebHost:Host").Value;

                    //初始化栏目相关的缓存
                    CmsCacheInit.Init();
                }
                catch (Exception e)
                {
                    LogNHelper.Exception(e);
                }
            });


        }
    }
}
