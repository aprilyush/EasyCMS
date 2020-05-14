/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  Utility
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;
using System.Web;
using System.Text.RegularExpressions;
using System.ComponentModel;
using System.Collections;
using System.Drawing;
using System.Reflection;
using System.Collections.Specialized;
using System.Data;
using System.Data.Common;

namespace VTemplate.Engine
{
    /// <summary>
    /// 实用类
    /// </summary>
    internal static class Utility
    {
        /// <summary>
        /// 
        /// </summary>
        static Utility()
        {
            RenderInstanceCache = new Dictionary<string, object>(StringComparer.InvariantCultureIgnoreCase);
            DbFactoriesCache = new Dictionary<string, DbProviderFactory>(StringComparer.InvariantCultureIgnoreCase);
            TypeCache = new Dictionary<string, Type>(StringComparer.InvariantCultureIgnoreCase);
        }

        #region 数据判断函数块
        /// <summary>
        /// 判断是否是空数据(null或DBNull)
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static bool IsNothing(object value)
        {
            return value == null || value == DBNull.Value;
        }
        /// <summary>
        /// 判断是否是整数
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static bool IsInteger(string value)
        {
            if (string.IsNullOrEmpty(value)) return false;
            if (value.StartsWith("00")) return false;  //00开头不认为是整数
            if (value[0] != '-' && !char.IsDigit(value[0])) return false;

            int i;
            return int.TryParse(value, out i);
        }
        /// <summary>
        /// 转移为某种类型
        /// </summary>
        /// <param name="value"></param>
        /// <param name="conversionType"></param>
        /// <returns></returns>
        internal static object ChangeType(object value, Type conversionType)
        {
            try
            {
                return Convert.ChangeType(value, conversionType);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 比较两个值
        /// </summary>
        /// <param name="value1"></param>
        /// <param name="value2"></param>
        /// <param name="success"></param>
        /// <returns></returns>
        internal static int CompareTo(object value1, object value2, out bool success)
        {
            Type type1 = value1.GetType();
            Type type2 = value2.GetType();
            bool isSystemType1 = Type.GetTypeCode(type1) != TypeCode.Object;
            bool isSystemType2 = Type.GetTypeCode(type2) != TypeCode.Object;

            success = false;
            if (isSystemType1)
            {
                //如果value1是基础类型.但两者类型不相同.则将value2转为value1类型
                if (type1 != type2)
                {                    
                    if (type1.IsEnum)
                    {
                        //枚举值.则特殊转换
                        value2 = Utility.ConvertTo(value2.ToString(), type1);
                    }
                    else
                    {
                        if (value2 is IConvertible)
                        {
                            value2 = Utility.ChangeType(value2, type1);
                        }
                        else
                        {
                            value2 = null;
                        }
                    }
                }
            }
            else if (isSystemType2)
            {
                //如果value2是基础类型.但两者类型不相同.则将value1转为value2类型
                if (type1 != type2)
                {
                    if (type2.IsEnum)
                    {
                        //枚举值.则特殊转换
                        value1 = Utility.ConvertTo(value1.ToString(), type2);
                    }
                    else
                    {
                        if (value1 is IConvertible)
                        {
                            value1 = Utility.ChangeType(value1, type2);
                        }
                        else
                        {
                            value1 = null;
                        }
                    }
                }
            }

            if (value1 != null && value1 is IComparable)
            {
                success = true;
                return ((IComparable)value1).CompareTo(value2);
            }
            else if (value2 != null && value2 is IComparable)
            {
                success = true;
                //value2 与 value1相比较.所以结果为相反
                return 0 - ((IComparable)value2).CompareTo(value1);
            }
            return 1;
        }
        #endregion

        #region 数据格式化函数块
        /// <summary>
        /// XML编码
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static string XmlEncode(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                using (StringWriter stringWriter = new StringWriter())
                {
                    using (XmlTextWriter xmlWriter = new XmlTextWriter(stringWriter))
                    {
                        xmlWriter.WriteString(value);
                        xmlWriter.Flush();
                        value = stringWriter.ToString();
                    }
                }
            }
            return value;
        }

