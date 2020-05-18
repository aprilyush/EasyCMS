using Atlass.Framework.Common;
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

        /// <summary>
        /// 返回渲染后的模板文件
        /// </summary>
        /// <param name="content"></param>
        /// <param name="template"></param>
        /// <returns></returns>
        public (bool genStatus,string contentHtml) GenerateContentHtml(ContentModel content,cms_template template)
        {
            try
            {
                this.LoadTemplate(template.template_content);
                this.InitPageTemplate(content);
                return (true, this.Document.GetRenderText());
            }
            catch(Exception ex)
            {
                LogNHelper.Exception(ex);
               
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


                //加载模板
                this.LoadTemplateFile(templatePath);
                //this.InitPageTemplate(content);

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

        protected virtual void LoadTemplate(string templateContent)
        {
            this.Document = new TemplateDocument(templateContent);
        }
        protected virtual void InitPageTemplate(ContentModel content)
        {
            this.Document.Variables.SetValue("this", this);
            this.Document.Variables.SetValue("news", content);
        }
    }
}
