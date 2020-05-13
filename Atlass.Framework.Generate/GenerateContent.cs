using Atlass.Framework.Common.NLog;
using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using System;
using System.IO;
using System.Text;

namespace Atlass.Framework.Generate
{
    public class GenerateContent
    {
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

                FileStream file = null;
                if (File.Exists(contentFilePath))
                {
                    file = File.OpenWrite(contentFilePath);
                }
                else
                {
                    file = File.Create(contentFilePath);
                }

                using (StreamReader reader = new StreamReader(templatePath, Encoding.UTF8))
                {
                    string str = reader.ReadToEnd();
                   
                    using (StreamWriter writer = new StreamWriter(file, Encoding.UTF8))
                    {
                        writer.WriteLine(str);
                    }
                }
                file.Close();
                file.Dispose();
                 

            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
        }
    }
}
