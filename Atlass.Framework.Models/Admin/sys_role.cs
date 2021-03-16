
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Newtonsoft.Json;
using FreeSql.DataAnnotations;

namespace Atlass.Framework.Models {

	
	public partial class sys_role {


		[JsonProperty, Column(IsPrimary = true)]
		public long id { get; set; }

		/// <summary>
		/// 创建人
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string create_person { get; set; } = string.Empty;

		/// <summary>
		/// 创建时间
		/// </summary>
		[JsonProperty]
		public DateTime create_time { get; set; }

		/// <summary>
		/// 备注
		/// </summary>
		[JsonProperty]
		public string remark { get; set; } = string.Empty;

		/// <summary>
		/// 角色编码
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string role_code { get; set; } = string.Empty;

		/// <summary>
		/// 角色名称
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string role_name { get; set; } = string.Empty;

		/// <summary>
		/// 排序
		/// </summary>
		[JsonProperty]
		public int role_sort { get; set; }

		/// <summary>
		/// 角色状态(0:正常，1:禁用)
		/// </summary>
		[JsonProperty, Column(DbType = "int(1)")]
		public int role_status { get; set; }

		/// <summary>
		/// 超管(1:是，0:不是)
		/// </summary>
		[JsonProperty, Column(DbType = "int(1)")]
		public int role_super { get; set; }
	}

}
