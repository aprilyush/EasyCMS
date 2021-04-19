using Atlass.Framework.Common;
using Atlass.Framework.Enum;
using Atlass.Framework.Models.Cms;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.CmsSet
{
    public class IpManagerAppService
    {
        private IFreeSql SqlDb;
        public IpManagerAppService(IServiceProvider service)
        {
            SqlDb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 获取ip列表
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public DataTableDto GetList(DataTableDto param)
        {
            long total = 0;
            var query = SqlDb.Select<cms_ip_manager>()
                .OrderBy(s => s.id)
                .Count(out total)
                .Page(param.pageNumber, param.pageSize)
                .ToList();

            param.total = total;
            param.rows = query;

            return param;
        }

        /// <summary>
        /// 获取单个数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public cms_ip_manager GetModel(int id)
        {
            if (id == 0)
            {
                return null;
            }
            return SqlDb.Queryable<cms_ip_manager>().Where(s => s.id == id).First();
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public long SaveData(cms_ip_manager dto,LoginUserDto loginUser)
        {

            dto.update_by = loginUser.LoginName;
            dto.update_time = DateTime.Now;
            if (dto.id == 0)
            {
                dto.create_by = loginUser.LoginName;
                dto.create_time = DateTime.Now;
                return SqlDb.Insert(dto).ExecuteIdentity();
            }
            else
            {
                SqlDb.Update<cms_ip_manager>().SetSource(dto).ExecuteAffrows();
            }

            return 0;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public int[] DeleteByIds(string ids)
        {
            var idsArry = ids.SplitToArrayInt();
            SqlDb.Delete<cms_ip_manager>().Where(s => idsArry.Contains(s.id)).ExecuteAffrows();

            return idsArry;
        }

        /// <summary>
        /// 停用
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public int[] BanIp(string ids)
        {
            var idsArry = ids.SplitToArrayInt();
            SqlDb.Update<cms_ip_manager>()
                .Set(s=>s.limit_enable,DataStatusConstant.DISABLE).Where(s => idsArry.Contains(s.id)).ExecuteAffrows();

            return idsArry;
        }
    }
}
