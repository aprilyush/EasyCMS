using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common.NLog
{
    public class LogDto
    {
        public string LogSummary { get; set; }
        public string LogMessage { get; set; }
        /// <summary>
        /// 1-info,2-debug,3-warn,4-error
        /// </summary>
        public int LogType { get; set; }
        public DateTime LogTime { get; set; }
    }
}
