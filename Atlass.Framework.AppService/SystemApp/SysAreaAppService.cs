using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.AppService;
using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.SystemApp;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.AppService
{
    public class SysAreaAppService 
    {
        private readonly IFreeSql Sqldb;
        public SysAreaAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 数据列表
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public List<CityTreeDto> GetData(long pid)
        {
            var list=new List<CityTreeDto>();
            var query = Sqldb.Queryable<sys_citys>().Where(s => s.province_code == pid).ToList();
            list = query.Where(s => s.city_code == 0)
                .Select(s => new CityTreeDto() {name = s.name, pid = s.city_code, zipcode = s.zipcode }).ToList();
            var cunty= query.Where(s => s.city_level == 3)
                .Select(s => new CityTreeDto() { name = s.name, pid = s.city_code, zipcode = s.zipcode}).ToList();
            list.AddRange(cunty);
            return list;
        }

        public List<ZtreeDto> GetProvince()
        {
            var query = Sqldb.Queryable<sys_citys>().Where(s=>s.province_code==0)
                .Select(s => new ZtreeDto() {id = s.zipcode.ToString(), name = s.name, pId = "0"}).ToList();
            return query;
        }
        public List<SysAreaTreeDto> GetAreaTree()
        {
            // var list=new List<SysAreaTreeDto>();
            //var data = Sqldb.Queryable<sys_citys>().OrderBy(s => s.sort).ToList();

            //var top = data.Where(s => s.parent_id == 0).Select(s => new SysAreaTreeDto()
            //{
            //    id = s.id,
            //    name = s.name,
            //    parent_id = s.parent_id,
            //    area_code = s.area_code,
            //    lat_lng = s.lat_lng,
            //    sort = s.sort,
            //    remark = s.remark
            //}).ToList();

            //foreach (var item in top)
            //{
            //    var level2tree = data.Where(s => s.parent_id == item.id).Select(s => new SysAreaTreeDto()
            //    {
            //        id = s.id,
            //        name = s.name,
            //        parent_id = s.parent_id,
            //        area_code = s.area_code,
            //        lat_lng = s.lat_lng,
            //        sort = s.sort,
            //        remark = s.remark
            //    }).ToList();


            //    foreach (var tree in level2tree)
            //    {
            //        var level3tree = data.Where(s => s.parent_id == tree.id).Select(s => new SysAreaTreeDto()
            //        {
            //            id = s.id,
            //            name = s.name,
            //            parent_id = s.parent_id,
            //            area_code = s.area_code,
            //            lat_lng = s.lat_lng,
            //            sort = s.sort,
            //            remark = s.remark
            //        }).ToList();

            //        tree.children = level3tree;
            //    }

            //    item.children = level2tree;
            //}


            return new List<SysAreaTreeDto>();

        }
        public bool IsExist(int areaCode, long id)
        {
            bool codeCount = false;
            if (id == 0)
            {
                var count = Sqldb.Queryable<sys_citys>().Where(s => s.zipcode == areaCode).Count();

                if (count > 0)
                {
                    codeCount = true;
                }
            }
            else
            {
                var count = Sqldb.Queryable<sys_citys>().Where(s => s.zipcode == areaCode && s.id != id).Count();

                if (count > 0)
                {
                    codeCount = true;
                }
            }

            return codeCount;
        }
        public void InsertData(sys_citys dto)
        {

            //if (dto.parent_id == 0)
            //{
            //    dto.parent_name = string.Empty;
            //}
            //else
            //{
            //    var parea = Sqldb.Queryable<sys_citys>().Where(s => s.id == dto.parent_id).First();

            //    dto.area_Level = parea.area_Level + 1;
            //}
            //dto.lat_lng = dto.lat_lng ?? string.Empty;
            //dto.id = IdWorkerHelper.NewId();
            //dto.create_person = UserCookie.AccountName;
            //dto.create_time = DateTime.Now;

            Sqldb.Insert(dto).ExecuteAffrows();

        }

        public void UpdateData(sys_citys dto)
        {
            //if (dto.parent_id == 0)
            //{
            //    dto.parent_name = string.Empty;
            //}
            //else
            //{
            //    var parea = Sqldb.Queryable<sys_citys>().Where(s => s.id == dto.parent_id).First();

            //    dto.area_Level = parea.area_Level + 1;
            //}
            //dto.lat_lng = dto.lat_lng ?? string.Empty;
            Sqldb.Update<sys_citys>().SetSource(dto).ExecuteAffrows();
        }

        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_citys GetAreaById(long id)
        {
            return Sqldb.Queryable<sys_citys>().Where(s => s.id == id).First();
        }
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="ids"></param>
        public void DelByIds(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idsArray = ids.Split(',').StrToLongArray();

                Sqldb.Delete<sys_citys>().Where(s=>idsArray.Contains(s.id)).ExecuteAffrows();
            }
        }

        
        public List<ZtreeDto> GetAreaZtree(int level)
        {
            return new List<ZtreeDto>();
            //var data =
            //        Sqldb.Queryable<sys_citys>()
            //            .Where(s => s.area_Level <= level)
            //            .OrderBy(s => s.sort)
            //            .Select(s => new ZtreeDto()
            //            {
            //                id = s.id.ToString(),
            //                name = s.name,
            //                pId = s.parent_id.ToString(),
            //                treeLevel = s.area_Level
            //            }).ToList();;

            //if (UserCookie.UserLevel == (int)UserLevelEnum.City)
            //{
            //    data =
            //        data.Where(
            //            s => s.pId == SqlFunc.ToString(UserCookie.City) || s.id == SqlFunc.ToString(UserCookie.City))
            //            .ToList();
            //}
            //else if (UserCookie.UserLevel == (int) UserLevelEnum.County)
            //{
            //    data =
            //        data.Where(
            //            s => s.pId == SqlFunc.ToString(UserCookie.County) || s.id == SqlFunc.ToString(UserCookie.County))
            //            .ToList();
            //}


            //return data;
        }
        /// <summary>
        /// 迭代获取区域下拉
        /// </summary>
        /// <returns></returns>
        public List<CitySelDto> GetCitySel()
        {
            var data = new List<CitySelDto>();
            var list = Sqldb.Queryable<sys_citys>().OrderBy(s => s.zipcode).Select(s => new CitySelDto() { Id = s.id, Name = s.name, ParentId = s.province_code }).ToList();

            var fdata = list.Where(s => s.ParentId == 0).ToList();

            foreach (var item in fdata)
            {
                data.Add(item);
                var city = list.Where(s => s.ParentId == item.Id).ToList();
                if (city.Any())
                {
                    item.Children = city;
                    foreach (var citem in city)
                    {
                        InitChildList(list, citem, citem.Id);
                        list.Add(citem);
                    }

                }
            }


            return data;
        }



        /// <summary>
        /// 迭代子项
        /// </summary>
        /// <param name="list"></param>
        /// <param name="node"></param>
        /// <param name="pId"></param>
        private void InitChildList(List<CitySelDto> list, CitySelDto node, long pId)
        {

            var parentList = list.Where(s => s.ParentId == pId).ToList();

            if (parentList.Any())
            {
                foreach (var pitem in parentList)
                {
                    node.Children.Add(pitem);
                    InitChildList(list, pitem, pitem.Id);
                }

            }
        }

        #region 常用

        public List<sys_citys> GetCountys(long pid)
        {
            if (pid == 0)
            {
                pid = 52;
            }

            return Sqldb.Queryable<sys_citys>().Where(s => s.province_code == pid && s.city_level == 3).ToList();
        }
       #endregion
    }
}
