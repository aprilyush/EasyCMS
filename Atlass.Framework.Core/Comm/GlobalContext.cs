using Atlass.Framework.Common.NLog;
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

        public static string GetWanIp()
        {
            string ip = string.Empty;
            try
            {
                //string url = "http://www.net.cn/static/customercare/yourip.asp";
                //string html = HttpHelper.HttpGet(url);
                //if (!string.IsNullOrEmpty(html))
                //{
                //    ip = HtmlHelper.Resove(html, "<h2>", "</h2>");
                //}
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return ip;
        }
    }
}
