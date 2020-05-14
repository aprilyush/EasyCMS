/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  IncludeTag
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// 文件包含标签.如: &lt;vt:include file="include.html" charset="utf-8" /&gt;
    /// </summary>
    public class IncludeTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal IncludeTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
            this.Charset = ownerTemplate.Charset;
        }
        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "include"; }
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
        /// 引用的文件
        /// </summary>
        public string File { get; private set; }
        /// <summary>
        /// 文件编码
        /// </summary>
        public Encoding Charset { get; private set; }
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
                case "file":
                    this.File = item.Text;                    
                    break;
                case "charset":
                    this.Charset = Utility.GetEncodingFromCharset(item.Text, this.OwnerTemplate.Charset);
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
            container.AppendChild(this);

            if (!string.IsNullOrEmpty(this.File))
            {
                //修正文件地址
                this.File = Utility.ResolveFilePath(this.Parent, this.File);

                if (System.IO.File.Exists(this.File))
                {
                    //增加到依赖文件列表
                    this.OwnerTemplate.AddFileDependency(this.File);

                    //解析数据
                    new TemplateDocument(ownerTemplate, this, System.IO.File.ReadAllText(this.File, this.Charset), ownerTemplate.OwnerDocument.DocumentConfig);
                }
            }
            return !isClosedTag;
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
            IncludeTag tag = new IncludeTag(ownerTemplate);
            this.CopyTo(tag);
            tag.File = this.File;
            tag.Charset = this.Charset;
            return tag;
        }
        #endregion
    }
}
