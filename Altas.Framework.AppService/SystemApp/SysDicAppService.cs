using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Altas.Framework.AppService;
using Altas.Framework.Common;
using Altas.Framework.Core.AltasDbContext;
using Altas.Framework.Core.Web;
using Altas.Framework.Models;
using Altas.Framework.ViewModels.Common;
using Animal.Adoption.Utils;
using SqlSugar;


namespace Altas.Framework.AppService
{
    public class SysDicAppService:BaseAppService
    {
        public SysDicAppService(IAltasDbContext sqldb)
            :base(sqldb)
        {

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
        public void InsertDicData(sys_dictionary dto)
        {
            dto.id = IdWorkerHelper.NewId();
            dto.create_person = UserCookie.AccountName;
            dto.create_time = DateTime.Now;

            if (dto.parent_id != 0)
            {
                var dicCode =
                    Sqldb.Queryable<sys_dictionary>().Where(s => s.id == dto.parent_id).Select(s => s.dic_code).First();

                dto.dic_code = dicCode;
            }
            Sqldb.Insertable(dto).ExecuteCommand();
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
                    Sqldb.Queryable<sys_dictionary>().Where(s => s.id == dto.parent_id).Select(s => s.dic_code).First();

                dto.dic_code = dicCode;
            }
            Sqldb.Updateable(dto).IgnoreColumns(s => new {s.create_person, s.create_time }).ExecuteCommand();
        }

        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_dictionary GetDicById(string id)
        {
            return Sqldb.Queryable<sys_dictionary>().InSingle(id);
        }

        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="ids"></param>
        public void DelByIds(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idsArray = ids.Split(',');

                Sqldb.Deleteable<sys_dictionary>().In(idsArray).ExecuteCommand();
            }
        }


        public List<sys_dictionary> GetDicSelList()
        {
            return Sqldb.Queryable<sys_dictionary>().Where(s => s.parent_id == 0).ToList();
        }

        public List<ZtreeDto> GetDicZtree()
        {
            var data = Sqldb.Queryable<sys_dictionary>().OrderBy(s=>s.sort_num).Where(s => s.parent_id == 0).Select(s=>new ZtreeDto()
            {
                id = s.id.ToString(),
                name = s.dic_name,
                pId = s.parent_id.ToString()
            }).ToList();

            return data;
        }


        public List<sys_dictionary> GetTreeGrid()
        {
            return Sqldb.Queryable<sys_dictionary>().OrderBy(s => s.sort_num).ToList();
        }
    }
}
