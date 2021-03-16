using Atlass.Framework.Common;
using Atlass.Framework.Models.Cms;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Cms
{
    public class IpManagerAppService
    {
        private IFreeSql SqlDb;
        public IpManagerAppService(IServiceProvider service)
        {
            SqlDb = service.GetRequiredService<IFreeSql>();
        }

        public DataTableDto GetList(DataTableDto param)
        {
            long total = 0;
            var query = SqlDb.Select<cms_ip_manager>()
                .OrderBy(s => s.id)
                .Count(out total)
                .Page(param.page, param.limit)
                .ToList();

            param.total = total;
            param.rows = query;

            return param;
        }

        public cms_ip_manager GetModel(int id)
        {
            if (id == 0)
            {
                return null;
            }
            return SqlDb.Queryable<cms_ip_manager>().Where(s => s.id == id).First();
        }

        public long SaveData(cms_ip_manager dto)
        {
          //  dto.front_limit = dto.front_limit ?? false;
           // dto.back_limit = dto.back_limit ?? false;
            if (dto.id == 0)
            {
                return SqlDb.Insert(dto).ExecuteIdentity();
            }
            else
            {
                SqlDb.Update<cms_ip_manager>().SetSource(dto).ExecuteAffrows();
            }

            return 0;
        }

        public int[] DeleteByIds(string ids)
        {
            var idsArry = ids.SplitToArrayInt();
            SqlDb.Delete<cms_ip_manager>().Where(s => idsArry.Contains(s.id)).ExecuteAffrows();

            return idsArry;
        }
    }
}
