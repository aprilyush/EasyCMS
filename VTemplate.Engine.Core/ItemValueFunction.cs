/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  GetItemValueFunction
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 项值函数委托
    /// </summary>
    /// <param name="tag"></param>
    /// <returns></returns>
    public delegate object ItemValueFunction(ItemTag tag);

    /// <summary>
    /// 项值函数集合
    /// </summary>
    public class ItemValueFunctionCollection
        : Dictionary<string, ItemValueFunction>
    {
        /// <summary>
        /// 
        /// </summary>
        public ItemValueFunctionCollection()
            : base(StringComparer.InvariantCultureIgnoreCase)
        {

        }

        /// <summary>
        /// 添加与方法名同名的用户自定义函数
        /// </summary>
        /// <param name="type"></param>
        /// <param name="function"></param>
        public new void Add(string type, ItemValueFunction function)
        {
            if (function != null)
            {
                if (this.ContainsKey(type))
                {
                    this[type] = function;
                }
                else
                {
                    base.Add(type, function);
                }
            }
        }
    }
}
