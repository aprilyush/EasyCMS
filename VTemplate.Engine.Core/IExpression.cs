/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  IExpression
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 表达式接口
    /// </summary>
    public interface IExpression : ICloneableElement<IExpression>
    {
        /// <summary>
        /// 获取表达式的值
        /// </summary>
        /// <returns></returns>
        object GetValue();
    }
}
