using Atlass.Framework.Common.NLog;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace Atlass.Framework.Common
{
    public class NetHelper
    {
        /// <summary>
        /// 获取内网IP
        /// </summary>
        /// <returns></returns>
        public static string GetLanIp()
        {
            try
            {
                foreach (var hostAddress in Dns.GetHostAddresses(Dns.GetHostName()))
                {
                    if (hostAddress.AddressFamily == AddressFamily.InterNetwork)
                    {
                        return hostAddress.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return string.Empty;
        }

    }
}
