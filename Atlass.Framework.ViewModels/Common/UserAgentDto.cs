using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels.Common
{
    public class UserAgentDto
    {
        /// <summary>
        ///浏览器信息
        /// </summary>
        public string Browser { get; set; }
        /// <summary>
        /// 设备信息
        /// </summary>
        public string Device { get; set; }
        /// <summary>
        /// 操作系统
        /// </summary>
        public string OS { get; set; }
        /// <summary>
        /// 访问ip
        /// </summary>
        public string Ip { get; set; }
        /// <summary>
        /// 获取ip纯真库的地址数据
        /// </summary>
        public string Address { get; set; }
    }
}
