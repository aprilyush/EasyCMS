/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ExpressionNodeType
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine.Evaluator
{
    /// <summary>
    /// 表达式节点的类型
    /// </summary>
    public enum ExpressionNodeType
    {
        /// <summary>
        /// 未知
        /// </summary>
        Unknown,
        /// <summary>
        /// +
        /// </summary>
        Plus,
        /// <summary>
        /// -
        /// </summary>
        Subtract,
        /// <summary>
        /// *
        /// </summary>
        MultiPly,
        /// <summary>
        /// /
        /// </summary>
        Divide,
        /// <summary>
        /// (
        /// </summary>
        LParentheses,
        /// <summary>
        /// )
        /// </summary>
        RParentheses,
        /// <summary>
        /// % (求模,取余)
        /// </summary>
        Mod,
        /// <summary>
        /// ^ (次幂)
        /// </summary>
        Power,
        /// <summary>
        /// &amp; (按位与)
        /// </summary>
        BitwiseAnd,
        /// <summary>
        /// | (按位或)
        /// </summary>
        BitwiseOr,
        /// <summary>
        /// &amp;&amp; (逻辑与)
        /// </summary>
        And,
        /// <summary>
        /// || (逻辑或)
        /// </summary>
        Or,
        /// <summary>
        /// ! (逻辑非)
        /// </summary>
        Not,
        /// <summary>
        /// == (相等)
        /// </summary>
        Equal,
        /// <summary>
        /// != 或 &lt;&gt; (不等于)
        /// </summary>
        Unequal,
        /// <summary>
        /// &gt; (大于)
        /// </summary>
        GT,
        /// <summary>
        /// &lt; (小于)
        /// </summary>
        LT,
        /// <summary>
        /// &gt;= (大于等于)
        /// </summary>
        GTOrEqual,
        /// <summary>
        /// &lt;= (小于等于)
        /// </summary>
        LTOrEqual,
        /// <summary>
        /// &lt;&lt; (左移位)
        /// </summary>
        LShift,
        /// <summary>
        /// &gt;&gt; (右移位)
        /// </summary>
        RShift,
        /// <summary>
        /// 数值
        /// </summary>
        Numeric
    }
}
