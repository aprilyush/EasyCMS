using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Common
{
    public class CommHelper
    {
        private static Encoding Gb2312 { get; } = Encoding.GetEncoding("gb2312");

        #region 类型转换
        public static T Cast<T>(object value, T defaultValue = default(T))
        {
            switch (value)
            {
                case null:
                    return defaultValue;
                case T variable:
                    return variable;
                default:
                    try
                    {
                        return (T)Convert.ChangeType(value, typeof(T));
                    }
                    catch (InvalidCastException)
                    {
                        return defaultValue;
                    }
            }
        }

        //添加枚举：(fileAttributes | FileAttributes.ReadOnly)   判断枚举：((fileAttributes & FileAttributes.ReadOnly) == FileAttributes.ReadOnly)   去除枚举：(fileAttributes ^ FileAttributes.ReadOnly)
        public static T ToEnum<T>(string value, T defaultValue) where T : struct
        {
            if (string.IsNullOrEmpty(value))
            {
                return defaultValue;
            }

            return Enum.TryParse<T>(value, true, out var result) ? result : defaultValue;
        }
        /// <summary>
        /// 将字符串类型转换为对应的枚举类型
        /// </summary>
        public static object ToEnum(Type enumType, string value, object defaultType)
        {
            object retVal;
            try
            {
                retVal = Enum.Parse(enumType, value, true);
            }
            catch
            {
                retVal = defaultType;
            }
            return retVal;
        }
        #endregion

        #region 字符串操作
        public static bool EqualsIgnoreCase(string a, string b)
        {
            if (a == b) return true;
            if (string.IsNullOrEmpty(a) || string.IsNullOrEmpty(b)) return false;

            return a.Equals(b, StringComparison.OrdinalIgnoreCase);
        }

        /// <summary>
        /// 将对象集合转化为可供Sql语句查询的In()条件，如将集合{'ss','xx','ww'}转化为字符串"'ss','xx','ww'"。
        /// </summary>
        /// <param name="collection">非数字的集合</param>
        /// <returns>可供Sql语句查询的In()条件字符串，各元素用单引号包围</returns>
        public static string ToSqlInStringWithQuote(ICollection collection)
        {
            var builder = new StringBuilder();
            if (collection != null)
            {
                foreach (var obj in collection)
                {
                    builder.Append("'").Append(obj).Append("'").Append(",");
                }
                if (builder.Length != 0) builder.Remove(builder.Length - 1, 1);
            }
            return builder.Length == 0 ? "null" : builder.ToString();
        }

        /// <summary>
        /// 将数字集合转化为可供Sql语句查询的In()条件，如将集合{2,3,4}转化为字符串"2,3,4"。
        /// </summary>
        /// <param name="collection">非数字的集合</param>
        /// <returns>可供Sql语句查询的In()条件字符串，各元素不使用单引号包围</returns>
        public static string ToSqlInStringWithoutQuote(ICollection collection)
        {
            var builder = new StringBuilder();
            if (collection != null)
            {
                foreach (var obj in collection)
                {
                    builder.Append(obj).Append(",");
                }
                if (builder.Length != 0) builder.Remove(builder.Length - 1, 1);
            }
            return builder.Length == 0 ? "null" : builder.ToString();
        }


        public static string ValueFromUrl(string value)
        {
            var retVal = string.Empty;
            if (!string.IsNullOrEmpty(value))
            {
                retVal = value.Replace("_equals_", "=").Replace("_and_", "&").Replace("_question_", "?").Replace("_quote_", "'").Replace("_add_", "+");
            }
            return retVal;
        }

        public static string ValueToUrl(string value)
        {
            var retVal = string.Empty;
            if (!string.IsNullOrEmpty(value))
            {
                //替换url中的换行符，update by sessionliang at 20151211
                retVal = value.Replace("=", "_equals_").Replace("&", "_and_").Replace("?", "_question_").Replace("'", "_quote_").Replace("+", "_add_").Replace("\r", "").Replace("\n", "");
            }
            return retVal;
        }
        public static string ToJsString(string value)
        {
            var retVal = string.Empty;
            if (!string.IsNullOrEmpty(value))
            {
                retVal = value.Replace("'", @"\'").Replace("\r", "\\r").Replace("\n", "\\n");
            }
            return retVal;
        }
        public static string UpperFirst(string input)
        {
            if (string.IsNullOrEmpty(input)) return string.Empty;
            return input.First().ToString().ToUpper() + input.Substring(1);
        }


     

        public static bool StartsWithIgnoreCase(string text, string startString)
        {
            if (string.IsNullOrEmpty(text) || string.IsNullOrEmpty(startString)) return false;
            return text.Trim().ToLower().StartsWith(startString.Trim().ToLower()) || string.Equals(text.Trim(), startString.Trim(), StringComparison.OrdinalIgnoreCase);
        }

        public static bool EndsWithIgnoreCase(string text, string endString)
        {
            if (string.IsNullOrEmpty(text) || string.IsNullOrEmpty(endString)) return false;
            return text.Trim().ToLower().EndsWith(endString.Trim().ToLower());
        }

        public static bool StartsWith(string text, string startString)
        {
            if (string.IsNullOrEmpty(text) || string.IsNullOrEmpty(startString)) return false;
            return text.StartsWith(startString);
        }
        #endregion


        #region 字典项，NameValueCollection，Dictionary 转换
        public static NameValueCollection ToNameValueCollection(string separateString)
        {
            if (!string.IsNullOrEmpty(separateString))
            {
                separateString = separateString.Replace("/u0026", "&");
            }
            return ToNameValueCollection(separateString, '&');
        }

        public static NameValueCollection ToNameValueCollection(string separateString, char seperator)
        {
            var attributes = new NameValueCollection();
            if (!string.IsNullOrEmpty(separateString))
            {
                var pairs = separateString.Split(seperator);
                foreach (var pair in pairs)
                {
                    if (pair.IndexOf("=", StringComparison.Ordinal) != -1)
                    {
                        var name = ValueFromUrl(pair.Split('=')[0]);
                        var value =ValueFromUrl(pair.Split('=')[1]);
                        attributes.Add(name, value);
                    }
                }
            }
            return attributes;
        }

        public static string NameValueCollectionToString(NameValueCollection attributes, char seperator = '&')
        {
            if (attributes == null || attributes.Count <= 0) return string.Empty;

            var builder = new StringBuilder();
            foreach (string key in attributes.Keys)
            {
                builder.Append($@"{ValueToUrl(key)}={ValueToUrl(attributes[key])}{seperator}");
            }
            builder.Length--;
            return builder.ToString();
        }

        public static NameValueCollection DictionaryToNameValueCollection(Dictionary<string, object> attributes)
        {
            var nvc = new NameValueCollection(StringComparer.OrdinalIgnoreCase);
            if (attributes != null && attributes.Count > 0)
            {
                foreach (var key in attributes.Keys)
                {
                    var value = attributes[key];
                    if (value != null)
                    {
                        nvc[key] = attributes[key].ToString();
                    }
                }
            }
            return nvc;
        }

        public static bool DictGetValue(Dictionary<int, bool> dict, int key)
        {
            if (dict.TryGetValue(key, out var retVal))
            {
                return retVal;
            }

            return false;
        }

        public static string ToAttributesString(NameValueCollection attributes)
        {
            var builder = new StringBuilder();
            if (attributes != null && attributes.Count > 0)
            {
                foreach (string key in attributes.Keys)
                {
                    var value = attributes[key];
                    if (!string.IsNullOrEmpty(value))
                    {
                        value = value.Replace("\"", "'");
                    }
                    builder.Append($@"{key}=""{value}"" ");
                }
                builder.Length--;
            }
            return builder.ToString();
        }

        public static string ToAttributesString(Dictionary<string, string> attributes)
        {
            var builder = new StringBuilder();
            if (attributes != null && attributes.Count > 0)
            {
                foreach (var key in attributes.Keys)
                {
                    var value = attributes[key];

                    builder.Append(value == null ? $"{key} " : $@"{key}=""{value.Replace("\"", "'")}"" ");
                }
                builder.Length--;
            }
            return builder.ToString();
        }

        public static string NameValueCollectionToJsonString(NameValueCollection attributes)
        {
            var jsonString = new StringBuilder("{");
            if (attributes != null && attributes.Count > 0)
            {
                foreach (string key in attributes.Keys)
                {
                    var value = attributes[key];
                    value = value?.Replace("\\", "\\\\").Replace("\"", "\\\\\\\"").Replace("\r\n", string.Empty);
                    jsonString.AppendFormat(@"""{0}"": ""{1}"",", key, value);
                }
                jsonString.Length--;
            }
            jsonString.Append("}");
            return jsonString.ToString();
        }

        public static NameValueCollection NewIgnoreCaseNameValueCollection()
        {
            var comparer = StringComparer.OrdinalIgnoreCase;
            var caseInsensitiveDictionary = new NameValueCollection(comparer);
            return caseInsensitiveDictionary;
        }
        #endregion


        /// <summary>
        /// byte到kb的长度转换
        /// </summary>
        /// <param name="byteSize"></param>
        /// <returns></returns>
        public static long GetKbSize(long byteSize)
        {
            long fileKbSize = Convert.ToUInt32(Math.Ceiling((double)byteSize / 1024));
            if (fileKbSize == 0)
            {
                fileKbSize = 1;
            }
            return fileKbSize;
        }
        /// <summary>  
        /// 将字节转换为GB
        /// </summary>  
        /// <param name="size">字节值</param>  
        /// <param name="mod">除数，硬盘除以1000，内存除以1024</param>  
        /// <returns></returns>  
        public static string ToGB(double size, double mod)
        {
            String[] units = new String[] { "B", "KB", "MB", "GB", "TB", "PB" };
            int i = 0;
            while (size >= mod)
            {
                size /= mod;
                i++;
            }
            return Math.Round(size) + units[i];
        }

        #region 汉字转拼音

        private static readonly int[] Pyvalue =
        {
            -20319, -20317, -20304, -20295, -20292, -20283, -20265, -20257, -20242, -20230, -20051, -20036, -20032,
            -20026, -20002, -19990, -19986, -19982, -19976, -19805, -19784, -19775, -19774, -19763, -19756, -19751,
            -19746, -19741, -19739, -19728,
            -19725, -19715, -19540, -19531, -19525, -19515, -19500, -19484, -19479, -19467, -19289, -19288, -19281,
            -19275, -19270, -19263,
            -19261, -19249, -19243, -19242, -19238, -19235, -19227, -19224, -19218, -19212, -19038, -19023, -19018,
            -19006, -19003, -18996,
            -18977, -18961, -18952, -18783, -18774, -18773, -18763, -18756, -18741, -18735, -18731, -18722, -18710,
            -18697, -18696, -18526,
            -18518, -18501, -18490, -18478, -18463, -18448, -18447, -18446, -18239, -18237, -18231, -18220, -18211,
            -18201, -18184, -18183,
            -18181, -18012, -17997, -17988, -17970, -17964, -17961, -17950, -17947, -17931, -17928, -17922, -17759,
            -17752, -17733, -17730,
            -17721, -17703, -17701, -17697, -17692, -17683, -17676, -17496, -17487, -17482, -17468, -17454, -17433,
            -17427, -17417, -17202,
            -17185, -16983, -16970, -16942, -16915, -16733, -16708, -16706, -16689, -16664, -16657, -16647, -16474,
            -16470, -16465, -16459,
            -16452, -16448, -16433, -16429, -16427, -16423, -16419, -16412, -16407, -16403, -16401, -16393, -16220,
            -16216, -16212, -16205,
            -16202, -16187, -16180, -16171, -16169, -16158, -16155, -15959, -15958, -15944, -15933, -15920, -15915,
            -15903, -15889, -15878,
            -15707, -15701, -15681, -15667, -15661, -15659, -15652, -15640, -15631, -15625, -15454, -15448, -15436,
            -15435, -15419, -15416,
            -15408, -15394, -15385, -15377, -15375, -15369, -15363, -15362, -15183, -15180, -15165, -15158, -15153,
            -15150, -15149, -15144,
            -15143, -15141, -15140, -15139, -15128, -15121, -15119, -15117, -15110, -15109, -14941, -14937, -14933,
            -14930, -14929, -14928,
            -14926, -14922, -14921, -14914, -14908, -14902, -14894, -14889, -14882, -14873, -14871, -14857, -14678,
            -14674, -14670, -14668,
            -14663, -14654, -14645, -14630, -14594, -14429, -14407, -14399, -14384, -14379, -14368, -14355, -14353,
            -14345, -14170, -14159,
            -14151, -14149, -14145, -14140, -14137, -14135, -14125, -14123, -14122, -14112, -14109, -14099, -14097,
            -14094, -14092, -14090,
            -14087, -14083, -13917, -13914, -13910, -13907, -13906, -13905, -13896, -13894, -13878, -13870, -13859,
            -13847, -13831, -13658,
            -13611, -13601, -13406, -13404, -13400, -13398, -13395, -13391, -13387, -13383, -13367, -13359, -13356,
            -13343, -13340, -13329,
            -13326, -13318, -13147, -13138, -13120, -13107, -13096, -13095, -13091, -13076, -13068, -13063, -13060,
            -12888, -12875, -12871,
            -12860, -12858, -12852, -12849, -12838, -12831, -12829, -12812, -12802, -12607, -12597, -12594, -12585,
            -12556, -12359, -12346,
            -12320, -12300, -12120, -12099, -12089, -12074, -12067, -12058, -12039, -11867, -11861, -11847, -11831,
            -11798, -11781, -11604,
            -11589, -11536, -11358, -11340, -11339, -11324, -11303, -11097, -11077, -11067, -11055, -11052, -11045,
            -11041, -11038, -11024,
            -11020, -11019, -11018, -11014, -10838, -10832, -10815, -10800, -10790, -10780, -10764, -10587, -10544,
            -10533, -10519, -10331,
            -10329, -10328, -10322, -10315, -10309, -10307, -10296, -10281, -10274, -10270, -10262, -10260, -10256,
            -10254
        };

        private static readonly string[] Pystr =
        {
            "a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao",
            "bie", "bin", "bing", "bo", "bu", "ca", "cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan",
            "chang", "chao", "che", "chen",
            "cheng", "chi", "chong", "chou", "chu", "chuai", "chuan", "chuang", "chui", "chun", "chuo", "ci", "cong",
            "cou", "cu", "cuan", "cui",
            "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "diu",
            "dong", "dou", "du", "duan",
            "dui", "dun", "duo", "e", "en", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu", "ga",
            "gai", "gan", "gang", "gao",
            "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha",
            "hai", "han", "hang",
            "hao", "he", "hei", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo",
            "ji", "jia", "jian",
            "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan", "jue", "jun", "ka", "kai", "kan",
            "kang", "kao", "ke", "ken",
            "keng", "kong", "kou", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang",
            "lao", "le", "lei",
            "leng", "li", "lia", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan",
            "lue", "lun", "luo",
            "ma", "mai", "man", "mang", "mao", "me", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming",
            "miu", "mo", "mou", "mu",
            "na", "nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ni", "nian", "niang", "niao", "nie", "nin",
            "ning", "niu", "nong",
            "nu", "nv", "nuan", "nue", "nuo", "o", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng", "pi",
            "pian", "piao", "pie",
            "pin", "ping", "po", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu",
            "quan", "que", "qun",
            "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou", "ru", "ruan", "rui", "run", "ruo", "sa",
            "sai", "san", "sang",
            "sao", "se", "sen", "seng", "sha", "shai", "shan", "shang", "shao", "she", "shen", "sheng", "shi", "shou",
            "shu", "shua",
            "shuai", "shuan", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo",
            "ta", "tai",
            "tan", "tang", "tao", "te", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui",
            "tun", "tuo",
            "wa", "wai", "wan", "wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie",
            "xin", "xing",
            "xiong", "xiu", "xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yo",
            "yong", "you",
            "yu", "yuan", "yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zha", "zhai",
            "zhan", "zhang",
            "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui",
            "zhun", "zhuo",
            "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"
        };

        public static string ToPinYin(string chrstr)
        {
            var returnstr = string.Empty;
            var nowchar = chrstr.ToCharArray();
            foreach (var t in nowchar)
            {
                var array = Encoding.Default.GetBytes(t.ToString());
                int i1 = array[0];
                int i2 = array[1];
                var chrasc = i1 * 256 + i2 - 65536;
                if (chrasc > 0 && chrasc < 160)
                {
                    returnstr += t;
                }
                else
                {
                    for (var i = (Pyvalue.Length - 1); i >= 0; i--)
                    {
                        if (Pyvalue[i] <= chrasc)
                        {
                            returnstr += Pystr[i];
                            break;
                        }
                    }
                }
            }
            return returnstr;
        }

        #endregion
        #region Base64编码解码
        public static string Base64Encode(string unencodedText)
        {
            try
            {
                var encodedBytes = Encoding.UTF8.GetBytes(unencodedText);
                return Convert.ToBase64String(encodedBytes);
            }
            catch
            {
                // ignored
            }

            return string.Empty;
        }

        public static string Base64Decode(string str)
        {
            try
            {
                var buff = Convert.FromBase64String(str);
                return Encoding.UTF8.GetString(buff);
            }
            catch
            {
                // ignored
            }

            return string.Empty;
        }
        #endregion



        /// <summary>
        /// 菜单的tabid
        /// </summary>
        /// <param name="menuUrl"></param>
        /// <returns></returns>
        public static string GetMenuTabId(String menuUrl)
        {
            if (menuUrl == "#")
            {
                return menuUrl;
            }
            string tabId = menuUrl.Replace("/", "_");
            if (tabId.IndexOf("_") == 0)
            {
                tabId = tabId.Substring(1);
            }
            return tabId;
        }
    }
}
