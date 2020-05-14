/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  Variable
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 变量
    /// </summary>
    public class Variable : ICloneableElement<Variable>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <param name="name"></param>
        internal Variable(Template ownerTemplate, string name)
        {
            this.OwnerTemplate = ownerTemplate;
            this.Name = name;
            this.cacheExpItems = new Dictionary<string, object>(StringComparer.InvariantCultureIgnoreCase);
        }

        /// <summary>
        /// 变量的宿主模板
        /// </summary>
        public Template OwnerTemplate { get; private set; }

        /// <summary>
        /// 变量名称
        /// </summary>
        public string Name { get; private set;}

        /// <summary>
        /// 变量的值
        /// </summary>
        private object _Value;
        /// <summary>
        /// 此变量的值
        /// </summary>
        public object Value
        {
            get
            {
                return _Value;
            }
            set
            {
                _Value = value;
                //清空缓存数据
                this.Reset();
            }
        }


        #region 变量值的缓存数据
        /// <summary>
        /// 缓存表达式数据
        /// </summary>
        private Dictionary<string, object> cacheExpItems;
        /// <summary>
        /// 获取缓存的个数
        /// </summary>
        internal int GetCacheCount()
        {
            return cacheExpItems.Count;
        }
        /// <summary>
        /// 添加变量表达式的值
        /// </summary>
        /// <param name="exp">变量表达式.以"."号开始.如".age"则表示此变量下的age属性/字段值</param>
        /// <param name="value"></param>
        internal void AddExpValue(string exp, object value)
        {
            lock (this.cacheExpItems)
            {
                if (this.cacheExpItems.ContainsKey(exp))
                {
                    this.cacheExpItems[exp] = value;
                }
                else
                {
                    this.cacheExpItems.Add(exp, value);
                }
            }
        }
        /// <summary>
        /// 获取变量表达的值
        /// </summary>
        /// <param name="exp"></param>
        /// <param name="exist"></param>
        /// <returns></returns>
        internal object GetExpValue(string exp, out bool exist)
        {
            exist = false;
            object value;
            lock (this.cacheExpItems)
            {
                exist = this.cacheExpItems.TryGetValue(exp, out value);
            }
            return value;
        }

        /// <summary>
        /// 设置变量中某种表达式所表示的值
        /// </summary>
        /// <param name="exp">变量表达式.如"age"则表示此变量下的age属性/字段值,"age.tostring()"则表示此变量下的age属性/字段的值的tostring方法所返回的值</param>
        /// <param name="value"></param>
        public void SetExpValue(string exp, object value)
        {
            if (string.IsNullOrEmpty(exp)) throw new ArgumentNullException("exp");
            this.AddExpValue("." + exp, value);
        }
        /// <summary>
        /// 重设(清空)当前变量中已缓存的表达式值
        /// </summary>
        public void Reset()
        {
            this.cacheExpItems.Clear();
        }
        #endregion


        #region 克隆当前变量对象到新的宿主模板
        /// <summary>
        /// 克隆当前变量对象到新的宿主模板
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <returns></returns>
        public Variable Clone(Template ownerTemplate)
        {
            return new Variable(ownerTemplate, this.Name);
        }
        #endregion
    }
}
