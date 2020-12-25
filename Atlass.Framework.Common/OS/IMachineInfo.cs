using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Common
{
    public interface IMachineInfo
    {


        /// <summary>
        /// 获取内存使用信息
        /// </summary>
        /// <returns></returns>
        MemoryMetrics GetMetrics();

        /// <summary>
        /// cpu使用率
        /// </summary>
        /// <returns></returns>
        string GetCPURate();
        /// <summary>
        /// 系统内核
        /// </summary>
        /// <returns></returns>
        string GetOSRunTime();

        /// <summary>
        /// 获取硬盘容量
        /// </summary>
        ComputerInfo GetDiskSize();

        /// 查找cpu的名称，主频, 核心数
        /// </summary>
        /// <returns></returns>
        Tuple<string, string> GetCPU();
    }
}
