/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  VariableField
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 变量表达式,如:{$:name.age} 变量元素中的变量表达式则是".age"
    /// </summary>
    public class VariableExpression : IExpression
    {
        /// <summary>
        /// 变量表达式
        /// </summary>
        /// <param name="variableId"></param>
        /// <param name="needCacheData"></param>
        internal VariableExpression(VariableIdentity variableId, bool needCacheData) 
            : this(variableId, null, false, needCacheData)
        { }
        /// <summary>
        /// 变量表达式
        /// </summary>
        /// <param name="variableId"></param>
        /// <param name="fieldName"></param>
        /// <param name="isMethod"></param>
        /// <param name="needCacheData"></param>
        internal VariableExpression(VariableIdentity variableId, string fieldName, bool isMethod, bool needCacheData)
        {
            this.VariableId = variableId;
            this.FieldName = fieldName;
            this.IsMethod = isMethod;
            this.NeedCacheData = needCacheData;
        }
        /// <summary>
        /// 变量表达式
        /// </summary>
        /// <param name="parentExp"></param>
        /// <param name="fieldName"></param>
        /// <param name="isMethod"></param>
        internal VariableExpression(VariableExpression parentExp, string fieldName, bool isMethod)
        {
            parentExp.NextExpression = this;
            this.ParentExpression = parentExp;
            this.VariableId = parentExp.VariableId;
            this.FieldName = fieldName;
            this.IsMethod = isMethod;
            this.NeedCacheData = parentExp.NeedCacheData;
        }
        /// <summary>
        /// 变量标识
        /// </summary>
        public VariableIdentity VariableId { get; private set; }
        /// <summary>
        /// 字段名
        /// </summary>
        public string FieldName { get; private set; }
        /// <summary>
        /// 是否是方法
        /// </summary>
        public bool IsMethod { get; private set; }

        /// <summary>
        /// 是否需要缓存数据
        /// </summary>
        /// <remarks>一般在变量标签出现的变量表达式的值都需要缓存.其它地方出现的则不需要缓存</remarks>
        private bool NeedCacheData { get; set; }

        /// <summary>
        /// 取得父级表达式
        /// </summary>
        private VariableExpression ParentExpression { get; set; }
        /// <summary>
        /// 取得下一个表达式
        /// </summary>
        private VariableExpression NextExpression { get; set; }

        /// <summary>
        /// 取得此变量字段的值
        /// </summary>
        /// <returns></returns>
        public object GetValue()
        {
            return this.GetValue(this.VariableId.Value);
        }
        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private object GetValue(object data)
        {
            if (Utility.IsNothing(data) && this.VariableId.Variable.GetCacheCount() == 0) return data;

            object value = data;
            if (!string.IsNullOrEmpty(this.FieldName))
            {
                bool exist;
                //优先从缓存中获取数据
                List<string> paths = new List<string>();
                VariableExpression exp = this;
                while (exp!= null)
                {
                    paths.Add(exp.IsMethod ? exp.FieldName + "()" : exp.FieldName);
                    exp = exp.ParentExpression;
                }
                paths.Reverse();
                string expPath = string.Join(".", paths.ToArray());

                value = this.VariableId.Variable.GetExpValue(expPath, out exist);
                if (!exist && !Utility.IsNothing(data))
                {
                    //缓存数据不存在.则从实体取数据
                    if (this.IsMethod)
                    {
                        value = Utility.GetMethodResult(data, this.FieldName, out exist);
                    }
                    else
                    {
                        value = Utility.GetPropertyValue(data, this.FieldName, out exist);
                    }
                    //如果需要的话就缓存数据
                    if(this.NeedCacheData)
                        this.VariableId.Variable.AddExpValue(expPath, value);
                }
            }

            if (this.NextExpression != null)
            {
                return this.NextExpression.GetValue(value);
            }
            else
            {
                return value;
            }
        }

        #region 输出标签数据
        /// <summary>
        /// 输出表达式的原字符串数据
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            StringBuilder buffer = new StringBuilder();
            buffer.Append(this.VariableId.ToString());

            VariableExpression exp = this;
            while (exp != null)
            {
                if (!string.IsNullOrEmpty(exp.FieldName))
                {
                    buffer.Append(".");
                    buffer.Append(exp.FieldName);
                    if (exp.IsMethod) buffer.Append("()");
                }
                exp = exp.NextExpression;
            }
            return buffer.ToString();
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
            VariableIdentity variableId = this.VariableId.Clone(ownerTemplate);
            VariableExpression exp = new VariableExpression(variableId, this.FieldName, this.IsMethod, this.NeedCacheData);
            if (this.NextExpression != null)
            {
                exp.NextExpression = (VariableExpression)(this.NextExpression.Clone(ownerTemplate));
                exp.NextExpression.ParentExpression = exp;
            }
            return exp;
        }

        #endregion
    }
}
