using DotLiquid;
using NewLife.Log;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Test.model;

namespace Test
{
    public class DotliquidRenderTest
    {

        /// <summary>
        /// 渲染模板
        /// </summary>
        public static void Render()
        {
         
            try
            {
                cms_channel site = new cms_channel();
                //string file = Environment.CurrentDirectory + "home.html";
                // var template = File.ReadAllText(file);

                // 根据路径读取模板内容
                //var templateStr = Template.FileSystem.ReadTemplateFile(new Context(CultureInfo.InvariantCulture),file);
                //// 解析模板，这里可以缓存Parse出来的对象，但是为了简单这里就略去了
                //var template = Template.Parse(templateStr, Hash.FromAnonymousObject(new { name = "World" });

                //var result = template.Render();
                //System.Reflection.FieldInfo[] fieldsInfo = site.GetType().GetFields(BindingFlags.Public | BindingFlags.Instance);
                PropertyInfo[] fieldsInfo = site.GetType().GetProperties();
                List<string> fields = new List<string>();

                foreach(PropertyInfo fieldInfo in fieldsInfo)
                {
                    fields.Add(fieldInfo.Name);
                }

                //Template.RegisterSafeType(typeof(cms_channel), fields.ToArray());
                Template.RegisterSafeType(typeof(cms_channel),x=>x);
                var template = Template.Parse("Hello, {{ site.site_description}}!,fuck：{{site.site_keyword}}");
                //var result = template.Render(Hash.FromAnonymousObject(new{ site1=site }));
                var result = template.Render(Hash.FromAnonymousObject(new { site = site }));
                XTrace.WriteLine(result);
            }
            catch(Exception ex)
            {
                XTrace.WriteLine(ex.Message);
            }
        }
    }
}
