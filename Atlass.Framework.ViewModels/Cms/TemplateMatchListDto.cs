using Atlass.Framework.Models.Cms;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Cms
{
    public class TemplateMatchListDto
    {
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string ChannelName { get; set; }
        /// <summary>
        /// 0-的时候取默认模板,栏目模板
        /// </summary>
        public int ChannelTemplate { get; set; }
        /// <summary>
        /// 0-的时候取默认模板，内容模板
        /// </summary>
        public int ContentTemplate { get; set; }
        public string ChannelTemplateName { get; set; }
        public string ContentTemplateName { get; set; }
    }
}
