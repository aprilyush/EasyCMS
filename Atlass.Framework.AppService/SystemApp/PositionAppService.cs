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

        public DataTableDto GetData(DataTableDto param)
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
            dto.update_by = user.LoginName;
            dto.update_time = DateTime.Now;
            if (dto.id == 0)
            {
                dto.create_by = user.LoginName;
                dto.create_time = DateTime.Now;
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<sys_position>().SetSource(dto).ExecuteAffrows();
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

        /// <summary>
        /// 获取职位下拉列表
        /// </summary>
        /// <returns></returns>
        public List<ZtreeSelInt64Dto> GetPositionSelectList()
        {
            var query = Sqldb.Select<sys_position>()
                        .OrderBy(s => s.post_sort)
                        .ToList(s => new ZtreeSelInt64Dto { id = s.id, name = s.post_name });
            return query;
        }

        /// <summary>
        /// 获取用户的职位信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string GetUserPositionName(long userId)
        {
            var positionIds = Sqldb.Select<sys_user_position>().Where(s => s.user_id == userId)
                .ToList(s => s.position_id);
            if (positionIds.Count > 0)
            {
                var positionNames = Sqldb.Select<sys_position>().Where(s => positionIds.Contains(s.id))
                    .ToList(s => s.post_name);
                if (positionNames.Count > 0)
                {
                    return string.Join(',', positionNames);
                }
            }
            return "暂无职务";
        }
    }
}
