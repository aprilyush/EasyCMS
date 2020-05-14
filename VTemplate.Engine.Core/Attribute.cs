/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  Attribute
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 元素属性
    /// </summary>
    public class Attribute : ICloneableElement<Attribute>
    {
        /// <summary>
        /// 元素属性
        /// </summary>
        /// <param name="name"></param>
        /// <param name="text"></param>
        private Attribute(string name, string text)
        {
            this.Name = name;
            this.Text = text;
        }
        /// <summary>
        /// 元素属性
        /// </summary>
        /// <param name="ownerElement"></param>
        /// <param name="name"></param>
        /// <param name="text"></param>
        internal Attribute(Element ownerElement, string name, string text)
        {
            this.OwnerElement = ownerElement;
            this.Name = name;
            this.Text = text;
            this.Value = ParserHelper.CreateExpression(this.OwnerElement.OwnerTemplate, this.Text);
        }

        /// <summary>
        /// 宿主标签
        /// </summary>
        public Element OwnerElement { get; internal set; }

        /// <summary>
        /// 属性名称
        /// </summary>
        public string Name { get; private set; }

        /// <summary>
        /// 属性的值文本
        /// </summary>
        public string Text { get; private set; }

        /// <summary>
        /// 属性的值
        /// </summary>
        public IExpression Value { get; private set; }

        /// <summary>
        /// 获取文本值
        /// </summary>
        internal string GetTextValue()
        {
            if (this.Value == null) return this.Text;
            object v = this.Value.GetValue();
            if (Utility.IsNothing(v)) return string.Empty;
            return v.ToString();
        }
        #region ICloneableElement<Attribute> 成员
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <returns></returns>
        public Attribute Clone(Template ownerTemplate)
        {
            Attribute attribute = new Attribute(this.Name, this.Text);
            attribute.OwnerElement = null;
            attribute.Value = this.Value == null ? null : this.Value.Clone(ownerTemplate);

            return attribute;
        }
        #endregion
    }
}
