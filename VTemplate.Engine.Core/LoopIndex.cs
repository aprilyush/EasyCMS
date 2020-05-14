/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  LoopIndex
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 循环索引
    /// </summary>
    public class LoopIndex : IConvertible, IComparable
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        public LoopIndex(decimal value)
        {
            this.Value = value;
        }

        /// <summary>
        /// 值
        /// </summary>
        public decimal Value { get; internal set; }

        /// <summary>
        /// 是否是第一个索引值
        /// </summary>
        public bool IsFirst { get; internal set; }

        /// <summary>
        /// 是否是最后一个索引值
        /// </summary>
        public bool IsLast { get; internal set; }

        /// <summary>
        /// 是否是偶数索引值
        /// </summary>
        public bool IsEven
        {
            get
            {
                return (this.Value % 2) == 0;
            }
        }

        /// <summary>
        /// 获取此索引值的字符串表现形式
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return this.Value.ToString();
        }

        #region IConvertible 成员
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public TypeCode GetTypeCode()
        {
            return this.Value.GetTypeCode();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public bool ToBoolean(IFormatProvider provider)
        {
            return Convert.ToBoolean(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public byte ToByte(IFormatProvider provider)
        {
            return Convert.ToByte(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public char ToChar(IFormatProvider provider)
        {
            return Convert.ToChar(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public DateTime ToDateTime(IFormatProvider provider)
        {
            return Convert.ToDateTime(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public decimal ToDecimal(IFormatProvider provider)
        {
            return Convert.ToDecimal(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public double ToDouble(IFormatProvider provider)
        {
            return Convert.ToDouble(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public short ToInt16(IFormatProvider provider)
        {
            return Convert.ToInt16(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public int ToInt32(IFormatProvider provider)
        {
            return Convert.ToInt32(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public long ToInt64(IFormatProvider provider)
        {
            return Convert.ToInt64(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public sbyte ToSByte(IFormatProvider provider)
        {
            return Convert.ToSByte(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public float ToSingle(IFormatProvider provider)
        {
            return Convert.ToSingle(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public string ToString(IFormatProvider provider)
        {
            return Convert.ToString(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="conversionType"></param>
        /// <param name="provider"></param>
        /// <returns></returns>
        public object ToType(Type conversionType, IFormatProvider provider)
        {
            return ((IConvertible)this.Value).ToType(conversionType, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public ushort ToUInt16(IFormatProvider provider)
        {
            return Convert.ToUInt16(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public uint ToUInt32(IFormatProvider provider)
        {
            return Convert.ToUInt32(this.Value, provider);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="provider"></param>
        /// <returns></returns>
        public ulong ToUInt64(IFormatProvider provider)
        {
            return Convert.ToUInt64(this.Value, provider);
        }

        #endregion

        #region IComparable 成员
        /// <summary>
        /// 比较器
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public int CompareTo(object obj)
        {
            if (obj == null || obj == DBNull.Value) return 1;
            decimal d;
            if (!(obj is decimal))
            {
                d = Utility.ConverToDecimal(obj);
            }
            else
            {
                d = (decimal)obj;
            }
            return this.Value.CompareTo(d);
        }

        #endregion
    }
}
