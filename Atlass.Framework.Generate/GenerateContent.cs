using Atlass.Framework.Common.NLog;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using System;
using System.IO;
using System.Text;
using VTemplate.Engine;

namespace Atlass.Framework.Generate
{
    public class GenerateContent
    {
        /// <summary>
        /// 当前页面的模板文档对象
        /// </summary>
        protected TemplateDocument Document
        {
            get;
            private set;
        }

        public void CreateHtml(int contentId)
        {
            try
            {
                var sqlDb = FreesqlDbInstance.GetInstance();
                var content = sqlDb.Select<cms_content>().Where(s => s.id == contentId).First();
                if (content == null)
                {
                    return;
                }
                string contentFolder = $@"static/content/{content.channel_id}";
                string contentFile= $@"static/content/{content.channel_id}/{ content.id}.html";
                
                string contentFolderPath = Path.Combine(GlobalParamsDto.WebRoot, contentFolder);
                string contentFilePath = Path.Combine(GlobalParamsDto.WebRoot, contentFile);
                string templatePath = Path.Combine(GlobalParamsDto.WebRoot, "Template/article.html");
                if (!File.Exists(templatePath))
                {
                    LogNHelper.Exception("模板数据不存在");
                    return;
                }
                if (!Directory.Exists(contentFolderPath))
                {
                    Directory.CreateDirectory(contentFolderPath);
                }

                FileInfo file = new FileInfo(contentFilePath);

                FileStream filestream = null;
                 if (!file.Exists)
                    {
                    filestream= file.Create();
                }
                else
                {
                    filestream = file.OpenWrite();
                }
               
                //加载模板
                this.LoadTemplateFile(templatePath);
                this.InitPageTemplate(content);
                string renderHtml =this.Document.GetRenderText();

                using (StreamWriter writer = new StreamWriter(filestream, Encoding.UTF8))
                {
                  
                    writer.WriteLine(renderHtml);
                }
                filestream.Close();
                filestream.Dispose();
                 

            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
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
            this.Document = new TemplateDocument(fileName, Encoding.UTF8, this.DocumentConfig);
        }

        protected virtual void InitPageTemplate(cms_content content)
        {
            this.Document.Variables.SetValue("this", this);
            this.Document.Variables.SetValue("news", content);
        }
    }
}
