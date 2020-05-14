/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ExpressionParser
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine.Evaluator
{
    /// <summary>
    /// 表达式解析器
    /// </summary>
    public class ExpressionParser
    {
        /// <summary>
        /// 构造表达式解析器
        /// </summary>
        /// <param name="expression">要分析的表达式,如"1+2+3+4"</param>
        public ExpressionParser(string expression)
        {
            this._Expression = expression;
            this._Position = 0;
        }

        /// <summary>
        /// 当前分析的表达式
        /// </summary>
        private string _Expression;
        /// <summary>
        /// 返回当前分析的表达式
        /// </summary>
        public string Expression
        {
            get
            {
                return _Expression;
            }
        }
        /// <summary>
        /// 当前读取的位置
        /// </summary>
        private int _Position;
        /// <summary>
        /// 返回当前读取的位置
        /// </summary>
        public int Position
        {
            get
            {
                return _Position;
            }
        }

        /// <summary>
        /// 读取下一个表达式节点,如果读取失败则返回null
        /// </summary>
        /// <returns></returns>
        public ExpressionNode ReadNode()
        {
            //空格的位置
            int whileSpacePos = -1;

            StringBuilder buffer = new StringBuilder(10);
            while (this._Position < this._Expression.Length)
            {
                char c = this._Expression[this._Position];

                //空白字符不处理
                if (ExpressionNode.IsWhileSpace(c))
                {
                    //判断两次的空白字符是否连续
                    if (whileSpacePos >= 0 && (this._Position - whileSpacePos) > 1)
                    {
                        throw new ExpressionException(string.Format("表达式\"{0}\"在位置({1})上的字符非法!", this._Expression, this._Position));
                    }
                    else
                    {
                        if (buffer.Length == 0)
                        {
                            //前空白不判断处理
                            whileSpacePos = -1;
                        }
                        else
                        {
                            whileSpacePos = this._Position;
                        }
                        this._Position++;
                    }
                    continue;
                }

                if (buffer.Length == 0 || ExpressionNode.IsCongener(c, buffer[buffer.Length - 1]))
                {
                    //同一类字符则继续读取字符
                    this._Position++;
                    buffer.Append(c);
                }
                else
                {
                    break;
                }

                //判断是否需要更多的操作符
                if (!ExpressionNode.NeedMoreOperator(c)) break;
            }

            if (buffer.Length == 0) return null;

            ExpressionNode expNode = new ExpressionNode(buffer.ToString());
            if (expNode.Type == ExpressionNodeType.Unknown)
            {
                throw new ExpressionException(string.Format("表达式\"{0}\"在位置({1})上的字符\"{2}\"非法!",
                    this._Expression, this._Position - expNode.Value.Length, expNode.Value));
            }

            return expNode;
        }
    }
}
