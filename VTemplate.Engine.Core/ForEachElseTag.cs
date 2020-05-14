/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ForEachElseTag
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// ForEachElse标签.如:&lt;vt:foreachelse&gt;...&lt;/vt:foreach&gt;
    /// </summary>
    public class ForEachElseTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal ForEachElseTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
        }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "foreachelse"; }
        }


        /// <summary>
        /// 返回标签的结束标签名称.
        /// </summary>
        public override string EndTagName
        {
            get
            {
                return "foreach";
            }
        }

        /// <summary>
        /// 返回此标签是否是单一标签.即是不需要配对的结束标签
        /// </summary>
        internal override bool IsSingleTag
        {
            get { return true; }
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
            //判断标签的容器是否为ForEach标签
            if (!(container is ForEachTag)) throw new ParserException(string.Format("未找到和{0}标签对应的{1}标签", this.TagName, this.EndTagName));

            ForEachTag foreachTag = (ForEachTag)container;
            if (foreachTag.Else != null) throw new ParserException(string.Format("{0}标签不能定义多个{1}标签", this.EndTagName, this.TagName));

            foreachTag.Else = this;

            return true;
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
            ForEachElseTag tag = new ForEachElseTag(ownerTemplate);
            this.CopyTo(tag);
            return tag;
        }
        #endregion
    }
}
