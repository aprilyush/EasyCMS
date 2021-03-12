using FreeSql.DataAnnotations;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Models.Admin
{
   public  class sys_user_position
    {
		[JsonProperty, Column(IsPrimary = true, IsIdentity = true)]
		public int id { get; set; }

		[JsonProperty, Column(StringLength = 30)]
		public string create_by { get; set; } = string.Empty;

		[JsonProperty, Column(DbType = "datetime")]
		public DateTime create_time { get; set; }

		/// <summary>
		/// 职位id
		/// </summary>
		[JsonProperty]
		public long position_id { get; set; }

		/// <summary>
		/// 用户id
		/// </summary>
		[JsonProperty]
		public long user_id { get; set; }
	}
}
