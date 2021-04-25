using Atlass.Framework.Common;
using Atlass.Framework.Common.Extends;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace System
{
    public static class StringExtensions
    {

        #region 字符串扩展判断
        /// <summary>
        /// 判断是否是手机号码
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool IsMobile(this string val)
        {
            return Regex.IsMatch(val, @"^1[3456789]\d{9}$", RegexOptions.IgnoreCase);
        }

        /// <summary>
        /// 判断是否是邮箱
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool IsEmail(this string val)
        {
            return Regex.IsMatch(val, @"^\w+([-_+.]\w+)*@\w+([-_.]\w+)*\.\w+([-_.]\w+)*$", RegexOptions.IgnoreCase);
        }

        /// <summary>
        /// 判断是否是数字
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool IsNumber(this string val)
        {
            const string formatNumber = "^[0-9]+$";
            return Regex.IsMatch(val, formatNumber);
        }

        /// <summary>
        /// 判断是否是时间
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool IsDateTime(this string val)
        {
            const string formatDate = @"^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$";
            const string formatDateTime = @"^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]?\d$";

            return Regex.IsMatch(val, formatDate) || Regex.IsMatch(val, formatDateTime);
        }


        /// <summary>
        /// 判断是否是身份证
        /// </summary>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool IsIDCard(this string val)
        {
            Regex regex;
            string[] strArray;
            DateTime time;
            if ((val.Length != 15) && (val.Length != 0x12))
            {
                return false;
            }
            if (val.Length == 15)
            {
                regex = new Regex(@"^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$");
                if (!regex.Match(val).Success)
                {
                    return false;
                }
                strArray = regex.Split(val);
                try
                {
                    time = new DateTime(int.Parse("19" + strArray[2]), int.Parse(strArray[3]), int.Parse(strArray[4]));
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            regex = new Regex(@"^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9Xx])$");
            if (!regex.Match(val).Success)
            {
                return false;
            }
            strArray = regex.Split(val);
            try
            {
                time = new DateTime(int.Parse(strArray[2]), int.Parse(strArray[3]), int.Parse(strArray[4]));
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// 判断一个字符串是否为网址
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        public static bool IsUrl(this string _value)
        {
            Regex regex = new Regex(@"(http://)?([\w-]+\.)*[\w-]+(/[\w- ./?%&=]*)?", RegexOptions.IgnoreCase);
            return regex.Match(_value).Success;
        }
        /// <summary>
        /// 判断一个字符串是否为字母加数字
        /// Regex("[a-zA-Z0-9]?"
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        public static bool IsWordAndNum(this string _value)
        {
            Regex regex = new Regex("[a-zA-Z0-9]?");
            return regex.Match(_value).Success;
        }
        /// <summary>
        /// 判断是否是IP地址
        /// </summary>
        /// <param name="_ip"></param>
        /// <returns></returns>
        public static bool IsIP(this string _ip)
        {
            string _express = @"^((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)$";
            if (_ip.Length == 0)
            {
                return false;
            }
            Regex regex = new Regex(_express);
            return regex.IsMatch(_ip);
        }
       
        #endregion

        #region 字符串截取
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

        /// <summary>从字符串中检索子字符串，在指定头部字符串之后，指定尾部字符串之前</summary>
        /// <remarks>常用于截取xml某一个元素等操作</remarks>
        /// <param name="str">目标字符串</param>
        /// <param name="after">头部字符串，在它之后</param>
        /// <param name="before">尾部字符串，在它之前</param>
        /// <param name="startIndex">搜索的开始位置</param>
        /// <param name="positions">位置数组，两个元素分别记录头尾位置</param>
        /// <returns></returns>
        public static String Substring(this String str, String after, String? before = null, Int32 startIndex = 0, Int32[]? positions = null)
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

        #endregion

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

        /// <summary>
        /// 去掉字符串中全部空格
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string TrimAll(this string value)
        {
            return Regex.Replace(value, @"\s", "");
        }

        /// <summary>
        /// 转换为字符串
        /// </summary>
        /// <param name="data">数据</param>
        public static string SafeString(this object data)
        {
            return data == null ? string.Empty : data.ToString().Trim();
        }
        /// <summary>
        /// 自带类库的反转
        /// </summary>
        /// <param name="original"></param>
        /// <returns></returns>
        public static string ReverseByArray(this string original)
        {
            char[] c = original.ToCharArray();
            Array.Reverse(c);
            return new string(c);
        }
        /// <summary>
        /// string 字符串翻转 高效反转算法
        /// </summary>
        /// <param name="original"></param>
        /// <returns></returns>
        public static string ReverseByCharBuffer(this string original)
        {
            char[] c = original.ToCharArray();
            int l = original.Length;
            for (int i = 0; i < l / 2; i++)
            {
                char t = c[i];
                c[i] = c[l - i - 1];
                c[l - i - 1] = t;
            }
            return new string(c);
        }

        /// <summary>
        /// 安全返回值
        /// </summary>
        /// <param name="value">可空值</param>
        public static T SafeValue<T>(this T? value) where T : struct
        {
            return value ?? default(T);
        }

        #region 空判断
        /// <summary>
        /// 是否为空的数据id 比如为0或者为空字符串
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static bool IsEmptyId(this string data)
        {
            if (string.IsNullOrEmpty(data))
            {
                return true;
            }
            if (data == "0")
            {
                return true;
            }

            return false;
        }
        /// <summary>
        /// 是否为空
        /// </summary>
        /// <param name="value">值</param>
        public static bool IsEmpty(this string value)
        {
            return string.IsNullOrWhiteSpace(value);
        }
        /// <summary>
        /// 是否为空
        /// </summary>
        /// <param name="value">值</param>
        public static bool IsEmpty(this Guid? value)
        {
            if (value == null)
                return true;
            return IsEmpty(value.Value);
        }
        /// <summary>
        /// 是否为空
        /// </summary>
        /// <param name="value">值</param>
        public static bool IsEmpty(this Guid value)
        {
            if (value == Guid.Empty)
                return true;
            return false;
        }
        /// <summary>
        /// 是否为空
        /// </summary>
        /// <param name="value">值</param>
        public static bool IsEmpty(this object value)
        {
            if (value != null && !string.IsNullOrEmpty(value.ToString()))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion
        #region 数组转换
        /// <summary>
        /// 转换为整型
        /// </summary>
        /// <param name="data">数据</param>
        public static int ToInt(this object data)
        {
            if (data == null)
                return 0;
            int result;
            var success = int.TryParse(data.ToString(), out result);
            if (success)
                return result;
            try
            {
                return Convert.ToInt32(data.ToString());
            }
            catch (Exception)
            {
                return 0;
            }
        }

        /// <summary>
        /// 整型转换
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static long ToInt64(this object data)
        {
            if (data == null)
                return 0;
            long result;
            var success = long.TryParse(data.ToString(), out result);
            if (success)
                return result;
            try
            {
                return Convert.ToInt64(data.ToString());
            }
            catch (Exception)
            {
                return 0;
            }
        }
        /// <summary>
        /// 字符串转为数组Int64
        /// </summary>
        /// <param name="value"></param>
        /// <param name="split"></param>
        /// <returns></returns>
        public static long[] SplitToArrayInt64(this string value, char split=',')
        {
            if (value.IsEmpty())
            {
                return new long[] { };
            }
            long[] newarray = Array.ConvertAll(value.Split(split), new Converter<string, long>(ToInt64));
            return newarray;
        }
        /// <summary>
        /// 字符串转为数组Int
        /// </summary>
        /// <param name="value"></param>
        /// <param name="split"></param>
        /// <returns></returns>
        public static int[] SplitToArrayInt(this string value, char split= ',')
        {
            if (value.IsEmpty())
            {
                return new int[] { };
            }
            int[] newarray = Array.ConvertAll(value.Split(split), new Converter<string, int>(ToInt));
            return newarray;
        }

        /// <summary>
        /// 字符串转为数组
        /// </summary>
        /// <param name="value"></param>
        /// <param name="split"></param>
        /// <returns></returns>
        public static string[] SplitToArray(this string value, char split = ',')
        {
            if (value.IsEmpty())
            {
                return new string[] { };
            }
            return value.Split(split);
        }
        #endregion
    }
}
