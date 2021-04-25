
using Atlass.Framework.Models.CmsSet;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.CmsSet
{
    public class AdAppService
    {
        private readonly IFreeSql Sqldb;
        public AdAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 数据列表
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public DataTableDto GetData(DataTableDto dto)
        {
            var query = Sqldb.Select<cms_ad>()
                .OrderByDescending(s => s.id)
                .Count(out long total)
                .Page(dto.pageNumber, dto.pageSize)
                .ToList();
            dto.rows = query;
            dto.total = total;
            return dto;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="loginUser"></param>
        /// <returns></returns>
        public cms_ad Save(cms_ad dto,LoginUserDto loginUser)
        {
            dto.ad_href = dto.ad_href ?? "#";
            dto.image_height = dto.image_height < 0 ? 100 : dto.image_height;
            dto.image_width = dto.image_width < 0 ? 100 : dto.image_width;
            dto.update_by = loginUser.LoginName;
            dto.update_time = DateTime.Now;
            dto.enable_status = 1;
            if (dto.id == 0)
            {
                dto.create_time = DateTime.Now;
                dto.create_by = loginUser.LoginName;
                dto.id=(int)Sqldb.Insert(dto).ExecuteIdentity();
            }
            else
            {
                Sqldb.Update<cms_ad>().SetSource(dto).ExecuteAffrows();
            }
            return dto;
        }

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public cms_ad GetModel(int id)
        {
            return Sqldb.Select<cms_ad>().Where(s => s.id == id).First();
        }


        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public int[] DeleteById(string ids)
        {
            var idsArray = ids.SplitToArrayInt();
            Sqldb.Delete<cms_ad>().Where(s => idsArray.Contains(s.id)).ExecuteAffrows();
            return idsArray;
        }

        /// <summary>
        /// 禁用广告
        /// </summary>
        /// <param name="id"></param>
        public void Ban(int id)
        {
            Sqldb.Update<cms_ad>().Set(s=>s.enable_status, 0).Where(s => s.id == id).ExecuteAffrows();
        }
    }
}
