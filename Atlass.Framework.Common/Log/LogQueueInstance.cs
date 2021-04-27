using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common.Log
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
            if (LogQueue.Count > 500)
            {
                return;
            }
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
