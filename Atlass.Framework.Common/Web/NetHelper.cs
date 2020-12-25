using Atlass.Framework.Common.NLog;
using System;
using System.Collections.Generic;
using System.Linq;
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
                //foreach (var hostAddress in Dns.GetHostAddresses(Dns.GetHostName()))
                //{
                //    if (hostAddress.AddressFamily == AddressFamily.InterNetwork)
                //    {
                //        return hostAddress.ToString();
                //    }
                //}

               return System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces()
               .Select(p => p.GetIPProperties()).SelectMany(p => p.UnicastAddresses)
               .Where(p => p.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork && !System.Net.IPAddress.IsLoopback(p.Address))
                .FirstOrDefault()?.Address.ToString();
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return string.Empty;
        }

    }
}
