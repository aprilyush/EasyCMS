/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ElementCollection
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 元素集合
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class ElementCollection<T> : IEnumerable<T> 
    {
        /// <summary>
        /// 存储空间
        /// </summary>
        private List<T> _List;

        #region 构造函数
        /// <summary>
        /// 构造默认的集合
        /// </summary>
        internal ElementCollection()
        {
            _List = new List<T>();
        }
        /// <summary>
        /// 构造初始含有一定数量的集合
        /// </summary>
        /// <param name="capacity">初始容量</param>
        internal ElementCollection(int capacity)
        {
            _List = new List<T>(capacity);
        }
        /// <summary>
        /// 构造集合
        /// </summary>
        /// <param name="collection">要复制的集合列表</param>
        internal ElementCollection(IEnumerable<T> collection)
        {
            _List = new List<T>(collection);
        }
        #endregion

        #region 返回数据
        /// <summary>
        /// 返回某个索引位置的数据
        /// </summary>
        /// <param name="index">索引位置</param>
        /// <returns></returns>
        public T this[int index]
        {
            get
            {
                return _List[index];
            }
        }
        #endregion

        #region IEnumerable<T> 成员
        /// <summary>
        /// 返回当前对象的迭代器
        /// </summary>
        /// <returns></returns>
        public IEnumerator<T> GetEnumerator()
        {
            return _List.GetEnumerator();
        }

        #endregion

        #region IEnumerable 成员
        /// <summary>
        /// 返回当前对象的迭代器
        /// </summary>
        /// <returns></returns>
        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return _List.GetEnumerator();
        }

        #endregion

        #region 添加元素
        /// <summary>
        /// 添加元素
        /// </summary>
        /// <param name="element">模板元素</param>
        internal virtual void Add(T element)
        {
            _List.Add(element);
        }

        /// <summary>
        /// 批量添加元素
        /// </summary>
        /// <param name="collection">集合数据,不可以为null</param>
        internal virtual void AddRange(IEnumerable<T> collection)
        {
            _List.AddRange(collection);
        }
        #endregion

        #region 返回数目
        /// <summary>
        /// 返回当前拥有的数目
        /// </summary>
        public int Count
        {
            get
            {
                return _List.Count;
            }
        }
        #endregion

        #region 清空元素
        /// <summary>
        /// 清空数据
        /// </summary>
        internal void Clear()
        {
            _List.Clear();
        }
        #endregion
    }
}
