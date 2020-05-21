using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Generate
{
	public class ChannelModel
    {
		/// <summary>
		/// 外链
		/// </summary>
		public string channel_href { get; set; } = string.Empty;

		/// <summary>
		/// 栏目图片
		/// </summary>
		public string channel_image { get; set; } = string.Empty;

		/// <summary>
		/// 栏目索引
		/// </summary>
		public string channel_index { get; set; } = string.Empty;

		/// <summary>
		/// 栏目名称
		/// </summary>
		public string channel_name { get; set; } = string.Empty;

		public int id { get; set; }
		public int parent_id { get; set; }
		public int sort_num { get; set; }
		/// <summary>
		///  0-的时候取默认模板,栏目模板
		/// </summary>
		public int channel_template { get; set; }
		/// <summary>
		/// 控制渲染 顶部导航渲染标识 0-渲染，1-不渲染 作用是为1时，在渲染顶部导航时可以根据标识不显示
		/// </summary>
		public int dis_drawing { get; set; }

		//扩展
		/// <summary>
		/// 栏目下的文章数据
		/// </summary>
		public List<ContentModel> contents { get; set; }

		/// <summary>
		/// 子栏目数量
		/// </summary>
		public int sub_count { get; set; }
		/// <summary>
		/// 子栏目
		/// </summary>
		public List<ChannelModel> sub_channels { get; set; }
		/// <summary>
		/// 导航
		/// </summary>
		public string navigation { get; set; }
	}
}
