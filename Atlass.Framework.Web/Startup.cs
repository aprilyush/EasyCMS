using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Cache;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core;
using Atlass.Framework.Core.DI;
using Atlass.Framework.Core.Extensions;
using Atlass.Framework.Core.HangfireExtend;
using Atlass.Framework.Core.HostService;
using Atlass.Framework.Core.Middleware;
using Atlass.Framework.ViewModels;
using Autofac;
using Autofac.Extensions.DependencyInjection;
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
            .AddYamlFile("configs/appsettings.yml", optional: true, reloadOnChange: true);
            //.AddJsonFile("configs/appsettings.json", optional: true, reloadOnChange: true);
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
            //���ô��ļ��ϴ�
            services.Configure<FormOptions>(options =>
            {
                options.MultipartBodyLengthLimit = 1024 * 1024 * 2000;
                options.MultipartHeadersCountLimit = 10;
            });
            //services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            //���ʹ��IIS�����ڳ���ģ��
            services.Configure<IISServerOptions>(option =>
            {
                option.AutomaticAuthentication = false;
            });
            #region ������ע��
            services.AddMemoryCache();//ʹ�ñ��ػ���������
            services.AddSession();//ʹ��Session
            services.AddOptions();
            
            //���ݵ�ַ
            services.AddGlobalVariable(Configuration);
            //services.AddFreeSql();
            #endregion


            #region hangfire����
            services.AddAtlassHangfire(Configuration);
            #endregion
            //΢��
            services.AddSenparcGlobalServices(Configuration)//Senparc.CO2NET ȫ��ע��
              .AddSenparcWeixinServices(Configuration);//Senparc.Weixin ע��
            services.Configure<SenparcWeixinSetting>(Configuration.GetSection("SenparcWeixinSetting"));


            //��־����
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
                LoggerHelper.Exception(e);
            }

        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, 
            IHostApplicationLifetime appLifetime, IOptions<Dictionary<string, string>> options,
            IOptions<SenparcSetting> senparcSetting, IOptions<SenparcWeixinSetting> senparcWeixinSetting)
        {
            GlobalContext.HostingEnvironment = env;
            //GlobalContext.AutofacContainer = app.ApplicationServices.GetAutofacRoot();
            AutofacUtil.Container= app.ApplicationServices.GetAutofacRoot();

            //�쳣����
            // app.UseExceptionHandler("/Home/Error");
            app.UseStatusCodePagesWithRedirects("/Login/Error/{0}");

            //cookie����
            app.UseCookiePolicy();
            app.UseHttpsRedirection();

            //����µ�ý���ļ����ͣ���̬�ļ�·��
  
            app.UseAtlassDefaultFiles(options);

            app.UseRouting();
            #region �Զ����м��
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

            //����hangfire��������
            if (GlobalContext.CrontabConfigDto.Enable) {
                app.UseHangfireServer(new BackgroundJobServerOptions
                {
                    Queues = new[] { "default" }
                });
                //  app.UseHangfireDashboard();
                app.UseHangfireDashboard("/easytask", new DashboardOptions()
                {
                    Authorization = new[] { new HangfireAuthorizeFilter() }
                });
            }
           


            //���� UseSenparcGlobal() �ĸ����÷��� CO2NET Demo��
            //https://github.com/Senparc/Senparc.CO2NET/blob/master/Sample/Senparc.CO2NET.Sample.netcore/Startup.cs
            IRegisterService register = RegisterService.Start(senparcSetting.Value)
                .UseSenparcGlobal();

            register.ChangeDefaultCacheNamespace("DefaultCO2NETCache");
            register.UseSenparcWeixin(senparcWeixinSetting.Value, senparcSetting.Value)

            #region ע�ṫ�ںţ����裩
                //ע�ṫ�ںţ���ע������                                                -- DPBMARK MP
                .RegisterMpAccount(senparcWeixinSetting.Value, "doctor_platform_mp") // DPBMARK_END //ע������΢��֧���汾��V3������ע������
                .RegisterTenpayV3(senparcWeixinSetting.Value, "doctor_platform_tenpay"); //��¼��ͬһ�� SenparcWeixinSettingItem ������
            #endregion

            //Ӧ�ó���������
            appLifetime.ApplicationStarted.Register(() => {
                try
                {

                    GlobalParamsDto.WebRoot = env.WebRootPath;

                    //��ʼ����Ŀ��صĻ���
                    CmsCacheInit.Init();
                }
                catch (Exception e)
                {
                    LoggerHelper.Exception(e);
                }
            });


        }
    }
}
