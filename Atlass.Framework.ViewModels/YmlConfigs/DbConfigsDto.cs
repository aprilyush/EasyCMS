using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels.YmlConfigs
{
    /// <summary>
    /// 数据库配置
    /// </summary>
    public class DbConfigsDto
    {
        /// <summary>
        /// 是否启用
        /// </summary>
        public bool Enable { get; set; }
        /// <summary>
        /// 数据库类型 0:mysql,1:sqlserver,2:postgresql,3:oracle,4:sqlite
        /// </summary>
        public FreeSql.DataType DataType { get; set; }
        /// <summary>
        /// 连接字符串
        /// </summary>
        public string MasterConnection { get; set; }
        public List<string> SlaveConnections { get; set; }
    }
}
