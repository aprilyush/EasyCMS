using System;
using System.Collections.Generic;
using System.Linq;
using Altas.Framework.AppService;
using Altas.Framework.Common;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Altas.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;



namespace Altas.Framework.Admin
{
    public class SysUserController : BaseController
    {
        private readonly SysUserAppService _userApp;

        public SysUserController(SysUserAppService userApp)
        {
            _userApp = userApp;
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

            string accountName = RequestHelper.RequestGet("accountName", "");

            var data=_userApp.GetData(param, accountName);

            return Content(data.ToJson());
        }

        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveData(sys_user dto)
        {
            var exist = _userApp.CheckUserName(dto.account_name, dto.id);
            if (exist)
            {
                return Error("用户名已存在");
            }

            dto.pass_word = Encrypt.DesEncrypt(dto.pass_word.Trim());
            if (dto.id == 0)
            {
                _userApp.InsertData(dto);
            }
            else
            {
                _userApp.UpdateData(dto);
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
            //result.Data = _userApp.GetUserById(id);
            ////result.statusCodeCode=JuiJsonEnum.Ok;
            var data = _userApp.GetUserById(id);
            result.data.Add("model",data);
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