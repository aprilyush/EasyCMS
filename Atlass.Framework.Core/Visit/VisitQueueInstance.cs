using Atlass.Framework.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core
{
    public static class VisitQueueInstance
    {
        private static ConcurrentQueue<cms_visit> Queue;
        static VisitQueueInstance()
        {
            Queue = new ConcurrentQueue<cms_visit>();
        }

        public static void Add(cms_visit log)
        {
            if (Queue.Count > 5000)
            {
                return;
            }
            Queue.Enqueue(log);
        }

        public static cms_visit GetVisit()
        { 
            Queue.TryDequeue(out cms_visit log);
            return log;
        }
        public static void Clear()
        {
           Queue.Clear();
        }
    }
}
