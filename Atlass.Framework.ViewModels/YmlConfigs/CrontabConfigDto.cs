using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels.YmlConfigs
{
    /// <summary>
    /// 定时任务
    /// </summary>
    public class CrontabConfigDto
    {
        /// <summary>
        /// 是否开启
        /// </summary>
        public bool Enable { get; set; } = false;
        /// <summary>
        /// 健康检查的时间间隔
        /// </summary>
        public int CheckInterval { get; set; } = 10;

        /// <summary>
        /// 0-Sqlite,1-LiteDb
        /// </summary>
        public int Storage { get; set; }
    }
}
