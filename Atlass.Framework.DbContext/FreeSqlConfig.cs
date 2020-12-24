using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.DbContext
{
    public class FreeSqlConfig : IOptions<FreeSqlConfig>
    {
        /// <summary>
        /// 主库
        /// </summary>
        public string MasterConnetion { get; set; }
        /// <summary>
        /// 从库链接
        /// </summary>
        public List<SlaveConnection> SlaveConnections { get; set; }
        /// <summary>
        /// 数据库类型
        /// </summary>
        public FreeSql.DataType DataType { get; set; }
        public FreeSqlConfig Value => this;
    }
    /// <summary>
    /// 从库链接
    /// </summary>
    public class SlaveConnection
    {
        public string ConnectionString { get; set; }
    }
}
