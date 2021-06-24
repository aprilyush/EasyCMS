using FreeSql.DataAnnotations;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Models.Admin
{
    /// <summary>
    /// 定时任务执行结果
    ///</summary>
    [JsonObject(MemberSerialization.OptIn), Table(Name = "crontab_history", DisableSyncStructure = true)]
    public class crontab_history
    {



        /// <summary>
        ///
        ///</summary>
        [JsonProperty, Column(DbType = "int(11)", IsPrimary = true, IsIdentity = true)]
        public int id { get; set; } = 0;



        /// <summary>
        ///任务id
        ///</summary>
        [JsonProperty, Column(DbType = "varchar(24)")]
        public string job_id { get; set; } = string.Empty;



        /// <summary>
        ///执行时间
        ///</summary>
        [JsonProperty, Column(DbType = "datetime")]
        public DateTime excute_time { get; set; } = DateTime.Now;



        /// <summary>
        ///直接结果：0-正常，1-异常
        ///</summary>
        [JsonProperty, Column(DbType = "int(5)")]
        public int excute_result { get; set; } = 0;



        /// <summary>
        ///执行耗时
        ///</summary>
        [JsonProperty, Column(DbType = "varchar(30)")]
        public string elapsed_time { get; set; } = string.Empty;



        /// <summary>
        ///异常信息
        ///</summary>
        [JsonProperty, Column(StringLength = -1)]
        public string error_message { get; set; }
    }
}
