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
        public List<sys_dictionary> GetData()
        {
            return Sqldb.Queryable<sys_dictionary>().OrderBy(s => s.sort_num).ToList();
        }

        public List<sys_dictionary> GetGridDataBypId(long pid)
        {
            //if (pid > 0)
            //{
                return Sqldb.Queryable<sys_dictionary>().OrderBy(s => s.sort_num).Where(s => s.parent_id == pid).ToList();
            //}
            //return new List<sys_dictionary>();
        }
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        public void InsertDicData(sys_dictionary dto,LoginUserDto UserCookie)
        {
            dto.id = IdWorkerHelper.NewId();
            dto.create_person = UserCookie.AccountName;
            dto.create_time = DateTime.Now;

            if (dto.parent_id != 0)
            {
                var dicCode =
                    Sqldb.Select<sys_dictionary>().Where(s => s.id == dto.parent_id).First(s => s.dic_code);

                dto.dic_code = dicCode;
            }
            else
            {
                dto.dic_code = "";
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
            }
        }


        public List<sys_dictionary> GetDicSelList()
        {
            return Sqldb.Queryable<sys_dictionary>().Where(s => s.parent_id == 0).ToList();
        }

        public List<ZtreeDto> GetDicZtree()
        {
            var data = Sqldb.Queryable<sys_dictionary>().OrderBy(s=>s.sort_num)
                .Where(s => s.parent_id == 0).ToList(s=>new ZtreeDto()
            {
                id = s.id.ToString(),
                name = s.dic_name,
                pId = s.parent_id.ToString()
            });

            return data;
        }


        public List<sys_dictionary> GetTreeGrid()
        {
            return Sqldb.Queryable<sys_dictionary>().OrderBy(s => s.sort_num).ToList();
        }
    }
}
