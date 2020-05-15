using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Core
{
    /// <summary>
    ///Html执行者
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class HtmlResultExecutor<T> : IActionResultExecutor<T> where T : HtmlResult
    {
        /// <summary>
        /// 执行
        /// </summary>
        /// <param name="context">上下文</param>
        /// <param name="result">值</param>
        /// <returns></returns>
        public async Task ExecuteAsync(ActionContext context, T result)
        {
            //var serialize = new YamlDotNet.Serialization.Serializer();
            //var valueString = serialize.Serialize(result.Value);
            // 把对象转成yaml字符串，用Response返回Content-Type: text/html;charset=utf-8
            context.HttpContext.Response.ContentType = "text/html; charset=utf-8";
            await context.HttpContext.Response.WriteAsync(result.Value.ToString());
        }
    }
}
