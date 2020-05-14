/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  RenderTag
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Text.RegularExpressions;
using System.Diagnostics;

namespace VTemplate.Engine
{
    /// <summary>
    /// 数据输出标签,可输出某个标签的数据,或直接输出文件数据.如: &lt;vt:output tagid="list" /&gt; 或 &lt;vt:output file="output.html" charset="utf-8" /&gt;
    /// </summary>
    public class OutputTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal OutputTag(Template ownerTemplate)
            : base(ownerTemplate)
        {  }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "output"; }
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
        /// 
        /// </summary>
        protected Tag outputTarget;
        /// <summary>
        /// 需要输出数据的标签id
        /// </summary>
        protected Tag OutputTarget
        {
            get
            {
                if (this.outputTarget == null
                    && this.TagId != null && !string.IsNullOrEmpty(this.TagId.GetTextValue()))
                {
                    this.outputTarget = this.OwnerDocument.GetChildTagById(this.TagId.GetTextValue());
                }
                return this.outputTarget;
            }
        }
        /// <summary>
        /// 需要输出数据的标签的Id
        /// </summary>
        public Attribute TagId
        {
            get
            {
                return this.Attributes["TagId"];
            }
        }

        /// <summary>
        /// 需要输出数据的文件
        /// </summary>
        public Attribute File
        {
            get
            {
                return this.Attributes["File"];
            }
        }
        /// <summary>
        /// 文件编码
        /// </summary>
        public Attribute Charset
        {
            get
            {
                return this.Attributes["Charset"];
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
            CancelEventArgs args = new CancelEventArgs();
            this.OnBeforeRender(args);
            if (!args.Cancel)
            {
                foreach (Element item in this.InnerElements)
                {
                    item.Render(writer);
                }

                string file = this.File == null ? string.Empty : Utility.ResolveFilePath(this.Parent, this.File.GetTextValue());
                Encoding charset = this.Charset == null ? this.OwnerTemplate.Charset : Utility.GetEncodingFromCharset(this.Charset.GetTextValue(), this.OwnerTemplate.Charset);

                if (this.OutputTarget != null)
                    this.OutputTarget.Render(writer);

                if (!string.IsNullOrEmpty(file))
                {
                    try
                    {
                        if (System.IO.File.Exists(file))
                        {
                            writer.Write(System.IO.File.ReadAllText(file, charset));
                        }
                    }
                    catch { }
                }
            }
            this.OnAfterRender(EventArgs.Empty); 
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
            if (this.TagId == null && this.File == null) throw new ParserException(string.Format("{0}标签中必须定义tagid或file属性", this.TagName));

            bool flag = base.ProcessBeginTag(ownerTemplate, container, tagStack, text, ref match, isClosedTag);

            return flag;
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
            OutputTag tag = new OutputTag(ownerTemplate);
            this.CopyTo(tag);
            return tag;
        }
        #endregion
    }
}
