using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace Atlass.Framework.Generate
{
    public class ContentModel
    {
		public int id { get; set; }
		/// <summary>
		/// 文字标题
		/// </summary>
		public string title { get; set; } = string.Empty;
		/// <summary>
		/// 副标题
		/// </summary>
		public string sub_title { get; set; } = string.Empty;

		/// <summary>
		/// 文字内容
		/// </summary>
		public string content { get; set; } = string.Empty;

		/// <summary>
		/// 简介
		/// </summary>
		public string summary { get; set; } = string.Empty;
		/// <summary>
		/// 封面图片
		/// </summary>
		public string cover_image { get; set; } = string.Empty;
		/// <summary>
		/// 作者
		/// </summary>
		public string author { get; set; } = string.Empty;

		/// <summary>
		/// 文章来源
		/// </summary>
		public string source { get; set; } = string.Empty;
		/// <summary>
		/// 栏目
		/// </summary>
		public int channel_id { get; set; }

		public int ip_limit { get; set; }

		/// <summary>
		/// 置顶
		/// </summary>
		public int is_top { get; set; }
		/// <summary>
		/// 标签
		/// </summary>
		public string tags { get; set; } = string.Empty;

		/// <summary>
		/// 外部链接
		/// </summary>
		public string content_href { get; set; }

		/// <summary>
		/// 点击量
		/// </summary>
		public int hit_count { get; set; }
	    
		public DateTime publish_time { get; set; }
		public DateTime last_edit_time { get; set; }

         //扩展部分
		 /// <summary>
		 /// 导航部分，首页>新闻中心
		 /// </summary>
		public string navigation { get; set; }


		///// <summary>
		///// 时间格式化函数
		///// </summary>
		///// <param name="date"></param>
		///// <param name="formatter"></param>
		///// <returns></returns>
		//public static string TimeFormatter(this DateTime date,string formatter="yyyy-MM-dd")
		//{
		//	return date.ToString(formatter);
		//}

	}
}
