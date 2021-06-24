using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class LoginLogController : BaseController
    {
        private readonly LoginInfoAppService loginInfoApp;

        public LoginLogController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            loginInfoApp = service.GetRequiredService<LoginInfoAppService>();
        }

        /// <summary>
        /// 登录日志
        /// </summary>
        /// <returns></returns>
        [RequirePermission("system:loginlog:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 数据
        /// </summary>
        /// <returns></returns>
        [RequirePermission("system:loginlog:view")]
        [HttpPost]
        public IActionResult GetData(DataTableDto dto)
        {
            int loginStatus = RequestHelper.GetPostInt("loginStatus", -1);
            string loginName = RequestHelper.GetPostString("loginName");
            string loginIP = RequestHelper.GetPostString("loginIP");
            string startDate = RequestHelper.GetPostString("startDate");
            string endDate = RequestHelper.GetPostString("endDate");
            var data = loginInfoApp.GetData(dto, loginStatus, loginName, loginIP,startDate,endDate);
            return Json(data);
        }

        /// <summary>
        /// 数据
        /// </summary>
        /// <returns></returns>
        [RequirePermission("system:loginlog:delete")]
        [HttpGet]
        public IActionResult RemoveAll(string ids)
        {
            if (ids.IsEmptyId())
            {
                return Error("删除失败");
            }

            loginInfoApp.Delete(ids);
            return Success();
        }

        [RequirePermission("system:loginlog:clear")]
        [HttpGet]
        public IActionResult Clear()
        {
           
            loginInfoApp.Clear();
            return Success();
        }
    }
}
