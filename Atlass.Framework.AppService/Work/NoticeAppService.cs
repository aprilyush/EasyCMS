using Atlass.Framework.Common;
using Atlass.Framework.Models;
using Atlass.Framework.Models.Work;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Work
{
    public class NoticeAppService
    {
        private readonly IFreeSql Sqldb;
        public NoticeAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public BootstrapGridDto GetList(BootstrapGridDto param, string ntitle,LoginUserDto user)
        {
          
            long total = 0;
            var query = new List<work_notice>();


            var deptId = 0;
            if (user.IsSuper)
            {
                query = Sqldb.Select<work_notice>()
                    .WhereIf(!string.IsNullOrEmpty(ntitle), s => s.n_title.Contains(ntitle))
                .OrderByDescending(s => s.id).Count(out total).Page(param.page,param.limit)
                .ToList();
            }
            else
            {
                query = Sqldb.Select<work_notice, work_notice_reply>()
                    .InnerJoin((n, r) => n.id == r.notice_id)
               .Where((n, r) => r.dept_id == deptId)
                .WhereIf(!string.IsNullOrEmpty(ntitle), (n, r) => n.n_title.Contains(ntitle))
                .OrderByDescending((n, r) => n.id).Count(out total).Page(param.page, param.limit)
                .ToList();
            }

            if (query.Count > 0)
            {

                var ids = query.Select(s => s.id).ToList();

                var repList = Sqldb.Queryable<work_notice_reply>()
                    .Where(s => ids.Contains(s.notice_id)).ToList();

                query.ForEach(s =>
                {
                    var noticeRefReplys = repList.Where(a => a.notice_id == s.id).ToList();
                    s.received_count = noticeRefReplys.Where(a => a.reply_status == 1).Count();
                    s.unreceived_count = noticeRefReplys.Where(a => a.reply_status == 0).Count();
                    if (user.IsSuper)
                    {
                        s.is_check = 1;
                    }
                    else
                    {
                        if (deptId > 0)
                        {
                            s.is_check = noticeRefReplys.Where(a => a.dept_id == deptId).OrderBy(a => a.id)
                                          .Select(a => a.reply_status).FirstOrDefault();
                        }

                    }

                });
            }
            param.total = total;
            param.rows = query;

            return param;
        }



        public void Save(work_notice dto, string deptIds, LoginUserDto user)
        {
            dto.dept_ids = deptIds;
            var edeptIds = deptIds.SplitToArrayInt64();
            dto.total_depts = edeptIds.Count();
            var depts = Sqldb.Queryable<sys_dept>().Where(s => edeptIds.Contains(s.id)).ToList();
            
            if (dto.id == 0)
            {
                dto.insert_time = DateTime.Now;
                //dto.n_time = dto.insert_time.ToString("yyyy-MM-dd");
                
                long id= Sqldb.Insert(dto).ExecuteIdentity();
                dto.id = (int)id;
            }
            else
            {
                var notice = Sqldb.Queryable<work_notice>().Where(s => s.id == dto.id).First();
                if (notice == null)
                {
                    return;
                }
                Sqldb.Delete<work_notice_reply>().Where(s => s.notice_id == dto.id).ExecuteAffrows();
                Sqldb.Update<work_notice>().SetSource(dto).IgnoreColumns(s => new { s.insert_time }).ExecuteAffrows();
            }
            var list = new List<work_notice_reply>();
            if (depts.Count > 0)
            {

                foreach (var dept in depts)
                {

                    var model = new work_notice_reply();
                    model.notice_id = dto.id;
                    model.user_id =0;
                    model.nick_name ="";
                    model.dept_id = dept.id;
                    model.dept_name = dept.dept_name;
                    model.reply_status = 0;
                    if (user.DeptId == dept.id)
                    {
                        model.reply_status = 1;
                    }
                    model.reply_time = TimeHelper.MinDateTime();
                    list.Add(model);
                }

                if (list.Count > 0)
                {
                    Sqldb.Insert(list).ExecuteAffrows();
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="noticeId"></param>
        /// <param name="adminid"></param>
        /// <returns></returns>
        public bool Delete(string Ids, LoginUserDto user)
        {
            var noticeIds = Ids.SplitToArrayInt();
            var notices = Sqldb.Select<work_notice>()
                .Where(s => noticeIds.Contains(s.id)&&s.insert_id==user.Id).ToList(s => s.id);
            if (notices.Count==0)
            {
                return false;
            }
            Sqldb.Delete<work_notice>().Where(s => notices.Contains(s.id)).ExecuteAffrows();
            Sqldb.Delete<work_notice_reply>().Where(s => notices.Contains(s.notice_id)).ExecuteAffrows();
            return true;
        }

        public BootstrapGridDto GetReplyList(BootstrapGridDto param, int noticeId)
        {
           
            long total = 0;
            var replys = Sqldb.Select<work_notice_reply>().Where(s => s.notice_id == noticeId)
                .OrderByDescending(s => s.reply_time)
                .Count(out total)
                .Page(param.page, param.limit)
                .ToList();
            param.total = total;
            param.rows = replys;

            return param;
        }

        public work_notice GetModel(int id,LoginUserDto user)
        {
            if (id == 0)
            {
                return null;
            }
           
            var model = Sqldb.Select<work_notice>().Where(s => s.id == id).First();
            if (model != null)
            {
                if (model.insert_id == user.Id)
                {
                    model.is_check = 1;
                }
                else
                {
                    model.is_check = Sqldb.Select<work_notice_reply>()
                        .Where(s => s.notice_id == id && s.dept_id == user.DeptId)
                        .First(s => s.reply_status);
                }

                var replys = Sqldb.Queryable<work_notice_reply>().Where(s => s.notice_id == id).ToList();
                model.received_count = replys.Where(s => s.reply_status == 1).Count();
                model.unreceived_count =model.total_depts-model.received_count;
            }

            return model;
        }

        public work_notice GetModel(int id)
        {
            return Sqldb.Select<work_notice>().Where(s => s.id == id).First();
        }



        public bool Reply(int noticeId,LoginUserDto user)
        {
            var nowTime = DateTime.Now;

            if (user.DeptId > 0)
            {
                var notice = Sqldb.Queryable<work_notice>().Where(s => s.id == noticeId).First();
                if (notice != null)
                {
                    if (nowTime > notice.n_time)
                    {
                        return false;
                    }
                    var replyId = Sqldb.Select<work_notice_reply>().Where(s => s.notice_id == noticeId && s.dept_id == user.DeptId)
                        .OrderBy(s => s.id).First(s => s.id);
                    if (replyId == 0)
                    {
                        return true;
                    }
                    Sqldb.Update<work_notice_reply>().Set(s => new work_notice_reply
                    {
                        reply_time = DateTime.Now,
                        nick_name = user.UserName,
                        user_id = user.Id,
                        reply_status = 1

                    }).Where(s => s.id == replyId).ExecuteAffrows();

                }


            }

            return true;

        }
    }
}
