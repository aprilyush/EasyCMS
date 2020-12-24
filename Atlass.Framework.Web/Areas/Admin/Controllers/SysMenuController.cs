using System;
using System.Collections.Generic;
using System.Linq;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Altas.Framework.Controllers.Admin
{
    [Area("Admin")]
    public class SysMenuController : BaseController
    {
        //
        // GET: /SysMenu/
        private SysMenuAppService _menuApp;

        public SysMenuController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _menuApp = service.GetRequiredService<SysMenuAppService>();
        }
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            var menuList = _menuApp.GetMenuList().Where(s=>s.menu_type==0).OrderBy(s=>s.menu_level).ToList();
            menuList.Insert(0, new sys_menu(){id=0,  menu_name= "请选择" });
            ViewBag.MenuSel = new SelectList(menuList, "id", "menu_name");

            //按钮
            //var funcSelList = _menuApp.GetFuncSelList();
            //funcSelList.Insert(0, new sys_operate(){ id = 0, func_cname = "请选择" });
            //ViewBag.FuncSel = new SelectList(funcSelList, "id", "func_cname");
            return View();
        }
        [HttpGet]
        public ActionResult GetData()
        {
            var data = _menuApp.GetMenuList();
            return Content(data.ToJson());
        }
        [HttpPost]
        public ActionResult SaveData(sys_menu dto, string funcs)
        {
            if (dto.parent_id == 0)
            {
                dto.menu_url =string.Empty;
                dto.menu_icon = dto.menu_icon ?? "fa fa-desktop";
            }
            else
            {
                dto.menu_url = dto.menu_url ?? string.Empty;
                dto.menu_icon = dto.menu_icon ?? "fa fa-tag";
            }
            
            if (dto.id==0)
            {
                _menuApp.AddMenu(dto, funcs);
            }
            else
            {
                _menuApp.UpdateMenu(dto, funcs);
            }
            return Success("保存成功");
        }
        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetDataById(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Error("参数错误");
            }
            var data = _menuApp.GetMenuById(id.ToInt64());
            var funcs = _menuApp.GetMenuRefOpt(id.ToInt64());
            var result = new ResultAdaptDto();
            result.data.Add("model", data);
            result.data.Add("funcs", funcs);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 删除某个操作
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Delfunc(string id)
        {
            _menuApp.Delfunc(id.ToInt64());

            return Success("删除成功");
        } 
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Del(string ids)
        {
            if (string.IsNullOrEmpty(ids))
            {
                return Error("参数错误");
            }

            _menuApp.DelByIds(ids);
            return Success("删除成功");
        }

      

	}
}