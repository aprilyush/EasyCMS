using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.SystemApp;
using Microsoft.Extensions.DependencyInjection;
using NPOI.OpenXmlFormats.Dml;

namespace Atlass.Framework.AppService
{
    public class SysMenuAppService
    {
        private readonly IFreeSql Sqldb;
        public SysMenuAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 获取菜单表格
        /// </summary>
        /// <returns></returns>
        public List<sys_menu> GetMenuList()
        {
            var query = Sqldb.Queryable<sys_menu>()
               .OrderBy(s => s.menu_sort)
               .ToList();

            return query;
        }
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="dto"></param>
        public void AddMenu(sys_menu dto,string funcs)
        {

            dto.id = IdHelper.NextId();
            dto.create_time = DateTime.Now;
            dto.create_person = "admin";
            //dto.menu_icon = dto.menu_font;
            if (dto.menu_url=="#")
            {
                dto.menu_type =0;
            }
            else
            {
                dto.menu_type = 1;
            }
            if (dto.parent_id == 0)
            {
                dto.menu_level = 1;
            }
            else
            {
                dto.menu_level = Sqldb.Select<sys_menu>().Where(s => s.id == dto.parent_id).First(s => s.menu_level)+ 1;
            }
            Sqldb.Insert(dto).ExecuteAffrows();

            //设置菜单下按钮
            if (dto.menu_type == 1 && !string.IsNullOrEmpty(funcs))
            {
                var funcArray = funcs.ToObject<List<SysFuncDto>>();
                var list = new List<sys_operate>();
                foreach (var func in funcArray)
                {
                    var funcModel = new sys_operate();
                    funcModel.menu_id = dto.id;
                    funcModel.func_title = func.title;
                    funcModel.role_tag = func.roleTag;
                    funcModel.id = func.id > 0 ? func.id : IdHelper.NextId();
                    funcModel.func_sort = func.funcSort;
                    list.Add(funcModel);
                }
                Sqldb.Insert(list).ExecuteAffrows();
            }

        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="dto"></param>
        public void UpdateMenu(sys_menu dto, string funcs)
        {

            if (dto.menu_url=="#")
            {
                dto.menu_type =0;
            }
            else
            {
                dto.menu_type = 1;
            }
            if (dto.parent_id == 0)
            {
                dto.menu_level = 1;
            }
            else
            {
                dto.menu_level = Sqldb.Queryable<sys_menu>().Where(s => s.id == dto.parent_id)
                    .First(s => s.menu_level)+ 1;
            }
            Sqldb.Update<sys_menu>(dto).SetSource(dto).IgnoreColumns(s => new { s.create_time, s.create_person }).ExecuteAffrows();

            //设置菜单下按钮
            Sqldb.Delete<sys_operate>().Where(s => s.menu_id == dto.id).ExecuteAffrows();
            if (dto.menu_type == 1 && !string.IsNullOrEmpty(funcs))
            {
                var funcArray = funcs.ToObject<List<SysFuncDto>>();
                var list = new List<sys_operate>();
                foreach (var func in funcArray)
                {
                    var funcModel = new sys_operate();
                    funcModel.menu_id = dto.id;
                    funcModel.func_title = func.title;
                    funcModel.role_tag = func.roleTag;
                    funcModel.id = func.id > 0 ? func.id : IdHelper.NextId();
                    funcModel.func_sort = func.funcSort;
                    list.Add(funcModel);
                }
                Sqldb.Insert(list).ExecuteAffrows();

            }
        }
        /// <summary>
        /// 单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public sys_menu GetMenuById(long id)
        {

            return Sqldb.Queryable<sys_menu>().Where(s => s.id == id).First();
        }
       
        /// <summary>
        /// 获取菜单下按钮
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<SysFuncDto> GetMenuRefOpt(long id)
        {
            return
                Sqldb.Queryable<sys_operate>()
                    .Where(s => s.menu_id == id)
                    .OrderBy(s=>s.func_sort)
                    .ToList(s => new SysFuncDto() { id = s.id, title = s.func_title,roleTag=s.role_tag,
                        funcSort = s.func_sort
                    });
        }
        

        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="ids"></param>
        public void DelByIds(long id)
        {
            if (id == 0)
            {
                return;
            }
            Sqldb.Transaction(() =>
            {
                var affrows = Sqldb.Delete<sys_menu>().Where(s =>s.id== id).ExecuteAffrows();
                if (affrows < 1)
                    throw new Exception("sys_menu");
                affrows = Sqldb.Delete<sys_operate>().Where(s => s.menu_id==id).ExecuteAffrows();
                //if (affrows < 1)
                //    throw new Exception("sys_menu");
                affrows = Sqldb.Delete<sys_role_authorize>()
                    .Where(s =>s.menu_id==id)
                    .ExecuteAffrows();
                affrows = Sqldb.Delete<sys_role_authorize>()
               .Where(s =>s.menu_pid == id)
               .ExecuteAffrows();
                //if (affrows < 1)
                //    throw new Exception("sys_menu");
            });

        }

        /// <summary>
        /// 删除操作
        /// </summary>
        /// <param name="funcId"></param>
        public void Delfunc(long funcId)
        {
            Sqldb.Delete<sys_operate>().Where(s => s.id == funcId).ExecuteAffrows();
            Sqldb.Delete<sys_role_authorize>().Where(s => s.menu_id == funcId).ExecuteAffrows();
        }


        /// <summary>
        /// 获取菜单目录的下拉
        /// </summary>
        /// <returns></returns>
        public List<ZtreeSelInt64Dto> GetMenuDicSelect()
        {
            var menus = Sqldb.Select<sys_menu>()
                .Where(s => s.menu_type == 0)
                .OrderBy(s => s.menu_sort)
                .ToList(s=>new ZtreeSelInt64Dto {id=s.id,name=s.menu_name, treeLevel=s.menu_level,pId=s.parent_id });

            List<ZtreeSelInt64Dto> list = new List<ZtreeSelInt64Dto>();
            if (menus.Count > 0)
            {
                List<ZtreeSelInt64Dto> tops = menus.Where(s => s.pId == 0).ToList();
                tops.ForEach(menu =>
                {
                    list.Add(menu);
                    var sons = menus.Where(s => s.pId == menu.id).ToList();
                    sons.ForEach(son =>
                    {
                        son.name = GetMenuNamePre(son.treeLevel-1) + son.name;
                        list.Add(son);
                          var sons2 = menus.Where(s => s.pId == son.id).ToList();
                        sons2.ForEach(son2 => {
                            son2.name = GetMenuNamePre(son2.treeLevel - 1) + son2.name;
                            list.Add(son2);
                        });
                       
                    });
                  
                });
            }

            list.Insert(0, new ZtreeSelInt64Dto { id = 0, name = "请选择" });
            return list;
        }

        private string GetMenuNamePre(int level)
        {
            string pre = "";
            for(int i = 0; i < level; i++)
            {
                pre += "¦┄┄";
            }
            return pre.Insert(0," ");
        }

    }
}
