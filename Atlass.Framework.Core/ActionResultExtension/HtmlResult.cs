using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Core
{
    /// <summary>
    /// 继承IActionResult接口返回新的结果
    /// 需要依赖注入
    /// services.AddScoped<IActionResultExecutor<YamlHtmlResultResult>,HtmlResultExecutor<HtmlResult>>();
    /// </summary>
    public class HtmlResult: ActionResult
    {       /// <summary>
            /// Yaml值
            /// </summary>
        public object Value { get; private set; }
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="value"></param>
        public HtmlResult(object value)
        {
            Value = value;
        }
        /// <summary>
        /// Result执行者
        /// </summary>
        /// <param name="context">上下文</param>
        /// <returns></returns>
        public override async Task ExecuteResultAsync(ActionContext context)
        {
            var services = context.HttpContext.RequestServices;
            var executor = services.GetRequiredService<IActionResultExecutor<HtmlResult>>();
            await executor.ExecuteAsync(context, new HtmlResult(this));
        }
    }
}
