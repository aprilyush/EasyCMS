/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  UserDefinedFunction
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 自定义函数委托
    /// </summary>
    /// <param name="args"></param>
    /// <returns></returns>
    public delegate object UserDefinedFunction(object[] args);

    /// <summary>
    /// 自定义函数集合
    /// </summary>
    public class UserDefinedFunctionCollection
        : Dictionary<string, UserDefinedFunction>
    {
        /// <summary>
        /// 
        /// </summary>
        public UserDefinedFunctionCollection()
            : base(StringComparer.InvariantCultureIgnoreCase)
        {

        }

        /// <summary>
        /// 添加与方法名同名的用户自定义函数
        /// </summary>
        /// <param name="function"></param>
        public void Add(UserDefinedFunction function)
        {
            if (function != null)
                this.Add(function.Method.Name, function);
        }

        /// <summary>
        /// 添加某个用户自定义函数
        /// </summary>
        /// <param name="key"></param>
        /// <param name="function"></param>
        /// <remarks>重写此函数主要是为便于可重复添加多次同名的自定义函数(但只有最后一次有效)</remarks>
        public new void Add(string key, UserDefinedFunction function)
        {
            lock (this)
            {
                if (base.ContainsKey(key))
                {
                    base[key] = function;
                }
                else
                {
                    base.Add(key, function);
                }
            }
        }
    }
}
