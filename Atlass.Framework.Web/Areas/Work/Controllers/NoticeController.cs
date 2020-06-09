using System;
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
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _noticeApp=service.GetRequiredService<NoticeAppService>();
            _deptApp = service.GetRequiredService<SysDepartmentAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult GetData(BootstrapGridDto dto)
        {
            var user = RequestHelper.AdminInfo();
            var data = _noticeApp.GetList(dto, "", user);
            return Data(data);
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
            return Data(result);
        }
        
        [HttpGet]
        public IActionResult DeleteById(int id)
        {
            var user = RequestHelper.AdminInfo();
            bool ret = _noticeApp.Delete(id, user);
            if (!ret)
            {
                return Error("删除失败");
            }

            return Success("删除成功");
        }
    }
}
