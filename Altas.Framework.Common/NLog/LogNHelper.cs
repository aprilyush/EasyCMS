using System;
using System.Collections.Generic;
using System.Text;
using NLog;

namespace Altas.Framework.Common.NLog
{
     public class LogNHelper
    {
        //private static Logger logger = LogManager.GetCurrentClassLogger();
        private static Logger logger =null;

        static LogNHelper()
        {
            logger = LogManager.GetLogger("AltasLog:");
        }
        /// <summary>
        /// 普通的日志信息
        /// </summary>
        /// <param name="message">日志内容</param>
        public static void Info(string message)
        {
            // Logger logger = LogManager.GetLogger("InfoLog");
            if (logger.IsInfoEnabled)
            {
                logger.Info(message);
            }
            //logger = null;
        }

        /// <summary>
        /// 异常信息
        /// </summary>
        /// <param name="message"></param>
        public static void Exception(string message)
        {
            // Logger logger = LogManager.GetLogger("Exception");
            if (logger.IsErrorEnabled)
            {
                logger.Error(message);
            }
            //logger = null;
        }

        /// <summary>
        /// 异常信息
        /// </summary>
        /// <param name="ex"></param>
        public static void Exception(Exception ex)
        {
            // Logger logger = LogManager.GetLogger("Exception");
            if (logger.IsErrorEnabled)
            {
                logger.Error(ex);
            }
            //logger = null;
        }

        /// <summary>
        /// 警告信息
        /// </summary>
        /// <param name="message"></param>
        public static void Warn(string message)
        {
            // Logger logger = LogManager.GetLogger("InfoLog");
            if (logger.IsWarnEnabled)
            {
                logger.Warn(message);
            }
            //logger = null;
        }

        /// <summary>
        /// 堆栈信息
        /// </summary>
        /// <param name="message"></param>
        public static void Trace(string message)
        {
            // Logger logger = LogManager.GetLogger("InfoLog");
            if (logger.IsTraceEnabled)
            {
                logger.Trace(message);
            }
            //logger = null;
        }

        /// <summary>
        /// 调试信息
        /// </summary>
        /// <param name="message"></param>
        public static void Debug(string message)
        {
            // Logger logger = LogManager.GetLogger("InfoLog");
            if (logger.IsDebugEnabled)
            {
                logger.Debug(message);
            }
            //logger = null;
        }

        public static void Fatal(string message)
        {
            // Logger logger = LogManager.GetLogger("InfoLog");
            if (logger.IsFatalEnabled)
            {
                logger.Fatal(message);
            }
            //logger = null;
        }
    }
}
