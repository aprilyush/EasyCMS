using Atlass.Framework.Common;
using Atlass.Framework.Core.Comm;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Base
{
    [TypeFilterAttribute(typeof(AtlassAuthorizationAttribute))]
    [ServiceFilter(typeof(AtlassActionFilterAttribute))]   
    public class BaseController: Controller
    {
        protected IAtlassRequest RequestHelper;
        public BaseController()
        {
            
        }

        /// <summary>
        /// 返回成功
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        protected virtual ContentResult Success(string msg)
        {
            var result = new { status = true, message = msg };
            return Content(result.ToJson());
        }
        /// <summary>
        /// 返回成功
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        protected virtual ContentResult Success()
        {
            var result = new { status = true, message = "操作成功" };
            return Content(result.ToJson());
        }
        /// <summary>
        /// 返回失败
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        protected virtual ContentResult Error()
        {
            var result = new { status = false, message = "操作失败" };
            return Content(result.ToJson());
        }

        /// <summary>
        /// 返回失败
        /// </summary>
        /// <param name="msg"></param>
        /// <returns></returns>
        protected virtual ContentResult Error(string msg)
        {
            var result = new { status = false, message = msg };
            return Content(result.ToJson());
        }


        /// <summary>
        /// json result BootstrapGridDto
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="dateFormatter"></param>
        /// <returns></returns>
        protected virtual ContentResult Json(DataTableDto dto)
        {
      
            return Content(dto.ToJson());
        }
        /// <summary>
        /// json result ResultAdaptDto
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="dateFormatter"></param>
        /// <returns></returns>
        protected virtual ContentResult Json(ResultAdaptDto dto)
        {
            return Content(dto.ToJson());
        }
        /// <summary>
        /// json result object
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        protected virtual ContentResult JsonEx(object dto)
        {
            return Content(dto.ToJson());
        }
    }
}
