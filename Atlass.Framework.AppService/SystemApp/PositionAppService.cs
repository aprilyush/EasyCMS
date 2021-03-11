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
    public class PositionAppService
    {
        private readonly IFreeSql Sqldb;
        public PositionAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        /// <summary>
        ///获取数据列表
        /// </summary>
        /// <param name="param"></param>

        public BootstrapGridDto GetData(BootstrapGridDto param)
        {
            long total = 0;
            var query = Sqldb.Select<sys_position>()
                    .OrderBy(s => s.id)
                .Page(param.pageNumber, param.pageSize)
                .Count(out total)
                .ToList();

            param.total = total;
            param.rows = query;
            return param;
        }

        /// <summary>
        ///新增数据
        /// </summary>
        /// <param name="dto"></param>

        public void Save(sys_position dto,LoginUserDto user)
        {
           
            dto.post_code = dto.post_code ?? "";
            dto.update_by = user.AccountName;
            dto.update_time = DateTime.Now;
            if (dto.id == 0)
            {
                dto.create_by = user.AccountName;
                dto.create_time = DateTime.Now;
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<sys_position>().SetSource(dto).IgnoreColumns(s=>new { s.create_by,s.create_time }).ExecuteAffrows();
            }
           
        }


        /// <summary>
        ///获取单条数据
        /// </summary>
        /// <param name="id"></param>

        public sys_position GetDataById(long id)
        {
            return Sqldb.Select<sys_position>().Where(s => s.id == id).First();
        }

        /// <summary>
        ///批量删除
        /// </summary>
        /// <param name="ids"></param>

        public void DelByIds(string ids)
        {
            long[] idsL = ids.SplitToArrayInt64();
            Sqldb.Delete<sys_position>().Where(s=> idsL.Contains(s.id)).ExecuteAffrows();
        }
    }
}
