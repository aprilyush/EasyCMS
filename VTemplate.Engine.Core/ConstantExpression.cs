/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ConstantExpression
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 常数表达式.
    /// </summary>
    public class ConstantExpression : IExpression
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        public ConstantExpression(object value)
        {
            this.Value = value;
        }

        #region IExpression 成员
        /// <summary>
        /// 常数值
        /// </summary>
        private object Value { get; set; }
        /// <summary>
        /// 获取常数的值
        /// </summary>
        /// <returns></returns>
        public object GetValue()
        {
            return this.Value;
        }

        /// <summary>
        /// 输出为字符串
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return this.Value == null ? string.Empty : this.Value.ToString();
        }
        #endregion

        #region ICloneableElement<IExpression> 成员
        /// <summary>
        /// 克隆表达式
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <returns></returns>
        public IExpression Clone(Template ownerTemplate)
        {
            //常量表达式不会被模板外部修改.所以不进行数据克隆
            return this;
        }

        #endregion
    }
}
