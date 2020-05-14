/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ExpressionException
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine.Evaluator
{
    /// <summary>
    /// 表达式错误
    /// </summary>
    public class ExpressionException
        : Exception
    {
        /// <summary>
        /// 
        /// </summary>
        public ExpressionException()
        { }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="message"></param>
        public ExpressionException(string message)
            : base(message)
        { }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="message"></param>
        /// <param name="innerException"></param>
        public ExpressionException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }
}
