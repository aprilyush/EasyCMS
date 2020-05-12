using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using NPOI.SS.Formula.Functions;

namespace Atlass.Framework.AppService
{
    public class SysUserAppService
    {
        private readonly IFreeSql Sqldb;
        public SysUserAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 登录验证
        /// </summary>
        /// <param name="uname"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public sys_user LoginValidate(string uname, string pwd)
        {
            pwd = Encrypt.DesEncrypt(pwd);
            return Sqldb.Queryable<sys_user>().Where(s => s.account_name == uname && s.pass_word == pwd).First();
        }
        //public plat_user LoginPlatValidate(string uname, string pwd)
        //{
        //    pwd = DESEncrypt.Encrypt(pwd);
        //    return Sqldb.Queryable<plat_user>().Where(s => s.account_name == uname && s.pass_word == pwd).First();
        //}
        /// <summary>
        /// 更新密码
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pwd"></param>
        public void UpdateUserPwd(long id, string pwd)
        {
            pwd = Encrypt.DesDecrypt(pwd);
            Sqldb.Update<sys_user>().Set(s => new sys_user { pass_word = pwd }).Where(s => s.id == id).ExecuteAffrows();
        }

        /// <summary>
        /// 获取数据表格
        /// </summary>
        /// <param name="param"></param>
        /// <param name="accountName"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param, string accountName)
        {
            var query = Sqldb.Select<sys_user, sys_role>()
                         .LeftJoin((u, r) => u.sys_role_id == r.id)
                         .OrderByDescending((u, r)=>u.is_super)
                         .OrderByDescending((u, r) => u.create_time)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList((u, r) => new { Id = u.id,IsSuper=u.is_super, AccountName = u.account_name, RealName = u.real_name, MobilePhone = u.mobile_phone, Email = u.email, CreateTime = u.create_time, RoleName = r.role_name });

            param.rows = query;
            param.total = total;

            return param;
        }

        public List<sys_user> GetAllUser()
        {
            return Sqldb.Queryable<sys_user>().OrderBy(s=>s.id).ToList();
        }
        /// <summary>
        /// 检测用户是否已经存在
        /// </summary>
        /// <param name="uname"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool CheckUserName(string uname, long id)
        {
            long count = 0;
            if (id == 0)
            {
                count = Sqldb.Select<sys_user>().Where(s => s.account_name == uname.Trim()).Count();
               
            }
            else
            {
                count = Sqldb.Select<sys_user>().Where(s => s.account_name == uname.Trim() && s.id != id).Count();
              
            }
            if (count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        /// <summary>
        /// 新增数据
        /// </summary>
        /// <param name="dto"></param>
        public void InsertData(sys_user dto,LoginUserDto UserCookie,string refExperts)
        {
            dto.id = IdWorkerHelper.NewId();
            dto.create_time = DateTime.Now;
            dto.create_person = UserCookie.AccountName;


            dto.fax = dto.fax ?? string.Empty;
            dto.email = dto.email ?? string.Empty;
            dto.mobile_phone = dto.mobile_phone ?? string.Empty;

           
            Sqldb.Insert(dto).ExecuteAffrows();

        }
        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateData(sys_user dto, string refExperts)
        {

            dto.fax = dto.fax ?? string.Empty;
            dto.email = dto.email ?? string.Empty;
            dto.mobile_phone = dto.mobile_phone ?? string.Empty;

            Sqldb.Update<sys_user>().SetSource(dto)
                .IgnoreColumns(s => new { s.create_person, s.create_time, s.account_name }).ExecuteAffrows();

        }
        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateProfile(sys_user dto)
        {

            dto.fax = dto.fax ?? string.Empty;
            dto.email = dto.email ?? string.Empty;
            dto.mobile_phone = dto.mobile_phone ?? string.Empty;
            Sqldb.Update<sys_user>().SetSource(dto)
                .UpdateColumns(s => new { s.real_name, s.pass_word, s.mobile_phone,s.email }).ExecuteAffrows();
        }
        /// <summary>
        /// 单个数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_user GetUserById(long id)
        {
            var data = Sqldb.Queryable<sys_user>().Where(s => s.id == id).First();

            data.pass_word = Encrypt.DesDecrypt(data.pass_word.Trim());

            return data;
        }

       
        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="ids"></param>
        public void DelUserByIds(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idsArray = ids.Split(',').StrToLongArray();

                Sqldb.Delete<sys_user>().Where(s=>idsArray.Contains(s.id)).ExecuteAffrows();
            }
        }


        public List<sys_role> GetRoleList()
        {
            return Sqldb.Queryable<sys_role>().ToList();
        }

       
    }
}
