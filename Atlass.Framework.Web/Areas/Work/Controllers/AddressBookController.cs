using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.SystemApp;
using Atlass.Framework.AppService.Work;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Work.Controllers
{

    [Area("work")]
    public class AddressBookController : BaseController
    {
        private readonly AddressBookAppService _addressBookApp;
        private readonly SysDepartmentAppService _deptApp;
        public AddressBookController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _addressBookApp = service.GetRequiredService<AddressBookAppService>();
            _deptApp = service.GetRequiredService<SysDepartmentAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetData(BootstrapGridDto param)
        {
            var name = RequestHelper.GetQueryString("name");
            var data = _addressBookApp.GetList(param, name);
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
        public IActionResult Save(work_address_book dto)
        {

            _addressBookApp.Save(dto);
            return Success("发布成功");
        }


        public IActionResult GetModel(int id)
        {
            var result = new ResultAdaptDto();
            if (id > 0)
            {
                var model = _addressBookApp.GetModel(id);
                result.data.Add("model", model);
            }

            var depts = _deptApp.GetDepartTree();
            result.data.Add("depts", depts);
            return Data(result);
        }

        [HttpGet]
        public IActionResult DeleteByIds(string ids)
        {
            _addressBookApp.DeleteByIds(ids);
            return Success("删除成功");
        }
    }
}
