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
        string GetRunTime();
    }
}
