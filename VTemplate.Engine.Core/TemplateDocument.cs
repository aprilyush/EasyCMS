/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  TemplateDocument
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;

namespace VTemplate.Engine
{
    /// <summary>
    /// 模板文档
    /// </summary>
    public class TemplateDocument : Template
    {

        #region 构造函数
        /// <summary>
        /// 
        /// </summary>
        private TemplateDocument(TemplateDocumentConfig documentConfig)
        {
            this.DocumentConfig = documentConfig;
        }
        /// <summary>
        /// 采用默认的文档配置并根据TextRader数据进行解析
        /// </summary>
        /// <param name="reader"></param>
        public TemplateDocument(TextReader reader) : this(reader, TemplateDocumentConfig.Default) { }
        /// <summary>
        /// 根据TextRader数据进行解析
        /// </summary>
        /// <param name="reader"></param>
        /// <param name="documentConfig"></param>
        public TemplateDocument(TextReader reader, TemplateDocumentConfig documentConfig)
        {
            this.DocumentConfig = documentConfig;
            this.ParseString(reader.ReadToEnd());
        }
        /// <summary>
        /// 采用默认的文档配置并根据文件内容进行解析
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="charset"></param>
        public TemplateDocument(string fileName, Encoding charset) : this(fileName, charset, TemplateDocumentConfig.Default) { }
        /// <summary>
        /// 根据文件内容进行解析
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="charset"></param>
        /// <param name="documentConfig"></param>
        public TemplateDocument(string fileName, Encoding charset, TemplateDocumentConfig documentConfig)
        {
            string text = System.IO.File.ReadAllText(fileName, charset);
            this.File = Path.GetFullPath(fileName);
            this.Charset = charset;
            this.AddFileDependency(this.File);
            this.DocumentConfig = documentConfig;
            this.ParseString(this, text);
        }
        /// <summary>
        /// 采用默认的文档配置并根据字符串进行解析
        /// </summary>
        /// <param name="text"></param>
        public TemplateDocument(string text) : this(text, TemplateDocumentConfig.Default) { }
        /// <summary>
        /// 根据字符串进行解析
        /// </summary>
        /// <param name="text"></param>
        /// <param name="documentConfig"></param>
        public TemplateDocument(string text, TemplateDocumentConfig documentConfig)
        {
            this.DocumentConfig = documentConfig;
            this.ParseString(text);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="documentElement"></param>
        /// <param name="text"></param>
        /// <param name="documentConfig"></param>
        internal TemplateDocument(Template documentElement, string text, TemplateDocumentConfig documentConfig) : this(documentElement, documentElement, text, documentConfig) { }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="documentElement"></param>
        /// <param name="container"></param>
        /// <param name="text"></param>
        /// <param name="documentConfig"></param>
        internal TemplateDocument(Template documentElement, Tag container, string text, TemplateDocumentConfig documentConfig)
        {
            this.DocumentConfig = documentConfig;
            this.AppendChild(documentElement);
            this.ChildTemplates.Add(documentElement);
            this.ParseString(documentElement, container, text);
        }
        #endregion

        #region 属性定义
        ///// <summary>
        ///// 模板文本数据
        ///// </summary>
        /////public string Text { get; private set; }

        /// <summary>
        /// 根文档模板
        /// </summary>
        public Template DocumentElement
        {
            get
            {
                return this.TagContainer;
            }
            set
            {
                this.TagContainer = value;
            }
        }

        /// <summary>
        /// 返回此模板块的宿主模板文档
        /// </summary>
        public override TemplateDocument OwnerDocument
        {
            get
            {
                return this;
            }
        }

        /// <summary>
        /// 模板文档的配置参数
        /// </summary>
        public TemplateDocumentConfig DocumentConfig { get; private set; }


        /// <summary>
        /// 
        /// </summary>
        private Tag _CurrentRenderingTag;
        /// <summary>
        /// 返回当前正在呈现数据的标签
        /// </summary>
        public Tag CurrentRenderingTag
        {
            get
            {
                return this._CurrentRenderingTag;
            }
            private set
            {
                this._CurrentRenderingTag = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [ThreadStatic]
        private static TemplateDocument _CurrentRenderingDocument;
        /// <summary>
        /// 当前正在呈现数据的文档
        /// </summary>
        public static TemplateDocument CurrentRenderingDocument
        {
            get
            {
                return _CurrentRenderingDocument;
            }
            private set
            {
                _CurrentRenderingDocument = value;
            }
        }
        #endregion

        #region 方法定义
        /// <summary>
        /// 获取此模板文档的呈现数据
        /// </summary>
        public string GetRenderText()
        {
            using (StringWriter writer = new StringWriter())
            {
                this.Render(writer);
                return writer.ToString();
            }
        }

        /// <summary>
        /// 注册当前呈现的标签
        /// </summary>
        /// <param name="tag"></param>
        internal void RegisterCurrentRenderingTag(Tag tag)
        {            
            TemplateDocument.CurrentRenderingDocument = tag == null ? null : tag.OwnerDocument;
            this.CurrentRenderingTag = tag;
        }
        #endregion
        
        #region 解析字符串
        /// <summary>
        /// 解析字符串
        /// </summary>
        /// <param name="text"></param>
        private void ParseString(string text)
        {
            this.ParseString(this, text);
        }
        /// <summary>
        /// 解析字符串
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <param name="text"></param>
        private void ParseString(Template ownerTemplate, string text)
        {
            this.ParseString(ownerTemplate, ownerTemplate, text);
        }
        /// <summary>
        /// 解析字符串
        /// </summary>
        /// <param name="ownerTemplate">宿主模板</param>
        /// <param name="container">标签的容器</param>
        /// <param name="text">模板文本数据</param>
        private void ParseString(Template ownerTemplate, Tag container, string text)
        {
            //设置根文档模板
            this.DocumentElement = ownerTemplate;
            //this.Text = text;

            if (string.IsNullOrEmpty(text)) return;

            int charOffset = 0, offset = 0;
            bool isClosedTag;
            Match match = null;

            //标签堆栈
            Stack<Tag> tagStack = new Stack<Tag>();
            tagStack.Push(container);

            try
            {
                while (offset < text.Length)
                {
                    if (ParserHelper.IsVariableTagStart(text, offset) && (match = ParserRegex.VarTagRegex.Match(text, offset)).Success)  //匹配到模板变量
                    {
                        //构建文本节点
                        ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, match.Index - charOffset);
                        //构建模板变量
                        ParserHelper.CreateVariableTag(ownerTemplate, container, match);
                    }
                    else if (ParserHelper.IsTagStart(text, offset) && (match = ParserRegex.TagRegex.Match(text, offset)).Success)  //匹配到某种类型的标签
                    {
                        //构建文本节点
                        ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, match.Index - charOffset);
                        //构建标签
                        Tag tag = ParserHelper.CreateTag(ownerTemplate, match, out isClosedTag);

                        //将标签加入堆栈
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
                        //取得容器
                        if (tagStack.Count > 0) container = tagStack.Peek();
                    }
                    else if (ParserHelper.IsCloseTagStart(text, offset) && (match = ParserRegex.EndTagRegex.Match(text, offset)).Success)            //匹配到某个结束标签
                    {
                        //取得标签名称
                        string name = match.Groups["tagname"].Value;
                        //非匹配的结束标签.则模板有错
                        throw new ParserException("无效的结束标签");
                    }
                    else if (ParserHelper.IsVTExpressionStart(text, offset))
                    {
                        char s = ParserHelper.ReadChar(text, offset + ParserHelper.VTExpressionHead.Length);
                        int startOffset = offset + ParserHelper.VTExpressionHead.Length + 1;
                        int lastOffset = text.IndexOf(s, offset + ParserHelper.VTExpressionHead.Length + 1);
                        if (lastOffset == -1) throw new ParserException(string.Format("无法找到VT表达式\"{0}\"的结束标记", ParserHelper.VTExpressionHead));
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
                //处理文本字符
                ParserHelper.CreateTextNode(ownerTemplate, container, text, charOffset, text.Length - charOffset);
                if (tagStack.Count > 1)
                {
                    //堆栈里还有其它元素.则有错误
                    throw new ParserException(string.Format("{0}标签未闭合", tagStack.Pop()));
                }
            }
            catch (ParserException ex)
            {
                //如果错误中不包含行号与列号.则计算行号与列号
                if (!ex.HaveLineAndColumnNumber && match != null && match.Success)
                {
                    //获取当前出错时正在解析的模板文件
                    string file = string.Empty;
                    Tag tag = container;
                    while (string.IsNullOrEmpty(file) && tag != null)
                    {
                        if (tag is Template)
                        {
                            file = ((Template)tag).File;
                        }
                        else if (tag is IncludeTag)
                        {
                            file = ((IncludeTag)tag).File;
                        }
                        tag = tag.Parent;
                    }
                    if (string.IsNullOrEmpty(file))
                    {
                        throw new ParserException(Utility.GetLineAndColumnNumber(text, match.Index), match.ToString(), ex.Message);
                    }
                    else
                    {
                        throw new ParserException(file, Utility.GetLineAndColumnNumber(text, match.Index), match.ToString(), ex.Message);
                    }
                }
                else
                {
                    //继续抛出错误
                    throw;
                }
            }
            finally
            {
                //清空堆栈
                tagStack.Clear();
                tagStack = null;
            }
        }
        #endregion

        #region 从文件缓存中构建模板文档对象
                /// <summary>
        /// 从文件缓存中构建模板文档对象
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="charset"></param>
        /// <returns></returns>
        //public static TemplateDocument FromFileCache(string fileName, Encoding charset)
        //{
        //    return FromFileCache(fileName, charset, TemplateDocumentConfig.Default);
        //}
        /// <summary>
        /// 从文件缓存中构建模板文档对象
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="charset"></param>
        /// <param name="documentConfig"></param>
        /// <returns></returns>
        //public static TemplateDocument FromFileCache(string fileName, Encoding charset, TemplateDocumentConfig documentConfig)
        //{
        //    Cache cache = HttpRuntime.Cache;
        //    if (documentConfig == null) documentConfig = TemplateDocumentConfig.Default;

        //    //没有缓存则直接返回实例
        //    if (cache == null) return new TemplateDocument(fileName, charset, documentConfig);
        //    fileName = Path.GetFullPath(fileName);

        //    string cacheKey = string.Format("TEMPLATE_DOCUMENT_CACHE_ITEM_{0}_{1}_{2}", documentConfig.TagOpenMode, documentConfig.CompressText, fileName);
        //    TemplateDocument document = cache.Get(cacheKey) as TemplateDocument;
        //    if (document == null)
        //    {
        //        document = new TemplateDocument(fileName, charset, documentConfig);
        //        cache.Insert(cacheKey, document, new CacheDependency(document.FileDependencies));
        //    }
        //    //返回副本
        //    return document.Clone();
        //}
        #endregion

        #region 克隆模板文档对象
        /// <summary>
        /// 克隆模板文档对象
        /// </summary>
        /// <returns></returns>
        private TemplateDocument Clone()
        {
            return (TemplateDocument)Clone(null);
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
            TemplateDocument tag = new TemplateDocument(this.DocumentConfig);

            //优先拷贝变量
            foreach (Variable var in this.Variables)
            {
                tag.Variables.Add(var.Clone(tag));
            }

            tag.Id = this.Id;
            tag.Name = this.Name;
            foreach (var att in this.Attributes)
            {
                tag.Attributes.Add(att.Clone(tag));
            }

            tag.Charset = this.Charset;
            tag.File = this.File;
            tag.fileDependencies = this.fileDependencies;
            tag.Visible = this.Visible;

            foreach (Element element in this.InnerElements)
            {
                Element item = element.Clone(tag);
                tag.AppendChild(item);

                if (element is Template && this.DocumentElement == element) tag.DocumentElement = (Template)item;
            }

            if (tag.DocumentElement == null) tag.DocumentElement = tag;
            return tag;
        }
        #endregion

        #region 标签定义

        private Dictionary<string, List<PanelTag>> _panelChilds = new Dictionary<string, List<PanelTag>>(20, StringComparer.InvariantCultureIgnoreCase);
        /// <summary>
        /// 添加某个Panel的子Panel
        /// </summary>
        /// <param name="panelId"></param>
        /// <param name="childPanel"></param>
        internal void AddPanelChild(string panelId, PanelTag childPanel)
        {
            if (!_panelChilds.ContainsKey(panelId))
            {
                _panelChilds.Add(panelId, new List<PanelTag>(10));
            }
            _panelChilds[panelId].Add(childPanel);
        }
        /// <summary>
        /// 获取某个Panel下的所有子panel
        /// </summary>
        /// <param name="panelId"></param>
        /// <returns></returns>
        internal List<PanelTag> GetPanelChilds(string panelId)
        {
            if (_panelChilds.ContainsKey(panelId))
            {
                return _panelChilds[panelId];
            }
            else
            {
                return null;
            }
        }
        #endregion
    }
}
