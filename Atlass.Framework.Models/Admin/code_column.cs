using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using FreeSql.DataAnnotations;

namespace Atlass.Framework.Models.Admin
{
	/// <summary>
	/// 代码生成，表的字段信息
	/// </summary>
	public class code_column
    {
		[JsonProperty, Column(IsPrimary = true, IsIdentity = true)]
		public int id { get; set; }

		/// <summary>
		/// 是否可空，0-不可空，1-可空
		/// </summary>
		[JsonProperty, Column(DbType = "int(3)")]
		public int can_null { get; set; }

		/// <summary>
		/// 字段名称
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string column_name { get; set; } = string.Empty;

		/// <summary>
		/// 字段描述
		/// </summary>
		[JsonProperty]
		public string comment { get; set; } = string.Empty;

		/// <summary>
		/// C# 类型
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string cstype { get; set; } = string.Empty;

		/// <summary>
		/// 数据库枚举类型int值
		/// </summary>
		[JsonProperty, Column(DbType = "int(10)")]
		public int dbtype { get; set; }
		/// <summary>
		/// 最大长度
		/// </summary>
		public int max_length { get; set; }
		/// <summary>
		/// 自增 0-不是，1-是
		/// </summary>
		[JsonProperty, Column(DbType = "int(10)")]
		public int is_identity { get; set; }

		/// <summary>
		/// 主键 0-不是，1-是
		/// </summary>
		[JsonProperty, Column(DbType = "int(10)")]
		public int? is_primary { get; set; }

		/// <summary>
		/// 字段位置
		/// </summary>
		[JsonProperty]
		public int sort_num { get; set; }

		/// <summary>
		/// 同步时间
		/// </summary>
		[JsonProperty, Column(DbType = "datetime")]
		public DateTime sync_time { get; set; }

		/// <summary>
		/// 表名
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string table_name { get; set; } = string.Empty;

		/// <summary>
		/// 数据库类型，字符串，varchar
		/// </summary>
		[JsonProperty]
		public string type_text { get; set; } = string.Empty;

		/// <summary>
		/// 数据库类型，字符串，varchar(255)
		/// </summary>
		[JsonProperty]
		public string type_text_full { get; set; } = string.Empty;

		/// <summary>
		/// 最新时间
		/// </summary>
		[JsonProperty, Column(DbType = "datetime")]
		public DateTime update_time { get; set; }

	}
}
