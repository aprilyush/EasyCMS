/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  Tag
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.ComponentModel;
using System.IO;

namespace VTemplate.Engine
{
    /// <summary>
    /// 标签元素
    /// </summary>
    public abstract class Tag : Element, IAttributesElement
    {
        /// <summary>
        /// 标签元素
        /// </summary>
        /// <param name="ownerTemplate">宿主模板</param>
        protected Tag(Template ownerTemplate) : base(ownerTemplate)
        {            
            this.InnerElements = new ElementCollection<Element>();
            this.Attributes = new AttributeCollection(this);
            //注册添加属性时触发事件.用于设置自身的某些属性值
            this.Attributes.Adding += OnAddingAttribute;
        }

        #region 属性定义
        /// <summary>
        /// 返回标签的名称.如for,foreach等等
        /// </summary>
        public abstract string TagName
        {
            get;
        }

        /// <summary>
        /// 返回标签的结束标签名称.
        /// </summary>
        public virtual string EndTagName
        {
            get
            {
                return this.TagName;
            }
        }

        /// <summary>
        /// 返回此标签是否是单一标签元素.即是不需要配对的结束标签
        /// </summary>
        internal abstract bool IsSingleTag
        {
            get;
        }
        /// <summary>
        /// 标签的Id
        /// </summary>
        public string Id { get; protected set; }
        /// <summary>
        /// 标签的名称
        /// </summary>
        public string Name { get; protected set; }

        /// <summary>
        /// 此标签包含的子元素集合
        /// </summary>
        public ElementCollection<Element> InnerElements { get; private set; }

        /// <summary>
        /// 此标签的属性集合
        /// </summary>
        public AttributeCollection Attributes { get; protected set; }
        #endregion

        #region 添加标签属性时的触发事件函数.用于设置自身的某些属性值
        /// <summary>
        /// 添加标签属性时的触发事件函数.用于设置自身的某些属性值
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OnAddingAttribute(object sender, AttributeCollection.AttributeAddingEventArgs e)
        {
            string name = e.Item.Name.ToLower();

            switch (name)
            {
                case "id":
                    this.Id = e.Item.Text.Trim();
                    break;
                case "name":
                    this.Name = e.Item.Text.Trim();
                    break;
            }
            OnAddingAttribute(name, e.Item);
        }

        /// <summary>
        /// 添加标签属性时的触发函数
        /// </summary>
        /// <param name="name"></param>
        /// <param name="item"></param>
        protected virtual void OnAddingAttribute(string name, Attribute item)
        {
        }
        #endregion

        #region 添加子元素
        /// <summary>
        /// 添加子元素
        /// </summary>
        /// <param name="element"></param>
        internal virtual void AppendChild(Element element)
        {
            element.Parent = this;
            this.InnerElements.Add(element);
        }
        #endregion

        #region 根据Id或Name获取元素标签
        /// <summary>
        /// 根据Id获取某个子元素标签
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public virtual Tag GetChildTagById(string id)
        {
            if (string.IsNullOrEmpty(id)) throw new ArgumentNullException("id");

            List<Tag> tags = new List<Tag>();
            //搜索当前元素下的子元素
            foreach (Element item in this.InnerElements)
            {
                if (item is Tag)
                {
                    Tag tag = (Tag)item;
                    tags.Add(tag);
                    if (id.Equals(tag.Id, StringComparison.InvariantCultureIgnoreCase)) return tag;
                }
            }

            //搜索子元素下的子元素
            foreach (Tag item in tags)
            {
                Tag tag = item.GetChildTagById(id);
                if (tag != null) return tag;
            }

            return null;
        }

        /// <summary>
        /// 根据name获取所有同名的子元素标签
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public virtual ElementCollection<Tag> GetChildTagsByName(string name)
        {
            if (string.IsNullOrEmpty(name)) throw new ArgumentNullException("name");

            ElementCollection<Tag> tags = new ElementCollection<Tag>();
            //搜索当前元素下的子元素
            foreach (Element item in this.InnerElements)
            {
                if (item is Tag)
                {
                    Tag tag = (Tag)item;
                    if (name.Equals(tag.Name, StringComparison.InvariantCultureIgnoreCase)) tags.Add(tag);

                    //处理其下子元素
                    tags.AddRange(tag.GetChildTagsByName(name));
                }
            }
            return tags;
        }

