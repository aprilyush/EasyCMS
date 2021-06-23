using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Altas.Framework.Admin
{
    [Area("Admin")]
    public class SysDicController : BaseController
    {
        private readonly SysDicAppService _dicApp;

        public SysDicController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _dicApp = service.GetRequiredService<SysDicAppService>();
        }

        /// <summary>
        /// 字典页
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:dic:view")]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 数据表格
        /// </summary>
        /// <returns></returns>
        [RequirePermission("system:dic:view")]
        [HttpPost]
        public ActionResult GetData(DataTableDto dto)
        {
            string dicCode = RequestHelper.GetPostString("dicCode");
            string dicName = RequestHelper.GetPostString("dicName");
            var list = _dicApp.GetData(dto,dicCode,dicName);
            return Json(list);
        }

        /// <summary>
        /// 表单页面
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:dic:add,system:dic:edit")]
        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            return View();
        }


        /// <summary>
        /// 获取单个数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [RequirePermission("system:dic:add,system:dic:edit")]
        [HttpGet]
        public ActionResult GetModel(string id)
        {
            var result = new ResultAdaptDto();
            var data = _dicApp.GetDicById(id.ToInt64());
            result.data.Add("model", data);
            return Json(result);
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("system:dic:add,system:dic:edit")]
        public ActionResult SaveData(sys_dictionary dto)
        {
            dto.dic_code = dto.dic_code ?? "";
            dto.dic_name = dto.dic_name.Trim();
            if (dto.dic_value.IsEmpty())
            {
                dto.dic_value = dto.dic_name;
            }
            if (dto.id == 0)
            {
                _dicApp.InsertDicData(dto, RequestHelper.AdminInfo());
            }
            else
            {
                _dicApp.UpdateDicData(dto);
            }

            return Success();
        }

        /// <summary>
        /// 表单页面
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:dic:son")]
        public ActionResult SonView(string parentId)
        {
            ViewBag.Id = parentId;
            var list = _dicApp.GetDicSelList();
            ViewBag.DicList = new SelectList(list, "id", "name", parentId);
            return View();
        }


        /// <summary>
        /// 字典数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        [RequirePermission("system:dic:son")]
        public ActionResult GetSonList(DataTableDto dto)
        {
            long pid = RequestHelper.GetPostInt64("pid",0);
            string name = RequestHelper.GetPostString("name");
            var list = _dicApp.GetSonList(dto,pid, name);

            return Json(list);

        }
        
        /// <summary>
        /// 添加字典数据
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:dic:son")]
        public ActionResult SonForm()
        {
            string id = RequestHelper.GetQueryString("id", "0");
            string parentId = RequestHelper.GetQueryString("parentId", "0");
            var parent = _dicApp.GetDicById(parentId.ToInt64());
            ViewBag.DicCode = parent.dic_code;
            ViewBag.Id = id;
            ViewBag.ParentId = parentId;
            return View();
        }

        /// <summary>
        /// 删除字典
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpGet]
        [RequirePermission("system:dic:delete")]
        public ActionResult removeAll(string ids)
        {
            _dicApp.DelByIds(ids);
            return Success("删除成功");
        }

        [HttpGet]
        [RequirePermission("system:dic:son")]
        public IActionResult DeleteSonByIds(string ids)
        {
            _dicApp.DeleteSonByIds(ids);
            return Success("删除成功");
        }

        public ActionResult FormTest()
        {
            return View();
        }
	}
}