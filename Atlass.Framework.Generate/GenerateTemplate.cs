using Atlass.Framework.Common;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core;
using Atlass.Framework.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Atlass.Framework.Generate
{
    /// <summary>
    /// 模板保存
    /// </summary>
    public static class GenerateTemplate
    {
        private static string HomeDirectory = "Template";//首页模板
        private static string ChannelDirectory = "Template/Channel";//栏目模板
        private static string ContentDirectory = "Template/Content";//内容模板
        //private static string SingleDirectory = "Template/Single";//单页模板
        private static string IncludeDirectory = "Template/include";//包含文件
        /// <summary>
        /// 模板生成
        /// </summary>
        /// <param name="templateType">模板类型，1-首页，2-栏目，3-内容页，4-单页</param>
        /// <param name="templateName">模板文件名称</param>
        /// <param name="templateContent">模板内容</param>
        public static void Create(int templateType,string templateName,string templateContent)
        {
            try
            {

                switch (templateType)
                {
                    case 1:
                        CreateHome(templateName, templateContent);
                        break;
                    case 2:
                        CreateChannel(templateName, templateContent);
                        break;
                    case 3:
                        CreateContent(templateName, templateContent);
                        break;
                    case 4:
                       // CreateContent(templateName, templateContent);
                        break;
                    case 5:
                        CreateInclude(templateName, templateContent);
                        break;
                    default:
                        break;
                }
            }catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
            }
        } 

        /// <summary>
        /// 生成首页模板
        /// </summary>
        /// <param name="templateName"></param>
        /// <param name="templateContent"></param>
        private static void CreateHome(string templateName,string templateContent)
        {
            string filePath = Path.Combine(GlobalContext.WebRootPath, HomeDirectory, templateName);
            FileUtils.WriteText(filePath, templateContent);
        }

        /// <summary>
        /// 生成栏目模板
        /// </summary>
        /// <param name="templateName"></param>
        /// <param name="templateContent"></param>
        private static void CreateChannel(string templateName, string templateContent)
        {
            string filePath = Path.Combine(GlobalContext.WebRootPath, ChannelDirectory, templateName);
            FileUtils.WriteText(filePath, templateContent);
        }

        /// <summary>
        /// 生成内容页模板
        /// </summary>
        /// <param name="templateName"></param>
        /// <param name="templateContent"></param>
        private static void CreateContent(string templateName, string templateContent)
        {
            string filePath = Path.Combine(GlobalContext.WebRootPath, ContentDirectory, templateName);
            FileUtils.WriteText(filePath, templateContent);
        }

        /// <summary>
        /// 生成包含文件
        /// </summary>
        /// <param name="templateName"></param>
        /// <param name="templateContent"></param>
        private static void CreateInclude(string templateName, string templateContent)
        {
            string filePath = Path.Combine(GlobalContext.WebRootPath, IncludeDirectory, templateName);
            FileUtils.WriteText(filePath, templateContent);
        }
    }
}
