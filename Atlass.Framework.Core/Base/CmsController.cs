using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Base
{
    public class CmsController:Controller
    {

        public virtual IActionResult Html(string htmlContent)
        {
            Response.ContentType = "text/html;charset=utf-8";
            Response.WriteAsync(htmlContent);
            return null;
        }
    }
}
