using Atlass.Framework.Cache;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core;
using Atlass.Framework.Generate.Dto;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VTemplate.Engine;

namespace Atlass.Framework.Generate
{
    public class GenerateService
    {
        /// <summary>
        /// 1-生成首页，2-生成栏目，3-内容，4-单文件
        /// </summary>
        private int RenderMode = 1;
        private readonly GenerateAppService generateApp;
        public GenerateService()
        {
            generateApp = new GenerateAppService();
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
        /// 生成静态文档，channelId和contentId都为0的时候生成首页
        /// </summary>
        /// <param name="contentId">文章id</param>
        /// <param name="channelId">栏目id</param>
        /// <param name="channelPage">栏目页的分页页面</param>
        /// <returns></returns>
        public GenerateResultDto GenerateHtml(int contentId,int channelId,int channelPage)
        {
            GenerateResultDto ret = new GenerateResultDto();
            try
            {
               
                //获取模板信息
                cms_template templateModel = null;
                ChannelModel channelModel = null;
                ContentModel contentModel = null;
                if (channelId == 0 && contentId == 0)
                {
                    templateModel = TemplateManagerCache.GetHomeTemplate();
                    RenderMode = 1;
                }
                else if (channelId > 0)
                {
                    channelModel = generateApp.GetChannel(channelId);
                    templateModel = ChannelManagerCache.GetChannelTemplate(channelId);
                    if (channelModel == null)
                    {
                        ret.Message = "栏目数据查找失败";
                        return ret;
                    }
                    RenderMode = 2;
                }
                else if (contentId > 0)
                {
                    contentModel = generateApp.GetContentInfo(contentId);
                    channelModel = generateApp.GetChannel(contentModel.channel_id);
                    templateModel = ChannelManagerCache.GetContentTemplate(contentModel.channel_id); 

                    if (contentModel == null)
                    {
                        ret.Message = "内容数据查找失败";
                        return ret;
                    }
                   
                    RenderMode = 3;
                }

                if (templateModel==null||templateModel.id == 0)
                {
                    throw new Exception("找不到模板");
                }

                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                this.Document = RenderDocumentCache.GetRenderDocument(templateModel.id);
                if (this.Document == null)
                {
                    string templateFile = Path.Combine(GlobalContext.WebRootPath, templateModel.template_file);
                    this.Document = new TemplateDocument(templateModel.template_content, GlobalContext.WebRootPath, templateFile);
                    RenderDocumentCache.AddRenderDocument(templateModel.id, this.Document);
                }

                #region 公用数据
                //加入基本信息
                this.Document.Variables.SetValue("this", this);
                //站点基本信息
                var site = SiteManagerCache.GetSiteInfo();
                this.Document.Variables.SetValue("site", site);
                //添加所有导航条数据
                var channels = generateApp.GetChannelTree();
                this.Document.Variables.SetValue("channels", channels);

                //解析模板中的栏目文章模板
                ElementCollection<Template> templateContents = this.Document.GetChildTemplatesByName("contents");
                foreach (Template template in templateContents)
                {
                    //从第几条数据开始
                    string startNum= template.Attributes.GetValue("startNum", "1");
                    string total = template.Attributes.GetValue("total", "10");
                    //根据模板块里定义的type属性条件取得新闻数据
                    var data = generateApp.GetContentSummary(template.Attributes.GetValue("channelIndex"),int.Parse(startNum), int.Parse(total));
                    //设置变量newsdata的值
                    template.Variables.SetValue("contents", data);
                }

                //解析模板中的channel标签
                ElementCollection<Template> templateChannel = this.Document.GetChildTemplatesByName("channel");
                foreach (Template template in templateChannel)
                {
                    string channelIndex = template.Attributes.GetValue("channelIndex", "#");
                    //根据模板块里定义的type属性条件取得新闻数据
                    var channel = ChannelManagerCache.GetChannelByIndex(channelIndex);
                    if (channel != null)
                    {
                        ChannelModel inChannelModel = generateApp.GetChannel(channel.id);
                        //设置变量newsdata的值
                        template.Variables.SetValue("channel", inChannelModel);
                    }

                }
                #endregion

                //渲染首页
                if (RenderMode == 1)
                {
                    string contentFilePath = Path.Combine(GlobalContext.WebRootPath, "index.html");
                    using (var filestream = new FileStream(contentFilePath, FileMode.Create, FileAccess.ReadWrite))
                    {
                        string renderHtml = this.Document.GetRenderText();

                        using (StreamWriter writer = new StreamWriter(filestream, Encoding.UTF8))
                        {

                            writer.WriteLine(renderHtml);
                            writer.Flush();
                        }
                    }

                    ret.Status = true;
                    return ret;
                }
                //栏目数据
                if (RenderMode == 2)
                {
                   
                    //获取当前栏目下的文章列表
                    //解析文章列表模板设置数据源 添加id为contents 模板
                    Tag element = this.Document.GetChildTagById("contents");
                    int total = int.Parse(element.Attributes.GetValue("total", "8"));
                    int startNum= int.Parse(element.Attributes.GetValue("startNum", "1"));//从第几条开始
                    //跳过多少条数据
                    int skipNum = (channelPage - 1) * total + (startNum - 1);
                    var channelContents=generateApp.GetContentSummaryByChannelId(channelId, skipNum, total);


                    this.Document.Variables.SetValue("contents", channelContents);
                    this.Document.Variables.SetValue("channel", channelModel);

                    string renderHtml = this.Document.GetRenderText();
                    ret.Status = true;
                    ret.Html = renderHtml;
                    return ret;
                }
                //文章数据
                if (RenderMode == 3)
                {
                    this.Document.Variables.SetValue("channel", channelModel);
                    this.Document.Variables.SetValue("content", contentModel);
                    //渲染内容数据
                    string renderHtml = this.Document.GetRenderText();
                    renderHtml = HtmlPlayerHandler.CreateVideo(renderHtml);
                    ret.Status = true;
                    ret.Html = renderHtml;
                    return ret;
                }

            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

            return ret;
        }
    }
}
