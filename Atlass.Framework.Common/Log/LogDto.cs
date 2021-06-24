using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common.Log
{
    public class LogDto
    {
        public string LogSummary { get; set; }
        public string LogMessage { get; set; }
        /// <summary>
        /// 1-info,2-debug,3-warn,4-error,5-sqllog
        /// </summary>
        public int LogType { get; set; }
        public DateTime LogTime { get; set; }

        /// <summary>
        /// sql执行时间
        /// </summary>
        public long ElapsedTime { get; set; }
        /// <summary>
        /// job执行结果，0-OK，1-失败
        /// </summary>
        public int ExcuteResult { get; set; }
    }
}
