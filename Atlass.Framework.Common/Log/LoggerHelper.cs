using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common.Log
{
     public class LoggerHelper
    {
        //private static Logger logger = LogManager.GetCurrentClassLogger();
        //private static Logger logger =null;

        static LoggerHelper()
        {
           // logger = LogManager.GetLogger("AtlassLog:");
        }
        /// <summary>
        /// 普通的日志信息
        /// </summary>
        /// <param name="message">日志内容</param>
        public static void Info(string message, string summary = "日志信息")
        {
            LogDto log = new LogDto() { LogSummary = summary, LogMessage = message, LogTime = DateTime.Now, LogType = 1 };
            LogQueueInstance.Add(log);
            //if (logger.IsInfoEnabled)
            //{
            //    logger.Info(message);
            //}
            //logger = null;
        }

        /// <summary>
        /// 异常信息
        /// </summary>
        /// <param name="message"></param>
        public static void Exception(string message, string summary = "异常信息")
        {
            LogDto log = new LogDto() { LogSummary = summary, LogMessage = message, LogTime = DateTime.Now, LogType = 4 };
            LogQueueInstance.Add(log);
            //if (logger.IsErrorEnabled)
            //{
            //    logger.Error(message);
            //}
            //logger = null;
        }

        /// <summary>
        /// 异常信息
        /// </summary>
        /// <param name="ex"></param>
        public static void Exception(Exception ex)
        {
            LogDto log = new LogDto() { LogSummary = ex.Message, LogMessage = ex.StackTrace, LogTime = DateTime.Now, LogType = 4 };
            LogQueueInstance.Add(log);
            // Logger logger = LogManager.GetLogger("Exception");
            //if (logger.IsErrorEnabled)
            //{
            //    logger.Error(ex);
            //}
            //logger = null;
        }

        /// <summary>
        /// 警告信息
        /// </summary>
        /// <param name="message"></param>
        public static void Warn(string message, string summary = "警告日志")
        {
            // Logger logger = LogManager.GetLogger("InfoLog");
            LogDto log = new LogDto() { LogSummary = summary, LogMessage = message, LogTime = DateTime.Now, LogType = 3 };
            LogQueueInstance.Add(log);
            //if (logger.IsWarnEnabled)
            //{
            //    logger.Warn(message);
            //}
            //logger = null;
        }

        /// <summary>
        /// 堆栈信息
        /// </summary>
        /// <param name="message"></param>
        //public static void Trace(string message)
        //{
        //    // Logger logger = LogManager.GetLogger("InfoLog");
        //    if (logger.IsTraceEnabled)
        //    {
        //        logger.Trace(message);
        //    }
        //    //logger = null;
        //}

        /// <summary>
        /// 调试信息
        /// </summary>
        /// <param name="message"></param>
        public static void Debug(string message, string summary = "调试")
        {
            LogDto log = new LogDto() { LogSummary = summary, LogMessage = message, LogTime = DateTime.Now, LogType = 2 };
            LogQueueInstance.Add(log);
            // Logger logger = LogManager.GetLogger("InfoLog");
            //if (logger.IsDebugEnabled)
            //{
            //    logger.Debug(message);
            //}
            //logger = null;
        }

        /// <summary>
        /// 调试信息
        /// </summary>
        /// <param name="message"></param>
        public static void Sql(string tableName, string sql,long elapsedTime)
        {
            LogDto log = new LogDto() { LogSummary = tableName, LogMessage = sql, LogTime = DateTime.Now, LogType = 5,ElapsedTime=elapsedTime };
            LogQueueInstance.Add(log);
            // Logger logger = LogManager.GetLogger("InfoLog");
            //if (logger.IsDebugEnabled)
            //{
            //    logger.Debug(message);
            //}
            //logger = null;
        }
    }
}
