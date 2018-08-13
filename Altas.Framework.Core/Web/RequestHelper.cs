using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Altas.Framework.Core.Web;
using Microsoft.AspNetCore.Http.Internal;

namespace Altas.Framework.Core.Web
{
    public class RequestHelper
    {
        public static string GetClientIp()
        {
            //ngix代理使用  HttpContext.Request.Headers["X-Real-IP"];获取
            var ip = HttpContextExt.Current.Request.Headers["X-Forwarded-For"].FirstOrDefault();
            if (string.IsNullOrEmpty(ip))
            {
                ip = HttpContextExt.Current.Connection.RemoteIpAddress.ToString();
            }

            return ip;
        }
        /// <summary>
        /// Get请求
        /// </summary>
        /// <param name="key"></param>
        /// <param name="defVal"></param>
        /// <returns></returns>
        public static string RequestGet(string key, string defVal)
        {
            //string val = string.Empty;
            if (HttpContextExt.Current.Request.Query.ContainsKey(key))
            {
                defVal = HttpContextExt.Current.Request.Query[key];
            }

            return defVal;
        }

        /// <summary>
        /// Post请求
        /// </summary>
        /// <param name="key"></param>
        /// <param name="defVal"></param>
        /// <returns></returns>
        public static string RequestPost(string key, string defVal)
        {

            if (HttpContextExt.Current.Request.HasFormContentType && HttpContextExt.Current.Request.Form.ContainsKey(key))
            {
                defVal = HttpContextExt.Current.Request.Form[key];
            }

            return defVal;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="key"></param>
        /// <param name="defVal"></param>
        /// <returns></returns>
        public static string RequestEx(string key, string defVal)
        {
            //if (HttpContextExt.Current.Request[key])
            //{
            //    defVal = HttpContextExt.Current.Request[key];
            //}
            string bodyText = string.Empty;
            using (var buffer = new StreamReader(HttpContextExt.Current.Request.Body))
            {
                bodyText = buffer.ReadToEnd();
            }
            if (!string.IsNullOrEmpty(bodyText))
            {

            }
            return defVal;
        }

        public static string RequestBody()
        {
            string bodyText = string.Empty;
            var request = HttpContextExt.Current.Request;
            request.EnableRewind();
            using (var buffer = new StreamReader(request.Body))
            {
                bodyText = buffer.ReadToEnd();
            }
            return bodyText;
        }
    }
}
