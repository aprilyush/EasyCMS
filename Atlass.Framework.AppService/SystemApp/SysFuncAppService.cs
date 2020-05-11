using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.AppService
{
    public class SysFuncAppService
    {
        private readonly IFreeSql Sqldb;
        public SysFuncAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public BootstrapGridDto GetData(BootstrapGridDto param)
        {

            var data = Sqldb.Queryable<sys_operate>()
                .OrderBy(s => s.func_sort)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList();
            param.rows = data;
            param.total = total;

            return param;
        }


        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        public void InsertFunc(sys_operate dto)
        {
            dto.id = IdWorkerHelper.NewId();
            dto.func_icon = dto.func_icon ?? "tag";
            //dto.func_class = dto.func_class ?? "btn-blue";
            //dto.create_time=DateTime.Now;
            //dto.create_person = UserCookie.AccountName;

            Sqldb.Insert(dto).ExecuteAffrows();
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateFunc(sys_operate dto)
        {
            dto.func_icon = dto.func_icon ?? "tag";
            //dto.func_class = dto.func_class ?? "btn-blue";

            //Sqldb.Updateable(dto).IgnoreColumns(s => new {s.create_time, s.create_person }).ExecuteCommand();
        }

        /// <summary>
        /// 获取数据id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_operate GetDataById(long id)
        {
            return Sqldb.Queryable<sys_operate>().Where(s=>s.id==id).First();
        }


        public void DelByIds(string ids)
        {
            try
            {
                if (!string.IsNullOrEmpty(ids))
                {
                    var idsArray = ids.Split(',');
                    long[] arri = idsArray.StrToLongArray();

                    //Sqldb.Ado.co();
                    Sqldb.Delete<sys_operate>().Where(s=> arri.Contains(s.id)).ExecuteAffrows();
                    Sqldb.Delete<sys_menu_ref_operate>().Where(s => arri.Contains(s.operate_id)).ExecuteAffrows();
                    Sqldb.Delete<sys_role_authorize>()
                        .Where(s => arri.Contains(s.menu_id)).ExecuteAffrows();
                  //  Sqldb.Ado.CommitTran();
                }
            }
            catch (Exception ex)
            {
                //Sqldb.Ado.RollbackTran();
                throw ex;
            }
        }
    }
}
