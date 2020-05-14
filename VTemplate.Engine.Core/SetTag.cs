/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  SetTag
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// 变量赋值标签, 如:&lt;vt:set var="page" value="1" /&gt;
    /// </summary>
    public class SetTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal SetTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
            this.Values = new ElementCollection<IExpression>();
        }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "set"; }
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
        /// 变量的值
        /// </summary>
        public ElementCollection<IExpression> Values { get; protected set; }

        /// <summary>
        /// 要对其赋值的变量
        /// </summary>
        public VariableIdentity Variable { get; protected set; }

        /// <summary>
        /// 格式化
        /// </summary>
        public Attribute Format
        {
            get
            {
                return this.Attributes["Format"];
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
                case "value":
                    this.Values.Add(item.Value);
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
            object value = null;
            string format = this.Format == null ? string.Empty : this.Format.GetTextValue();
            if (string.IsNullOrEmpty(format))
            {
                value = this.Values[0].GetValue();
            }
            else
            {
                List<object> param = new List<object>();
                foreach (IExpression ie in this.Values)
                {
                    param.Add(ie.GetValue());
                }
                value = string.Format(format, param.ToArray());
            }
            if (this.Variable != null) this.Variable.Value = value;

            if (this.Output && value != null) writer.Write(value);
            base.RenderTagData(writer);
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
            if (this.Values.Count < 1) throw new ParserException(string.Format("{0}标签中缺少value属性", this.TagName));
            if (this.Values.Count > 1 && this.Format == null) throw new ParserException(string.Format("{0}标签如果已定义多个value属性,则也必须定义format属性", this.TagName));

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
            SetTag tag = new SetTag(ownerTemplate);
            this.CopyTo(tag);
            tag.Variable = this.Variable == null ? null : this.Variable.Clone(ownerTemplate);
            tag.Output = this.Output;
            foreach (IExpression exp in this.Values)
            {
                tag.Values.Add((IExpression)(exp.Clone(ownerTemplate)));
            }
            return tag;
        }
        #endregion
    }
}
