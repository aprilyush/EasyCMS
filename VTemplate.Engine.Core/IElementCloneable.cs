/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  IElementClonable
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 支持元素的深度克隆的接口定义
    /// </summary>
    public interface ICloneableElement<T>
    {
        /// <summary>
        /// 克隆元素
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <returns></returns>
        T Clone(Template ownerTemplate);
    }
}
