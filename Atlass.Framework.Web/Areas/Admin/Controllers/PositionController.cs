using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
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
    [Area("Admin")]
    public class PositionController : BaseController
    {
        private readonly PositionAppService _positionApp;

        public PositionController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _positionApp = service.GetRequiredService<PositionAppService>();
        }

        /// <summary>
        ///列表页面
        /// </summary>
        /// <param name="dto"></param>

        [HttpGet]
        [RequirePermission("system:post:view")]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        ///获取数据列表
        /// </summary>
        /// <param name="param"></param>
        [HttpPost]
        [RequirePermission("system:post:view")]
        public ActionResult getList(DataTableDto param)
        {
            var data = _positionApp.GetData(param);
            return Json(data);
        }

        /// <summary>
        ///表单页面
        /// </summary>
        [HttpGet]
        [RequirePermission("system:post:add,system:post:edit")]
        public ActionResult Form(string id)
        {
            ViewBag.Id = id;

            return View();
        }
        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>

        [HttpPost]
        [RequirePermission("system:post:add,system:post:edit")]
        public ActionResult SaveData(sys_position dto)
        {
            var result = new ResultAdaptDto();

            _positionApp.Save(dto, RequestHelper.AdminInfo());
            result.status = true;
            return Json(result);
        }

        /// <summary>
        ///获取数据详情
        /// </summary>
        ///<param name="id"></param>
        [HttpGet]
        [RequirePermission("system:post:add,system:post:edit")]
        public ActionResult GetModel(string id)
        {
            var result = new ResultAdaptDto();
            var data = _positionApp.GetDataById(id.ToInt64());
            if (data != null)
            {
                result.data.Add("model", data);
                result.status = true;
            }
            result.status = true;
            return Json(result);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:post:delete")]
        public ActionResult RemoveAll(string ids)
        {
            var result = new ResultAdaptDto();

            _positionApp.DelByIds(ids);
            result.status = true;
            return Json(result);
        }
    }
}
