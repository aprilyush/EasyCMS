using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.ViewModels;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using VTemplate.Engine;

namespace Atlass.Framework.Generate
{
    public class GenerateChannel
    {
        private readonly GenerateContentAppService _generateContentApp;
        public GenerateChannel()
        {
            _generateContentApp = new GenerateContentAppService();
        }
        /// <summary>
        /// 当前页面的模板文档对象
        /// </summary>
        protected TemplateDocument Document
        {
            get;
            private set;
        }

        /// <summary>
        /// 返回渲染后的模板文件
        /// </summary>
        /// <param name="content"></param>
        /// <param name="template"></param>
        /// <returns></returns>
        public (bool genStatus,string contentHtml) GenerateChannelHtml(int channelId)
        {
            try
            {
                //Stopwatch watcher = new Stopwatch();
                //watcher.Start();
                var channel = _generateContentApp.GetChannel(channelId);
                if (channel == null)
                {
                    return (false,null);
                }
                var templateModel = TemplateManagerCache.GetChannelTemplate(channel.channel_template);
                if (templateModel == null)
                {
                    return(false, null);
                }

                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                //this.LoadTemplate(templateModel.template_content);"Template/Channel"
                this.Document = RenderDocumentCache.GetRenderDocument(templateModel.id);
                if (this.Document == null)
                {
                    string templateFile = Path.Combine(GlobalParamsDto.WebRoot, templateModel.template_file);
                    this.Document = new TemplateDocument(templateModel.template_content, GlobalParamsDto.WebRoot, templateFile);
                    RenderDocumentCache.AddRenderDocument(templateModel.id, this.Document);
                }
                
                this.Document.Variables.SetValue("this", this);
                //站点数据
                var site = SiteManagerCache.GetSiteInfo();
                site.site_title = channel.channel_name;
                this.Document.Variables.SetValue("site", site);
                //设置顶部导航条数据
                var navigations = _generateContentApp.GetChannelTree(channelId);
                this.Document.Variables.SetValue("navigations", navigations);

                //解析文章列表模板设置数据源
                Tag element = this.Document.GetChildTagById("contents");
                string total = element.Attributes.GetValue("total", "8");
                
                var contents = _generateContentApp.GetContentSummary(channelId, 1, int.Parse(total));
                //设置变量newsdata的值
                this.Document.Variables.SetValue("channel", channel);
                this.Document.Variables.SetValue("contents", contents);

                string renderHtml = this.Document.GetRenderText();


                //watcher.Stop();
                //string msg = $"渲染栏目耗时：{watcher.ElapsedMilliseconds} ms";

                //LogNHelper.Info(msg);

                return (true, renderHtml);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);

            }
            return (false, null);
        }

    }
}
