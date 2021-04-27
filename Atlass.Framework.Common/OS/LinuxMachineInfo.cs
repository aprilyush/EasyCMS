using Atlass.Framework.Common.Log;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Threading;

namespace Atlass.Framework.Common
{
    public class LinuxMachineInfo: IMachineInfo
    {


        /// <summary>
        /// 获取内存使用信息
        /// </summary>
        /// <returns></returns>
        public MemoryMetrics GetMetrics()
        {
            string output = ShellHelper.Bash("free -m");

            var lines = output.Split("\n");
            var memory = lines[1].Split(" ", StringSplitOptions.RemoveEmptyEntries);

            var metrics = new MemoryMetrics();
            metrics.RAMTotal = double.Parse(memory[1]);
            metrics.RAMUsed = double.Parse(memory[2]);
            metrics.RAMFree = double.Parse(memory[3]);
            metrics.RAMRate = Math.Ceiling(100 * metrics.RAMUsed / metrics.RAMTotal);
            return metrics;
        }


        public string GetCPURate()
        {

            //string output = ShellHelper.Bash("top -b -n1 | grep \"Cpu(s)\" | awk '{print $2 + $4}'");
            //string cpuRate = output.Trim();
            //return cpuRate;

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

            var cpuUsagePercentage = Math.Round(cpuUsageTotal * 100, 2);
            return cpuUsagePercentage.ToString()+"%";
        }

        public string GetOSRunTime()
        {
            string runTime = string.Empty;
            try
            {
                string output = ShellHelper.Bash("uptime -s");
                output = output.Trim();
                runTime = TimeHelper.FormatTime((DateTime.Now - output.ToDate()).TotalMilliseconds.ToString().Split('.')[0].ToInt64());
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }
            return runTime;
        }

        /// <summary>
        /// 获取硬盘容量
        /// </summary>
        public ComputerInfo GetDiskSize()
        {
            ComputerInfo computer=null;
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

                computer.DiskCount = diskcon.Length;
                computer.RAMTotal = CommHelper.ToGB(total, 1000);
                computer.RAMFree = CommHelper.ToGB(free, 1000);
                computer.RAMUsed = CommHelper.ToGB(total - free, 1000);
                computer.UsedRate = (100 - Math.Ceiling((decimal)free * 100 / total)).ToString() + "%";
            }catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
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
               
                     string output = ShellHelper.Bash("cat /proc/cpuinfo");

                var lines = output.Split("\n");
                var cpuNmae = lines[4].Split(":", StringSplitOptions.RemoveEmptyEntries)[1];
                string mhz=lines[7].Split(":", StringSplitOptions.RemoveEmptyEntries)[1];
                //string cpuNmae = "";
                //for(int i = 1; i < memory.Length; i++)
                //{
                //    cpuNmae += memory[i]+" ";
                //}
                //result = new Tuple<string, string>($"{memory[0]}核，{cpuNmae}","");
                double CPUGHz= Math.Round(mhz.ToDouble() / 1000, 2);
                result = new Tuple<string, string>(cpuNmae, CPUGHz.ToString()+"GHz");
            }
            finally
            {

            }
            return result;
        }
    }
}
