using Atlass.Framework.Models;
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
        public List<sys_department> GetData()
        {
            var list = Sqldb.Select<sys_department>().OrderBy(s=>s.sort_num).ToList();
            return list;
        }


        public sys_department GetModel(int id)
        {
            return Sqldb.Select<sys_department>().Where(s => s.id == id).First();

        }

        public List<ZtreeSelIntDto> GetDepartTree()
        {
            var depts = Sqldb.Queryable<sys_department>()
               .OrderBy(s => s.sort_num)
               .Select(s => new ZtreeSelIntDto()
               {
                   id = s.id,
                   pId = s.parent_id,
                   name = s.department_name
               }).ToList();
            return depts;
        }


        public void SaveDepartment(sys_department dto)
        {
            if (dto.parent_id == 0)
            {
                dto.department_level = 1;
            }
            else
            {
                dto.department_level = Sqldb.Select<sys_department>().Where(s => s.id == dto.parent_id).First(s => s.parent_id) + 1;
            }
            if (dto.id == 0)
            {
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<sys_department>().SetSource(dto).IgnoreColumns(s=>new { s.insert_id,s.insert_time})
                    .Where(s => s.id == dto.id).ExecuteAffrows();
            }
        }


        public void DeleteById(int id)
        {
            var sons = Sqldb.Select<sys_department>().Where(s => s.parent_id == id).ToList(s => s.id);
            Sqldb.Delete<sys_department>().Where(s => s.id == id).ExecuteAffrows();
            if (sons.Count > 0)
            {
                Sqldb.Delete<sys_department>().Where(s => sons.Contains(s.id)).ExecuteAffrows();
            }
        }
    }
}
