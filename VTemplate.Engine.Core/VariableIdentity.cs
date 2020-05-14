/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  VariableIdentity
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 变量标识:变量标识由两部分组成,变量前缀(以#号开头)与变量名.如"#.member"或"#user.member".其中变量前缀是可以省略.如"member"
    /// </summary>
    public class VariableIdentity
        : ICloneableElement<VariableIdentity>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <param name="variable"></param>
        /// <param name="prefix"></param>
        public VariableIdentity(Template ownerTemplate, Variable variable, string prefix)
        {
            this.OwnerTemplate = ownerTemplate;
            this.Variable = variable;
            this.Prefix = prefix;
        }
        #region 属性定义
        /// <summary>
        /// 宿主模板
        /// </summary>
        public Template OwnerTemplate { get; private set; }

        /// <summary>
        /// 变量
        /// </summary>
        public Variable Variable { get; private set; }

        /// <summary>
        /// 变量前缀.
        /// </summary>
        public string Prefix { get; private set; }

        /// <summary>
        /// 设置或返回变量的值
        /// </summary>
        public object Value
        {
            get
            {
                return this.Variable.Value;
            }
            set
            {
                this.Variable.Value = value;
            }
        }
        #endregion

        #region 方法定义
        /// <summary>
        /// 设置变量中某种表达式所表示的值
        /// </summary>
        /// <param name="exp">变量表达式.如"age"则表示此变量下的age属性/字段值,"age.tostring()"则表示此变量下的age属性/字段的值的tostring方法所返回的值</param>
        /// <param name="value"></param>
        public void SetExpValue(string exp, object value)
        {
            this.Variable.SetExpValue(exp, value);
        }

        /// <summary>
        /// 重设(清空)当前变量中已缓存的表达式值
        /// </summary>
        public void Reset()
        {
            this.Variable.Reset();
        }
        #endregion

        #region 克隆当前变量对象到新的宿主模板
        /// <summary>
        /// 克隆当前变量对象到新的宿主模板
        /// </summary>
        /// <param name="template"></param>
        /// <returns></returns>
        public VariableIdentity Clone(Template template)
        {
            //获取新的变量
            Template ownerTemplate = Utility.GetOwnerTemplateByPrefix(template, this.Prefix);
            Variable variable = Utility.GetVariableOrAddNew(ownerTemplate, this.Variable.Name);
            return new VariableIdentity(template, variable, this.Prefix);
        }
        #endregion

        #region 输出变量标识的原字符串数据
        /// <summary>
        /// 输出变量标识的原字符串数据,如#.member
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            StringBuilder buffer = new StringBuilder();
            if (this.Prefix != null)
            {
                buffer.AppendFormat("#{0}.", this.Prefix);
            }
            buffer.Append(this.Variable.Name);

            return buffer.ToString();
        }
        #endregion
    }
}
