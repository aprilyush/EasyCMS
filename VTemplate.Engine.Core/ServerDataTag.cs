/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ServerDataTag
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using System.Configuration;

namespace VTemplate.Engine
{
    /// <summary>
    /// 服务器数据类型
    /// </summary>
    public enum ServerDataType
    {
        /// <summary>
        /// 未知
        /// </summary>
        Unknown,
        /// <summary>
        /// 服务器当前时间
        /// </summary>
        Time,
        /// <summary>
        /// 0~1之间的随机数
        /// </summary>
        Random,
        /// <summary>
        /// 服务器当前上下文的HttpApplicationState对象.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        Application,
        /// <summary>
        /// 服务器当前上下文的HttpSessionState对象.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        Session,
        /// <summary>
        /// 服务器当前上下文的缓存对象
        /// </summary>
        Cache,
        /// <summary>
        /// 服务器当前上下文的Request.QueryString数据集合.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        QueryString,
        /// <summary>
        /// 服务器当前上下文的Request.Form数据集合.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        Form,
        /// <summary>
        /// 服务器当前上下文的Request.Cookie数据集合.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        Cookie,
        /// <summary>
        /// 服务器当前上下文的Request.ServerVariables数据集合.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        ServerVariables,
        /// <summary>
        /// 服务器当前上下文的Request.Params数据集合.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        RequestParams,
        /// <summary>
        /// 服务器当前上下文的HttpRequest对象.如果模板引擎不在Web程序上使用则无效
        /// </summary>
        Request,
        /// <summary>
        /// 服务器系统平台
        /// </summary>
        Environment,
        /// <summary>
        /// 获取当前应用程序的AppSettings配置节点参数
        /// </summary>
        AppSetting
    }
    /// <summary>
    /// 服务器数据标签,.如: &lt;vt:serverdata var="request" type="request" /&gt;
    /// </summary>
    public class ServerDataTag : Tag
    {
        /// <summary>
        /// 随机种子数
        /// </summary>
        private static Random random;
        /// <summary>
        /// 
        /// </summary>
        static ServerDataTag()
        {
            random = new Random();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal ServerDataTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
        }


        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "serverdata"; }
        }

        /// <summary>
        /// 返回此标签是否是单一标签.即是不需要配对的结束标签
        /// </summary>
        internal override bool IsSingleTag
        {
            get { return false; }
        }
        #endregion

        #region 属性定义
        /// <summary>
        /// 数据类型.
        /// </summary>
        /// <remarks></remarks>
        public Attribute Type
        {
            get
            {
                return this.Attributes["Type"];
            }
        }

        /// <summary>
        /// 存储表达式结果的变量
        /// </summary>
        public VariableIdentity Variable { get; protected set; }

        /// <summary>
        /// 数据值
        /// </summary>
        public Attribute Item
        {
            get
            {
                return this.Attributes["Item"];
            }
        }

        /// <summary>
        /// 是否输出此标签的结果值
        /// </summary>
        public bool Output { get; protected set; }
        #endregion

        #region 添加标签属性时的触发函数.用于设置自身的某些属性值
        /// <summary>
        /// 添加标签属性时的触发函数.用于设置自身的某些属性值
        /// </summary>
        /// <param name="name"></param>
        /// <param name="item"></param>
        protected override void OnAddingAttribute(string name, Attribute item)
        {
            switch (name)
            {
                case "var":
                    this.Variable = ParserHelper.CreateVariableIdentity(this.OwnerTemplate, item.Text);
                    break;
                case "output":
                    this.Output = Utility.ConverToBoolean(item.Text);
                    break;
            }
        }
        #endregion

        #region 开始解析标签数据
        /// <summary>
        /// 开始解析标签数据
        /// </summary>
        /// <param name="ownerTemplate">宿主模板</param>
        /// <param name="container">标签的容器</param>
        /// <param name="tagStack">标签堆栈</param>
        /// <param name="text"></param>
        /// <param name="match"></param>
        /// <param name="isClosedTag">是否闭合标签</param>
        /// <returns>如果需要继续处理EndTag则返回true.否则请返回false</returns>
        internal override bool ProcessBeginTag(Template ownerTemplate, Tag container, Stack<Tag> tagStack, string text, ref Match match, bool isClosedTag)
        {
            if (this.Variable == null && !this.Output) throw new ParserException(string.Format("{0}标签中如果未定义Output属性为true则必须定义var属性", this.TagName));
            if (this.Type == null) throw new ParserException(string.Format("{0}标签中缺少type属性或type属性值未知", this.TagName));
            //if (this.Type != ServerDataType.Random 
            //    && this.Type != ServerDataType.Time
            //    && this.Type != ServerDataType.Request
            //    && this.Type != ServerDataType.Environment
            //    && this.Item == null) throw new ParserException(string.Format("当{0}标签type=\"{1}\"时必须设置item属性值", this.TagName, this.Type));
            
            return base.ProcessBeginTag(ownerTemplate, container, tagStack, text, ref match, isClosedTag);
        }
        #endregion

        #region 克隆当前元素到新的宿主模板
        /// <summary>
        /// 克隆当前元素到新的宿主模板
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <returns></returns>
        internal override Element Clone(Template ownerTemplate)
        {
            ServerDataTag tag = new ServerDataTag(ownerTemplate);
            this.CopyTo(tag);
            tag.Variable = this.Variable == null ? null : this.Variable.Clone(ownerTemplate);
            tag.Output = this.Output;
            return tag;
        }
        #endregion

        #region 呈现本元素的数据
        /// <summary>
        /// 呈现本元素的数据
        /// </summary>
        /// <param name="writer"></param>
        protected override void RenderTagData(System.IO.TextWriter writer)
        {
            object value = this.GetServerData();
            if (this.Variable != null) this.Variable.Value = value;

            if (this.Output && value != null) writer.Write(value);
            base.RenderTagData(writer);
        }
        #endregion

        #region 获取对应类型的数据
        /// <summary>
        /// 获取数据
        /// </summary>
        /// <returns></returns>
        private object GetServerData()
        {
            ServerDataType type = (ServerDataType)Utility.ConvertTo(this.Type.GetTextValue(), typeof(ServerDataType));
            switch (type)
            {
                case ServerDataType.Time:
                    return GetServerTime();
                case ServerDataType.Random:
                    return random.NextDouble();
                case ServerDataType.Application:
                    return GetApplicationItem();
                case ServerDataType.Session:
                    return GetSessionItem();
                case ServerDataType.Cache:
                    return GetCacheItem();
                case ServerDataType.QueryString:
                    return GetRequestQueryStringItem();
                case ServerDataType.Form:
                    return GetRequestFormItem();
                case ServerDataType.Cookie:
                    return GetCookieItem();
                case ServerDataType.ServerVariables:
                    return GetRequestServerVariablesItem();
                case ServerDataType.RequestParams:
                    return GetRequestParamsItem();
                case ServerDataType.Request:
                    return GetRequestItem();
                case ServerDataType.Environment:
                    return typeof(System.Environment);
                case ServerDataType.AppSetting:
                    return ConfigurationManager.AppSettings[this.Item.ToString()];
                default:
                    return null;
            }
        }
        /// <summary>
        /// 获取服务器时间
        /// </summary>
        /// <returns></returns>
        private DateTime GetServerTime()
        {
            DateTime time = DateTime.Now;
            string item = this.Item == null ? null : this.Item.GetTextValue();
            if (!string.IsNullOrEmpty(item))
            {
                switch (item.ToLower())
                {
                    case "today":
                        time = DateTime.Today;
                        break;
                    case "yesterday":
                        time = DateTime.Today.AddDays(-1);
                        break;
                    case "tomorrow":
                        time = DateTime.Today.AddDays(1);
                        break;
                }
            }
            return time;
        }

        /// <summary>
        /// 获取HttpApplicationState数据
        /// </summary>
        /// <returns></returns>
        private object GetApplicationItem()
        {
            object value = null;
            HttpContext context = HttpContext.Current;
            string item = this.Item == null ? null : this.Item.GetTextValue();
            if (!string.IsNullOrEmpty(item) && context != null && context.Application != null)
            {
                value = context.Application[item];
            }
            return value;
        }

        /// <summary>
        /// 获取HttpSessionState数据
        /// </summary>
        /// <returns></returns>
        private object GetSessionItem()
        {
            object value = null;
            HttpContext context = HttpContext.Current;
            string item = this.Item == null ? null : this.Item.GetTextValue();
            if (!string.IsNullOrEmpty(item) && context != null && context.Session != null)
            {
                value = context.Session[item];
            }
            return value;
        }

        /// <summary>
        /// 获取Cache数据
        /// </summary>
        /// <returns></returns>
        private object GetCacheItem()
        {
            object value = null;
            Cache cache = HttpRuntime.Cache;
            string item = this.Item == null ? null : this.Item.GetTextValue();
            if (!string.IsNullOrEmpty(item) && cache != null)
            {
                value = cache[item];
            }
            return value;
        }
        /// <summary>
        /// 获取Request.Form数据
        /// </summary>
        /// <returns></returns>
        private string GetNameValueCollectionItem(NameValueCollection items)
        {
            string value = null;
            string item = this.Item == null ? null : this.Item.GetTextValue();
            if (!string.IsNullOrEmpty(item))
            {
                value = items[item];
            }
            return value;
        }
        /// <summary>
        /// 获取Request.QueryString数据
        /// </summary>
        /// <returns></returns>
        private string GetRequestQueryStringItem()
        {
            string value = null;
            HttpContext context = HttpContext.Current;
            if (context != null && context.Request != null)
            {
                value = GetNameValueCollectionItem(context.Request.QueryString);
            }
            return value;
        }

        /// <summary>
        /// 获取Request.Form数据
        /// </summary>
        /// <returns></returns>
        private string GetRequestFormItem()
        {
            string value = null;
            HttpContext context = HttpContext.Current;
            if (context != null && context.Request != null)
            {
                value = GetNameValueCollectionItem(context.Request.Form);
            }
            return value;
        }
        /// <summary>
        /// 获取Request.ServerVariables数据
        /// </summary>
        /// <returns></returns>
        private string GetRequestServerVariablesItem()
        {
            string value = null;
            HttpContext context = HttpContext.Current;
            if (context != null && context.Request != null)
            {
                value = GetNameValueCollectionItem(context.Request.ServerVariables);
            }
            return value;
        }

        /// <summary>
        /// 获取Request.Cookie数据
        /// </summary>
        /// <returns></returns>
        private string GetCookieItem()
        {
            string value = null;
            HttpContext context = HttpContext.Current;
            string item = this.Item == null ? null : this.Item.GetTextValue();
            if (!string.IsNullOrEmpty(item) && context != null && context.Request != null)
            {
                string[] keys = item.Split(".".ToCharArray(), 2, StringSplitOptions.RemoveEmptyEntries);
                HttpCookie cookie = context.Request.Cookies[keys[0]];
                if (cookie != null)
                {
                    if (keys.Length > 1)
                    {
                        value = cookie[keys[1]];
                    }
                    else
                    {
                        value = cookie.Value;
                    }
                    if (!string.IsNullOrEmpty(value)) value = HttpUtility.UrlDecode(value, context.Request.ContentEncoding);
                }
            }
            return value;
        }
        /// <summary>
        /// 获取Request.Params数据
        /// </summary>
        /// <returns></returns>
        private string GetRequestParamsItem()
        {
            string value = null;
            HttpContext context = HttpContext.Current;
            if (context != null && context.Request != null)
            {
                value = GetNameValueCollectionItem(context.Request.Params);
            }
            return value;
        }
        /// <summary>
        /// 获取Request对象
        /// </summary>
        /// <returns></returns>
        private object GetRequestItem()
        {
            object value = null;
            HttpContext context = HttpContext.Current;
            if (context != null && context.Request != null)
            {
                value = context.Request;
            }
            return value;
        }
        #endregion
    }
}
