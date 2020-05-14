/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  IAttributesElement
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    
    /// <summary>
    /// 定义可包含属性的元素
    /// </summary>
    public interface IAttributesElement
    {
        /// <summary>
        /// 返回元素属性集合
        /// </summary>
        AttributeCollection Attributes { get; }
    }
}
