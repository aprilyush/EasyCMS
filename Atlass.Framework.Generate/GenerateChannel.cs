using Atlass.Framework.Cache;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.ViewModels;
using System;
using System.Collections.Generic;
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
                //加载模板
                //this.LoadTemplate(templateModel.template_content);"Template/Channel"
                string templateFile = Path.Combine(GlobalParamsDto.WebRoot,templateModel.template_file);
                this.Document = new TemplateDocument(templateModel.template_content, templateFile);
                this.Document.Variables.SetValue("this", this);

                Tag element = this.Document.GetChildTagById("contents");
                string total = element.Attributes.GetValue("total", "8");
                
                var contents = _generateContentApp.GetContentSummary(channelId, 1, int.Parse(total));
                //设置变量newsdata的值
                this.Document.Variables.SetValue("channel", channel);
                this.Document.Variables.SetValue("contents", contents);

                string renderHtml = this.Document.GetRenderText();
                return (true, renderHtml);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);

            }
            return (false, null);
        }

        /// <summary>
        /// 当前页面的模板文档的配置参数
        /// </summary>
        protected virtual TemplateDocumentConfig DocumentConfig
        {
            get
            {
                return TemplateDocumentConfig.Default;
            }
        }

        /// <summary>
        /// 装载模板文件
        /// </summary>
        /// <param name="fileName"></param>
        protected virtual void LoadTemplateFile(string fileName)
        {
            this.Document = null;

            this.Document = new TemplateDocument(fileName, Encoding.UTF8, this.DocumentConfig);

        }

        protected virtual void LoadTemplate(string templateContent)
        {
            //this.Document = new TemplateDocument(templateContent);
        }
        protected virtual void InitPageTemplate(ContentModel content)
        {
            this.Document.Variables.SetValue("this", this);
            this.Document.Variables.SetValue("news", content);
        }
    }
}
