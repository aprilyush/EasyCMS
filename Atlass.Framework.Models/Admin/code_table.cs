using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using FreeSql.DataAnnotations;

namespace Atlass.Framework.Models.Admin
{
	public class code_table
    {

		[JsonProperty, Column(IsPrimary = true,IsIdentity =true)]
		public int id { get; set; }

		/// <summary>
		/// 数据库
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string db_name { get; set; } = string.Empty;

		/// <summary>
		/// 表描述
		/// </summary>
		[JsonProperty]
		public string remark { get; set; } = string.Empty;

		/// <summary>
		/// 首次同步时间
		/// </summary>
		[JsonProperty, Column(DbType = "datetime")]
		public DateTime sync_time { get; set; }

		/// <summary>
		/// 表名
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string table_name { get; set; } = string.Empty;
		/// <summary>
		/// 生成代码，实体类名称
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string entity_name { get; set; } = string.Empty;

		/// <summary>
		/// 表类型 0-表，1-视图，2-存储过程
		/// </summary>
		[JsonProperty, Column(DbType = "int(2)")]
		public int table_type { get; set; }

		/// <summary>
		/// 最新同步时间
		/// </summary>
		[JsonProperty, Column(DbType = "datetime")]
		public DateTime update_time { get; set; }


		/// <summary>
		///表字段
		/// </summary>
		[JsonProperty, Column(IsIgnore =true)]
		public List<code_column> columns { get; set; }
	}
}
