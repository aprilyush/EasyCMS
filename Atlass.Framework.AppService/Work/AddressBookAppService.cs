using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Work
{
    public class AddressBookAppService
    {
        private readonly IFreeSql Sqldb;
        public AddressBookAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public BootstrapGridDto GetList(BootstrapGridDto param, string name)
        {

            long total = 0;
            var query = Sqldb.Select<work_address_book>()
                .WhereIf(!string.IsNullOrEmpty(name), s => s.real_name == name)
                .OrderByDescending(s => s.id).Count(out total)
                .Page(param.page,param.limit)
                .ToList();

            param.total = total;
            param.rows = query;

            return param;
        }


        public  work_address_book GetModel(int id)
        {
            if (id == 0)
            {
                return null;
            }
           
            return Sqldb.Select<work_address_book>().Where(s => s.id == id).First();
        }

        public void Save(work_address_book dto)
        {
            dto.profile = dto.profile ?? "";
            dto.work_job = dto.work_job ?? "";
            dto.work_number = dto.work_number ?? "";
            dto.address = dto.address ?? "";
            dto.inner_tel = dto.inner_tel ?? "";
            dto.mobile = dto.mobile ?? "";
            dto.insert_time = DateTime.Now;
            if (dto.dept_id == 0)
            {
                dto.department_name = "";
            }
            else
            {
                dto.department_name = dto.department_name ?? "";
            }

            if (dto.id == 0)
            {

                Sqldb.Insert(dto).ExecuteAffrows();

            }
            else
            {
                Sqldb.Update<work_address_book>().SetSource(dto).IgnoreColumns(s=>s.insert_time).ExecuteAffrows();
            }
        }

        public void DeleteByIds(string ids)
        {
            var idsArray = ids.Split(',').StrToIntArray();
            Sqldb.Delete<work_address_book>().Where(s => idsArray.Contains(s.id)).ExecuteAffrows();
        }
    }
}
