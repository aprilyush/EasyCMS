/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  TextNode
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 文本节点
    /// </summary>
    public class TextNode : Element
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <param name="text"></param>
        internal TextNode(Template ownerTemplate, string text)
            : base(ownerTemplate)
        {
            this.Text = text;
        }

        /// <summary>
        /// 此节点的文本数据
        /// </summary>
        public string Text
        {
            get;
            private set;
        }

        #region 呈现本元素的数据
        /// <summary>
        /// 呈现本元素的数据
        /// </summary>
        /// <param name="writer"></param>
        public override void Render(System.IO.TextWriter writer)
        {
            writer.Write(this.Text);
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
            return new TextNode(ownerTemplate, this.Text);
        }
        #endregion

        /// <summary>
        /// 返回文本节点的文本字符
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return this.Text;
        }
    }
}
