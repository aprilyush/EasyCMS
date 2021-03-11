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
	/// 职位信息
	/// </summary>
	public class sys_position
    {/// <summary>
	 /// 岗位ID
	 /// </summary>
		[JsonProperty, Column(IsPrimary = true, IsIdentity = true)]
		public long id { get; set; }

		/// <summary>
		/// 创建者
		/// </summary>
		[JsonProperty, Column(StringLength = 64)]
		public string create_by { get; set; } = string.Empty;

		/// <summary>
		/// 创建时间
		/// </summary>
		[JsonProperty, Column(DbType = "datetime")]
		public DateTime create_time { get; set; }

		/// <summary>
		/// 岗位编码
		/// </summary>
		[JsonProperty, Column(StringLength = 64)]
		public string post_code { get; set; } = string.Empty;

		/// <summary>
		/// 岗位名称
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string post_name { get; set; } = string.Empty;

		/// <summary>
		/// 显示顺序
		/// </summary>
		[JsonProperty, Column(DbType = "int(4)")]
		public int post_sort { get; set; }

		/// <summary>
		/// 状态（0正常 1停用）
		/// </summary>
		[JsonProperty, Column(DbType = "int(1)")]
		public int post_status { get; set; }

		/// <summary>
		/// 备注
		/// </summary>
		[JsonProperty, Column(StringLength = 500)]
		public string remark { get; set; } = string.Empty;

		/// <summary>
		/// 更新者
		/// </summary>
		[JsonProperty, Column(StringLength = 64)]
		public string update_by { get; set; } = string.Empty;

		/// <summary>
		/// 更新时间
		/// </summary>
		[JsonProperty, Column(DbType = "datetime")]
		public DateTime update_time { get; set; }

	}
}
