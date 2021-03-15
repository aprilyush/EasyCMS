using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Enum;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels;
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
            //pwd = Encrypt.DesEncrypt(pwd);
            return Sqldb.Queryable<sys_user>().Where(s => s.login_name == uname && s.pass_word == pwd).First();
        }

        /// <summary>
        /// 更新密码
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pwd"></param>
        public void UpdateUserPwd(long id, string pwd)
        {
            //pwd = Encrypt.DesDecrypt(pwd);
            Sqldb.Update<sys_user>().Set(s => new sys_user { pass_word = pwd }).Where(s => s.id == id).ExecuteAffrows();
        }

        /// <summary>
        /// 获取数据表格
        /// </summary>
        /// <param name="param"></param>
        /// <param name="LoginName"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param, string loginName,string userName,string phone)
        {
            var query = Sqldb.Select<sys_user>()
                         //.LeftJoin((u, r) => u.role_id == r.id)
                         .WhereIf(!loginName.IsEmpty(),u=>u.login_name== loginName)
                         .WhereIf(!userName.IsEmpty(),u => u.user_name.Contains(userName))
                         .WhereIf(!phone.IsEmpty(), u => u.mobile_phone.Contains(phone))
                         .OrderByDescending(u =>u.is_super)
                         .OrderByDescending(u=> u.create_time)
                .Count(out long total)
                .Page(param.pageNumber, param.pageSize)
                .ToList();
            if (query.Count > 0)
            {
                var roleIds = query.Where(s => s.role_id > 0).Select(s => s.role_id).ToList();
                if (roleIds.Count > 0)
                {
                    var roles = Sqldb.Select<sys_role>().Where(s => roleIds.Contains(s.id)).ToList();
                    query.ForEach(s =>
                    {
                        s.role_name = roles.Where(a => a.id == s.role_id).Select(a => a.role_name).FirstOrDefault();
                    });
                }
            }
            param.rows = query;
            param.total = total;

            return param;
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
            var user = Sqldb.Select<sys_user>().Where(s => s.login_name == uname.Trim()).First();
            if (user == null)
            {
                return false;
            }
            
            if (user.id==id)
            {
                return false;
            }

            return true;
        }


        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="userDto"></param>
        public void SaveData(sys_user dto,List<long> positions,LoginUserDto userDto)
        {
            // dto.pass_word = Encrypt.DesEncrypt(dto.pass_word.Trim());

            dto.email = dto.email ?? string.Empty;
            dto.mobile_phone = dto.mobile_phone ?? string.Empty;
            if (dto.dept_id == 0)
            {
                dto.dept_name = "";
            }
            else
            {
                var deptName = Sqldb.Select<sys_dept>().Where(s => s.id == dto.dept_id).First(s => s.dept_name);
                dto.dept_name = deptName ?? "";
            }
            if (dto.user_avatar.IsEmpty())
            {
                dto.user_avatar = "/ui/img/profile.jpg";
            }

            dto.update_by = userDto.LoginName;
            dto.update_time = DateTime.Now;
            if (dto.id == 0)
            {
                dto.id = IdHelper.NewId();
                dto.del_flag = DataStatusConstant.NOT_DELETED;
                dto.create_time = DateTime.Now;
                dto.create_by = userDto.LoginName;
                Sqldb.Insert(dto).ExecuteAffrows();
               
            }
            else
            {
                Sqldb.Update<sys_user>().SetSource(dto)
                 .IgnoreColumns(s => new { s.create_by, s.create_time, s.user_name, s.del_flag }).ExecuteAffrows();
                Sqldb.Delete<sys_user_position>().Where(s => s.user_id == dto.id).ExecuteAffrows();
            }

            //插入职位信息
           
            if (positions != null && positions.Count > 0)
            {
                List<sys_user_position> positionsList = new List<sys_user_position>();
                foreach(int pid in positions)
                {
                    sys_user_position positionMoel = new sys_user_position();
                    positionMoel.user_id = dto.id;
                    positionMoel.position_id = pid;
                    positionMoel.create_by = userDto.LoginName;
                    positionMoel.create_time = dto.update_time;
                    positionsList.Add(positionMoel);
                }

                Sqldb.Insert(positionsList).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 更新个人资料
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateProfile(long id, string userName, string mobilePhone, string email, int gender)
        {


            mobilePhone = mobilePhone ?? string.Empty;
            email = email ?? string.Empty;
            Sqldb.Update<sys_user>()
                .Set(s => s.user_name, userName)
                .Set(s=>s.mobile_phone,mobilePhone)
                .Set(s=>s.email,email)
                .Set(s=>s.gender,gender)
                .Where(s=>s.id==id).ExecuteAffrows();
        }
        /// <summary>
        /// 单个数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_user GetUserById(long id)
        {
            var data = Sqldb.Queryable<sys_user>().Where(s => s.id == id).First();
            if (data != null)
            {
                data.positionList = Sqldb.Select<sys_user_position>().Where(s => s.user_id == id).ToList(s => s.position_id);
            }
           // data.pass_word = Encrypt.DesDecrypt(data.pass_word.Trim());

            return data;
        }

       
        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="ids"></param>
        public void DelUserByIds(string ids)
        {
            var idsArray = ids.SplitToArrayInt64();

            Sqldb.Delete<sys_user>().Where(s => idsArray.Contains(s.id)).ExecuteAffrows();
        }

        /// <summary>
        /// 更新密码
        /// </summary>
        /// <param name="id"></param>
        /// <param name="loginName"></param>
        /// <param name="oldPassword"></param>
        /// <param name="newPassword"></param>
        public ResultAdaptDto UpdatePassword(long id,string loginName,string oldPassword,string newPassword)
        {
            ResultAdaptDto ret = new ResultAdaptDto();
            var user = Sqldb.Select<sys_user>().Where(s => s.id == id).First();
            if (user == null)
            {
                ret.status = false;
                ret.message = "用户不存在";
                return ret;
            }

            //个人中心的密码更新
            if (loginName.IsEmpty()&&user.pass_word != oldPassword)
            {
                ret.status = false;
                ret.message = "用户密码比对失败，禁止更新";
                return ret;
            }

            Sqldb.Update<sys_user>()
                .Set(s => s.pass_word, newPassword)
                .Where(s => s.id == id).ExecuteAffrows();

            ret.message = "密码更新成功";
            return ret;
        }
    }
}
