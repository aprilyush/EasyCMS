/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  FunctionTag
 *
 * ***********************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Reflection;

namespace VTemplate.Engine
{
    /// <summary>
    /// 函数调用标签.如: &lt;vt:function var="MaxAge" method="Max" type="System.Math" args="$user1.age" args="$user2.age" /&gt;
    /// </summary>
    public class FunctionTag : Tag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        internal FunctionTag(Template ownerTemplate)
            : base(ownerTemplate)
        {
            this.FunctionArgs = new ElementCollection<IExpression>();
        }

        #region 重写Tag的方法
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "function"; }
        }
        /// <summary>
        /// 返回此标签是否是单一标签.即是不需要配对的结束标签
        /// </summary>
        internal override bool IsSingleTag
        {
            get { return false; }
        }
        #endregion

        #region 属性定义
        /// <summary>
        /// 参与函数运算的参数列表
        /// </summary>
        public virtual ElementCollection<IExpression> FunctionArgs { get; protected set; }

        /// <summary>
        /// 调用的方法
        /// </summary>
        public Attribute Method
        {
            get
            {
                return this.Attributes["Method"];
            }
        }

        /// <summary>
        /// 包含方法的类型
        /// </summary>
        public Attribute Type
        {
            get
            {
                return this.Attributes["Type"];
            }
        }

        /// <summary>
        /// 存储表达式结果的变量
        /// </summary>
        public VariableIdentity Variable { get; protected set; }

        /// <summary>
        /// 是否输出此标签的结果值
        /// </summary>
        public bool Output { get; protected set; }
        #endregion

        #region 添加标签属性时的触发函数.用于设置自身的某些属性值
        /// <summary>
        /// 添加标签属性时的触发函数.用于设置自身的某些属性值
        /// </summary>
        /// <param name="name"></param>
        /// <param name="item"></param>
        protected override void OnAddingAttribute(string name, Attribute item)
        {
            switch (name)
            {
                case "args":
                    this.FunctionArgs.Add(item.Value);
                    break;
                case "var":
                    this.Variable = ParserHelper.CreateVariableIdentity(this.OwnerTemplate, item.Text);
                    break;
                case "output":
                    this.Output = Utility.ConverToBoolean(item.Text);
                    break;
            }
        }
        #endregion

        #region 呈现本元素的数据
        /// <summary>
        /// 呈现本元素的数据
        /// </summary>
        /// <param name="writer"></param>
        protected override void RenderTagData(System.IO.TextWriter writer)
        {
            object value = this.GetFunctionResult();
            if (this.Variable != null) this.Variable.Value = value;

            if (this.Output && value != null) writer.Write(value);
            base.RenderTagData(writer);
        }

        /// <summary>
        /// 获取函数的结果
        /// </summary>
        /// <returns></returns>
        private object GetFunctionResult()
        {
            //计算表达式的值
            object value = null;
            List<object> funcParams = new List<object>();
            List<Type>   funcParamsTypes = new List<Type>();
            foreach (IExpression exp in this.FunctionArgs)
            {
                object expValue = exp.GetValue();
                funcParams.Add(expValue);
                funcParamsTypes.Add(expValue == null ? typeof(object) : expValue.GetType());
            }

            string invokeMethod = this.Method.GetTextValue();
            if (this.Type == null)
            {
                //调用自定义函数
                UserDefinedFunction func;
                if (this.OwnerTemplate.UserDefinedFunctions.TryGetValue(invokeMethod, out func))
                {
                    value = func(funcParams.ToArray());
                }
            }
            else
            {
                //如果类型定义的是变量表达式则获取表达式的值,否则建立类型
                object container = this.Type.Value is VariableExpression ? this.Type.Value.GetValue() : Utility.CreateType(this.Type.Value.GetValue().ToString());

                if (container != null)
                {
                    System.Type type = container is System.Type ? (System.Type)container : container.GetType();
                    BindingFlags flags = BindingFlags.Static | BindingFlags.Public | BindingFlags.IgnoreCase;
                    if (!(container is System.Type)) flags |= BindingFlags.Instance;

                    MethodInfo method = type.GetMethod(invokeMethod, flags, null, funcParamsTypes.ToArray(), null);
                    if (method == null)
                    {
                        //获取所有同名的方法
                        MemberInfo[] methods = type.GetMember(invokeMethod, flags | BindingFlags.InvokeMethod);
                        foreach (MethodInfo m in methods)
                        {
                            ParameterInfo[] parameters = m.GetParameters();
                            if (parameters.Length == 1
                                && parameters[0].ParameterType.IsArray
                                && parameters[0].ParameterType.FullName == "System.Object[]")
                            {
                                //如果函数只有一个参数,并且是Object数组参数
                                try
                                {
                                    value = m.Invoke(container is System.Type ? null : container, new object[] { funcParams.ToArray() });
                                    //不出错.则退出查找
                                    break;
                                }
                                catch (TargetInvocationException e)
                                {
                                    throw new Exception(string.Format("在执行标签“{0}”的方法时出错", this.ToString()), e);
                                }
                                catch { }
                            }
                            else if (parameters.Length == funcParams.Count)
                            {
                                //尝试转换类型
                                List<object> paramValues = new List<object>();
                                for (var i = 0; i < parameters.Length; i++)
                                {
                                    object v = funcParams[i];
                                    if (parameters[i].ParameterType != funcParamsTypes[i] && v != null)
                                    {
                                        v = Utility.ConvertTo(funcParams[i].ToString(), parameters[i].ParameterType);
                                        if (v == null) break;   //转换失败则尝试下一个方法

                                        paramValues.Add(v);
                                    }
                                    else
                                    {
                                        paramValues.Add(v);
                                    }
                                }
                                if (paramValues.Count == parameters.Length)
                                {
                                    try
                                    {
                                        value = m.Invoke(container is System.Type ? null : container, paramValues.ToArray());
                                        //不出错.则退出查找
                                        break;
                                    }
                                    catch (TargetInvocationException e)
                                    {
                                        throw new Exception(string.Format("在执行标签“{0}”的方法时出错", this.ToString()), e);
                                    }
                                    catch { }
                                }
                                paramValues.Clear();
                            }
                        }
                    }
                    else
                    {
                        //执行方法
                        try
                        {
                            value = method.Invoke(container is System.Type ? null : container, funcParams.ToArray());
                        }
                        catch (TargetInvocationException e)
                        {
                            throw new Exception(string.Format("在执行标签“{0}”的方法时出错", this.ToString()), e);
                        }
                        catch
                        {
                            value = null;
                        }
                    }
                }
            }

            return value;
        }
        #endregion

        #region 开始解析标签数据
        /// <summary>
        /// 开始解析标签数据
        /// </summary>
        /// <param name="ownerTemplate">宿主模板</param>
        /// <param name="container">标签的容器</param>
        /// <param name="tagStack">标签堆栈</param>
        /// <param name="text"></param>
        /// <param name="match"></param>
        /// <param name="isClosedTag">是否闭合标签</param>
        /// <returns>如果需要继续处理EndTag则返回true.否则请返回false</returns>
        internal override bool ProcessBeginTag(Template ownerTemplate, Tag container, Stack<Tag> tagStack, string text, ref Match match, bool isClosedTag)
        {
            //if (this.Variable == null && !this.Output) throw new ParserException(string.Format("{0}标签中如果未定义Output属性为true则必须定义var属性", this.TagName));
            if (this.Method == null || string.IsNullOrEmpty(this.Method.Text)) throw new ParserException(string.Format("{0}标签中缺少method属性", this.TagName));

            return base.ProcessBeginTag(ownerTemplate, container, tagStack, text, ref match, isClosedTag);
        }
        #endregion

        #region 克隆当前元素到新的宿主模板
        /// <summary>
        /// 克隆当前元素到新的宿主模板
        /// </summary>
        /// <param name="ownerTemplate"></param>
        /// <returns></returns>
        internal override Element Clone(Template ownerTemplate)
        {
            FunctionTag tag = new FunctionTag(ownerTemplate);
            this.CopyTo(tag);
            tag.Variable = this.Variable == null ? null : this.Variable.Clone(ownerTemplate);
            tag.Output = this.Output;
            foreach (IExpression exp in this.FunctionArgs)
            {
                tag.FunctionArgs.Add(exp.Clone(ownerTemplate));
            }
            return tag;
        }
        #endregion
    }
}
