/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ForEachTag
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// ForEach标签.如:&lt;vt:foreach from="collection" item="variable"  index="i"&gt;...&lt;/vt:foreach&gt;
    /// </summary>
    public class ForEachTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal ForEachTag(Template ownerTemplate)
            : base(ownerTemplate)
        {}

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "foreach"; }
        }

        /// <summary>
        /// 返回此标签是否是单一标签.即是不需要配对的结束标签
        /// </summary>
        internal override bool IsSingleTag
        {
            get { return false; }
        }

        /// <summary>
        /// 根据Id获取某个子元素标签
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public override Tag GetChildTagById(string id)
        {
            Tag tag = base.GetChildTagById(id);

            //如果在自身元素里找不到.则从ForEachTag标签里找
            if (tag == null && this.Else != null)
            {
                if (id.Equals(this.Else.Id, StringComparison.InvariantCultureIgnoreCase))
                {
                    tag = this.Else;
                }
                else
                {
                    tag = this.Else.GetChildTagById(id);
                }
            }

            return tag;
        }
        /// <summary>
        /// 根据name获取所有同名的子元素标签
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public override ElementCollection<Tag> GetChildTagsByName(string name)
        {
            ElementCollection<Tag> tags = base.GetChildTagsByName(name);
            //处理ForEachTag标签
            if (this.Else != null)
            {
                if (name.Equals(this.Else.Name, StringComparison.InvariantCultureIgnoreCase)) tags.Add(this.Else);
                tags.AddRange(this.Else.GetChildTagsByName(name));
            }
            return tags;
        }

        /// <summary>
        /// 根据标签名获取所有同标签名的子元素标签
        /// </summary>
        /// <param name="tagName"></param>
        /// <returns></returns>
        public override ElementCollection<Tag> GetChildTagsByTagName(string tagName)
        {
            ElementCollection<Tag> tags = base.GetChildTagsByTagName(tagName);
            //处理ForEachTag标签
            if (this.Else != null)
            {
                if (tagName.Equals(this.Else.TagName, StringComparison.InvariantCultureIgnoreCase)) tags.Add(this.Else);
                tags.AddRange(this.Else.GetChildTagsByTagName(tagName));
            }
            return tags;
        }
        #endregion

        #region 属性定义
        /// <summary>
        /// 来源数据的变量
        /// </summary>
        public VariableExpression From { get; protected set; }
        /// <summary>
        /// 当前项变量
        /// </summary>
        public VariableIdentity Item { get; protected set; }
        /// <summary>
        /// 索引变量
        /// </summary>
        public VariableIdentity Index { get; protected set; }

        /// <summary>
        /// 分组大小
        /// </summary>
        public Attribute GroupSize
        {
            get
            {
                return this.Attributes["GroupSize"];
            }
        }

        /// <summary>
        /// ForEachElse节点
        /// </summary>
        private ForEachElseTag _Else;
        /// <summary>
        /// ForEachElse节点
        /// </summary>
        public ForEachElseTag Else
        {
            get { return _Else; }
            internal set
            {
                if (value != null) value.Parent = this;
                _Else = value;
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
                case "from":
                    VariableExpression ve = item.Value as VariableExpression;
                    if (ve == null && this.OwnerDocument.DocumentConfig.CompatibleMode)
                    {
                        ve = ParserHelper.CreateVariableExpression(this.OwnerTemplate, item.Text, false);
                    }
                    this.From = ve;
                    break;
                case "item":
                    this.Item = ParserHelper.CreateVariableIdentity(this.OwnerTemplate, item.Text);
                    break;
                case "index":
                    this.Index = ParserHelper.CreateVariableIdentity(this.OwnerTemplate, item.Text);
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
            IEnumerable array = Utility.GetResolvedDataSource(this.From.GetValue());
            int index = 0;
            LoopIndex li = new LoopIndex(0);
            if (this.Index != null) this.Index.Value = li;
            if (array != null)
            {
                IEnumerator list = array.GetEnumerator();
                int groupSize = this.GroupSize == null ? 0 : Utility.ConverToInt32(this.GroupSize.GetTextValue());
                if (groupSize > 1) list = Utility.SplitToGroup(list, groupSize);

                list.Reset();
                if (list.MoveNext())
                {
                    li.IsLast = false;
                    while (!li.IsLast)
                    {
                        object v = list.Current;
                        li.Value = ++index;
                        li.IsFirst = (index == 1);
                        li.IsLast = !list.MoveNext();
                        if (this.Index != null) this.Index.Reset();
                        if (this.Item != null) this.Item.Value = v;
                        base.RenderTagData(writer);
                    }
                }
            }
            if (index == 0 && this.Else != null)
            {
                //没有数据则输出Else节点的数据
                this.Else.Render(writer);
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
            if (this.From == null) throw new ParserException(string.Format("{0}标签中缺少from属性", this.TagName));

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
            ForEachTag tag = new ForEachTag(ownerTemplate);
            this.CopyTo(tag);
            tag.Else = this.Else == null ? null : (ForEachElseTag)(this.Else.Clone(ownerTemplate));
            tag.From = this.From == null ? null : (VariableExpression)this.From.Clone(ownerTemplate);
            tag.Index = this.Index == null ? null : this.Index.Clone(ownerTemplate);
            tag.Item = this.Item == null ? null : this.Item.Clone(ownerTemplate);

            return tag;
        }
        #endregion
    }
}
