using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common
{
    public class MemoryMetrics
    { 
        /// <summary>
        /// 内存大小
        /// </summary>
        public double RAMTotal { get; set; }
        /// <summary>
        /// 已使用内容
        /// </summary>
        public double RAMUsed { get; set; }
        /// <summary>
        /// 空闲内存
        /// </summary>
        public double RAMFree { get; set; }
        /// <summary>
        /// 内存使用率
        /// </summary>
        public double RAMRate { get; set; }
    }
}
