using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Doctor
{
    public class ExpertInfoAppService
    {
        private readonly IFreeSql Sqldb;
        public ExpertInfoAppService(IServiceProvider service)
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
            var query = Sqldb.Queryable<expert_info>()
                .Where(s => s.is_delete == 0)
                .OrderByDescending(s => s.insert_time)
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
        public void InsertData(expert_info dto, string btns,LoginUserDto UserCookie)
        {
            dto.id = IdWorkerHelper.GenObjectId();
            dto.insert_time = DateTime.Now;
            dto.insert_uid = UserCookie.Id;
            //dto.star_score = 5;
            //dto.expert_count = 1;
            dto.open_id = dto.open_id ?? IdWorkerHelper.GenOopenId();
            Sqldb.Insert(dto).ExecuteAffrows();
            if (!string.IsNullOrEmpty(btns))
            {
                var btnlist = btns.ToObject<List<ext_button>>();
                if (btnlist.Any())
                {
                    btnlist.ForEach(s =>
                    {
                        s.pid = dto.id;
                    });
                    Sqldb.Insert(btnlist).ExecuteAffrows();
                }

            }

        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateData(expert_info dto, string btns)
        {
            dto.open_id = dto.open_id ?? IdWorkerHelper.GenOopenId();
            Sqldb.Update<expert_info>().SetSource(dto)
                .IgnoreColumns(s => new { s.insert_time, s.insert_uid, s.expert_count, s.star_score }).ExecuteAffrows();
         
            if (!string.IsNullOrEmpty(btns))
            {
                var btnlist = btns.ToObject<List<ext_button>>();

                if (btnlist.Any())
                {
                    var extids = btnlist.Where(s => s.id > 0).Select(s => s.id).ToList();
                    btnlist.ForEach(s =>
                    {
                        s.pid = dto.id;
                    });

                    if (extids.Any())
                    {
                        Sqldb.Delete<ext_button>().Where(s => extids.Contains(s.id)).ExecuteAffrows();
                    }
                    Sqldb.Insert(btnlist).ExecuteAffrows();
                }
            }
        }

        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public expert_info GetDataById(string id)
        {
            var model = Sqldb.Queryable<expert_info>().Where(s => s.id == id).First();
            return model;
        }

        public List<ext_button> GetButtons(string id)
        {
            return Sqldb.Queryable<ext_button>().Where(s => s.pid == id).ToList();
        }

        public void Delbtn(int id)
        {
            Sqldb.Delete<ext_button>().Where(s => s.id == id).ExecuteAffrows();
        }
        public void DeleteById(string id)
        {
            Sqldb.Update<expert_info>().Set(s => s.is_delete,1).Where(s => s.id == id)
                .ExecuteAffrows();
        }


        /// <summary>
        /// 获取专家类型列表
        /// </summary>
        /// <returns></returns>
        public List<DicKeyStrDto> GetExpertTypeList()
        {
            return Sqldb.Queryable<expert_dic>().Where(s => s.is_delete == 0)
                  .Select(s => new DicKeyStrDto()
                  {
                      id = s.id,
                      name = s.expert_name
                  }).ToList();

        }
    }
}
