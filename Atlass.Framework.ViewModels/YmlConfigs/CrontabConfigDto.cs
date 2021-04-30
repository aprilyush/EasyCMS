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
    }
}
