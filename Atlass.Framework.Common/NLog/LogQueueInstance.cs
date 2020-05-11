using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common.NLog
{
    public class LogQueueInstance
    {
        private static ConcurrentQueue<LogDto> LogQueue;
        static LogQueueInstance()
        {
            LogQueue = new ConcurrentQueue<LogDto>();
        }

        public static void Add(LogDto log)
        {
            LogQueue.Enqueue(log);
        }

        public static LogDto GetLog()
        {
            LogQueue.TryDequeue(out LogDto log);
            return log;
        }
        public static void Clear()
        {
            LogQueue.Clear();
        }
    }
}
