using FreeSql.DataAnnotations;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Models.Admin
{
	public class login_info
    {
		[JsonProperty, Column(IsPrimary = true, IsIdentity = true)]
		public int id { get; set; }

		/// <summary>
		/// 浏览器信息
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string browser { get; set; } = string.Empty;

		/// <summary>
		/// 设备信息
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string device_info { get; set; } = string.Empty;

		/// <summary>
		/// 日志内容
		/// </summary>
		[JsonProperty]
		public string login_message { get; set; } = string.Empty;

		/// <summary>
		/// 登录名
		/// </summary>
		[JsonProperty, Column(StringLength = 30)]
		public string login_name { get; set; } = string.Empty;

		/// <summary>
		/// 0-失败，1-成功
		/// </summary>
		[JsonProperty, Column(DbType = "int(255)")]
		public int login_status { get; set; }

		/// <summary>
		/// 操作系统
		/// </summary>
		[JsonProperty, Column(StringLength = 50)]
		public string osinfo { get; set; } = string.Empty;

		/// <summary>
		/// 真实地址
		/// </summary>
		[JsonProperty]
		public string real_address { get; set; } = string.Empty;

		/// <summary>
		/// ip
		/// </summary>
		[JsonProperty, Column(StringLength = 20)]
		public string request_ip { get; set; } = string.Empty;

		/// <summary>
		/// 访问时间
		/// </summary>
		[JsonProperty, Column(DbType = "datetime")]
		public DateTime request_time { get; set; }
	}
}
