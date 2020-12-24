using Atlass.Framework.Common.NLog;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Management;
using System.Text;

namespace Atlass.Framework.Common
{
    public class WindowsMachineInfo: IMachineInfo
    {
        /// <summary>
        /// 获取内存使用信息
        /// </summary>
        /// <returns></returns>
        public MemoryMetrics GetMetrics()
        {
            string output = ShellHelper.Cmd("wmic", "OS get FreePhysicalMemory,TotalVisibleMemorySize /Value");

            var lines = output.Trim().Split("\n");
            var freeMemoryParts = lines[0].Split("=", StringSplitOptions.RemoveEmptyEntries);
            var totalMemoryParts = lines[1].Split("=", StringSplitOptions.RemoveEmptyEntries);

            var metrics = new MemoryMetrics();
            metrics.Total = Math.Round(double.Parse(totalMemoryParts[1]) / 1024, 0);
            metrics.Free = Math.Round(double.Parse(freeMemoryParts[1]) / 1024, 0);
            metrics.Used = metrics.Total - metrics.Free;

            return metrics;
        }

        /// <summary>
        /// cpu使用率
        /// </summary>
        /// <returns></returns>
        public string GetCPURate()
        {
           
            string output = ShellHelper.Cmd("wmic", "cpu get LoadPercentage");
            string cpuRate = output.Replace("LoadPercentage", string.Empty).Trim();
            return cpuRate;
        }

        /// <summary>
        /// 系统内核
        /// </summary>
        /// <returns></returns>
        public string GetRunTime()
        {
            string runTime = string.Empty;
            try
            {
                string output = ShellHelper.Cmd("wmic", "OS get LastBootUpTime/Value");
                string[] outputArr = output.Split("=", StringSplitOptions.RemoveEmptyEntries);
                if (outputArr.Length == 2)
                {
                    runTime = TimeHelper.FormatTime((DateTime.Now - outputArr[1].Split('.')[0].ToDate()).TotalMilliseconds.ToString().Split('.')[0].ToInt64());
                }
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return runTime;
        }

    }
}