        /// <summary>
        /// 文本编码
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static string TextEncode(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                value = HttpUtility.HtmlEncode(value);
                //两个的空格或制表符则转换
                value = Regex.Replace(value, "  |\t", "&nbsp;&nbsp;");
                value = Regex.Replace(value, "\r\n|\r|\n", "<br />");
            }
            return value;
        }

        /// <summary>
        /// JS脚本编码
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static string JsEncode(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                value = value.Replace("\\", "\\\\");
                value = value.Replace("\"", "\\\"");
                value = value.Replace("\'", "\\'");
                value = value.Replace("\r", "\\r");
                value = value.Replace("\n", "\\n");
            }
            return value;
        }

        /// <summary>
        /// 压缩文本
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static string CompressText(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                value = Regex.Replace(value, @"[ \t]*\r?\n[ \t]*", "");
            }
            return value;
        }
        /// <summary>
        /// 删除HTML代码
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static string RemoveHtmlCode(string value)
        {
            if (string.IsNullOrEmpty(value)) return string.Empty;

            value = Regex.Replace(value, "<script[^>]*>.*?</script>|<style[^>]*>.*?</style>|<!--.*?-->", "", RegexOptions.Singleline | RegexOptions.IgnoreCase);

            return Regex.Replace(value, @"</?\s*[\w:\-]+(\s*[\w:\-]+\s*(=\s*""[^""]*""|=\s*'[^']*'|=\s*[^\s=>]*))*\s*/?>", "").Trim();
        }
        #endregion

        #region 数据转换函数块
        /// <summary>
        /// 将某个集合数据拆分为一组一组数据
        /// 例如: int[] datas = [1,2,3,4,5,6]; 当SplitToGroup(datas, 2)拆分后,将会拆分为类似以下的集合"[1,2],[3,4],[5,6]"
        /// </summary>
        /// <param name="list"></param>
        /// <param name="groupSize"></param>
        /// <returns></returns>
        internal static IEnumerator SplitToGroup(IEnumerator list, int groupSize)
        {
            List<ArrayList> groupList = new List<ArrayList>();
            while (true)
            {
                ArrayList groupItems = new ArrayList();
                for (int i = 0; i < groupSize; i++)
                {
                    if (list.MoveNext())
                    {
                        groupItems.Add(list.Current);
                    }
                    else
                    {
                        break;
                    }
                }
                if (groupItems.Count > 0)
                {
                    groupList.Add(groupItems);
                }
                else
                {
                    break;
                }
            }
            if (groupList.Count > 0)
            {
                return groupList.GetEnumerator();
            }
            else
            {
                return list;
            }
        }
        /// <summary>
        /// 转换字符串为布尔值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static bool ConverToBoolean(string value)
        {
            if (value == "1" || string.Equals(value, Boolean.TrueString, StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 转换字符串为整型值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static int ConverToInt32(string value)
        {
            int v;
            if (!int.TryParse(value, out v))
            {
                v = 0;
            }
            return v;
        }

        /// <summary>
        /// 转换字符串为数值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static decimal ConverToDecimal(object value)
        {
            if (value == null || value == DBNull.Value) return 0M;
            decimal v;
            try
            {
                v = Convert.ToDecimal(value);
            }
            catch
            {
                v = 0M;
            }
            return v;
        }

        /// <summary>
        /// 截取字符
        /// </summary>
        /// <param name="value">要截取的字符串</param>
        /// <param name="maxLength">最大大小</param>
        /// <param name="charset">采用的编码</param>
        /// <param name="appendText">附加字符</param>
        /// <returns></returns>
        internal static string CutString(string value, int maxLength, Encoding charset, string appendText)
        {
            StringBuilder buffer = new StringBuilder(maxLength);
            int length = 0;
            int index = 0;
            while (index < value.Length)
            {
                char c = value[index];
                length += charset.GetByteCount(new char[] { c });
                if (length <= maxLength)
                {
                    buffer.Append(c);
                }
                else
                {
                    break;
                }
                index++;
            }
            if (index < value.Length && !string.IsNullOrEmpty(appendText)) buffer.Append(appendText);
            return buffer.ToString();
        }

        /// <summary>
        /// 从字符集名称获取编码器
        /// </summary>
        /// <param name="charset"></param>
        /// <param name="defaultCharset"></param>
        /// <returns></returns>
        internal static Encoding GetEncodingFromCharset(string charset, Encoding defaultCharset)
        {
            Encoding e = defaultCharset;
            try
            {
                e = Encoding.GetEncoding(charset);
            }
            catch
            {
                e = defaultCharset;
            }
            return e;
        }

        /// <summary>
        /// 转换为某种数据类型
        /// </summary>
        /// <param name="value">要转换的字符串</param>
        /// <param name="type">最终的数据类型</param>
        /// <returns>如果转换失败返回null</returns>
        internal static object ConvertTo(string value, Type type)
        {
            object result = value;
            if (value != null)
            {
                try
                {
                    if (type.IsEnum)
                    {
                        //枚举类型
                        result = Enum.Parse(type, value, true);
                    }
                    else if (Type.GetTypeCode(type) == TypeCode.DateTime)
                    {
                        //日期型
                        result = DateTime.Parse(value);
                    }
                    else
                    {
                        //其它值
                        result = (value as IConvertible).ToType(type, null);
                    }
                }
                catch
                {
                    result = null;
                }
            }
            return result;
        }

        /// <summary>
        /// 获取条件的比较类型
        /// </summary>
        /// <param name="compareType"></param>
        /// <returns></returns>
        internal static IfConditionCompareType GetIfConditionCompareType(string compareType)
        {
            IfConditionCompareType icct = IfConditionCompareType.Equal;
            if (!string.IsNullOrEmpty(compareType))
            {
                switch (compareType.Trim())
                {
                    case ">":
                        icct = IfConditionCompareType.GT;
                        break;
                    case ">=":
                        icct = IfConditionCompareType.GTAndEqual;
                        break;
                    case "<":
                        icct = IfConditionCompareType.LT;
                        break;
                    case "<=":
                        icct = IfConditionCompareType.LTAndEqual;
                        break;
                    case "<>":
                    case "!=":
                        icct = IfConditionCompareType.UnEqual;
                        break;
                    case "^=":
                        icct = IfConditionCompareType.StartWith;
                        break;
                    case "$=":
                        icct = IfConditionCompareType.EndWith;
                        break;
                    case "*=":
                        icct = IfConditionCompareType.Contains;
                        break;
                    default:
                        icct = IfConditionCompareType.Equal;
                        break;
                }
            }
            return icct;
        }
        #endregion

        #region 数据源处理函数块
        /// <summary>
        /// 获取某个对象对应的DbType
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static DbType GetObjectDbType(object value)
        {
            if (value == null) return DbType.Object;
            switch (Type.GetTypeCode(value is Type ? (Type)value : value.GetType()))
            {
                case TypeCode.Boolean:
                    return DbType.Boolean;
                case TypeCode.Byte:
                    return DbType.Byte;
                case TypeCode.Char:
                case TypeCode.String:
                    return DbType.String;
                case TypeCode.DateTime:
                    return DbType.DateTime;
                case TypeCode.Decimal:
                    return DbType.Decimal;
                case TypeCode.Double:
                    return DbType.Double;
                case TypeCode.Int16:
                    return DbType.Int16;
                case TypeCode.Int32:
                    return DbType.Int32;
                case TypeCode.Int64:
                    return DbType.Int64;
                case TypeCode.SByte:
                    return DbType.SByte;
                case TypeCode.Single:
                    return DbType.Single;
                case TypeCode.UInt16:
                    return DbType.UInt16;
                case TypeCode.UInt32:
                    return DbType.UInt32;
                case TypeCode.UInt64:
                    return DbType.UInt64;
                default:
                    return DbType.Object;
            }
        }
        /// <summary>
        /// 获取某个属性的值
        /// </summary>
        /// <param name="container">数据源</param>
        /// <param name="propName">属性名</param>
        /// <param name="exist">是否存在此属性</param>
        /// <returns>属性值</returns>
        internal static object GetPropertyValue(object container, string propName, out bool exist)
        {
            exist = false;
            object value = null;
            if (container == null)
            {
                throw new ArgumentNullException("container");
            }
            if (string.IsNullOrEmpty(propName))
            {
                throw new ArgumentNullException("propName");
            }
            if (Utility.IsInteger(propName))
            {
                #region 索引值部分
                //属性名只为数字.则取数组索引
                int index = Utility.ConverToInt32(propName);
                if (container is IList)
                {
                    IList iList = (IList)container;
                    if (iList.Count > index)
                    {
                        exist = true;
                        value = iList[index];
                    }
                }
                else if (container is ICollection)
                {
                    ICollection ic = (ICollection)container;
                    if (ic.Count > index)
                    {
                        exist = true;
                        IEnumerator ie = ic.GetEnumerator();
                        int i = 0;
                        while (i++ <= index) { ie.MoveNext(); }
                        value = ie.Current;
                    }
                }
                else
                {
                    //判断是否含有索引属性
                    PropertyInfo item = container.GetType().GetProperty("Item", new Type[] { typeof(int) });
                    if (item != null)
                    {
                        try
                        {
                            value = item.GetValue(container, new object[] { index });
                            exist = true;
                        }
                        catch
                        {
                            exist = false;
                        }
                    }
                }
                #endregion
            }
            else
            {
                #region 字段/属性/键值
                //容器是类型.则查找静态属性或字段
                Type type = container is Type ? (Type)container : container.GetType();
                BindingFlags flags = BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.IgnoreCase;
                if (!(container is Type)) flags |= BindingFlags.Instance;

                //查找字段
                FieldInfo field = type.GetField(propName, flags);
                if (field != null)
                {
                    exist = true;
                    value = field.GetValue(container);
                }
                else
                {
                    //查找属性
                    PropertyInfo property = type.GetProperty(propName, flags, null, null, Type.EmptyTypes, new ParameterModifier[0]);
                    if (property != null)
                    {
                        exist = true;
                        value = property.GetValue(container, null);
                    }
                    else if (container is ICustomTypeDescriptor)
                    {
                        //已实现ICustomTypeDescriptor接口
                        ICustomTypeDescriptor ictd = (ICustomTypeDescriptor)container;
                        PropertyDescriptor descriptor = ictd.GetProperties().Find(propName, true);
                        if (descriptor != null)
                        {
                            exist = true;
                            value = descriptor.GetValue(container);
                        }
                    }
                    else if (container is IDictionary)
                    {
                        //是IDictionary集合
                        IDictionary idic = (IDictionary)container;
                        if (idic.Contains(propName))
                        {
                            exist = true;
                            value = idic[propName];
                        }
                    }
                    else if (container is NameObjectCollectionBase)
                    {
                        //是NameObjectCollectionBase派生对象
                        NameObjectCollectionBase nob = (NameObjectCollectionBase)container;

                        //调用私有方法
                        MethodInfo method = nob.GetType().GetMethod("BaseGet", BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance, null, new Type[] { typeof(string) }, new ParameterModifier[] { new ParameterModifier(1) });
                        if (method != null)
                        {
                            value = method.Invoke(container, new object[] { propName });
                            exist = value != null;
                        }
                    }
                    else
                    {
                        //判断是否含有索引属性
                        PropertyInfo item = type.GetProperty("Item", new Type[] { typeof(string) });
                        if (item != null)
                        {
                            try
                            {
                                value = item.GetValue(container, new object[] { propName });
                                exist = true;
                            }
                            catch
                            {
                                exist = false;
                            }
                        }
                    }
                }
                #endregion
            }
            return value;
        }
        /// <summary>
        /// 获取方法的结果值
        /// </summary>
        /// <param name="container"></param>
        /// <param name="methodName"></param>
        /// <param name="exist"></param>
        /// <returns></returns>
        internal static object GetMethodResult(object container, string methodName, out bool exist)
        {
            exist = false;
            Type type = (container is Type ? (Type)container : container.GetType());
            MethodInfo method = type.GetMethod(methodName, BindingFlags.Static | BindingFlags.Instance |
                                                           BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.IgnoreCase,
                                                                          null, Type.EmptyTypes, new ParameterModifier[0]);
            object result = null;
            if (method != null)
            {
                exist = true;
                return method.Invoke(method.IsStatic ? null : container, null);
            }
            return result;
        }

        /// <summary>
        /// 返回数据源的枚举数
        /// </summary>
        /// <param name="dataSource">要处理的数据源</param>
        /// <returns>如果非IListSource与IEnumerable实例则返回null</returns>
        internal static IEnumerable GetResolvedDataSource(object dataSource)
        {
            if (dataSource != null)
            {
                if (dataSource is IListSource)
                {
                    IListSource source = (IListSource)dataSource;
                    IList list = source.GetList();
                    if (!source.ContainsListCollection)
                    {
                        return list;
                    }
                    if ((list != null) && (list is ITypedList))
                    {
                        PropertyDescriptorCollection itemProperties = ((ITypedList)list).GetItemProperties(new PropertyDescriptor[0]);
                        if ((itemProperties == null) || (itemProperties.Count == 0))
                        {
                            return null;
                        }
                        PropertyDescriptor descriptor = itemProperties[0];
                        if (descriptor != null)
                        {
                            object component = list[0];
                            object value = descriptor.GetValue(component);
                            if ((value != null) && (value is IEnumerable))
                            {
                                return (IEnumerable)value;
                            }
                        }
                        return null;
                    }
                }
                if (dataSource is IEnumerable)
                {
                    return (IEnumerable)dataSource;
                }
            }
            return null;
        }
        #endregion

        #region 模板引擎相关辅助函数块
        /// <summary>
        /// 修正文件地址
        /// </summary>
        /// <param name="tag"></param>
        /// <param name="fileName"></param>
        /// <returns></returns>
        internal static string ResolveFilePath(Tag tag, string fileName)
        {
            if (!string.IsNullOrEmpty(fileName) && fileName.IndexOf(":") == -1 && !fileName.StartsWith("\\\\"))
            {
                string referPath = string.Empty;
                while (string.IsNullOrEmpty(referPath) && tag != null)
                {
                    if (tag is Template)
                    {
                        referPath = ((Template)tag).File;
                    }
                    else if (tag is IncludeTag)
                    {
                        referPath = ((IncludeTag)tag).File;
                    }
                    tag = tag.Parent;
                }
                if (!string.IsNullOrEmpty(referPath))
                {
                    fileName = Path.Combine(Path.GetDirectoryName(referPath), fileName);
                }
                fileName = Path.GetFullPath(fileName);
            }
            return fileName;
        }
        /// <summary>
        /// 统计行号与列号(x = 列号, y = 行号)
        /// </summary>
        /// <param name="text"></param>
        /// <param name="offset"></param>
        /// <returns></returns>
        internal static Point GetLineAndColumnNumber(string text, int offset)
        {
            int line, column, p;
            line = column = 1;
            p = 0;
            while (p < offset && p < text.Length)
            {
                char c = text[p];
                if (c == '\r' || c == '\n')
                {
                    if (c == '\r' && p < (text.Length - 1))
                    {
                        //\r\n字符
                        if (text[p + 1] == '\n') p++;
                    }
                    line++;
                    column = 1;
                }
                else
                {
                    column++;
                }
                p++;
            }
            return new Point(column, line);
        }
        /// <summary>
        /// 从模板中获取某个变量.如果不存在此变量则添加新的变量
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <param name="varName"></param>
        /// <returns></returns>
        internal static Variable GetVariableOrAddNew(Template ownerTemplate, string varName)
        {
            Variable var = ownerTemplate.Variables[varName];
            if (var == null)
            {
                var = new Variable(ownerTemplate, varName);
                ownerTemplate.Variables.Add(var);
            }
            return var;
        }

        /// <summary>
        /// 根据前缀获取变量的模板所有者
        /// </summary>
        /// <param name="template"></param>
        /// <param name="prefix"></param>
        /// <returns>如果prefix值为null则返回template的根模板.如果为空值.则为template.如果为#则返回template的父模板.否则返回对应Id的模板</returns>
        internal static Template GetOwnerTemplateByPrefix(Template template, string prefix)
        {
            if (prefix == string.Empty) return template;               //前缀为空.则返回当前模板
            if (prefix == "#") return template.OwnerTemplate ?? template;   //前缀为#.则返回父模板(如果父模板不存在则返回当前模板)

            //取得根模板
            while (template.OwnerTemplate != null) template = template.OwnerTemplate;

            //如果没有前缀.则返回根模板.否则返回对应Id的模板
            return prefix == null ? template : template.GetChildTemplateById(prefix);
        }
        #endregion

        #region 模板数据解析相关辅助函数块
        /// <summary>
        /// 类型的缓存
        /// </summary>
        private static Dictionary<string, Type> TypeCache;
        /// <summary>
        /// 建立某个类型
        /// </summary>
        /// <param name="typeName"></param>
        /// <returns></returns>
        internal static Type CreateType(string typeName)
        {
            return CreateType(typeName, null);
        }
        /// <summary>
        /// 建立某个类型
        /// </summary>
        /// <param name="typeName">类型名称</param>
        /// <param name="assembly">程序集.如果为空.则表示当前程序域里的所有程序集</param>
        /// <returns></returns>
        internal static Type CreateType(string typeName, string assembly)
        {
            if (string.IsNullOrEmpty(typeName)) return null;

            Type type = null;
            bool flag = false;
            string cacheKey = string.Concat(typeName, ",", assembly);

            lock (TypeCache)
            {
                flag = TypeCache.TryGetValue(cacheKey, out type);
            }
            if (!flag)
            {
                if (string.IsNullOrEmpty(assembly))
                {
                    //从当前程序域里建立类型
                    type = Type.GetType(typeName, false, true);
                    if (type == null)
                    {
                        //搜索当前程序域里的所有程序集
                        Assembly[] assemblies = AppDomain.CurrentDomain.GetAssemblies();
                        foreach (Assembly asm in assemblies)
                        {
                            type = asm.GetType(typeName, false, true);
                            if (type != null) break;
                        }
                    }
                }
                else
                {
                    //从某个程序集里建立类型
                    Assembly asm;
                    if (assembly.IndexOf(":") != -1)
                    {
                        asm = Assembly.LoadFrom(assembly);
                    }
                    else
                    {
                        asm = Assembly.Load(assembly);
                    }
                    if (asm != null)
                    {
                        type = asm.GetType(typeName, false, true);
                    }
                }
                //缓存
                lock (TypeCache)
                {
                    if (!TypeCache.ContainsKey(cacheKey))
                    {
                        TypeCache.Add(cacheKey, type);
                    }
                }
            }
            return type;
        }
        /// <summary>
        /// 存储模板解析器实例的缓存
        /// </summary>
        private static Dictionary<string, object> RenderInstanceCache;
        /// <summary>
        /// 获取解析器的实例
        /// </summary>
        /// <param name="renderInstance"></param>
        /// <returns></returns>
        private static object GetRenderInstance(string renderInstance)
        {
            if (string.IsNullOrEmpty(renderInstance)) return null;

            string[] k = renderInstance.Split(new char[] { ',' }, 2);
            if (k.Length != 2) return null;

            string assemblyKey = k[1].Trim();
            string typeKey = k[0].Trim();
            string cacheKey = string.Concat(typeKey, ",", assemblyKey);

            //从缓存读取
            object render;
            bool flag = false;
            lock (RenderInstanceCache)
            {
                flag = RenderInstanceCache.TryGetValue(cacheKey, out render);
            }
            if (!flag || render == null)
            {
                //重新生成实例
                render = null;
                //生成实例
                Assembly assembly;
                if (assemblyKey.IndexOf(":") != -1)
                {
                    assembly = Assembly.LoadFrom(assemblyKey);
                }
                else
                {
                    assembly = Assembly.Load(assemblyKey);
                }
                if (assembly != null)
                {
                    render = assembly.CreateInstance(typeKey, false);
                }
                if (render != null)
                {
                    //缓存
                    lock (RenderInstanceCache)
                    {
                        if (RenderInstanceCache.ContainsKey(cacheKey))
                        {
                            RenderInstanceCache[cacheKey] = render;
                        }
                        else
                        {
                            RenderInstanceCache.Add(cacheKey, render);
                        }
                    }
                }
            }
            return render;
        }

        /// <summary>
        /// 预解析模板数据
        /// </summary>
        /// <param name="renderInstance">模板解析器实例的配置</param>
        /// <param name="template">要解析处理的模板</param>
        internal static void PreRenderTemplate(string renderInstance, Template template)
        {
            ITemplateRender render = GetRenderInstance(renderInstance) as ITemplateRender;
            if (render != null) render.PreRender(template);
        }
        /// <summary>
        /// 使用特性方法预解析模板数据
        /// </summary>
        /// <param name="renderInstance"></param>
        /// <param name="renderMethod"></param>
        /// <param name="template"></param>
        internal static void PreRenderTemplateByAttributeMethod(string renderInstance, string renderMethod, Template template)
        {
            object render = GetRenderInstance(renderInstance);
            if (render != null)
            {
                //取得特性方法
                MethodInfo method = null;

                MethodInfo[] methods = render.GetType().GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
                foreach (MethodInfo m in methods)
                {
                    TemplateRenderMethodAttribute att = System.Attribute.GetCustomAttribute(m, typeof(TemplateRenderMethodAttribute)) as TemplateRenderMethodAttribute;
                    if (att != null)
                    {
                        if (renderMethod.Equals(m.Name, StringComparison.InvariantCultureIgnoreCase))
                        {
                            method = m;
                            break;
                        }
                    }
                }

                if (method != null)
                {
                    ParameterInfo[] pars = method.GetParameters();
                    if (pars.Length == 1 && pars[0].ParameterType == typeof(Template))
                    {
                        method.Invoke(method.IsStatic ? null : render, new object[] { template });
                    }
                }
            }
        }


        /// <summary>
        /// 数据驱动工厂实例的缓存
        /// </summary>
        private static Dictionary<string, DbProviderFactory> DbFactoriesCache;

        /// <summary>
        /// 建立数据驱动工厂
        /// </summary>
        /// <param name="providerName"></param>
        internal static DbProviderFactory CreateDbProviderFactory(string providerName)
        {
            if(string.IsNullOrEmpty(providerName)) return null;

            //从缓存读取
            DbProviderFactory factory;
            bool flag = false;
            lock (DbFactoriesCache)
            {
                flag = DbFactoriesCache.TryGetValue(providerName, out factory);
            }
            if (!flag || factory == null)
            {
                factory = DbProviderFactories.GetFactory(providerName);
                //缓存
                if (factory != null)
                {
                    lock (DbFactoriesCache)
                    {
                        if (DbFactoriesCache.ContainsKey(providerName))
                        {
                            DbFactoriesCache[providerName] = factory;
                        }
                        else
                        {
                            DbFactoriesCache.Add(providerName, factory);
                        }
                    }
                }
            }
            return factory;
        }
        #endregion
    }
}
