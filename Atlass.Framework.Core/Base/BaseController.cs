using Atlass.Framework.Common;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Base
{
    [ServiceFilter(typeof(AtlassActionFilterAttribute))]
    public class BaseController: Controller
    {
        protected IAtlassReuqestHelper RequestHelper;
        public BaseController()
        {
            
        }
        protected virtual ContentResult Success(string msg)
        {
            var result = new { status = true, msg = msg };
            return Content(result.ToJson());
        }
        protected virtual ContentResult Success()
        {
            var result = new { status = true };
            return Content(result.ToJson());
        }
        protected virtual ContentResult Error()
        {
            var result = new { status = false, msg = "操作失败" };
            return Content(result.ToJson());
        }
        protected virtual ContentResult Error(string msg)
        {
            var result = new { status = false, msg = msg };
            return Content(result.ToJson());
        }

        protected virtual ContentResult Data(BootstrapGridDto dto, string dateFormatter = "yyyy-MM-dd HH:mm:ss")
        {
            return Content(dto.ToJson(dateFormatter));
        }
        protected virtual ContentResult Data(ResultAdaptDto dto, string dateFormatter = "yyyy-MM-dd HH:mm:ss")
        {
            return Content(dto.ToJson(dateFormatter));
        }
    }
}
