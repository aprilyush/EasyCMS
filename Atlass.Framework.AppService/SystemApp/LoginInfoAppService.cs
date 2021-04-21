using Atlass.Framework.Models.Admin;
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
        /// 插入登录信息
        /// </summary>
        /// <param name="dto"></param>
        public void InsertLoginInfo(login_info dto)
        {
            Sqldb.Insert(dto).ExecuteAffrows();
        }
    }
}
