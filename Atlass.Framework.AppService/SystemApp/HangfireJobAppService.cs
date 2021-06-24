using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.SystemApp
{
    public class HangfireJobAppService
    {
        private readonly IFreeSql Sqldb;
        public HangfireJobAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public DataTableDto GetList(DataTableDto param)
        {

            var query = Sqldb.Select<hangfire_task>()
                .OrderByDescending(s=>s.excute_status)
                .OrderByDescending(s => s.excute_time).Count(out long total)
                .Page(param.page, param.limit).ToList();
            param.total = total;
            param.rows = query;
            return param;
        }

        /// <summary>
        /// 保持数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public string Save(hangfire_task dto)
        {
            if (dto.id.IsEmptyId())
            {

                var exiteJob = Sqldb.Select<hangfire_task>()
                    .Where(s => s.assembly_namespace == dto.assembly_namespace && s.class_name == dto.class_name).Count();
                if (exiteJob > 0)
                {
                    throw new Exception($"任务{dto.assembly_namespace}.{dto.class_name}已存在");
                }
                dto.id = IdHelper.ObjectId();
                dto.excute_time = DateTime.Now;
                dto.excute_status = 1;
                int affect=Sqldb.Insert(dto).ExecuteAffrows();
                if (affect < 1)
                {
                    throw new Exception("任务添加失败");
                }

                return dto.id;

            }
            else
            {
                int affect = Sqldb.Update<hangfire_task>().SetSource(dto).IgnoreColumns(s => new { s.excute_time,s.excute_status }).ExecuteAffrows();
                if (affect < 1)
                {
                    throw new Exception("任务添加失败");
                }

                return dto.id;
            }
        }

        public hangfire_task GetModel(string id)
        {
            return Sqldb.Select<hangfire_task>().Where(s => s.id == id).First();
        }

        public int DelByIds(string id)
        {
            
            return Sqldb.Delete<hangfire_task>().Where(s =>s.id==id).ExecuteAffrows();
        }

        public int Pause(string id)
        {
            return Sqldb.Update<hangfire_task>().Set(s=>s.excute_status,0).Where(s => s.id == id).ExecuteAffrows();
        }
        public int Resume(string id)
        {
            return Sqldb.Update<hangfire_task>().Set(s => s.excute_status, 1).Where(s => s.id == id).ExecuteAffrows();
        }


        /// <summary>
        /// 任务执行日志
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="jobId"></param>
        /// <returns></returns>
        public DataTableDto GetLogPageList(DataTableDto dto, string jobId)
        {
            var query = Sqldb.Select<crontab_history>()
                .Where(s => s.job_id == jobId)
               .OrderByDescending(s => s.id)
               .Count(out long total)
               .Page(dto.pageNumber, dto.pageSize).ToList();
            dto.total = total;
            dto.rows = query;
            return dto;
        }


        /// <summary>
        /// 清除执行日志
        /// </summary>
        /// <param name="jobId"></param>
        public void ClearJobLog(string jobId)
        {
            Sqldb.Delete<crontab_history>().Where(s => s.job_id == jobId).ExecuteAffrows();
        }
    }
}
