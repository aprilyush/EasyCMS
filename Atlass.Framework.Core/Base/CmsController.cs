using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Core.Base
{
    /// <summary>
    /// 返回html方式1
    /// </summary>
    [ServiceFilter(typeof(IPFilterAttribute))]
    public class CmsController: Controller
    {


        /// <summary>
        ///直接写Html内容返回
        /// </summary>
        /// <param name="htmlContent"></param>
        /// <returns></returns>
        public virtual IActionResult WriteHtml(string htmlContent)
        {
            var response = HttpContext.Response;
            response.ContentType = "text/html;charset=utf-8";
            response.WriteAsync(htmlContent);
            response.StatusCode = 200;
            return null;
        }

        /// <summary>
        /// 继承IActionResult 实现新的HtmlResult
        /// </summary>
        /// <param name="htmlContent"></param>
        /// <returns></returns>
        public virtual IActionResult Html(string htmlContent)
        {
            return new HtmlResult(htmlContent);
        }
    }
}
