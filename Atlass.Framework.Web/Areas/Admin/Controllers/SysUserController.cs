using System;
using System.Collections.Generic;
using System.Linq;
using Atlass.Framework.AppService;
using Atlass.Framework.AppService.SystemApp;
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
    public class SysUserController : BaseController
    {
        private readonly SysUserAppService _userApp;
        private readonly SysDepartmentAppService _deptApp;

        public SysUserController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _userApp = service.GetRequiredService<SysUserAppService>();
            _deptApp = service.GetRequiredService<SysDepartmentAppService>();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Form(string id)
        {
            ViewBag.Id = id;
            var role = _userApp.GetRoleList();
            role.Insert(0,new sys_role(){id = 0,role_name = "请选择"});
            ViewBag.RoleList = new SelectList(role, "id", "role_name");
            return View();
        }

        public ActionResult GetAllUser()
        {
            var data = _userApp.GetAllUser();
            return Content(data.ToJson());
        }
        /// <summary>
        /// 数据表格
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
     
        public ActionResult GetData(BootstrapGridDto param)
        {
            //var data = new DataGridEx();

            string accountName = RequestHelper.GetQueryString("userName");
            string nickName = RequestHelper.GetQueryString("nickName");
            var data=_userApp.GetData(param, accountName, nickName);

            return Content(data.ToJson());
        }

        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveData(sys_user dto,string refExperts)
        {
            var exist = _userApp.CheckUserName(dto.account_name, dto.id);
            if (exist)
            {
                return Error("用户名已存在");
            }

            dto.pass_word = Encrypt.DesEncrypt(dto.pass_word.Trim());
            if (dto.id == 0)
            {
                _userApp.InsertData(dto,RequestHelper.AdminInfo(), refExperts);
            }
            else
            {
                _userApp.UpdateData(dto, refExperts);
            }

            return Success();
        }

        /// <summary>
        /// 单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult GetUserById(string id)
        {
            var result=new ResultAdaptDto();

            if (!id.EmptyId())
            {
                var user = _userApp.GetUserById(id.ToInt64());
                result.data.Add("model", user);
            }
            var depts = _deptApp.GetDepartTree();
            result.data.Add("depts", depts);
            return Content(result.ToJson());
        }

        public ActionResult DelUserByIds(string ids)
        {
            _userApp.DelUserByIds(ids);

            return Success("删除成功");
        }

        public ActionResult Profile(string id)
        {
            ViewBag.Id = id;
            return View();
        }


        public ActionResult UpdateProfile(sys_user dto)
        {
            dto.pass_word = Encrypt.DesEncrypt(dto.pass_word.Trim());
            _userApp.UpdateProfile(dto);
            return Success("修改成功");
        }
    }
}