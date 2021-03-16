﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.AppService.Work;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models.Work;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Work.Controllers
{
    [Area("Work")]
    public class NoticeController : BaseController
    {
        private readonly NoticeAppService _noticeApp;
        private readonly SysDepartmentAppService _deptApp;
        public NoticeController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _noticeApp=service.GetRequiredService<NoticeAppService>();
            _deptApp = service.GetRequiredService<SysDepartmentAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult GetData(DataTableDto dto)
        {
            var user = RequestHelper.AdminInfo();
            var data = _noticeApp.GetList(dto, "", user);
            return Json(data);
        }

        public IActionResult Form(int id)
        {
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="deptIds"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Save(work_notice dto,string deptIds)
        {
            if (string.IsNullOrEmpty(deptIds))
            {
                return Error("参会部门不能为空");
            }
            if (dto.n_time.Hour == 0)
            {
                return Error("请选择会议当天具体时间");
            }
            var user = RequestHelper.AdminInfo();
            dto.insert_id = user.Id;
            dto.insert_time = DateTime.Now;
            dto.n_content = dto.n_content ?? "";
            _noticeApp.Save(dto,deptIds,user);
            return Success("发布成功");
        }


        public IActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
          
            if (id>0)
            {
                var user = _noticeApp.GetModel(id);
                result.data.Add("model", user);
            }
            var depts = _deptApp.GetDepartTree();
            result.data.Add("depts", depts);
            return Json(result);
        }
        
        [HttpGet]
        public IActionResult DeleteByIds(string ids)
        {
            var user = RequestHelper.AdminInfo();
            bool ret = _noticeApp.Delete(ids, user);
            if (!ret)
            {
                return Error("删除失败");
            }

            return Success("删除成功");
        }

        /// <summary>
        /// 详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Detail(int id)
        {

            return View();
        }

        [HttpGet]
        public IActionResult GetDetailModel(int id)
        {
            var result = new ResultAdaptDto();

            var user = RequestHelper.AdminInfo();
            var model = _noticeApp.GetModel(id, user);
            result.data.Add("model", model);
            return Json(result);
        }

        /// <summary>
        /// 回复列表
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult GetReplyList(DataTableDto param)
        {
            var noticeId = RequestHelper.GetQueryInt("noticeId");
            var data=_noticeApp.GetReplyList(param, noticeId);
            return Json(data);
        }

        /// <summary>
        /// 签收
        /// </summary>
        /// <param name="noticeId"></param>
        /// <returns></returns>
        public IActionResult Reply(int noticeId)
        {
            var user = RequestHelper.AdminInfo();
            var ret=_noticeApp.Reply(noticeId, user);
            if (!ret)
            {
                return Error("超过截止日期，无法签收");
            }
            return Success("已签收");
        }
    }
}
