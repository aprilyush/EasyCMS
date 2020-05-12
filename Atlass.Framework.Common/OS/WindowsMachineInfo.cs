using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Management;
using System.Text;

namespace Atlass.Framework.Common.OS
{
    public class WindowsMachineInfo
    {
        #region 字段

        private const int GwHwndfirst = 0;
        private const int GwHwndnext = 2;
        private const int GwlStyle = -16;
        private const int WsVisible = 268435456;
        private const int WsBorder = 8388608;
        private static readonly PerformanceCounter PcCpuLoad; //CPU计数器 

        private static readonly PerformanceCounter MemoryCounter = new PerformanceCounter();
        private static readonly PerformanceCounter CpuCounter = new PerformanceCounter();
        private static readonly PerformanceCounter DiskReadCounter = new PerformanceCounter();
        private static readonly PerformanceCounter DiskWriteCounter = new PerformanceCounter();

        private static readonly string[] InstanceNames;
        private static readonly PerformanceCounter[] NetRecvCounters;
        private static readonly PerformanceCounter[] NetSentCounters;

        #endregion

        /// <summary>
        /// 获取物理内存总数，单位B
        /// </summary>
        /// <returns></returns>
        public static decimal GetTotalPhysicalMemory()
        {
            string s = QueryComputerSystem("totalphysicalmemory");
            return s.ToDecimal();
        }

        /// <summary>
        /// 获取空闲的物理内存数，单位B
        /// </summary>
        /// <returns></returns>
        public static decimal GetFreePhysicalMemory()
        {
            return GetCounterValue(MemoryCounter, "Memory", "Available Bytes", null);
        }

        /// <summary>
        /// 获取已经使用了的物理内存数，单位B
        /// </summary>
        /// <returns></returns>
        public static decimal GetUsedPhysicalMemory()
        {
            return GetTotalPhysicalMemory() - GetFreePhysicalMemory();
        }

        /// <summary>
        /// 查询计算机系统信息
        /// </summary>
        /// <param name="type">类型名</param>
        /// <returns></returns>
        public static string QueryComputerSystem(string type)
        {
            try
            {
                string str = null;
                var mos = new ManagementObjectSearcher("SELECT * FROM Win32_ComputerSystem");
                foreach (var mo in mos.Get())
                {
                    str = mo[type].ToString();
                }
                return str;
            }
            catch (Exception e)
            {
                return "未能获取到当前计算机系统信息，可能是当前程序无管理员权限，如果是web应用程序，请将应用程序池的高级设置中的进程模型下的标识设置为：LocalSystem；如果是普通桌面应用程序，请提升管理员权限后再操作。异常信息：" + e.Message;
            }
        }

        private static decimal GetCounterValue(PerformanceCounter pc, string categoryName, string counterName, string instanceName)
        {
            pc.CategoryName = categoryName;
            pc.CounterName = counterName;
            pc.InstanceName = instanceName;
            return pc.NextValue().ToDecimal();
        }
    }
}
