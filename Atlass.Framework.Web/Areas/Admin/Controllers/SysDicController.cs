﻿using System;
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
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            var pid = RequestHelper.GetQueryString("pid", "0");
            var dicSel = _dicApp.GetDicSelList();
            dicSel.Insert(0, new sys_dictionary() {id = 0, dic_name = "全部"});
            ViewBag.DicSelList = new SelectList(dicSel, "id", "dic_name", pid);
            return View();
        }

        /// <summary>
        /// 数据表格
        /// </summary>
        /// <returns></returns>
       
        public ActionResult GetData()
        {
            var data=new DataTableDto();

            var list = _dicApp.GetData();
            //data.list = list;
            //data.pageSize = list.Count;
            return Content(data.ToJson());
        }

        
        public ActionResult GetGridDataBypId()
        {
            //var data = new BootstrapGridDto();
            string pid = RequestHelper.GetQueryString("pid", "0");
            //if (HttpContextExt.Current.Request.Form.Count > 0 && HttpContextExt.Current.Request.Form.ContainsKey("pid"))
            //{
            //    var pid = HttpContext.Request.Form["pid"];
               
                
            //}
            var list = _dicApp.GetGridDataBypId(pid.ToInt64());
           // data.rows = list;
            //data.total = list.Count;
            return Content(list.ToJson());

        }
        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveData(sys_dictionary dto)
        {
            dto.dic_code = dto.dic_code??"";
            dto.dic_name = dto.dic_name.Trim();
            dto.dic_value = dto.dic_name;
            if (dto.id == 0)
            {
                _dicApp.InsertDicData(dto,RequestHelper.AdminInfo());
            }
            else
            {
                _dicApp.UpdateDicData(dto);
            }

            return Success();
        }

        /// <summary>
        /// 获取单个数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult GetDicById(string id)
        {
            var result=new ResultAdaptDto();
            var data = _dicApp.GetDicById(id.ToInt64());
            result.data.Add("model",data);
            //result.Data = _dicApp.GetDicById(id);
            ////result.statusCodeCode=JuiJsonEnum.Ok;
            return Content(result.ToJson());
        }

        public ActionResult del(string ids)
        {
            _dicApp.DelByIds(ids);
            return Success("删除成功");
        }
        public ActionResult GetDicZtree()
        {
            var result = new ResultAdaptDto();
            var data = _dicApp.GetDicZtree();
            data.Insert(0,new ZtreeDto(){id ="0",name = "通用字典"});
            result.data.Add("dicTree",data);
            //result.Data = data;
            //result.statusCode = true;
            return Content(result.ToJson());
        }


        public ActionResult TreeView()
        {
            return View();
        }

        public ActionResult GetTreeGrid()
        {

           var list = _dicApp.GetTreeGrid();
            
            return Content(list.ToJson());
        }

        public ActionResult FormTest()
        {
            return View();
        }
	}
}