using Atlass.Framework.Common;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.AppService.SystemApp
{
    public class LoginInfoAppService
    {
        private readonly IFreeSql Sqldb;
        public LoginInfoAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public DataTableDto GetData(DataTableDto dto,int loginStatus,string loginName, string loginIP, string loginDate)
        {
            var stime = DateTime.Now.AddDays(-15);
            if (!loginDate.IsEmpty())
            {
                stime = loginDate.ToDate();
            }
            var query = Sqldb.Select<login_info>()
                      .Where(s=>s.request_time> stime)
                      .WhereIf(loginStatus >= 0,s=>s.login_status== loginStatus)
                      .WhereIf(!loginName.IsEmpty(), s => s.login_name == loginName)
                      .WhereIf(!loginIP.IsEmpty(), s => s.request_ip == loginIP)
                      .OrderByDescending(s => s.id)
                      .Count(out long total)
                      .Page(dto.pageNumber, dto.pageSize)
                      .ToList();
            dto.total = total;
            dto.rows = query;
            return dto;
        }

        /// <summary>
        /// 插入登录信息
        /// </summary>
        /// <param name="dto"></param>
        public void InsertLoginInfo(login_info dto)
        {
            Sqldb.Insert(dto).ExecuteAffrows();
        }


        public void Delete(string ids)
        {
            var idsArray = ids.SplitToArrayInt();
            Sqldb.Delete<login_info>().Where(s => idsArray.Contains(s.id)).ExecuteAffrows();
        }


        public void Clear()
        {
            Sqldb.Ado.ExecuteScalar("truncate table login_info");
        }
    }
}
