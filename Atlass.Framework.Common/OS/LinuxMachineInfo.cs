using Atlass.Framework.Common.NLog;
using System;
using System.Collections.Generic;
using System.Text;

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
            metrics.Total = double.Parse(memory[1]);
            metrics.Used = double.Parse(memory[2]);
            metrics.Free = double.Parse(memory[3]);

            return metrics;
        }


        public string GetCPURate()
        {
           
            string output = ShellHelper.Bash("top -b -n1 | grep \"Cpu(s)\" | awk '{print $2 + $4}'");
            string cpuRate = output.Trim();
            return cpuRate;
        }

        public string GetRunTime()
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
                LogNHelper.Exception(ex);
            }
            return runTime;
        }

    }
}
