/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ElseTag
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine
{
    /// <summary>
    /// Else标签..只适用于if标签内.如&lt;vt:if var="member.age" value="20" compare="&lt;="&gt;..&lt;vt:else&gt;..&lt;/vt:if&gt;
    /// </summary>
    public class ElseTag : IfConditionTag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal ElseTag(Template ownerTemplate)
            : base(ownerTemplate)
        {}

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "else"; }
        }

        /// <summary>
        /// 返回此标签是否是单一标签.即是不需要配对的结束标签
        /// </summary>
        internal override bool IsSingleTag
        {
            get { return true; }
        }
        #endregion
        
        #region 重写IfConditionTag方法
        /// <summary>
        /// else节点不支持比较值
        /// </summary>
        public override ElementCollection<IExpression> Values
        {
            get
            {
                return null;
            }
        }
        /// <summary>
        /// else节点不支持条件变量
        /// </summary>
        public override VariableExpression VarExpression
        {
            get
            {
                return null;
            }
        }

        /// <summary>
        /// 永远返回true
        /// </summary>
        /// <returns></returns>
        internal override bool IsTestSuccess()
        {
            return true;
        }
        #endregion

        #region 解析标签数据
        /// <summary>
        /// 解析标签数据
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
            //判断标签的容器是否为IfTag标签
            if (!(container is IfTag)) throw new ParserException(string.Format("未找到和{0}标签对应的{1}标签", this.TagName, this.EndTagName));

            IfTag ifTag = (IfTag)container;
            if (ifTag.Else != null) throw new ParserException(string.Format("{0}标签不能定义多个{1}标签", this.EndTagName, this.TagName));

            //加入到If标签的Else节点
            ifTag.Else = this;

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
            ElseTag tag = new ElseTag(ownerTemplate);
            this.CopyTo((IfConditionTag)tag);
            return tag;
        }
        #endregion
    }
}
