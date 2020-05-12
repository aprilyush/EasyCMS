using Atlass.Framework.Common;
using Atlass.Framework.Common.Extends;
using System;
using System.Collections.Generic;
using System.Text;

namespace System
{
    public static class StringExtensions
    {

        /// <summary>从当前字符串开头移除另一字符串，不区分大小写，循环多次匹配前缀</summary>
        /// <param name="str">当前字符串</param>
        /// <param name="starts">另一字符串</param>
        /// <returns></returns>
        public static String TrimStart(this String str, params String[] starts)
        {
            if (String.IsNullOrEmpty(str)) return str;
            if (starts == null || starts.Length < 1 || String.IsNullOrEmpty(starts[0])) return str;

            for (var i = 0; i < starts.Length; i++)
            {
                if (str.StartsWith(starts[i], StringComparison.OrdinalIgnoreCase))
                {
                    str = str.Substring(starts[i].Length);
                    if (String.IsNullOrEmpty(str)) break;

                    // 从头开始
                    i = -1;
                }
            }
            return str;
        }

        /// <summary>从当前字符串结尾移除另一字符串，不区分大小写，循环多次匹配后缀</summary>
        /// <param name="str">当前字符串</param>
        /// <param name="ends">另一字符串</param>
        /// <returns></returns>
        public static String TrimEnd(this String str, params String[] ends)
        {
            if (String.IsNullOrEmpty(str)) return str;
            if (ends == null || ends.Length < 1 || String.IsNullOrEmpty(ends[0])) return str;

            for (var i = 0; i < ends.Length; i++)
            {
                if (str.EndsWith(ends[i], StringComparison.OrdinalIgnoreCase))
                {
                    str = str.Substring(0, str.Length - ends[i].Length);
                    if (String.IsNullOrEmpty(str)) break;

                    // 从头开始
                    i = -1;
                }
            }
            return str;
        }

        // <summary>从字符串中检索子字符串，在指定头部字符串之后，指定尾部字符串之前</summary>
        /// <remarks>常用于截取xml某一个元素等操作</remarks>
        /// <param name="str">目标字符串</param>
        /// <param name="after">头部字符串，在它之后</param>
        /// <param name="before">尾部字符串，在它之前</param>
        /// <param name="startIndex">搜索的开始位置</param>
        /// <param name="positions">位置数组，两个元素分别记录头尾位置</param>
        /// <returns></returns>
        public static String? Substring(this String str, String after, String? before = null, Int32 startIndex = 0, Int32[]? positions = null)
        {
            if (String.IsNullOrEmpty(str)) return str;
            if (String.IsNullOrEmpty(after) && String.IsNullOrEmpty(before)) return str;

            /*
             * 1，只有start，从该字符串之后部分
             * 2，只有end，从开头到该字符串之前
             * 3，同时start和end，取中间部分
             */

            var p = -1;
            if (!String.IsNullOrEmpty(after))
            {
                p = str.IndexOf(after, startIndex);
                if (p < 0) return null;
                p += after.Length;

                // 记录位置
                if (positions != null && positions.Length > 0) positions[0] = p;
            }

            if (String.IsNullOrEmpty(before)) return str.Substring(p);

            var f = str.IndexOf(before, p >= 0 ? p : startIndex);
            if (f < 0) return null;

            // 记录位置
            if (positions != null && positions.Length > 1) positions[1] = f;

            if (p >= 0)
                return str.Substring(p, f - p);
            else
                return str.Substring(0, f);
        }

        /// <summary>拆分字符串成为不区分大小写的可空名值字典。逗号分号分组，等号分隔</summary>
        /// <param name="value">字符串</param>
        /// <param name="nameValueSeparator">名值分隔符，默认等于号</param>
        /// <param name="separators">分组分隔符，默认逗号分号</param>
        /// <returns></returns>
        [Obsolete]
        public static IDictionary<String, String> SplitAsDictionary(this String? value, String nameValueSeparator = "=", params String[] separators)
        {
            var dic = new NullableDictionary<String, String>(StringComparer.OrdinalIgnoreCase);
            if (value == null || value.IsEmpty()) return dic;

            if (String.IsNullOrEmpty(nameValueSeparator)) nameValueSeparator = "=";
            if (separators == null || separators.Length == 0) separators = new String[] { ",", ";" };

            var ss = value.Split(separators, StringSplitOptions.RemoveEmptyEntries);
            if (ss == null || ss.Length == 0) return dic;

            foreach (var item in ss)
            {
                var p = item.IndexOf(nameValueSeparator);
                // 在前后都不行
                if (p <= 0 || p >= item.Length - 1) continue;

                var key = item.Substring(0, p).Trim();
                dic[key] = item.Substring(p + nameValueSeparator.Length).Trim();
            }

            return dic;
        }
    }
}
