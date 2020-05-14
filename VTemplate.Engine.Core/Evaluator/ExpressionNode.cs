/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ExpressionNode
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace VTemplate.Engine.Evaluator
{
    /// <summary>
    /// 表达式的节点(如操作数或运算符)
    /// </summary>
    public class ExpressionNode
    {
        /// <summary>
        /// 构造节点实例
        /// </summary>
        /// <param name="value">操作数或运算符</param>
        public ExpressionNode(string value)
        {
            this._Value = value;
            this._Type = ParseNodeType(value);
            this._PRI = GetNodeTypePRI(this.Type);
            this._Numeric = null;
        }

        private string _Value;
        /// <summary>
        /// 返回当前节点的操作数
        /// </summary>
        public string Value
        {
            get
            {
                return _Value;
            }
        }

        private ExpressionNodeType _Type;
        /// <summary>
        /// 返回当前节点的类型
        /// </summary>
        public ExpressionNodeType Type
        {
            get
            {
                return _Type;
            }
            internal set
            {
                _Type = value;
            }
        }

        private int _PRI;
        /// <summary>
        /// 返回当前节点的优先级
        /// </summary>
        public int PRI
        {
            get
            {
                return _PRI;
            }
        }

        private object _Numeric;
        /// <summary>
        /// 返回此节点的数值
        /// </summary>
        public object Numeric
        {
            get
            {
                if (_Numeric == null)
                {
                    if (this.Type != ExpressionNodeType.Numeric) return 0;

                    decimal value = Convert.ToDecimal(this.Value);

                    if (this.UnitaryNode != null)
                    {
                        switch (this.UnitaryNode.Type)
                        {
                            case ExpressionNodeType.Subtract:
                                value = 0 - value;
                                break;
                        }
                    }

                    _Numeric = value;
                }
                return _Numeric;
            }
            internal set
            {
                _Numeric = value;
                _Value = _Numeric.ToString();
            }
        }

        private ExpressionNode _UnitaryNode;
        /// <summary>
        /// 设置或返回与当前节点相关联的一元操作符节点
        /// </summary>
        public ExpressionNode UnitaryNode
        {
            get
            {
                return _UnitaryNode;
            }
            set
            {
                _UnitaryNode = value;
            }
        }

        #region 静态方法与属性
        /// <summary>
        /// 解析节点类型
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static ExpressionNodeType ParseNodeType(string value)
        {
            if (string.IsNullOrEmpty(value)) return ExpressionNodeType.Unknown;

            switch (value)
            {
                case "+":
                    return ExpressionNodeType.Plus;
                case "-":
                    return ExpressionNodeType.Subtract;
                case "*":
                    return ExpressionNodeType.MultiPly;
                case "/":
                    return ExpressionNodeType.Divide;
                case "%":
                    return ExpressionNodeType.Mod;
                case "^":
                    return ExpressionNodeType.Power;
                case "(":
                    return ExpressionNodeType.LParentheses;
                case ")":
                    return ExpressionNodeType.RParentheses;
                case "&":
                    return ExpressionNodeType.BitwiseAnd;
                case "|":
                    return ExpressionNodeType.BitwiseOr;
                case "&&":
                    return ExpressionNodeType.And;
                case "||":
                    return ExpressionNodeType.Or;
                case "!":
                    return ExpressionNodeType.Not;
                case "==":
                    return ExpressionNodeType.Equal;
                case "!=":
                case "<>":
                    return ExpressionNodeType.Unequal;
                case ">":
                    return ExpressionNodeType.GT;
                case "<":
                    return ExpressionNodeType.LT;
                case ">=":
                    return ExpressionNodeType.GTOrEqual;
                case "<=":
                    return ExpressionNodeType.LTOrEqual;
                case "<<":
                    return ExpressionNodeType.LShift;
                case ">>":
                    return ExpressionNodeType.RShift;
                default:
                    //判断是否操作数
                    if (IsNumerics(value))
                    {
                        return ExpressionNodeType.Numeric;
                    }
                    else
                    {
                        return ExpressionNodeType.Unknown;
                    }
            }
        }

        /// <summary>
        /// 获取各节点类型的优先级
        /// </summary>
        /// <param name="nodeType"></param>
        /// <returns></returns>
        private static int GetNodeTypePRI(ExpressionNodeType nodeType)
        {
            switch (nodeType)
            {
                case ExpressionNodeType.LParentheses:
                case ExpressionNodeType.RParentheses:
                    return 9;
                //逻辑非是一元操作符,所以其优先级较高
                case ExpressionNodeType.Not:
                    return 8;
                case ExpressionNodeType.Mod:
                    return 7;
                case ExpressionNodeType.MultiPly:
                case ExpressionNodeType.Divide:
                case ExpressionNodeType.Power:
                    return 6;
                case ExpressionNodeType.Plus:
                case ExpressionNodeType.Subtract:
                    return 5;
                case ExpressionNodeType.LShift:
                case ExpressionNodeType.RShift:
                    return 4;
                case ExpressionNodeType.BitwiseAnd:
                case ExpressionNodeType.BitwiseOr:
                    return 3;
                case ExpressionNodeType.Equal:
                case ExpressionNodeType.Unequal:
                case ExpressionNodeType.GT:
                case ExpressionNodeType.LT:
                case ExpressionNodeType.GTOrEqual:
                case ExpressionNodeType.LTOrEqual:
                    return 2;
                case ExpressionNodeType.And:
                case ExpressionNodeType.Or:
                    return 1;
                default:
                    return 0;
            }
        }

        /// <summary>
        /// 判断某个操作数是否是数值
        /// </summary>
        /// <param name="op"></param>
        /// <returns></returns>
        public static bool IsNumerics(string op)
        {
            return Numerics.IsMatch(op);
        }

        /// <summary>
        /// 判断某个字符后是否需要更多的操作符
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public static bool NeedMoreOperator(char c)
        {
            switch (c)
            {
                case '&':
                case '|':
                case '=':
                case '!':
                case '>':
                case '<':
                case '.':   //小数点
                    return true;
            }
            //数字则需要更多
            return char.IsDigit(c);
        }

        /// <summary>
        /// 判断两个字符是否是同一类
        /// </summary>
        /// <param name="c1"></param>
        /// <param name="c2"></param>
        /// <returns></returns>
        public static bool IsCongener(char c1, char c2)
        {
            if (c1 == '(' || c2 == '(') return false;
            if (c1 == ')' || c2 == ')') return false;

            if (char.IsDigit(c1) || c1 == '.')
            {
                //c1为数字,则c2也为数字
                return (char.IsDigit(c2) || c2 == '.');
            }
            else
            {
                //c1为非数字,则c2也为非数字
                return !(char.IsDigit(c2) || c2 == '.');
            }
        }

        /// <summary>
        /// 判断某个字符是否是空白字符
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public static bool IsWhileSpace(char c)
        {
            return c == ' ' || c == '\t';
        }

        /// <summary>
        /// 判断是否是一元操作符节点
        /// </summary>
        /// <param name="nodeType"></param>
        /// <returns></returns>
        public static bool IsUnitaryNode(ExpressionNodeType nodeType)
        {
            return (nodeType == ExpressionNodeType.Plus || nodeType == ExpressionNodeType.Subtract);
        }

        /// <summary>
        /// 操作数的正则表达式
        /// </summary>
        private static Regex Numerics = new Regex(@"^[\+\-]?(0|[1-9]\d*|[1-9]\d*\.\d+|0\.\d+)$", RegexOptions.Compiled);
        #endregion
    }
}