        /// <summary>
        /// 根据标签名获取所有同标签名的子元素标签
        /// </summary>
        /// <param name="tagName"></param>
        /// <returns></returns>
        public virtual ElementCollection<Tag> GetChildTagsByTagName(string tagName)
        {
            if (string.IsNullOrEmpty(tagName)) throw new ArgumentNullException("tagName");

            ElementCollection<Tag> tags = new ElementCollection<Tag>();
            //搜索当前元素下的子元素
            foreach (Element item in this.InnerElements)
            {
                if (item is Tag)
                {
                    Tag tag = (Tag)item;
                    if (tagName.Equals(tag.TagName, StringComparison.InvariantCultureIgnoreCase)) tags.Add(tag);

                    //处理其下子元素
                    tags.AddRange(tag.GetChildTagsByTagName(tagName));
                }
            }
            return tags;
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
        internal virtual bool ProcessBeginTag(Template ownerTemplate, Tag container, Stack<Tag> tagStack, string text, ref Match match, bool isClosedTag)
        {
            container.AppendChild(this);
            return !isClosedTag;
        }
        #endregion

        #region 结束标签的解析
        /// <summary>
        /// 结束标签的解析
        /// </summary>
        /// <param name="ownerTemplate">模板宿主</param>
        /// <param name="container">元素容器</param>
        /// <param name="tagStack">标签堆栈</param>
        /// <param name="text"></param>
        /// <param name="match"></param>
        internal virtual void ProcessEndTag(Template ownerTemplate, Tag container, Stack<Tag> tagStack, string text, ref Match match)
        {
            int charOffset = 0, offset = 0;
            bool isClosedTag;

            charOffset = offset = match.Index + match.Length;
            match = null;
            while (offset < text.Length)
            {
                if (ParserHelper.IsVariableTagStart(text, offset) && (match = ParserRegex.VarTagRegex.Match(text, offset)).Success)                //匹配到模板变量
                {
                    //构建文本节点
                    ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, match.Index - charOffset);
                    //构建模板变量
                    ParserHelper.CreateVariableTag(ownerTemplate, container, match);
                }
                else if (ParserHelper.IsTagStart(text, offset) && (match = ParserRegex.TagRegex.Match(text, offset)).Success)                     //匹配到某种类型的标签
                {
                    //构建文本节点
                    ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, match.Index - charOffset);
                    //构建标签
                    Tag tag = ParserHelper.CreateTag(ownerTemplate, match, out isClosedTag);

                    if (container.IsSingleTag && tag.IsSingleTag)
                    {
                        //如果前容器是单一标签并且当前标签也是单一标签.则回退到上一级非单元素标签
                        while (tagStack.Count > 0)
                        {
                            container = tagStack.Peek();
                            if (container.IsSingleTag)
                            {
                                tagStack.Pop();
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    //将当前标签加入堆栈
                    tagStack.Push(tag);

                    //将解析权交给标签
                    bool flag = tag.ProcessBeginTag(ownerTemplate, container, tagStack, text, ref match, isClosedTag);
                    //非已闭合标签或者是单标签则处理标签的结束标签
                    if (flag)
                    {
                        tag.ProcessEndTag(ownerTemplate, tag, tagStack, text, ref match);
                    }
                    if (tagStack.Count > 0 && tagStack.Peek() == tag && isClosedTag)
                    {
                        //闭合标签则回滚一级
                        tagStack.Pop();
                    }
                    if (tag.IsSingleTag)
                    {
                        //如果标签是单标签则退出寻找
                        break;
                    }
                    else
                    {
                        //取得容器
                        if (tagStack.Count > 0) container = tagStack.Peek();
                    }
                }
                else if (ParserHelper.IsCloseTagStart(text, offset) && (match = ParserRegex.EndTagRegex.Match(text, offset)).Success)            //匹配到某个结束标签
                {
                    //构建文本节点
                    ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, match.Index - charOffset);
                    //取得标签名称
                    string name = match.Groups["tagname"].Value;

                    //回滚标签堆栈.直到回滚到同名称元素的上级为此
                    while (tagStack.Count > 0)
                    {
                        Tag popTag = tagStack.Pop();
                        if (name.Equals(popTag.TagName, StringComparison.InvariantCultureIgnoreCase)) break;
                        if (!name.Equals(popTag.EndTagName, StringComparison.InvariantCultureIgnoreCase))
                        {
                            //非匹配的结束标签.则模板有错
                            throw new ParserException(string.Format("无效的结束标签,原期望的是{0}结束标签", popTag.EndTagName));
                        }
                    }
                    break;
                }
                else if (ParserHelper.IsVTExpressionStart(text, offset))
                {
                    char s = ParserHelper.ReadChar(text, offset + ParserHelper.VTExpressionHead.Length);
                    int startOffset = offset + ParserHelper.VTExpressionHead.Length + 1;
                    int lastOffset = text.IndexOf(s, offset + ParserHelper.VTExpressionHead.Length + 1);
                    if (lastOffset == -1) throw new ParserException(string.Format("无法找到VT表达式[{0}{1}]的结束标记[{1}]", ParserHelper.VTExpressionHead, s));
                    string code = text.Substring(startOffset, lastOffset - startOffset);
                    if (code.Length > 0)
                    {
                        //构建文本节点
                        ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, offset - charOffset);
                        //解析表达式里的代码
                        new TemplateDocument(ownerTemplate, container, code, ownerTemplate.OwnerDocument.DocumentConfig);
                    }
                    offset = lastOffset + 1;
                    charOffset = offset;
                    continue;
                }
                else if (ParserHelper.IsCommentTagStart(text, offset))
                {
                    //构建文本节点
                    ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, offset - charOffset);

                    //找到注释的起始标记"<!--vt[",则直接查找结束标记"]-->"
                    offset = text.IndexOf(ParserHelper.CommentTagEnd, offset + ParserHelper.CommentTagStart.Length);
                    if (offset == -1) throw new ParserException("无法找到注释的结束标记");
                    offset += ParserHelper.CommentTagEnd.Length;
                    charOffset = offset;
                    continue;
                }
                //处理偏移位置
                if (match != null && match.Success)
                {
                    charOffset = offset = match.Index + match.Length;
                    match = null;
                }
                else
                {
                    offset++;
                }
            }

