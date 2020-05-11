using Atlass.Framework.Common;
using Atlass.Framework.Common.Html;
using Atlass.Framework.Models;
using Atlass.Framework.Models.BaseData;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Api;
using Atlass.Framework.ViewModels.Common;
using Atlass.Framework.ViewModels.Wx;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Api
{
    public class ApiExpertAppService
    {
        private readonly IFreeSql Sqldb;
        public ApiExpertAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 获取专家列表
        /// </summary>
        /// <returns></returns>
        public List<ExpertListDto> GetAllList()
        {
            var categorys = Sqldb.Select<expert_dic>().Where(s => s.is_delete == 0).OrderBy(s => s.expert_sort)
                .ToList();
            var list = new List<ExpertListDto>();
            if (categorys.Count>0)
            {
                var cids = categorys.Select(s => s.id).ToList();
                string emptyOpenId = IdWorkerHelper.GenOopenId();
                var experts = Sqldb.Queryable<expert_info>()
                    .Where(s => cids.Contains(s.expert_type) && s.open_id != emptyOpenId && s.is_delete == 0 && s.is_show == true)
                    .OrderBy(s => s.show_sort)
                    .Select(s => new ExpertDetailDto()
                    {
                        id = s.id,
                        company_name = s.company_name,
                        expert_count = s.expert_count,
                        expert_name = s.expert_name,
                        position_name = s.position_name,
                        work_year = s.work_year,
                        expert_profile = s.expert_profile,
                        category_id = s.expert_type,
                        head_url = s.head_url,
                        star_score = s.star_score,
                        open_id = s.open_id,
                        expert_title = s.expert_title
                    }).ToList();

                categorys.ForEach(s =>
                {
                    var model = new ExpertListDto();
                    model.category_name = s.expert_name;
                    model.list = experts.Where(a => a.category_id == s.id).ToList();
                    list.Add(model);
                });
            }


            return list;
        }

        /// <summary>
        /// 获取banner
        /// </summary>
        /// <returns></returns>
        public List<banner_info> GetBanner()
        {
            return Sqldb.Select<banner_info>().OrderBy(s => s.banner_sort).ToList();
        }

        /// <summary>
        /// 首页姐妹翻车集锦
        /// </summary>
        /// <returns></returns>
        public List<string> GetHostQuestion()
        {
            var list = Sqldb.Select<hot_question>()
                .OrderByDescending(s => s.is_top)
                .OrderByDescending(S => S.hit_count)
                .Page(1, 10).ToList(s=>s.hot_title);
            return list;
        }


        /// <summary>
        /// 获取专家信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public expert_info GetExpertInfo(string id)
        {
            return Sqldb.Queryable<expert_info>().Where(s => s.id == id).First();
        }
        /// <summary>
        /// 服务按钮
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<DicKeyStrDto> GetButtons(string id)
        {
            return Sqldb.Select<ext_button>().Where(s => s.pid == id).ToList(s => new DicKeyStrDto()
            {
                id = s.btn_name,
                name = s.btn_href
            });
        }


        /// <summary>
        /// 添加回复
        /// </summary>
        /// <param name="id"></param>
        /// <param name="content"></param>
        /// <param name="repeat"></param>
        /// 状态，专家名称，用户openid
        public QuestionPushDto SaveReply(string id, string content,string replyImages)
        {
            var ret = new QuestionPushDto();
            var question = Sqldb.Queryable<expert_question>().Where(s => s.id == id).Select(s =>
                new { expertOpenId = s.expert_id, expertDataId = s.expert_id,
                    totaltimes = s.total_times, reptimes = s.resp_times, 
                    qend = s.qend, pid = s.pid, openid = s.insert_id,
                    roudend = s.round_end }).First();
            if (question == null)
            {
                ret.message = "回复失败";
                return ret;
            }
            if (question.roudend)
            {
                ret.message = "咨询已结束";
                return ret;
            }
            if (question.reptimes == 2)
            {
                ret.message = "咨询已结束";
                return ret;
            }
            string emptyId = IdWorkerHelper.GenOId();

            var images = new List<question_imgs>();
            if (!string.IsNullOrEmpty(replyImages))
            {
                var imagesArray = replyImages.Split(',');
                foreach(var image in imagesArray)
                {
                    var imageModel = new question_imgs();
                    imageModel.img_type = 1;
                    imageModel.img_url = image;
                    imageModel.pid = id;
                    if (question.reptimes == 0)
                    {
                        imageModel.up_number = 1;
                    }
                    else
                    {
                        imageModel.up_number = 2;
                    }
                    images.Add(imageModel);
                }
            }
            if (question.reptimes == 0)
            {
                if (images.Count > 0)
                {
                    Sqldb.Insert(images).ExecuteAffrows();
                }
                Sqldb.Update<expert_question>().Set(s => new expert_question()
                {
                    resp_time_one = DateTime.Now,
                    resp_content_one = content,
                    resp_times = 1,
                    high_light = false
                }).Where(s => s.id == id).ExecuteAffrows();

                if (question.pid != emptyId)
                {
                    Sqldb.Update<expert_question>().Set(s => new expert_question()
                    {
                        high_light = false
                    }).Where(s => s.id == question.pid).ExecuteAffrows();
                }
            }
            else
            {
                if (images.Count > 0)
                {
                    Sqldb.Insert(images).ExecuteAffrows();
                }
                Sqldb.Update<expert_question>().Set(s => new expert_question()
                {
                    resp_time_two = DateTime.Now,
                    resp_content_two = content,
                    resp_times = 2,
                    round_end=true
                }).Where(s => s.id == id).ExecuteAffrows();
            }

            //是否问完三个回合
            if (question.pid != emptyId)
            {
                //var timeLine = GetTimeLine();
                if (question.totaltimes == QuestionGlobalSet.RoundCount&& question.reptimes==1)
                {
                    Sqldb.Update<expert_question>().Set(s => s.qend == true)
                        .Where(s => s.pid == question.pid || s.id == question.pid).ExecuteAffrows();
                }
            }
            var expertName = Sqldb.Select<expert_info>().Where(s => s.id == question.expertDataId)
                .First(s => s.expert_name);

            ret.patientOpenid = question.openid;
            ret.expertOpenId = question.expertOpenId;
            ret.expertName = expertName;
            ret.status = true;
            return ret;
        }


        /// <summary>
        /// 专家咨询列表
        /// </summary>
        /// <param name="openId">专家openid</param>
        /// <param name="page"></param>
        /// <param name="psize"></param>
        /// <returns></returns>
        public List<QListDto> QuestionList(string openId,int page, int psize)
        {
            string empid = IdWorkerHelper.GenOId();
            var query = Sqldb.Select<expert_question>()
                .Where(s => s.expert_id == openId && s.pid == empid)
                .OrderByDescending(s => s.last_time)
                .Select(s => new QListDto()
                {
                    id = s.id,
                    qtitle = s.qtitle,
                    qcontent = s.qcontent,
                    replyCount = s.resp_times,
                    time = s.last_time,
                    high_light = s.high_light,
                    qend = s.qend,
                    expert_name = s.expert_name,
                    patientOpenId=s.insert_id
                }).Page(page, psize).ToList();
            if (query.Count > 0)
            {
                var patientIds = query.Select(s => s.patientOpenId).Distinct().ToList();
                var patients = Sqldb.Select<wx_user>().Where(s => patientIds.Contains(s.open_id)).ToList();
                query.ForEach(s =>
                {
                    s.patientName = patients.Where(a => a.open_id == s.patientOpenId).Select(a => a.nick_name).FirstOrDefault();
                });
            }
            return query;
        }

        #region 快捷回复，私人资料,相关服务
        /// <summary>
        /// 相关服务
        /// </summary>
        /// <returns></returns>
        public List<HotQuestionDto> NgoService()
        {
            var query = Sqldb.Select<ngo_service>()
                .OrderBy(s => s.sort_num).ToList(s => new HotQuestionDto { hot_title = s.service_title, url = s.url });
            return query;
        }
        /// <summary>
        /// 快捷回复
        /// </summary>
        /// <param name="dto"></param>
        public void SaveQuickReply(quick_reply dto,string quickImages)
        {

            if (dto.id.EmptyId())
            {
                var expert = Sqldb.Select<expert_info>().Where(s => s.id == dto.expert_id)
              .First(s => new DicKeyStrDto { id = s.open_id, name = s.expert_name });
                if (expert == null)
                {
                    throw new Exception($"专家信息不存在{dto.expert_id}");
                }
                dto.insert_id = expert.id;
            }
          
            var images = new List<hot_question_image>();
            if (!string.IsNullOrEmpty(quickImages))
            {
                var imgArrary = quickImages.Split(',');
                foreach (var url in imgArrary)
                {
                    var image = new hot_question_image();
                    image.image_url = url;
                    images.Add(image);
                }
            }
            if (dto.id.EmptyId())
            {
                dto.id = IdWorkerHelper.GenObjectId();
                dto.insert_time = DateTime.Now;
                Sqldb.Insert(dto).ExecuteAffrows();
                if (images.Count > 0)
                {
                    images.ForEach(s =>
                    {
                        s.pid = dto.id;
                    });
                    Sqldb.Insert(images).ExecuteAffrows();
                }
            }
            else
            {
                var imageList = Sqldb.Select<hot_question_image>().Where(s => s.pid == dto.id).ToList(s => s.id);
                if (imageList.Count > 0)
                {
                    Sqldb.Delete<hot_question_image>().Where(s => imageList.Contains(s.id)).ExecuteAffrows();
                }
                Sqldb.Update<quick_reply>()
                    .SetSource(dto).IgnoreColumns(s => new {s.expert_id, s.insert_id,s.insert_time,s.qtype }).ExecuteAffrows();
                if (images.Count > 0)
                {
                    images.ForEach(s =>
                    {
                        s.pid = dto.id;
                    });
                    Sqldb.Insert(images).ExecuteAffrows();
                }
            }
        }

        /// <summary>
        /// 删除快捷回复
        /// </summary>
        /// <param name="id"></param>
        public void DeleteQuickReply(string id)
        {
            var quick = Sqldb.Select<quick_reply>().Where(s => s.id == id).Select(s => s.id).First();
            if (!quick.EmptyId())
            {
                var images = Sqldb.Select<hot_question_image>()
                    .Where(s => s.pid == quick).ToList(s => s.id);
                if (images.Count > 0)
                {
                    Sqldb.Delete<hot_question_image>().Where(s => images.Contains(s.id)).ExecuteAffrows();
                }
                Sqldb.Delete<quick_reply>().Where(s => s.id == id).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 获取详情
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        public List<HotQuestionDto> GetQuickList(string openId)
        {
            var quick = Sqldb.Select<quick_reply>()
                .Where(s => s.insert_id == openId)
                .ToList(s => new HotQuestionDto { id = s.id, hot_title = s.qtitle, qcontent = s.qcontent, qtype = s.qtype });
            if (quick.Count > 0)
            {
                quick.ForEach(s =>
                {
                    s.summary_info = s.qcontent.NoHTML(20);
                    s.images= Sqldb.Select<hot_question_image>()
                    .Where(a=>a.pid==s.id).ToList(a=> a.image_url);
                });
            }

            return quick;
        }
        /// <summary>
        /// 获取详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public HotQuestionDto GetQuickReplyModel(string id)
        {
            var model = Sqldb.Select<quick_reply>().Where(s => s.id == id)
                .First(s => new HotQuestionDto { id = s.id, hot_title = s.qtitle, qcontent = s.qcontent });
            if (model != null)
            {
                model.summary_info = model.qcontent.NoHTML(20);
                model.images = Sqldb.Select<hot_question_image>()
                    .Where(s => s.pid == id).ToList(s =>s.image_url);
            }
            return model;
        }
        #endregion
    }
}
