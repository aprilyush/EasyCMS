using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common
{
    public class IPHelper
    {
      //  private static ConcurrentBag<LimitIpDto> WriteList;
        private static int WriteListCount = 0;
        static IPHelper()
        {
           // WriteList = new ConcurrentBag<LimitIpDto>();
        }

        /// <summary>
        /// 判断是否在白名单里
        /// </summary>
        /// <returns></returns>
        public static bool InWriteList()
        {
            //string ip = GetClientIp();
            //if (string.IsNullOrEmpty(ip))
            //{
            //    return true;
            //}
            return true;
            //return IPHelper.InWriteList(ip);
        }
        public static bool ISIP(string IP)
        {
            bool result;
            try
            {
                if (IP.Length > 15)
                {
                    result = false;
                }
                else
                {
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
            }
            catch
            {
                result = false;
            }
            return result;
        }


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



        //public static void AddIpRange(LimitIpDto dto)
        //{
        //    WriteList.Add(dto);
        //    WriteListCount++;
        //}

        //public static void UpdateIpRange(LimitIpDto dto)
        //{
        //    var count = WriteList.Where(s => s.Id == dto.Id).Count();
        //    if (count == 0)
        //    {
        //        AddIpRange(dto);
        //        return;
        //    }
        //    foreach (var model in WriteList)
        //    {
        //        if (model.Id == dto.Id)
        //        {
        //            model.StartIpNum = dto.StartIpNum;
        //            model.EndIpNum = dto.EndIpNum;
        //        }
        //    }
        //}
        //public static void RemoveIpRange(int id)
        //{

        //    var leftList = WriteList.Where(s => s.Id != id).ToList();
        //    WriteList = new ConcurrentBag<LimitIpDto>(leftList);
        //    if (WriteListCount > 0)
        //    {
        //        WriteListCount--;
        //    }

        //}
        //public static void RemoveAll()
        //{
        //    WriteList = new ConcurrentBag<LimitIpDto>();
        //    WriteListCount = 0;
        //}
        public static bool InWriteList(string ip)
        {
            if (WriteListCount == 0)
            {
                return true;
            }

            if (!ISIP(ip))
            {
                return false;
            }
            uint ipVal = IPValue(ip);
            //int count = WriteList.Where(s => s.StartIpNum <= ipVal && s.EndIpNum >= ipVal).Count();

            //if (count > 0)
            //{
            //    return true;
            //}

            return false;
        }
    }
}
