
using Atlass.Framework.Cache;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using VTemplate.Engine;

namespace Atlass.TemplateExt
{
    /// <summary>
    /// DataReader标签.如:&lt;vt:channels var="members" connection="sitedb"  commandtext="select * from [member]"&gt;...&lt;/vt:foreach&gt;
    /// </summary>
    public class ChannelsTag : Tag
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal ChannelsTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
            this.Parameters = new ElementCollection<IExpression>();
        }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "channels"; }
        }

        /// <summary>
        /// 返回此标签是否是单一标签.即是不需要配对的结束标签
        /// </summary>
        public override bool IsSingleTag
        {
            get { return false; }
        }
        #endregion

        #region 属性定义
        /// <summary>
        /// 栏目索引
        /// </summary>
        /// <remarks></remarks>
        public Attribute ChannelIndex
        {
            get
            {
                return this.Attributes["channelIndex"];
            }
        }

        /// <summary>
        /// 从第几条信息开始显示，默认从1开始
        /// </summary>
        public Attribute StartNum
        {
            get
            {
                return this.Attributes["startNum"];
            }
        }
        /// <summary>
        /// 显示信息总数 默认20条
        /// </summary>
        public Attribute TotalNum
        {
            get
            {
                return this.Attributes["totalNum"];
            }
        }
        /// <summary>
        /// "default" 默认排序，即栏目管理界面中的排序。此值是默认的，如果没有指定属性的话。
        ///"publishDate" 按发布时间排序。
        ///"publishDateBack" 按发布时间的相反方向排序。
        ///"hits" 按点击量排序。
        /// </summary>
        public Attribute Order
        {
            get
            {
                return this.Attributes["order"];
            }
        }

        /// <summary>
        /// 数据查询参数的格式.默认为"@p{0}",其中"{0}"是占位符,表示各参数的索引数字.
        /// </summary>
        public Attribute ParameterFormat
        {
            get
            {
                return this.Attributes["ParameterFormat"];
            }
        }

        /// <summary>
        /// 要获取的行号.从0开始计算
        /// </summary>
        public Attribute RowIndex
        {
            get
            {
                return this.Attributes["RowIndex"];
            }
        }

        /// <summary>
        /// 存储表达式结果的变量
        /// </summary>
        public VariableIdentity Variable { get; protected set; }

        /// <summary>
        /// 查询命令中使用的变量参数列表,各参数在查询命令语句中则用参数名代替.如"@p0","@p1"之类的参数名
        /// </summary>
        public virtual ElementCollection<IExpression> Parameters { get; protected set; }
        #endregion

        #region 添加标签属性时的触发函数.用于设置自身的某些属性值
        /// <summary>
        /// 添加标签属性时的触发函数.用于设置自身的某些属性值
        /// </summary>
        /// <param name="name"></param>
        /// <param name="item"></param>
        public override void OnAddingAttribute(string name, Attribute item)
        {
            switch (name)
            {
                case "var":
                    this.Variable = ParserHelper.CreateVariableIdentity(this.OwnerTemplate, item.Text);
                    break;
                case "parameters":
                    IExpression exp = item.Value;
                    if (this.OwnerDocument.DocumentConfig.CompatibleMode)
                    {
                        if (!(exp is VariableExpression))
                            exp = ParserHelper.CreateVariableExpression(this.OwnerTemplate, item.Text, false);
                    }
                    this.Parameters.Add(exp);
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
        public override bool ProcessBeginTag(Template ownerTemplate, Tag container, Stack<Tag> tagStack, string text, ref Match match, bool isClosedTag)
        {
            if (this.Variable == null) throw new ParserException(string.Format("{0}标签中缺少var属性", this.TagName));
            if (this.StartNum == null) throw new ParserException(string.Format("{0}标签中缺少StartNum属性", this.TagName));
            if (this.TotalNum == null) throw new ParserException(string.Format("{0}标签中缺少TotalNum属性", this.TagName));

            return base.ProcessBeginTag(ownerTemplate, container, tagStack, text, ref match, isClosedTag);
        }
        #endregion

        #region 克隆当前元素到新的宿主模板
        /// <summary>
        /// 克隆当前元素到新的宿主模板
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <returns></returns>
        public override Element Clone(Template ownerTemplate)
        {
            ChannelsTag tag = new ChannelsTag(ownerTemplate);
            this.CopyTo(tag);
            tag.Variable = this.Variable == null ? null : this.Variable.Clone(ownerTemplate);
            foreach (IExpression exp in this.Parameters)
            {
                tag.Parameters.Add(exp.Clone(ownerTemplate));
            }
            return tag;
        }
        #endregion

        #region 呈现本元素的数据
        /// <summary>
        /// 呈现本元素的数据
        /// </summary>
        /// <param name="writer"></param>
        public override void RenderTagData(System.IO.TextWriter writer)
        {
            this.Variable.Value = GetDataSource();
            base.RenderTagData(writer);
        }
        #endregion

        #region 获取数据源
        /// <summary>
        /// 获取数据源
        /// "default" 默认排序，即栏目管理界面中的排序。此值是默认的，如果没有指定属性的话。
        ///"publishDate" 按发布时间排序。
        ///"publishDateBack" 按发布时间的相反方向排序。
        ///"hits" 按点击量排序。
        /// </summary>
        /// <returns></returns>
        protected virtual object GetDataSource()
        {
            //var sqlDb = DbInstanceFactory.GetInstance();
            var channel = ChannelManagerCache.GetChannelByIndex(ChannelIndex.GetTextValue());
            if (channel == null)
            {
                return null;
            }
            var channelList = ChannelManagerCache.GetChannelList();

            return channelList;
        }
        #endregion
    }

}
