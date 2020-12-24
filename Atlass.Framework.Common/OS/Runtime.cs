using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;

namespace Atlass.Framework.Common
{
    public class Runtime
    {
        #region 系统特性
        /// <summary>是否Mono环境</summary>
        public static Boolean Mono { get; } = Type.GetType("Mono.Runtime") != null;

        /// <summary>是否Web环境</summary>
        public static Boolean IsWeb => false;

        /// <summary>是否Windows环境</summary>
        public static Boolean Windows => RuntimeInformation.IsOSPlatform(OSPlatform.Windows);

        /// <summary>是否Linux环境</summary>
        public static Boolean Linux() {
           return RuntimeInformation.IsOSPlatform(OSPlatform.OSX) || RuntimeInformation.IsOSPlatform(OSPlatform.Linux);
        }

        /// <summary>是否OSX环境</summary>
       // public static Boolean OSX => RuntimeInformation.IsOSPlatform(OSPlatform.OSX);

        #endregion
    }
}
