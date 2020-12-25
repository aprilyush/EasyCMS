using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.OS
{
    public class SystemMonitor
    {
        /// <summary>
        /// 核心数
        /// </summary>
        public int ProcessorCount { get; set; }
        /// <summary>
        /// 服务器名称
        /// </summary>
        public string MachineName { get; set; }
        /// <summary>
        /// 系统架构
        /// </summary>
        public string OSArchitecture { get; set; }
        /// <summary>
        /// 操作系统
        /// </summary>
        public string OSDescription { get; set; }
        /// <summary>
        ///局域网Ip
        /// </summary>
        public string LanIp { get; set; }

        /// <summary>
        /// .NetCore版本
        /// </summary>
        public string NetCoreVersion { get; set; }

        /// <summary>
        /// 进程名称
        /// </summary>
        public string ProcessorName { get; set; }
        /// <summary>
        /// 网站根目录
        /// </summary>
        public string ContentRootPath { get; set; }
        /// <summary>
        /// 网站资源目录
        /// </summary>
        public string WebRootPath { get; set; }
        /// <summary>
        /// 进程启动时间
        /// </summary>
        public string ProcessStartTime { get; set; }
        /// <summary>
        /// 内存占用
        /// </summary>
        public string  ProcessMemory{ get; set; }

        /// <summary>
        /// gc的工作模式
        /// </summary>
        public string WorkGC { get; set; }
        /// <summary>
        /// 系统运行时长
        /// </summary>
        public string OsRuntime { get; set; }
    }
}
