/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ExpressionEvaluator
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace VTemplate.Engine.Evaluator
{
    /// <summary>
    /// 表达式计算器
    /// </summary>
    public class ExpressionEvaluator
    {
        #region 构造函数
        /// <summary>
        /// 
        /// </summary>
        private ExpressionEvaluator()
        {
        }
        #endregion

        #region 分析表达式

        /// <summary>
        /// 将算术表达式转换为逆波兰表达式
        /// </summary>
        /// <param name="expression">要计算的表达式,如"1+2+3+4"</param>
        private static List<ExpressionNode> ParseExpression(string expression)
        {
            if (string.IsNullOrEmpty(expression)) return new List<ExpressionNode>();

            List<ExpressionNode> listOperator = new List<ExpressionNode>(10);
            Stack<ExpressionNode> stackOperator = new Stack<ExpressionNode>(5);

            ExpressionParser expParser = new ExpressionParser(expression);
            ExpressionNode beforeExpNode = null;       //前一个节点            
            ExpressionNode unitaryNode = null;         //一元操作符
            ExpressionNode expNode;

            //是否需要操作数
            bool requireOperand = false;

            #region 分析表达式

            while ((expNode = expParser.ReadNode()) != null)
            {
                if (expNode.Type == ExpressionNodeType.Numeric)
                {
                    //操作数， 直接加入后缀表达式中
                    if (unitaryNode != null)
                    {
                        //设置一元操作符节点
                        expNode.UnitaryNode = unitaryNode;
                        unitaryNode = null;
                    }

                    listOperator.Add(expNode);
                    requireOperand = false;
                }
                else if (expNode.Type == ExpressionNodeType.LParentheses)
                {
                    //左括号， 直接加入操作符栈
                    stackOperator.Push(expNode);
                }
                else if (expNode.Type == ExpressionNodeType.RParentheses)
                {
                    //右括号则在操作符栈中反向搜索，直到遇到匹配的左括号为止，将中间的操作符依次加到后缀表达式中。
                    ExpressionNode lpNode = null;
                    while (stackOperator.Count > 0)
                    {
                        lpNode = stackOperator.Pop();
                        if (lpNode.Type == ExpressionNodeType.LParentheses) break;
                        listOperator.Add(lpNode);
                    }
                    if (lpNode == null || lpNode.Type != ExpressionNodeType.LParentheses)
                    {
                        throw new ExpressionException(string.Format("在表达式\"{0}\"中没有与在位置({1})上\")\"匹配的\"(\"字符!", expParser.Expression, expParser.Position));
                    }
                }
                else
                {
                    if (stackOperator.Count == 0)
                    {
                        //第一个节点则判断此节点是否是一元操作符"+,-,!,("中的一个,否则其它都非法
                        if (listOperator.Count == 0 &&
                            !(expNode.Type == ExpressionNodeType.LParentheses || expNode.Type == ExpressionNodeType.Not))
                        {
                            //后缀表达式没有任何数据则判断是否是一元操作数
                            if (ExpressionNode.IsUnitaryNode(expNode.Type))
                            {
                                unitaryNode = expNode;
                            }
                            else
                            {
                                //丢失操作数
                                throw new ExpressionException(string.Format("表达式\"{0}\"在位置({1})上缺少操作数!", expParser.Expression, expParser.Position));
                            }
                        }
                        else
                        {
                            //直接压入操作符栈
                            stackOperator.Push(expNode);
                        }
                        requireOperand = true;          //下一个节点需要操作数
                    }
                    else
                    {
                        if (requireOperand)
                        {
                            //如果需要操作数则判断当前的是否是"+","-"号(一元操作符),如果是则继续
                            if (ExpressionNode.IsUnitaryNode(expNode.Type) && unitaryNode == null)
                            {
                                unitaryNode = expNode;
                            }
                            else
                            {
                                //丢失操作数
                                throw new ExpressionException(string.Format("表达式\"{0}\"在位置({1})上缺少操作数!", expParser.Expression, expParser.Position));
                            }
                        }
                        else
                        {
                            //对前面的所有操作符进行优先级比较
                            do
                            {
                                //取得上一次的操作符
                                beforeExpNode = stackOperator.Peek();

                                //如果前一个操作符优先级较高，则将前一个操作符加入后缀表达式中
                                if (beforeExpNode.Type != ExpressionNodeType.LParentheses && (beforeExpNode.PRI - expNode.PRI) >= 0)
                                {
                                    listOperator.Add(stackOperator.Pop());
                                }
                                else
                                {
                                    break;
                                }

                            } while (stackOperator.Count > 0);

                            //将操作符压入操作符栈
                            stackOperator.Push(expNode);
                            requireOperand = true;
                        }
                    }
                }
            }

            if (requireOperand)
            {
                //丢失操作数
                throw new ExpressionException(string.Format("表达式\"{0}\"在位置({1})上缺少操作数!", expParser.Expression, expParser.Position));
            }
            //清空堆栈
            while (stackOperator.Count > 0)
            {
                //取得操作符
                beforeExpNode = stackOperator.Pop();
                if (beforeExpNode.Type == ExpressionNodeType.LParentheses)
                {
                    throw new ExpressionException(string.Format("表达式\"{0}\"中括号不匹配,丢失右括号!", expParser.Expression, expParser.Position));
                }
                listOperator.Add(beforeExpNode);
            }
            #endregion

            return listOperator;
        }

        /// <summary>
        /// 对逆波兰表达式进行计算
        /// </summary>
        /// <param name="nodes"></param>
        /// <returns></returns>
        private static object CalcExpression(List<ExpressionNode> nodes)
        {
            if (nodes == null || nodes.Count == 0) return null;

            #region 计算表达式
            if (nodes.Count > 1)
            {
                int index = 0;
                //储存数据
                ArrayList values = new ArrayList();
                while (index < nodes.Count)
                {
                    ExpressionNode node = nodes[index];

                    switch (node.Type)
                    {
                        //如果是数字，则将值存入 values 中
                        case ExpressionNodeType.Numeric:
                            values.Add(node.Numeric);
                            index++;
                            break;
                        default:
                            //二元表达式，需要二个参数， 如果是Not的话，则只要一个参数
                            int paramCount = 2;
                            if (node.Type == ExpressionNodeType.Not) paramCount = 1;
                            //计算操作数的值
                            if (values.Count < paramCount)
                            {
                                throw new ExpressionException("缺少操作数");
                            }
                            //传入参数
                            object[] data = new object[paramCount];
                            for (int i = 0; i < paramCount; i++)
                            {
                                data[i] = values[index - paramCount + i];
                            }
                            //将计算结果再存入当前节点
                            node.Numeric = Calculate(node.Type, data);
                            node.Type = ExpressionNodeType.Numeric;
                            //将操作数节点删除
                            for (int i = 0; i < paramCount; i++)
                            {
                                nodes.RemoveAt(index - i - 1);
                                values.RemoveAt(index - i - 1);
                            }
                            index -= paramCount;
                            break;
                    }
                }
            }

            if (nodes.Count == 1)
            {
                switch (nodes[0].Type)
                {
                    case ExpressionNodeType.Numeric:
                        return nodes[0].Numeric;
                    default:
                        throw new ExpressionException("缺少操作数");
                }
            }
            else
            {
                throw new ExpressionException("缺少操作符或操作数");
            }
            #endregion
        }

        #region 计算节点的值
        /// <summary>
        /// 计算节点的值
        /// </summary>
        /// <param name="nodeType">节点的类型</param>
        /// <param name="data">要计算的值,有可能是两位或一位数</param>
        /// <returns></returns>
        private static object Calculate(ExpressionNodeType nodeType, object[] data)
        {
            decimal d1, d2;
            bool b1, b2;
            switch (nodeType)
            {
                case ExpressionNodeType.Plus:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 + d2;
                case ExpressionNodeType.Subtract:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 - d2;
                case ExpressionNodeType.MultiPly:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 * d2;
                case ExpressionNodeType.Divide:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    if (d2 == 0) throw new DivideByZeroException();
                    return d1 / d2;
                case ExpressionNodeType.Power:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return Math.Pow((double)d1, (double)d2);
                case ExpressionNodeType.Mod:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    if (d2 == 0) throw new DivideByZeroException();
                    return d1 % d2;
                case ExpressionNodeType.BitwiseAnd:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return (int)d1 & (int)d2;
                case ExpressionNodeType.BitwiseOr:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return (int)d1 | (int)d2;
                case ExpressionNodeType.And:
                    b1 = ConvertToBool(data[0]);
                    b2 = ConvertToBool(data[1]);
                    return b1 && b2;
                case ExpressionNodeType.Or:
                    b1 = ConvertToBool(data[0]);
                    b2 = ConvertToBool(data[1]);
                    return b1 || b2;
                case ExpressionNodeType.Not:
                    b1 = ConvertToBool(data[0]);
                    return !b1;
                case ExpressionNodeType.Equal:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 == d2;
                case ExpressionNodeType.Unequal:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 != d2;
                case ExpressionNodeType.GT:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 > d2;
                case ExpressionNodeType.LT:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 < d2;
                case ExpressionNodeType.GTOrEqual:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 >= d2;
                case ExpressionNodeType.LTOrEqual:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return d1 <= d2;
                case ExpressionNodeType.LShift:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return (long)d1 << (int)d2;
                case ExpressionNodeType.RShift:
                    d1 = ConvertToDecimal(data[0]);
                    d2 = ConvertToDecimal(data[1]);
                    return (long)d1 >> (int)d2;
                default:
                    return 0;
            }
        }
        #endregion

        #region 数据转换
        /// <summary>
        /// 将某个值转换为bool值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static bool ConvertToBool(object value)
        {
            if (value is bool)
            {
                return (bool)value;
            }
            else
            {
                return Convert.ToDecimal(value) == 1;
            }
        }

        /// <summary>
        /// 将某个值转换为decimal值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static decimal ConvertToDecimal(object value)
        {
            if (value is bool)
            {
                return ((bool)value ? 1 : 0);
            }
            else
            {
                return Convert.ToDecimal(value);
            }
        }
        #endregion


        /// <summary>
        /// 对表达式进行计算
        /// </summary>
        /// <param name="expression">要计算的表达式,如"1+2+3+4"</param>
        /// <returns>返回计算结果,如果带有逻辑运算符则返回true/false,否则返回数值</returns>
        public static object Eval(string expression)
        {
            return CalcExpression(ParseExpression(expression));
        }
        #endregion
    }
}
