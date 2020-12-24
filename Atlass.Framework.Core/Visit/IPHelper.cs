using Atlass.Framework.Models.Cms;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Visit
{
    public static class IPHelper
    {
        private static ConcurrentDictionary<int,cms_ip_manager> WriteList;
       
        static IPHelper()
        {
            WriteList = new ConcurrentDictionary<int, cms_ip_manager>();
        }

        public static void AddIpRange(cms_ip_manager dto)
        {
            if (WriteList.ContainsKey(dto.id))
            {
                WriteList[dto.id] = dto;
                return;
            }
            WriteList.TryAdd(dto.id, dto);
        }

        public static void RemoveIpRange(int id)
        {
            if (WriteList.ContainsKey(id))
            {
                WriteList.TryRemove(id,out cms_ip_manager ip);
                return;
            }
        }
        public static void RemoveAll()
        {
            WriteList.Clear();
        }
        /// <summary>
        /// 判断是否在白名单里
        /// </summary>
        /// <returns></returns>
        public static bool InWriteList(string ip)
        {

            if (!IsIP(ip))
            {
                return false;
            }
            if (WriteList.Count == 0)
            {
                return true;
            }
            uint ipVal = IPValue(ip);
            bool inlist = false;
            foreach(var k in WriteList)
            {
                var iprange = k.Value;
                if(ipVal>= iprange.start_ip_val&& ipVal <= iprange.end_ip_val)
                {
                    inlist = true;
                    break;
                }
                
            }

            return inlist;
        }


        /// <summary>
        /// 判断是否是IP地址
        /// </summary>
        /// <param name="_ip"></param>
        /// <returns></returns>
        public static bool IsIP(this string IP)
        {
            bool result;
            try
            {
                if (string.IsNullOrEmpty(IP))
                {
                    return false;

                }
                if (IP.Length > 15)
                {
                    return false;
                }


                string[] array = IP.Split(new char[]
                    {
                        '.'
                    });
                foreach (string value in array)
                {
                    if (Convert.ToInt32(value) > 255)
                    {
                        return false;
                    }
                }
                result = true;
            }
            catch
            {
                result = false;
            }
            return result;
        }

        /// <summary>
        /// 获取ip的值
        /// </summary>
        /// <param name="IP"></param>
        /// <returns></returns>
        public static uint IPValue(string IP)
        {
            string[] array = IP.Split(new char[]
            {
                '.'
            });
            uint num = Convert.ToUInt32(array[0]) * 256u * 256u * 256u;
            uint num2 = Convert.ToUInt32(array[1]) * 256u * 256u;
            uint num3 = Convert.ToUInt32(array[2]) * 256u;
            uint num4 = Convert.ToUInt32(array[3]) - 1u;
            return num + num2 + num3 + num4;
        }


    }
}
