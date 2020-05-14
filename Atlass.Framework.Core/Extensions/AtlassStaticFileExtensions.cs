using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core
{
    public static class AtlassStaticFileExtensions
    {
        public static IApplicationBuilder UseAtlassDefaultFiles(this IApplicationBuilder app, 
            IOptions<Dictionary<string, string>> options)
        {
            var provider = new FileExtensionContentTypeProvider();
            foreach (string key in options.Value.Keys)
            {
                // Console.WriteLine($"新媒体类型：{key},{option.Value[key]}");
                provider.Mappings.Add(key, options.Value[key]);
            }
            DefaultFilesOptions defaultFilesOptions = new DefaultFilesOptions();
            defaultFilesOptions.DefaultFileNames.Add("index.html");
            app.UseDefaultFiles(defaultFilesOptions);
            app.UseStaticFiles(new StaticFileOptions() { ContentTypeProvider = provider });
            return app;
        }
    }
}
