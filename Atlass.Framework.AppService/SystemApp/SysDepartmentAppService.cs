using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.SystemApp
{
    public class SysDepartmentAppService
    {
        private readonly IFreeSql Sqldb;
        public SysDepartmentAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 数据列表
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public List<sys_dept> GetData()
        {
            var list = Sqldb.Select<sys_dept>().OrderBy(s=>s.order_num).ToList();
            return list;
        }

        /// <summary>
        /// 部门信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_dept GetModel(int id)
        {
            return Sqldb.Select<sys_dept>().Where(s => s.id == id).First();

        }
        /// <summary>
        /// ztree下拉选择树
        /// </summary>
        /// <returns></returns>
        public List<ZtreeSelInt64Dto> GetDepartTree()
        {
            var depts = Sqldb.Queryable<sys_dept>()
               .OrderBy(s => s.order_num)
               .ToList(s => new ZtreeSelInt64Dto()
               {
                   id = s.id,
                   pId = s.parent_id,
                   name = s.dept_name
               });
            //depts.Insert(0, new ZtreeSelInt64Dto { id = 0, name = "请选择" });
            return depts;
        }

        /// <summary>
        /// 提交数据
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="user"></param>
        public void SaveDepartment(sys_dept dto,LoginUserDto user)
        {

            dto.update_by = user.LoginName;
            dto.update_time = DateTime.Now;
            dto.ancestors = "";
            dto.phone = dto.phone ?? "";
            dto.email = dto.email ?? "";
            dto.remark = dto.remark ?? "";
            if (dto.leader_id == 0)
            {
                dto.leader = "";
            }
            else
            {
                string leader = Sqldb.Select<sys_user>().Where(s => s.id == dto.leader_id).First(s => s.user_name);
                dto.leader = leader ?? "";
            }
            if (dto.id == 0)
            {
                dto.create_by = user.LoginName;
                dto.create_time = DateTime.Now;
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<sys_dept>().SetSource(dto).IgnoreColumns(s=>new { s.create_by,s.create_time,s.del_flag})
                    .Where(s => s.id == dto.id).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="id"></param>
        public ResultAdaptDto DeleteById(int id)
        {
            ResultAdaptDto ret = new ResultAdaptDto();
            var sons = Sqldb.Select<sys_dept>().Where(s => s.parent_id == id).ToList(s => s.id);
            if (sons.Count > 0)
            {
                ret.message = "请先删除当前部门下面的子部门";
                ret.status = false;
            }
            Sqldb.Delete<sys_dept>().Where(s => s.id == id).ExecuteAffrows();
            return ret;
        }
    }
}
