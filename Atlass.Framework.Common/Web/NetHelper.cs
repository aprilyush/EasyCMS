using Atlass.Framework.Common.NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Net.NetworkInformation;

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

               var nets= NetworkInterface.GetAllNetworkInterfaces()
               .Select(p => p.GetIPProperties()).SelectMany(p => p.UnicastAddresses)
               .Where(p => p.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork && !System.Net.IPAddress.IsLoopback(p.Address))
                .ToList();
                if (nets.Count > 0)
                {
                    string[] ip = nets.Where(s=>s.IsDnsEligible).Select(s => s.Address.ToString()).ToArray();
                    return string.Join(',', ip);
                }
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return string.Empty;
        }

        #region 判断是否是外网IP
        /// <summary>
        /// 是否是局域网Ip
        /// </summary>
        /// <param name="ipAddress"></param>
        /// <returns></returns>
        public static bool IsIntranetIP(string ipAddress)
        {
            if (ipAddress.IsEmpty())
            {
                return true;
            }
            long ipNum = GetIpNum(ipAddress);
            /**
                私有IP：A类 10.0.0.0-10.255.255.255
                            B类 172.16.0.0-172.31.255.255
                            C类 192.168.0.0-192.168.255.255
                当然，还有127这个网段是环回地址 
           **/
            long aBegin = GetIpNum("10.0.0.0");
            long aEnd = GetIpNum("10.255.255.255");
            long bBegin = GetIpNum("172.16.0.0");
            long bEnd = GetIpNum("172.31.255.255");
            long cBegin = GetIpNum("192.168.0.0");
            long cEnd = GetIpNum("192.168.255.255");
            bool isInnerIp = IsIsIntranet(ipNum, aBegin, aEnd) || IsIsIntranet(ipNum, bBegin, bEnd) || IsIsIntranet(ipNum, cBegin, cEnd) || ipAddress.Equals("127.0.0.1");
            return isInnerIp;
        }

        /// <summary>
        /// 把IP地址转换为Long型数字
        /// </summary>
        /// <param name="ipAddress">IP地址字符串</param>
        /// <returns></returns>
        private static long GetIpNum(string ipAddress)
        {
            string[] ip = ipAddress.Split('.');
            long a = int.Parse(ip[0]);
            long b = int.Parse(ip[1]);
            long c = int.Parse(ip[2]);
            long d = int.Parse(ip[3]);

            long ipNum = a * 256 * 256 * 256 + b * 256 * 256 + c * 256 + d;
            return ipNum;
        }

        private static bool IsIsIntranet(long userIp, long begin, long end)
        {
            return (userIp >= begin) && (userIp <= end);
        }
        #endregion

    }
}