            if (match == null) throw new ParserException(string.Format("{0}标签未闭合", container.TagName));
        }
        #endregion

        #region 呈现本元素的数据
        /// <summary>
        /// 在呈现元素标签数据之前触发的事件
        /// </summary>
        public event CancelEventHandler BeforeRender;
        /// <summary>
        /// 在呈现元素标签数据之后触发的事件
        /// </summary>
        public event EventHandler AfterRender;

        /// <summary>
        /// 触发呈现元素标签数据之前的事件
        /// </summary>
        /// <param name="args"></param>
        protected virtual void OnBeforeRender(CancelEventArgs args)
        {
            CancelEventHandler e = this.BeforeRender;
            if (e != null) e(this, args);
        }
        /// <summary>
        /// 触发呈现元素标签数据之前的事件
        /// </summary>
        /// <param name="args"></param>
        protected virtual void OnAfterRender(EventArgs args)
        {
            EventHandler e = this.AfterRender;
            if (e != null) e(this, args);
        }
        /// <summary>
        /// 呈现本元素的数据
        /// </summary>
        /// <param name="writer"></param>
        public override void Render(System.IO.TextWriter writer)
        {
            //注册当前正在呈现数据的标签
            Tag currentRenderTag = this.OwnerDocument.CurrentRenderingTag;
            this.OwnerDocument.RegisterCurrentRenderingTag(this);
            //呈现本标签的数据
            this.RenderTagData(writer);
            //恢复当前正在呈现数据的标签
            this.OwnerDocument.RegisterCurrentRenderingTag(currentRenderTag);
        }

        /// <summary>
        /// 呈现本标签元素的数据
        /// </summary>
        /// <param name="writer"></param>
        protected virtual void RenderTagData(System.IO.TextWriter writer)
        {
            CancelEventArgs args = new CancelEventArgs();
            this.OnBeforeRender(args);
            if (!args.Cancel)
            {
                foreach (Element item in this.InnerElements)
                {
                    item.Render(writer);
                }
            }
            this.OnAfterRender(EventArgs.Empty);
        }
        #endregion

        #region 保存本标签的呈现数据
        /// <summary>
        /// 将本标签的呈现数据保存到文件,采用宿主模板的编码
        /// </summary>
        /// <param name="fileName">文件地址</param>
        public virtual void RenderTo(string fileName)
        {
            this.RenderTo(fileName, this.OwnerDocument == null ? Encoding.Default : this.OwnerDocument.Charset);
        }
        /// <summary>
        /// 将本标签的呈现数据保存到文件
        /// </summary>
        /// <param name="fileName">文件地址</param>
        /// <param name="charset">文件编码</param>
        public virtual void RenderTo(string fileName, Encoding charset)
        {
            using (StreamWriter writer = new StreamWriter(fileName, false, charset))
            {
                this.Render(writer);
            }
        }
        #endregion

        #region 输出标签的原字符串数据
        /// <summary>
        /// 输出标签的原字符串数据
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            StringBuilder buffer = new StringBuilder();
            buffer.AppendFormat("<vt:{0}", this.TagName);
            foreach (Attribute attribute in this.Attributes)
            {
                buffer.AppendFormat(" {0}=\"{1}\"", attribute.Name, HttpUtility.HtmlEncode(attribute.Text));
            }
            buffer.AppendFormat(">");
            return buffer.ToString();
        }
        #endregion

        #region 拷贝自身数据对某个新对象上
        /// <summary>
        /// 拷贝自身数据对某个新对象上
        /// </summary>
        /// <param name="tag"></param>
        protected virtual void CopyTo(Tag tag)
        {
            tag.Id = this.Id;
            tag.Name = this.Name;
            foreach (var att in this.Attributes)
            {
                tag.Attributes.Add(att.Clone(tag.OwnerTemplate));
            }
            foreach (Element element in this.InnerElements)
            {
                tag.AppendChild(element.Clone(tag.OwnerTemplate));
            }
        }
        #endregion
    }
}
