/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  Template
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// 模板块标签.如: &lt;vt:template id="member"&gt;.......&lt;/vt:template&gt; 或自闭合的模板:&lt;vt:template id="member" file="member.html" /&gt;
    /// </summary>
    public class Template : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        internal Template() : this(null) { }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal Template(Template ownerTemplate)
            : base(ownerTemplate)
        {
            this.Visible = true;
            this.Charset = (ownerTemplate == null ? Encoding.Default : ownerTemplate.Charset);
            this.Variables = new VariableCollection();
            this.ChildTemplates = new ElementCollection<Template>();
            this.fileDependencies = new List<string>();
            this.UserDefinedFunctions = new UserDefinedFunctionCollection();
            this.ItemValueFunctions = new ItemValueFunctionCollection();
            this.TagContainer = this;
        }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "template"; }
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
        /// 模板的关联文件
        /// </summary>
        public string File { get; internal set; }

        /// <summary>
        /// 模板数据采用的编码
        /// </summary>
        public Encoding Charset { get; internal set; }

        /// <summary>
        /// 设置或返回此模板是否可见
        /// </summary>
        public bool Visible { get; set; }

        /// <summary>
        /// 返回此模板下的变量集合
        /// </summary>
        public VariableCollection Variables { get; private set; }

        /// <summary>
        /// 自定义函数集合
        /// </summary>
        public UserDefinedFunctionCollection UserDefinedFunctions { get; private set; }

        /// <summary>
        /// 项值函数集合
        /// </summary>
        public ItemValueFunctionCollection ItemValueFunctions { get; private set; }

        /// <summary>
        /// 返回此模板下的子模板元素
        /// </summary>
        public ElementCollection<Template> ChildTemplates { get; set; }

        /// <summary>
        /// 标签容器
        /// </summary>
        protected Template TagContainer { get; set; }

        /// <summary>
        /// 返回处理模板数据的实例
        /// </summary>
        public Attribute RenderInstance
        {
            get
            {
                return this.Attributes["render"];
            }
        }

        /// <summary>
        /// 返回处理模板数据的特性方法
        /// </summary>
        public Attribute RenderMethod
        {
            get
            {
                return this.Attributes["rendermethod"];
            }
        }
        #endregion

        #region 模板的依赖文件
        /// <summary>
        /// 模板的依赖文件列表
        /// </summary>
        protected List<string> fileDependencies;
        /// <summary>
        /// 返回模板的依赖文件
        /// </summary>
        public string[] FileDependencies
        {
            get
            {
                return this.fileDependencies.ToArray();
            }
        }
        /// <summary>
        /// 添加模板的依赖文件
        /// </summary>
        /// <param name="fileName"></param>
        internal void AddFileDependency(string fileName)
        {
            foreach (string item in this.fileDependencies)
            {
                if (item.Equals(fileName, StringComparison.InvariantCultureIgnoreCase)) return;
            }
            this.fileDependencies.Add(fileName);
            if (this.OwnerTemplate != null) this.OwnerTemplate.AddFileDependency(fileName);
        }
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

        #region 注册全局的函数
        /// <summary>
        /// 注册全局的自定义函数
        /// </summary>
        /// <param name="function">函数</param>
        public void RegisterGlobalFunction(UserDefinedFunction function)
        {
            this.RegisterGlobalFunction(function.Method.Name, function);
        }
        /// <summary>
        /// 注册全局的自定义函数
        /// </summary>
        /// <param name="functionName">函数名称</param>
        /// <param name="function">函数</param>
        public void RegisterGlobalFunction(string functionName, UserDefinedFunction function)
        {
            if (string.IsNullOrEmpty(functionName)) throw new ArgumentNullException("functionName");
            if (function == null) throw new ArgumentNullException("function");

            TagContainer.UserDefinedFunctions.Add(functionName, function);
            foreach (Template child in TagContainer.ChildTemplates)
            {
                child.RegisterGlobalFunction(functionName, function);
            }
        }
        /// <summary>
        /// 注册全局的项值函数
        /// </summary>
        /// <param name="type">值类型</param>
        /// <param name="function">函数</param>
        public void RegisterGlobalItemValueFunction(string type, ItemValueFunction function)
        {
            if (string.IsNullOrEmpty(type)) throw new ArgumentNullException("type");
            if (function == null) throw new ArgumentNullException("function");

            TagContainer.ItemValueFunctions.Add(type, function);
            foreach (Template child in TagContainer.ChildTemplates)
            {
                child.RegisterGlobalItemValueFunction(type, function);
            }
        }
        #endregion

        #region 子模板函数
        /// <summary>
        /// 获取某个Id的子模板.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Template GetChildTemplateById(string id)
        {
            if (string.IsNullOrEmpty(id)) throw new ArgumentNullException("id");
            foreach (Template template in TagContainer.ChildTemplates)
            {
                if (id.Equals(template.Id, StringComparison.InvariantCultureIgnoreCase))
                {
                    return template;
                }
                else
                {
                    Template t = template.GetChildTemplateById(id);
                    if (t != null) return t;
                }
            }
            return null;
        }
        /// <summary>
        /// 获取所有具有同名称的模板列表.
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public ElementCollection<Template> GetChildTemplatesByName(string name)
        {
            if (string.IsNullOrEmpty(name)) throw new ArgumentNullException("name");

            ElementCollection<Template> items = new ElementCollection<Template>();
            foreach (Template template in TagContainer.ChildTemplates)
            {
                if (name.Equals(template.Name, StringComparison.InvariantCultureIgnoreCase))
                {
                    items.Add(template);
                }
                items.AddRange(template.GetChildTemplatesByName(name));
            }
            return items;
        }
        #endregion

        #region 设置变量的值
        /// <summary>
        /// 设置当前模板块和其下所有子模板块下某个同名称的变量或变量表达式的值
        /// </summary>
        /// <param name="varExp"></param>
        /// <param name="value"></param>
        public void SetValue(string varExp, object value)
        {
            TagContainer.Variables.SetValue(varExp, value);
            foreach (Template child in TagContainer.ChildTemplates)
            {
                child.SetValue(varExp, value);
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
            string renderInstance = this.RenderInstance == null ? null : this.RenderInstance.GetTextValue();
            string renderMethod = this.RenderMethod == null ? null : this.RenderMethod.GetTextValue();

            //优先将处理权交给RenderInstance
            if (!string.IsNullOrEmpty(renderInstance))
            {
                if (!string.IsNullOrEmpty(renderMethod))
                {
                    //采用特性方法处理
                    Utility.PreRenderTemplateByAttributeMethod(renderInstance, renderMethod, this);
                }
                else
                {
                    //采用接口处理
                    Utility.PreRenderTemplate(renderInstance, this);
                }
            }
            if (this.Visible)
            {
                base.RenderTagData(writer);
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
            //将自身加入到宿主的子模板列表中
            ownerTemplate.ChildTemplates.Add(this);
            //加入到标签容器的元素列表中
            container.AppendChild(this);

            if (!string.IsNullOrEmpty(this.File))
            {
                //修正文件地址
                this.File = Utility.ResolveFilePath(this.Parent, this.File);

                if (System.IO.File.Exists(this.File))
                {
                    //增加到依赖文件列表
                    this.OwnerTemplate.AddFileDependency(this.File);

                    //读取文件数据进行解析
                    new TemplateDocument(this, System.IO.File.ReadAllText(this.File, this.Charset), ownerTemplate.OwnerDocument.DocumentConfig);
                }
            }

            //非闭合标签则查找结束标签
            if (!isClosedTag)
            {
                this.ProcessEndTag(this, this, tagStack, text, ref match);                
            }
            //因为已处理EndTag.所以不需要外部继续再处理
            return false;
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
            Template tag = new Template(ownerTemplate);
            //加入到宿主模板的子模板列表
            ownerTemplate.ChildTemplates.Add(tag);

            //优先拷贝变量
            foreach (Variable var in this.Variables)
            {
                tag.Variables.Add(var.Clone(tag));
            }
            
            //复制其它属性
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
                tag.AppendChild(element.Clone(tag));
            }
            
            return tag;
        }
        #endregion
    }
}
