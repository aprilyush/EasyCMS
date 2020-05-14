/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ItemTag
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// 项标签.如: &lt;vt:item type="user" key="user1" /&gt;
    /// </summary>
    public class ItemTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal ItemTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
            this.Output = true;
            this.ExpArgs = new ElementCollection<IExpression>();
        }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "item"; }
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
        /// 参与表达式运算的变量参数列表
        /// </summary>
        public virtual ElementCollection<IExpression> ExpArgs { get; protected set; }
        /// <summary>
        /// 要获取项值的数据类型.
        /// </summary>
        /// <remarks>获取数据项的类型</remarks>
        public Attribute DataType
        {
            get
            {
                return this.Attributes["Type"];
            }
        }

        /// <summary>
        /// 要获取项值的数据名称.
        /// </summary>
        /// <remarks>获取数据项的名称</remarks>
        public Attribute DataKey
        {
            get
            {
                return this.Attributes["Key"];
            }
        }

        /// <summary>
        /// 存储表达式结果的变量
        /// </summary>
        public VariableIdentity Variable { get; protected set; }

        /// <summary>
        /// 是否输出此标签的结果值，默认是输出
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
                case "args":
                    IExpression exp = item.Value;
                    if (this.OwnerDocument.DocumentConfig.CompatibleMode)
                    {
                        if (!(exp is VariableExpression))
                            exp = ParserHelper.CreateVariableExpression(this.OwnerTemplate, item.Text, false);
                    }
                    this.ExpArgs.Add(exp);
                    break;
                case "var":
                    this.Variable = ParserHelper.CreateVariableIdentity(this.OwnerTemplate, item.Text);
                    break;
                case "output":
                    this.Output = Utility.ConverToBoolean(item.Text);
                    break;
            }
        }
        #endregion

        #region 呈现本元素的数据
        /// <summary>
        /// 呈现本元素的数据
        /// </summary>
        /// <param name="writer"></param>
        protected override void RenderTagData(System.IO.TextWriter writer)
        {
            string type = this.DataType.GetTextValue();
            if (!string.IsNullOrEmpty(type))
            {
                ItemValueFunction function;
                if (this.OwnerTemplate.ItemValueFunctions.TryGetValue(type, out function))
                {
                    object value = function.Invoke(this);
                    if (this.Variable != null) this.Variable.Value = value;
                    if (this.Output && value != null) writer.Write(value);
                    base.RenderTagData(writer);
                }
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
            if (this.DataType == null) throw new ParserException(string.Format("{0}标签中缺少type属性", this.TagName));
            if (this.DataKey == null) throw new ParserException(string.Format("{0}标签中缺少key属性", this.TagName));

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
            ItemTag tag = new ItemTag(ownerTemplate);
            this.CopyTo(tag);
            tag.Variable = this.Variable == null ? null : this.Variable.Clone(ownerTemplate);
            tag.Output = this.Output;
            foreach (IExpression exp in this.ExpArgs)
            {
                tag.ExpArgs.Add(exp.Clone(ownerTemplate));
            }
            return tag;
        }
        #endregion
    }
}
