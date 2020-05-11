using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace Atlass.Framework.Common
{
    public static class ExtValidate
    {

        /// <summary>
        /// 是否为空的数据id 比如为0或者为空字符串
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static bool EmptyId(this string data)
        {
            if (string.IsNullOrEmpty(data))
            {
                return true;
            }
            if (data == "0")
            {
                return true;
            }

            return false;
        }

    }
}
