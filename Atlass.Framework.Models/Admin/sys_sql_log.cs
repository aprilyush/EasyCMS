using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Newtonsoft.Json;
using FreeSql.DataAnnotations;

namespace Atlass.Framework.Models
{
    /// <summary>
    /// sql执行日志

    ///</summary>
    [JsonObject(MemberSerialization.OptIn), Table(Name = "sys_sql_log", DisableSyncStructure = true)]
    public class sys_sql_log
    {



        /// <summary>
        ///数据Id
        ///</summary>
        [JsonProperty, Column(DbType = "int(255)", IsPrimary = true, IsIdentity = true)]
        public int id { get; set; } = 0;



        /// <summary>
        ///表名
        ///</summary>
        [JsonProperty, Column(DbType = "varchar(50)")]
        public string table_name { get; set; } = string.Empty;



        /// <summary>
        ///执行sql字符串
        ///</summary>
        [JsonProperty,Column(DbType = "mediumtext")]
        public string sql_string { get; set; } = "";



        /// <summary>
        ///耗时毫秒
        ///</summary>
        [JsonProperty, Column(DbType = "bigint(20)")]
        public long elapsed_time { get; set; } = 0;



        /// <summary>
        ///执行时间
        ///</summary>
        [JsonProperty, Column(DbType = "datetime")]
        public DateTime excute_time { get; set; } = DateTime.Now;


    }
}
