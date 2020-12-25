using Atlass.Framework.Common.NLog;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Management;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading;

namespace Atlass.Framework.Common
{
    public class WindowsMachineInfo: IMachineInfo
    {

        private PerformanceCounter cpuCounter;
        public WindowsMachineInfo()
        {
            //cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
        }
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
            metrics.RAMTotal = Math.Round(double.Parse(totalMemoryParts[1]) / 1024, 0);
            metrics.RAMFree = Math.Round(double.Parse(freeMemoryParts[1]) / 1024, 0);
            metrics.RAMUsed = metrics.RAMTotal - metrics.RAMFree;
            metrics.RAMRate =Math.Ceiling(100*metrics.RAMUsed / metrics.RAMTotal);
            return metrics;
        }

        /// <summary>
        /// cpu使用率
        /// </summary>
        /// <returns></returns>
        public string GetCPURate()
        {

            //string output = ShellHelper.Cmd("wmic", "cpu get LoadPercentage");
            //string cpuRate = output.Replace("LoadPercentage", string.Empty).Trim();
            try
            {

                //ManagementObjectSearcher searcher = new ManagementObjectSearcher("select * from Win32_PerfFormattedData_PerfOS_Processor");
                //var cpuTimes = searcher.Get()
                //    .Cast<ManagementObject>()
                //    .Select(mo => new
                //    {
                //        Name = mo["Name"],
                //        Usage = mo["PercentProcessorTime"]
                //    }).ToList();
                //var query = cpuTimes.Where(x => x.Name.ToString() == "_Total").Select(x => x.Usage);
                //var cpuUsage = query.SingleOrDefault();
                //if (cpuUsage == null)
                //{
                //    return "0";
                //}

                //return cpuUsage.ToString() + "%";
                var startTime = DateTime.UtcNow;
                var startCpuUsage = Process.GetCurrentProcess().TotalProcessorTime;
                var stopWatch = new Stopwatch();
                // Start watching CPU
                stopWatch.Start();

                // Meansure something else, such as .Net Core Middleware
                Thread.Sleep(100);

                // Stop watching to meansure
                stopWatch.Stop();
                var endTime = DateTime.UtcNow;
                var endCpuUsage = Process.GetCurrentProcess().TotalProcessorTime;

                var cpuUsedMs = (endCpuUsage - startCpuUsage).TotalMilliseconds;
                var totalMsPassed = (endTime - startTime).TotalMilliseconds;
                var cpuUsageTotal = cpuUsedMs / (Environment.ProcessorCount * totalMsPassed);

                var cpuUsagePercentage = cpuUsageTotal * 100;
                return cpuUsagePercentage.ToString();
            }
            catch(Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return "";
           
        }

        /// <summary>
        /// 系统内核
        /// </summary>
        /// <returns></returns>
        public string GetOSRunTime()
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


        /// <summary>
        /// 获取硬盘容量
        /// </summary>
        private string GetDiskSize1()
        {
            string result = string.Empty;
            StringBuilder sb = new StringBuilder();
            try
            {
                string hdId = string.Empty;
                ManagementClass hardDisk = new ManagementClass("win32_DiskDrive");
                ManagementObjectCollection hardDiskC = hardDisk.GetInstances();
                foreach (ManagementObject m in hardDiskC)
                {
                    long capacity = Convert.ToInt64(m["Size"].ToString());
                    sb.Append(CommHelper.ToGB(capacity, 1000.0) + "+");
                }
                result = sb.ToString().TrimEnd('+');
            }
            finally
            {

            }
            return result;
        }
        public ComputerInfo GetDiskSize()
        {
            ComputerInfo computer;
            try
            {
                computer = new ComputerInfo();
                var diskcon = Directory.GetLogicalDrives();
                long total = 0;
                long free = 0;
                foreach (string diskname in diskcon)
                {
                    try
                    {
                        DriveInfo di = new DriveInfo(diskname);
                        if (di.IsReady)
                        {
                            total += di.TotalSize;
                            free += di.AvailableFreeSpace;
                            computer.DiskCount++;
                        }
                    }
                    catch
                    {

                    }


                }

               
                computer.RAMTotal = CommHelper.ToGB(total, 1000);
                computer.RAMFree =CommHelper.ToGB(free, 1000);
                computer.RAMUsed = CommHelper.ToGB(total-free, 1000);
                computer.UsedRate = (100 - Math.Ceiling((decimal)free * 100 / total)).ToString()+"%";
            }
            finally
            {

            }
            return computer;
        }


        /// 查找cpu的名称，主频, 核心数
        /// </summary>
        /// <returns></returns>
        public Tuple<string, string> GetCPU()
        {
            Tuple<string, string> result = null;
            try
            {
                string str = string.Empty;
                ManagementClass mcCPU = new ManagementClass("Win32_Processor");
                ManagementObjectCollection mocCPU = mcCPU.GetInstances();
                foreach (ManagementObject m in mocCPU)
                {
                    string name = m["Name"].ToString();
                    string[] parts = name.Split('@');
                    result = new Tuple<string, string>(parts[0].Split('-')[0] + "处理器", parts[1]);
                    break;
                }

            }
            finally
            {

            }
            return result;
        }
    }
}
