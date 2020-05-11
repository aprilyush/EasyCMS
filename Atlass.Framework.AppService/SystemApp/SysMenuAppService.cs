using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.AppService;
using Atlass.Framework.ViewModels.SystemApp;
using Atlass.Framework.ViewModels.Wx;
using Microsoft.Extensions.DependencyInjection;
using Atlass.Framework.Models.doctor;
using Atlass.Framework.Models.Admin;

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
        /// 数据表格
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public List<sys_menu> GetMenuList(BootstrapGridDto param)
        {

            //int total = 0;
            var query = Sqldb.Queryable<sys_menu>().OrderBy(s=>s.menu_sort).ToList();
            return query;
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

            dto.id = IdWorkerHelper.NewId();
            dto.create_time = DateTime.Now;
            dto.create_person = "admin";
            //dto.menu_icon = dto.menu_font;
            if (!string.IsNullOrEmpty(dto.menu_url))
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
                    funcModel.func_cname = func.title;
                    funcModel.func_name = func.funcname;
                    funcModel.func_icon = func.icon;
                    funcModel.func_url = func.url;
                    funcModel.in_table = func.intable;
                    funcModel.id = func.id > 0 ? func.id : IdWorkerHelper.NewId();
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

            if (!string.IsNullOrEmpty(dto.menu_url))
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
                    funcModel.func_cname = func.title;
                    funcModel.func_name = func.funcname;
                    funcModel.func_icon = func.icon;
                    funcModel.func_url = func.url;
                    funcModel.in_table = func.intable;
                    funcModel.id = func.id > 0 ? func.id : IdWorkerHelper.NewId();
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
                    .Select(s => new SysFuncDto() { id = s.id, title = s.func_cname, funcname = s.func_name,
                        icon = s.func_icon, url = s.func_url, intable = s.in_table,
                        funcSort = s.func_sort
                    })
                    .ToList();
        }
        /// <summary>
        /// 模块导航
        /// </summary>
        /// <returns></returns>
        public List<sys_menu> GetTopMenuList(LoginUserDto UserCookie)
        {

            var list = new List<sys_menu>();

            if (UserCookie.IsSuper)
            {
                list =
                    Sqldb.Queryable<sys_menu>()
                        .Where(s => s.parent_id==0)
                        .OrderBy(s => s.menu_sort)
                        .ToList();
            }
            else
            {
                list =
                    Sqldb.Select<sys_menu, sys_role_authorize>()
                        .LeftJoin((m, r) => m.id == r.menu_id)
                        .Where((m, r) => r.role_id == UserCookie.SysRoleId && m.parent_id == 0)
                        .OrderBy((m, r) => m.menu_sort)
                        .ToList((m, r) => m);
            }

            return list;


        }
        /// <summary>
        /// 根据权限获取菜单
        /// </summary>
        /// <returns></returns>
        /// <summary>
        /// 根据权限获取菜单
        /// </summary>
        /// <returns></returns>
        public async Task<(List<RoleMenuDto>, List<RoleMenuDto>)> GetRoleMenu(LoginUserDto UserCookie)
        {
            var list = new List<RoleMenuDto>();
            if (UserCookie.IsSuper)
            {
                list = await Sqldb.Queryable<sys_menu>().OrderBy(s => s.menu_sort).Select(s => new RoleMenuDto()
                {
                    id = s.id,
                    menu_name = s.menu_name,
                    menu_sort = s.menu_sort,
                    menu_url = s.menu_url,
                    parent_id = s.parent_id,
                    menu_type = s.menu_type,
                    menu_icon = s.menu_icon
                }).ToListAsync();

                var funcs = await Sqldb.Queryable<sys_operate>().OrderBy(m => m.func_sort).Select(m => new RoleMenuDto()
                {
                    id = m.id,
                    menu_name = m.func_cname,
                    func_name = m.func_name,
                    menu_url = m.func_url,
                    parent_id = m.menu_id,
                    menu_type = 3,
                    menu_icon = m.func_icon,
                    in_table = m.in_table
                }).ToListAsync();
                return (list, funcs);
            }
            else
            {
                list =
                    await Sqldb.Select<sys_menu, sys_role_authorize>()
                        .LeftJoin((m, r) => m.id == r.menu_id)
                       .Where((m, r) => r.role_id == UserCookie.SysRoleId)
                       .OrderBy((m, r) => m.menu_sort)
                       .ToListAsync((m, r) => new RoleMenuDto()
                       {
                           id = m.id,
                           menu_name = m.menu_name,

                           menu_sort = m.menu_sort,
                           menu_url = m.menu_url,
                           parent_id = m.parent_id,
                           menu_type = m.menu_type,
                           menu_icon = m.menu_icon
                       });

                var funcs = await Sqldb.Select<sys_operate, sys_role_authorize>()
                             .LeftJoin((m, r) => m.id == r.menu_id)
                        .Where((m, r) => r.role_id == UserCookie.SysRoleId)
                        .OrderBy((m, r) => m.id)
                        .ToListAsync((m, r) => new RoleMenuDto()
                        {
                            id = m.id,
                            menu_name = m.func_cname,
                            func_name = m.func_name,
                            menu_url = m.func_url,
                            parent_id = m.menu_id,
                            menu_type = 3,
                            menu_icon = m.func_icon,
                            in_table = m.in_table
                        });

                return (list, funcs);

            }
           
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
                long[] arri = idsArray.StrToLongArray();
                Sqldb.Transaction(() =>
                {
                    var affrows=Sqldb.Delete<sys_menu>().Where(s=> arri.Contains(s.id)).ExecuteAffrows();
                    if (affrows < 1)
                        throw new Exception("sys_menu");
                    affrows = Sqldb.Delete<sys_operate>().Where(s => arri.Contains(s.menu_id)).ExecuteAffrows();
                    //if (affrows < 1)
                    //    throw new Exception("sys_menu");
                    affrows = Sqldb.Delete<sys_role_authorize>()
                        .Where(s => arri.Contains(s.menu_id) || arri.Contains(s.menu_pid))
                        .ExecuteAffrows();
                    //if (affrows < 1)
                    //    throw new Exception("sys_menu");
                });

            }

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

        public List<sys_operate> GetFuncSelList()
        {
            return Sqldb.Queryable<sys_operate>().OrderBy(s => s.func_sort).ToList();
        }




        /// <summary>
        /// 获取首页统计
        /// </summary>
        /// <returns></returns>
        public HomeChartDto GetHomeChart()
        {
            var model=new HomeChartDto();
            var chart=new EchartsDto();
            var time = DateTime.Now;
            var stime=new DateTime(time.Year,time.Month,1);
            var today=new DateTime(time.Year,time.Month,time.Day,0,0,0);
            int days = time.Day;
            //总览数量
            decimal totalFen= Sqldb.Select<pay_history>().Where(s => s.pay_time > stime).Sum(s=>s.total_fee);
            model.MonthPayCount = decimal.Round(totalFen/100,2) ;
            var questions = Sqldb.Queryable<expert_question>().Where(s => s.insert_time > stime)
                .Select(s => new { id = s.id, itime = s.insert_time }).ToList();
            int count = 0;
            if (questions.Any())
            {
                count = 1;
                model.TodayQuestionCount = questions.Where(s => s.itime > today).Count();
                model.MonthQuestionCount = questions.Count;
                model.TotalQuestion = Sqldb.Select<expert_question>().Count();
            }
            var ymodel = new EchartsYDto();
            ymodel.name = "本月咨询量";
            for (int i = 0; i < days; i++)
            {
                if (i >0)
                {
                    stime = stime.AddDays(1);
                }
                if (count > 0)
                {
                    var etime = stime.AddDays(1);
                    int tcount = questions.Where(s => s.itime > stime&&s.itime<etime).Count();
                    ymodel.data.Add(tcount);
                }
                else
                {
                   ymodel.data.Add(0);
                }
                chart.Xdata.Add(stime.ToString("MM-dd"));
            }
            chart.Ydata.Add(ymodel);
            chart.Title.Add(ymodel.name);
            model.chart = chart;
            //图表
            return model;
        }


        /// <summary>
        /// 获取首页统计
        /// </summary>
        /// <returns></returns>
        public HomeChartDto GetHomeDoctorChart(LoginUserDto user)
        {
            var model = new HomeChartDto();
            var chart = new EchartsDto();
            var time = DateTime.Now;
            var stime = new DateTime(time.Year, time.Month, 1);
            var today = new DateTime(time.Year, time.Month, time.Day, 0, 0, 0);
            int days = time.Day;
            int year_num = stime.ToString("yyyyMM").ToInt();
            //总览数量
            decimal totalFen = Sqldb.Select<pay_chart,user_ref_expert>()
                 .InnerJoin((p,u)=>p.expert_id==u.expert_id)
                .Where((p, u) =>u.user_id==user.Id&&p.year_num > year_num).First((p, u) =>p.money_num);

            string emptyId = IdWorkerHelper.GenOId();
            model.MonthPayCount = decimal.Round(totalFen / 100, 2);
            var questions = Sqldb.Select<expert_question,user_ref_expert>()
                .InnerJoin((q, u) => q.expert_oid == u.expert_id)
                .Where((q,u)=>u.user_id==user.Id&&q.insert_time > stime&&q.pid==emptyId)
                .ToList((q, u) => new { id = q.id, itime = q.insert_time });
            int count = 0;
            if (questions.Any())
            {
                count = 1;
                model.TodayQuestionCount = questions.Where(s => s.itime > today).Count();
                model.MonthQuestionCount = questions.Count;
                
            }

            model.TotalQuestion = Sqldb.Select<expert_question, user_ref_expert>()
                .InnerJoin((q, u) => q.expert_oid == u.expert_id)
                .Where((q, u) => u.user_id == user.Id && q.pid == emptyId).Count();
            var ymodel = new EchartsYDto();
            ymodel.name = "本月咨询量";
            for (int i = 0; i < days; i++)
            {
                if (i > 0)
                {
                    stime = stime.AddDays(1);
                }
                if (count > 0)
                {
                    var etime = stime.AddDays(1);
                    int tcount = questions.Where(s => s.itime > stime && s.itime < etime).Count();
                    ymodel.data.Add(tcount);
                }
                else
                {
                    ymodel.data.Add(0);
                }
                chart.Xdata.Add(stime.ToString("MM-dd"));
            }
            chart.Ydata.Add(ymodel);
            chart.Title.Add(ymodel.name);
            model.chart = chart;
            //图表
            return model;
        }
    }
}
