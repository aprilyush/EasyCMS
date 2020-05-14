/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  PanelTag
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.ComponentModel;

namespace VTemplate.Engine
{
    /// <summary>
    /// 面板数据标签,如: &lt;vt:panel id="header" /&gt;或者 &lt;vt:panel container="header"&gt;&lt;/vt:panel&gt;
    /// </summary>
    public class PanelTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal PanelTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
        }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "panel"; }
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
        /// 面板所在的容器标签
        /// </summary>
        public string Container
        {
            get;
            protected set;
        }
        #endregion

        #region 呈现本元素的数据
        /// <summary>
        /// 呈现本元素的数据
        /// </summary>
        /// <param name="writer"></param>
        public override void Render(System.IO.TextWriter writer)
        {
            if (string.IsNullOrEmpty(this.Container))
            {
                //不存在容器定义则直接呈现数据
                base.Render(writer);
            }
        }
        /// <summary>
        /// 呈现数据到容器里
        /// </summary>
        /// <param name="writer"></param>
        private void RenderToContainer(System.IO.TextWriter writer)
        {
            base.Render(writer);
        }

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
                if (!string.IsNullOrEmpty(this.Id))
                {
                    var panels = this.OwnerDocument.GetPanelChilds(this.Id);
                    if (panels != null)
                    {
                        foreach (var panelTag in panels)
                        {
                            panelTag.RenderToContainer(writer);
                        }
                    }
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
            if (string.IsNullOrEmpty(this.Container) && string.IsNullOrEmpty(this.Id)) throw new ParserException(string.Format("{0}标签中必须定义id或者container属性", this.TagName));

            if (!string.IsNullOrEmpty(this.Container))
            {
                var conTag = this.OwnerDocument.GetChildTagById(this.Container) as PanelTag;
                if (conTag == null) throw new ParserException(string.Format("{0}标签中Container属性定义的“{1}”<vt:panel>标签不存在", this.TagName, this.Container));
                this.OwnerDocument.AddPanelChild(this.Container, this);
            }

            bool flag = base.ProcessBeginTag(ownerTemplate, container, tagStack, text, ref match, isClosedTag);

            return flag;
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
                case "container":
                    this.Container = item.Text;
                    break;
            }
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
            PanelTag tag = new PanelTag(ownerTemplate);
            tag.Container = this.Container;
            this.CopyTo(tag);

            if (!string.IsNullOrEmpty(this.Container))
            {
                ownerTemplate.OwnerDocument.AddPanelChild(this.Container, tag);
            }

            return tag;
        }
        #endregion
    }
}
