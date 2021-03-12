using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Common
{
    public class LoginUserDto
    {
        public long Id { get; set; }
        /// <summary>
        /// 登录名
        /// </summary>
        public string LoginName { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        public string UserName { get; set; }
        /// <summary>
        /// 超管
        /// </summary>
        public bool IsSuper { get; set; }
        /// <summary>
        /// 性别 1-男，0-女，2-未知
        /// </summary>
        public int Gender { get; set; }
        /// <summary>
        /// 角色
        /// </summary>
        public long RoleId { get; set; }
        /// <summary>
        /// 角色
        /// </summary>
        public string RoleName { get; set; }
        /// <summary>
        /// 角色
        /// </summary>
        public string RoleCode { get; set; }
        /// <summary>
        /// 部门
        /// </summary>
        public int DeptId { get; set; }
        public string DeptName { get; set; }
        /// <summary>
        /// 电话
        /// </summary>
        public string Phone { get; set; }
        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 头像
        /// </summary>
        public string Avatar { get; set; }
    }
}
