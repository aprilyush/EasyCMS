using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.Doctor
{
    public class ExpertDicAppService
    {
        private readonly IFreeSql Sqldb;
        public ExpertDicAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public BootstrapGridDto GetData(BootstrapGridDto param)
        {
           
            var query = Sqldb.Queryable<expert_dic>()
                .Where(s => s.is_delete == 0)
                .OrderBy(s => s.expert_sort)
                .Count(out long total)
                .Page(param.page, param.limit)
                .ToList();
            param.total = total;
            param.rows = query;
            return param;
        }

        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        public void InsertData(expert_dic dto)
        {
            dto.id = IdWorkerHelper.GenObjectId();
            Sqldb.Insert(dto).ExecuteAffrows();
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateData(expert_dic dto)
        {
            Sqldb.Update<expert_dic>(dto).ExecuteAffrows();
        }

        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public expert_dic GetDataById(string id)
        {
            var model = Sqldb.Queryable<expert_dic>().Where(s => s.id == id).First();
            return model;
        }

        public void DeleteById(string id)
        {
            Sqldb.Update<expert_dic>().Set(s => s.is_delete,1).Where(s => s.id == id)
                .ExecuteAffrows();
        }
    }
}
