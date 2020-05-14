/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  VariableCollection
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Collections.Specialized;

namespace VTemplate.Engine
{
    /// <summary>
    /// 变量集合
    /// </summary>
    public class VariableCollection
        : IEnumerable<Variable>
    {
        /// <summary>
        /// 构造默认集合
        /// </summary>
        internal VariableCollection()
        {
            _Dictionary = new Dictionary<string, Variable>(StringComparer.InvariantCultureIgnoreCase);
        }

        /// <summary>
        /// 构造一定容量的集合
        /// </summary>
        /// <param name="capacity"></param>
        public VariableCollection(int capacity)
        {
            _Dictionary = new Dictionary<string, Variable>(capacity, StringComparer.InvariantCultureIgnoreCase);
        }

        /// <summary>
        /// 存放容器
        /// </summary>
        private Dictionary<string, Variable> _Dictionary;

        /// <summary>
        /// 返回某个索引位置的变量
        /// </summary>
        /// <param name="index">索引值</param>
        /// <returns>如果存在此索引位置值,则返回其变量值否则返回null</returns>
        public Variable this[int index]
        {
            get
            {
                if (index >= 0 && index < _Dictionary.Count)
                {
                    IEnumerator<Variable> enumer = _Dictionary.Values.GetEnumerator();
                    int i = 0;
                    while (enumer.MoveNext())
                    {
                        if (i == index)
                        {
                            return enumer.Current;
                        }

                        i++;
                    }                    
                }
                return null;
            }
        }

        /// <summary>
        /// 返回某个名称的量
        /// </summary>
        /// <param name="name">量名称</param>
        /// <returns>如果存在此量,则返回其量否则返回null</returns>
        public Variable this[string name]
        {
            get
            {
                if (string.IsNullOrEmpty(name)) return null;

                Variable value;
                bool success = _Dictionary.TryGetValue(name, out value);
                if (!success) value = null;

                return value;
            }
        }

        /// <summary>
        /// 添加某个变量
        /// </summary>
        /// <param name="item">量元素</param>
        internal void Add(Variable item)
        {
            if (item == null) return;

            //判断是否存在某个值,如果存在则更新
            if (Contains(item.Name))
            {
                _Dictionary[item.Name] = item;
            }
            else
            {
                _Dictionary.Add(item.Name, item);
            }
        }

        /// <summary>
        /// 清空所有属性值
        /// </summary>
        internal void Clear()
        {
            _Dictionary.Clear();
        }

        /// <summary>
        /// 判断是否存在某个属性
        /// </summary>
        /// <param name="name">要判断的变量名称</param>
        /// <returns>存在则返回true否则返回false</returns>
        public bool Contains(string name)
        {
            return _Dictionary.ContainsKey(name);
        }

        /// <summary>
        /// 返回属性数目
        /// </summary>
        public int Count
        {
            get
            {
                return _Dictionary.Count;
            }
        }

        #region 设置某个变量的值
        /// <summary>
        /// 设置某个变量或变量表达式的值
        /// </summary>
        /// <param name="varExp">变量名(如:"user")或变量表达式(如"user.age"则表示设置user变量的age属性/字段值)</param>
        /// <param name="value">变量值</param>
        /// <remarks>
        /// 不管变量表达式中的定义的"属性"或"字段"是否存在于变量实例.都可以设置值.
        /// </remarks>
        public void SetValue(string varExp, object value)
        {
            if (string.IsNullOrEmpty(varExp)) throw new ArgumentNullException("varExp");
            string[] exps = varExp.Split(".".ToCharArray(), 2);

            Variable var = this[exps[0]];
            if (var != null)
            {
                if (exps.Length == 1)
                {
                    var.Value = value;
                }
                else if (exps.Length == 2)
                {
                    var.SetExpValue(exps[1], value);
                }
            }
        }
        #endregion

        #region IEnumerable<Variable> 成员
        /// <summary>
        /// 返回当前对象的迭代器
        /// </summary>
        /// <returns></returns>
        public IEnumerator<Variable> GetEnumerator()
        {
            return this._Dictionary.Values.GetEnumerator();
        }

        #endregion

        #region IEnumerable 成员
        /// <summary>
        /// 返回当前对象的迭代器
        /// </summary>
        /// <returns></returns>
        IEnumerator IEnumerable.GetEnumerator()
        {
            return this._Dictionary.Values.GetEnumerator();
        }

        #endregion
    }
}
