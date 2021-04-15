using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.AppService
{
    public class SysDicAppService
    {
        private readonly IFreeSql Sqldb;
        public SysDicAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 数据列表
        /// </summary>
        /// <returns></returns>
        public DataTableDto GetData(DataTableDto dto, string code, string name)
        {
            var query= Sqldb.Queryable<sys_dictionary>()
                      .Where(s=>s.parent_id==0)
                      .WhereIf(!code.IsEmpty(),s=>s.dic_code==code)
                      .WhereIf(!name.IsEmpty(),s=>s.dic_name==name)
                      .OrderBy(s => s.sort_num)
                       .Count(out long total)
                .Page(dto.page, dto.limit).ToList();

            dto.rows = query;
            dto.total = total;
            return dto;
        }
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        public void InsertDicData(sys_dictionary dto,LoginUserDto UserCookie)
        {
            dto.id = IdHelper.NewId();
            dto.create_person = UserCookie.LoginName;
            dto.create_time = DateTime.Now;

            if (dto.parent_id != 0)
            {
                var dicCode =
                    Sqldb.Select<sys_dictionary>().Where(s => s.id == dto.parent_id).First(s => s.dic_code);

                dto.dic_code = dicCode;
            }
            Sqldb.Insert(dto).ExecuteAffrows();
        }
        /// <summary>
        /// 更新字典
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateDicData(sys_dictionary dto)
        {
            if (dto.parent_id != 0)
            {
                var dicCode =
                    Sqldb.Queryable<sys_dictionary>().Where(s => s.id == dto.parent_id).First(s => s.dic_code);

                dto.dic_code = dicCode;
            }
            Sqldb.Update<sys_dictionary>().SetSource(dto).IgnoreColumns(s => new {s.create_person, s.create_time }).ExecuteAffrows();
        }

        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_dictionary GetDicById(long id)
        {
            return Sqldb.Queryable<sys_dictionary>().Where(s => s.id == id).First();
        }

        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="ids"></param>
        public void DelByIds(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idsArray = ids.SplitToArrayInt64();

                Sqldb.Delete<sys_dictionary>().Where(s=>idsArray.Contains(s.id)).ExecuteAffrows();
                Sqldb.Delete<sys_dictionary>().Where(s => idsArray.Contains(s.parent_id)).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 删除子项
        /// </summary>
        /// <param name="ids"></param>
        public void DeleteSonByIds(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idsArray = ids.SplitToArrayInt64();

                Sqldb.Delete<sys_dictionary>().Where(s => idsArray.Contains(s.id)).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 字典数据
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="pid"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public DataTableDto GetSonList(DataTableDto dto,long pid,string name)
        {
            var query = Sqldb.Queryable<sys_dictionary>()
                    .Where(s=>s.parent_id==pid)
                    .WhereIf(!name.IsEmpty(), s => s.dic_name == name)
                    .OrderBy(s => s.sort_num)
                     .Count(out long total)
              .Page(dto.page, dto.limit).ToList();

            dto.rows = query;
            dto.total = total;
            return dto;
        }


        /// <summary>
        /// 获取下来数据
        /// </summary>
        /// <returns></returns>
        public List<DicKeyInt64Dto> GetDicSelList()
        {
            var query= Sqldb.Queryable<sys_dictionary>()
                .Where(s => s.parent_id == 0)
                .OrderBy(s => s.sort_num)
                .ToList(s=>new DicKeyInt64Dto { id=s.id,name=s.dic_name});
            return query;
        }

    }
}
