using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using VTemplate.Engine;

namespace Atlass.Framework.Generate
{
    public class GenerateContent
    {
       
        
        private readonly GenerateAppService _contentApp;
        public GenerateContent()
        {
            _contentApp = new GenerateAppService();
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
        /// 返回渲染后的页面文件
        /// </summary>
        /// <param name="content"></param>
        /// <param name="template"></param>
        /// <returns></returns>
        public (bool genStatus,string contentHtml) GenerateContentHtml(int channelId,int id)
        {
            try
            {
                Stopwatch watcher = new Stopwatch();
                watcher.Start();
                var templateModel = ChannelManagerCache.GetContentTemplate(channelId);
                if (templateModel == null)
                {
                    return (false, "");
                }
                var content = _contentApp.GetContentInfo(id);
                if (content == null)
                {
                    return (false, "");
                }
                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                this.Document = RenderDocumentCache.GetRenderDocument(templateModel.id);
                if (this.Document == null)
                {
                    string templateFile = Path.Combine(GlobalContext.WebRootPath, templateModel.template_file);
                    this.Document = new TemplateDocument(templateModel.template_content, GlobalContext.WebRootPath, templateFile);
                    RenderDocumentCache.AddRenderDocument(templateModel.id, this.Document);
                }

                this.Document.Variables.SetValue("this", this);
                //站点基本信息
                var site = SiteManagerCache.GetSiteInfo();
                this.Document.Variables.SetValue("site", site);
                //设置顶部导航条数据
                var navigations = _contentApp.GetChannelTree();
                this.Document.Variables.SetValue("navigations", navigations);

                //获取当前文章信息
                this.Document.Variables.SetValue("content", content);
                string renderHtml = this.Document.GetRenderText();
                renderHtml = HtmlPlayerHandler.CreateVideo(renderHtml);
                watcher.Stop();
                string msg = $"渲染内容页耗时：{watcher.ElapsedMilliseconds} ms";

                LoggerHelper.Info(msg);
                return (true, renderHtml);
            }
            catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
               
            }
            return (false, "");
        }

        /// <summary>
        /// 加载模板文件，生成模板内容
        /// </summary>
        /// <param name="contentId"></param>
        public void CreateHtml(int contentId)
        {
            try
            {
                var sqlDb = DbInstanceFactory.GetInstance();
                var content = sqlDb.Select<cms_content>().Where(s => s.id == contentId).First();
                if (content == null)
                {
                    return;
                }
                string contentFolder = $@"static/content/{content.channel_id}";
                string contentFile= $@"static/content/{content.channel_id}/{ content.id}.html";
                
                string contentFolderPath = Path.Combine(GlobalContext.WebRootPath, contentFolder);
                string contentFilePath = Path.Combine(GlobalContext.WebRootPath, contentFile);
                string templatePath = Path.Combine(GlobalContext.WebRootPath, "Template/article.html");
                if (!File.Exists(templatePath))
                {
                    LoggerHelper.Exception("模板数据不存在");
                    return;
                }
                if (!Directory.Exists(contentFolderPath))
                {
                    Directory.CreateDirectory(contentFolderPath);
                }


                //加载模板
                //this.LoadTemplateFile(templatePath);
                //this.InitPageTemplate(content);
                //this.Document = new TemplateDocument(templatePath, fileName);

                using (var filestream = new FileStream(contentFilePath, FileMode.Create, FileAccess.ReadWrite))
                {
                    string renderHtml = this.Document.GetRenderText();

                    using (StreamWriter writer = new StreamWriter(filestream, Encoding.UTF8))
                    {

                        writer.WriteLine(renderHtml);
                        writer.Flush();
                    }
                }


            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }
        }

        /// <summary>
        /// 装载模板文件
        /// </summary>
        /// <param name="fileName"></param>
        protected virtual void LoadTemplateFile(string fileName)
        {
            this.Document = null;
            //if ("cache".Equals(this.TestType, StringComparison.InvariantCultureIgnoreCase) || this.IsLoadCacheTemplate)
            //{
            //    //测试缓存模板文档
            //    this.Document = TemplateDocument.FromFileCache(fileName, Encoding.UTF8, this.DocumentConfig);
            //}
            //else
            //{
            //    //测试实例模板文档
            //    this.Document = new TemplateDocument(fileName, Encoding.UTF8, this.DocumentConfig);
            //}
            //测试实例模板文档
            //this.Document = new TemplateDocument(fileName, Encoding.UTF8);
        }

        protected virtual void LoadTemplate(string templateContent,string fileName)
        {
            this.Document = new TemplateDocument(templateContent, GlobalContext.WebRootPath,fileName);
        }
        protected virtual void InitPageTemplate(ContentModel content)
        {
            this.Document.Variables.SetValue("this", this);
            this.Document.Variables.SetValue("news", content);
        }
    }
}
