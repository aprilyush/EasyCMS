using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
     /// cron表达式帮助类
     /// </summary>
        public static class CronHelper
        {
            /// <summary>
            /// 返回每分钟触发的cron表达式
            /// </summary>
            public static string Minutely()
            {
                return "* * * * *";
            }

            /// <summary>
            /// 返回每小时指定分钟的cron表达式
            /// </summary>
            /// <param name="minute">The minute in which the schedule will be activated (0-59).</param>
            public static string Hourly(int minute = 0)
            {
                return $"{minute} * * * *";
            }

            /// <summary>
            /// 返回UTC时间每天指定小时以及分钟触发的cron表达式
            /// </summary>
            /// <param name="hour">The hour in which the schedule will be activated (0-23).</param>
            /// <param name="minute">The minute in which the schedule will be activated (0-59).</param>
            public static string Daily(int hour = 0, int minute = 0)
            {
                return $"{minute} {hour} * * *";
            }

            /// <summary>
            /// 返回UTC时间指定星期几、小时以及分钟触发的cron表达式
            /// </summary>
            /// <param name="dayOfWeek">The day of week in which the schedule will be activated.</param>
            /// <param name="hour">The hour in which the schedule will be activated (0-23).</param>
            /// <param name="minute">The minute in which the schedule will be activated (0-59).</param>
            public static string Weekly(DayOfWeek dayOfWeek = DayOfWeek.Monday, int hour = 0, int minute = 0)
            {
                return $"{minute} {hour} * * {(int)dayOfWeek}";
            }

            /// <summary>
            /// 返回UTC时间每月指定天数、小时以及分钟的cron表达式
            /// </summary>
            /// <param name="day">The day of month in which the schedule will be activated (1-31).</param>
            /// <param name="hour">The hour in which the schedule will be activated (0-23).</param>
            /// <param name="minute">The minute in which the schedule will be activated (0-59).</param>
            public static string Monthly(int day = 1, int hour = 0, int minute = 0)
            {
                return $"{minute} {hour} {day} * *";
            }

            /// <summary>
            /// 返回UTC时间每月最后一天指定小时、分钟的cron表达式
            /// </summary>
            /// <param name="hour"></param>
            /// <param name="minute"></param>
            /// <returns></returns>
            public static string LastDayOfMonth(int hour = 0, int minute = 0)
            {
                return $"0 {minute} {hour} L * ?";
            }

            /// <summary>
            /// 返回UTC时间每年指定月份、天数、小时、分钟的cron表达式
            /// </summary>
            /// <param name="month">The month in which the schedule will be activated (1-12).</param>
            /// <param name="day">The day of month in which the schedule will be activated (1-31).</param>
            /// <param name="hour">The hour in which the schedule will be activated (0-23).</param>
            /// <param name="minute">The minute in which the schedule will be activated (0-59).</param>
            public static string Yearly(int month = 1, int day = 1, int hour = 0, int minute = 0)
            {
                return $"{minute} {hour} {day} {month} *";
            }

            /// <summary>
            /// 返回每指定分钟数触发的cron表达式
            /// </summary>
            /// <param name="interval">The number of minutes to wait between every activation.</param>
            public static string MinuteInterval(int interval)
            {
                return $"*/{interval} * * * *";
            }

            /// <summary>
            /// 返回每指定小时数触发的cron表达式
            /// </summary>
            /// <param name="interval">The number of hours to wait between every activation.</param>
            public static string HourInterval(int interval)
            {
                return $"0 */{interval} * * *";
            }

            /// <summary>
            /// 返回每指定天数触发的cron表达式
            /// </summary>
            /// <param name="interval">The number of days to wait between every activation.</param>
            public static string DayInterval(int interval)
            {
                return $"0 0 */{interval} * *";
            }

            /// <summary>
            /// 返回每指定月数触发的cron表达式
            /// </summary>
            /// <param name="interval">The number of months to wait between every activation.</param>
            public static string MonthInterval(int interval)
            {
                return $"0 0 1 */{interval} *";
            }
        }
}
