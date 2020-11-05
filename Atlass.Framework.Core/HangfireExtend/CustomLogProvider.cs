using Atlass.Framework.Common.NLog;
using Hangfire.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.HangfireExtend
{
    public class CustomLogProvider : ILogProvider
    {
        public ILog GetLogger(string name)
        {
            // Logger name usually contains the full name of a type that uses it,
            // e.g. "Hangfire.Server.RecurringJobScheduler". It's used to know the
            // context of this or that message and for filtering purposes.
            return new CustomLogger { Name = name };
        }
    }

    public class CustomLogger : ILog
    {
        public string Name { get; set; }

        public bool Log(LogLevel logLevel, Func<string> messageFunc, Exception exception = null)
        {
            if (messageFunc == null)
            {
                // Before calling a method with an actual message, LogLib first probes
                // whether the corresponding log level is enabled by passing a `null`
                // messageFunc instance.
                return logLevel > LogLevel.Warn;
            }

            // Writing a message somewhere, make sure you also include the exception parameter,
            // because it usually contain valuable information, but it can be `null` for regular
            // messages.
            LogNHelper.Exception(String.Format("{0}: {1} {2} {3}", logLevel, Name, messageFunc(), exception));
            // Console.WriteLine();

            // Telling LibLog the message was successfully logged.
            return true;
        }

    }
}
