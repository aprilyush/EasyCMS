using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Generate;
using Atlass.Framework.Models.Admin;
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

        /// <summary>
        /// 表的字段信息
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        [RequirePermission("system:codegen:synctable")]
        [HttpGet]
        public IActionResult SyncTable()
        {
            string tableName = RequestHelper.GetQueryString("tableName");
            codeGenApp.SyncTable(tableName.Trim());
            return Success("表结构同步成功");
        }

        /// <summary>
        /// 代码生成
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        [RequirePermission("system:codegen:gentable")]
        [HttpGet]
        public IActionResult GenCode(string tableName)
        {
            code_table table = codeGenApp.GetTable(tableName.Trim());
            GenerateCodeDto codeDto = new GenerateCodeDto();
            if (table != null)
            {
                GenerateCodeTemplate generateCode = new GenerateCodeTemplate(table);
                //实体类
                var ret = generateCode.GenEntity();
                if (ret.Status)
                {
                    codeDto.Entity = ret.Html;
                }
                //服务
                var ret2 = generateCode.GenAppService();
                if (ret2.Status)
                {
                    codeDto.Service = ret2.Html;
                }
                //控制器
                var ret3 = generateCode.GenController();
                if (ret3.Status)
                {
                    codeDto.Controller = ret3.Html;
                }
                //列表页
                var ret4 = generateCode.GenList();
                if (ret4.Status)
                {
                    codeDto.List = ret4.Html;
                }
                //服务
                var ret5 = generateCode.GenForm();
                if (ret5.Status)
                {
                    codeDto.Form = ret5.Html;
                }
            }
            ViewData.Model = codeDto;
            return View();
        }
    }
}
