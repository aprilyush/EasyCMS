using Atlass.Framework.Cache;
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
    public class GenerateHome
    {
        private readonly GenerateContentAppService _generateContentApp;
        public GenerateHome()
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
        public void GenerateHomeHtml()
        {
            try
            {

                var templateModel = TemplateManagerCache.GetHomeTemplate();
                if (templateModel.id==0)
                {
                    throw new Exception("找不到模板");
                }
                //加载模板
                //this.LoadTemplate(templateModel.template_content);
                string templateFile = Path.Combine(GlobalParamsDto.WebRoot, templateModel.template_file);
                this.Document = new TemplateDocument(templateModel.template_content, GlobalParamsDto.WebRoot, templateFile);
                this.Document.Variables.SetValue("this", this);
                //设置顶部导航条数据
                var navigations = _generateContentApp.GetChannelTree();
                this.Document.Variables.SetValue("navigations", navigations);

                //获取栏目文章模板
                ElementCollection<Template> templates = this.Document.GetChildTemplatesByName("channels");
                foreach (Template template in templates)
                {
                    string total = template.Attributes.GetValue("total", "10");
                    //根据模板块里定义的type属性条件取得新闻数据
                    var data = _generateContentApp.GetContentSummary(template.Attributes.GetValue("type"),1,int.Parse(total));
                    //设置变量newsdata的值
                    template.Variables.SetValue("contents", data);

                    //取得模板块下Id为newslist的标签(也即是在cnblogs_newsdata.html文件中定义的foreach标签)
                    //Tag tag = template.GetChildTagById("newslist");
                    //if (tag is ForEachTag)
                    //{
                    //    //如果标签为foreach标签则设置其BeforeRender事件用于设置变量表达式{$:#.news.url}的值
                    //    tag.BeforeRender += new System.ComponentModel.CancelEventHandler(Tag_BeforeRender);
                    //}
                }

                string contentFilePath = Path.Combine(GlobalParamsDto.WebRoot, "index.html");
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

       
    }
}
