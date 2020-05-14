/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * DateTime		:  2009-11-23 16:46:13
 * Description	:  ImportTag
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// 类型导入标签, 如:&lt;vt:import var="math" type="System.Math" /&gt;
    /// </summary>
    public class ImportTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal ImportTag(Template ownerTemplate)
            : base(ownerTemplate)
        {}

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "import"; }
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
        /// 要对其赋值的变量
        /// </summary>
        public VariableIdentity Variable { get; protected set; }

        /// <summary>
        /// 要导入的类型名称
        /// </summary>
        public Attribute Type
        {
            get
            {
                return this.Attributes["Type"];
            }
        }

        /// <summary>
        /// 类型所在的程序集
        /// </summary>
        public Attribute Assembly
        {
            get
            {
                return this.Attributes["Assembly"];
            }
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
                case "var":
                    this.Variable = ParserHelper.CreateVariableIdentity(this.OwnerTemplate, item.Text);
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
            Type type = null;
            if (this.Type.Value is VariableExpression)
            {
                object v = this.Type.Value.GetValue();
                if (v != null)
                {
                    type = (v is Type ? (Type)v : v.GetType());
                }
            }
            else
            {
                string assembly = this.Assembly == null ? string.Empty : this.Assembly.GetTextValue();
                type = Utility.CreateType(this.Type.GetTextValue(), assembly);
            }
            if (this.Variable != null) this.Variable.Value = type;

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
            if (this.Variable == null) throw new ParserException(string.Format("{0}标签中缺少var属性", this.TagName));
            if (this.Type == null || string.IsNullOrEmpty(this.Type.Text)) throw new ParserException(string.Format("{0}标签中缺少type属性", this.TagName));

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
            ImportTag tag = new ImportTag(ownerTemplate);
            this.CopyTo(tag);
            tag.Variable = this.Variable == null ? null : this.Variable.Clone(ownerTemplate);
            return tag;
        }
        #endregion
    }
}
