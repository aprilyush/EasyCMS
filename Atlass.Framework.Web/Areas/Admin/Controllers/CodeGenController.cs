using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Atlass.Framework.Web.Areas.Admin.Controllers
{
    [Area("admin")]
    public class CodeGenController : BaseController
    {
        private CodeGenAppService codeGenApp;
        public CodeGenController(IServiceProvider service)
        {
            codeGenApp = service.GetRequiredService<CodeGenAppService>();
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
        }

        /// <summary>
        /// 列表页面
        /// </summary>
        /// <returns></returns>
        [RequirePermission("system:codegen:view")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 获取表格
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [RequirePermission("system:codegen:view")]
        [HttpPost]
        public IActionResult GetData(DataTableDto dto)
        {
            string tableName = RequestHelper.GetPostString("tableName");
            var data = codeGenApp.GetList(dto, tableName);
            return Json(data);
        }


        /// <summary>
        /// 全量同步
        /// </summary>
        /// <returns></returns>
        [RequirePermission("system:codegen:syncAll")]
        [HttpGet]
        public IActionResult SyncAll()
        {

            codeGenApp.SyncAll();

            return Success();
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [RequirePermission("system:codegen:delete")]
        [HttpGet]
        public IActionResult RemoveAll(string ids)
        {
            if (ids.IsEmptyId())
            {
                return Error("删除失败");
            }

            codeGenApp.RemoveAll(ids);
            return Success("删除成功");
        }


        /// <summary>
        /// 表的字段信息
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        [RequirePermission("system:codegen:column")]
        [HttpGet]
        public IActionResult ColumnView(string tableName)
        {
            ViewBag.TableName = tableName;
            return View();
        }

        /// <summary>
        /// 表的字段信息
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        [RequirePermission("system:codegen:column")]
        [HttpPost]
        public IActionResult GetColumndata()
        {
            string tableName = RequestHelper.GetPostString("tableName");
            string columnName= RequestHelper.GetPostString("columnName");
            var data = codeGenApp.GetColumndata(tableName, columnName);
            return Json(data);
        }
    }
}
