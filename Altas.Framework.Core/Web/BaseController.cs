using System;
using System.Collections.Generic;
using System.Text;
using Altas.Framework.Common;
using Microsoft.AspNetCore.Mvc;

namespace Altas.Framework.Core.Web
{
    [AuthorizeFilter]
    [WebExceptionFilter]
   public class BaseController: Controller
    {
        protected virtual ContentResult Success(string msg)
        {
            var result = new { statusCode = 200, msg = msg };
            return Content(result.ToJson());
        }
        protected virtual ContentResult Success()
        {
            var result = new { statusCode = 200 };
            return Content(result.ToJson());
        }
        protected virtual ContentResult Error()
        {
            var result = new { statusCode = 300, msg = "操作失败" };
            return Content(result.ToJson());
        }
        protected virtual ContentResult Error(string msg)
        {
            var result = new { statusCode = 300, msg = msg };
            return Content(result.ToJson());
        }

        protected virtual ContentResult Data(object dto,string dateFormatter= "yyyy-MM-dd HH:mm:ss")
        {
            return Content(dto.ToJson(dateFormatter));
        }
    }
}
