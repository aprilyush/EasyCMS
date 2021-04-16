using Atlass.Framework.Common.NLog;
using Atlass.Framework.ViewModels.YmlConfigs;
using Autofac;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Atlass.Framework.Core
{
    public class GlobalContext
    {
        public static IWebHostEnvironment HostingEnvironment { get; set; }

        public static string GetVersion()
        {
            Version version = Assembly.GetEntryAssembly().GetName().Version;
            return version.Major + "." + version.Minor;
        }
        
        /// <summary>
        /// 数据库配置
        /// </summary>
        public static List<DbConfigsDto> DbConfigs { get; set; }

        /// <summary>
        /// 默认数据库配置
        /// </summary>
        public static DbConfigsDto DefaultDbConfig { get; set; }
        /// <summary>
        /// redis配置
        /// </summary>
        public static RedisConfigDto RedisConfig { get; set; }

    }
}
