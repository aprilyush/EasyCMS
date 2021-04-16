using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels.YmlConfigs
{
    public class RedisConfigDto
    {

        /// <summary>
        /// 是否启用
        /// </summary>
        public bool Enable { get; set; } = true;
        /// <summary>
        /// host:127.0.0.1:6379
        /// </summary>
        public string Host { get; set; } = "127.0.0.1:6379";
        /// <summary>
        /// redis用户名 redis6.0使用
        /// </summary>
        public string User { get; set; } = "";
        /// <summary>
        /// 密码
        /// </summary>
        public string Password { get; set; } = "";
        /// <summary>
        /// 使用的db 0
        /// </summary>
        public int Db { get; set; } = 0;
        /// <summary>
        /// 最大连接池
        /// </summary>
        public int MaxPoolSize { get; set; } = 200;
        /// <summary>
        /// 最小连接池
        /// </summary>
        public int MinPoolSize { get; set; } = 10;
        /// <summary>
        ///连接超时 ms
        /// </summary>
        public int ConnectTimeout { get; set; } = 5000;
        /// <summary>
        /// 连接名称
        /// </summary>
        public string ConnectionName { get; set; } = "easycms";
        /// <summary>
        /// 前缀
        /// </summary>
        public string PreKey { get; set; } = "{easycms}:";
    }
}
