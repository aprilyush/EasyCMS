using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Models;
using Atlass.Framework.Models.BaseData;
using Atlass.Framework.Models.question;
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
    public class ApiQuestionAppService
    {
        private readonly IFreeSql Sqldb;
        public ApiQuestionAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        /// <summary>
        /// 获取咨询主题
        /// </summary>
        /// <returns></returns>
        public List<string> GetTheme()
        {
            return Sqldb.Select<question_theme>().OrderBy(s => s.sort_num).ToList(s=>s.theme_name);
        }
        /// <summary>
        /// 获取个人信息
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        public wx_user GetPatientInfo(string openId)
        {
            var user = Sqldb.Select<wx_user>().Where(s => s.open_id == openId).First(); 
            if (user == null)
            {
                user = new wx_user();
                user.open_id = openId;
            }
            return user;
        }

        /// <summary>
        /// 保存提问
        /// </summary>
        /// <param name="dto"></param>
        ///  //状态，专家名称，专家opneid
        public QuestionPushDto SaveQuestion(QuestionDto dto,string question_no)
        {
            dto.paient_openid = dto.paient_openid.Trim();
            dto.expert_id = dto.expert_id.Trim();
            var ret = new QuestionPushDto();
            var expert = Sqldb.Queryable<expert_info>().Where(s => s.id == dto.expert_id)
                .Select(s => new { openId = s.open_id, expert_name = s.expert_name }).First();
            var totals = GetTotalNum();
            var model = new expert_question();
            model.id = dto.id;
            model.qtitle = dto.qtitle;
            model.qcontent = dto.qcontent;
            model.expert_oid = dto.expert_id;//专家id
            model.expert_id = expert.openId;//专家opendid
            model.provice = dto.province;
            model.city = dto.city;
            model.insert_id = dto.paient_openid;
            model.sexual_orientation = dto.sexual_orientation;
            model.highrisk_time = dto.hight_risk_time;
            if (expert != null)
            {
                model.expert_name = expert.expert_name;
            }

            model.insert_time = DateTime.Now;
           
            model.resp_time_one = TimeHelper.MinDateTime();
            model.resp_time_two = model.resp_time_one;
            model.pid = IdWorkerHelper.GenOId();
            model.total_times = 1;
            model.round_num = 1;
            model.last_time = model.insert_time;
            model.question_no = question_no.ToInt64();
            model.serial_num = totals;
            model.high_light = true;
            model.last_push_time = model.insert_time;
            model.comment_time = TimeHelper.MinDateTime();
            List<question_imgs> imgList = new List<question_imgs>();
            if (!string.IsNullOrEmpty(dto.imgs))
            {
                var imageArray = dto.imgs.Split(',');

                foreach (var img in imageArray)
                {
                    var imgModel = new question_imgs();
                    imgModel.img_url = img;
                    imgModel.pid = model.id;
                    imgList.Add(imgModel);
                }
            }

            var hismodel = new expert_history();
            hismodel.id = Sqldb.Select<expert_history>().
                Where(s => s.user_id == model.insert_id && s.expert_id == model.expert_id
                ).First(s => s.id);
            hismodel.expert_id = model.expert_id;
            hismodel.insert_time = model.insert_time;
            hismodel.user_id = model.insert_id;
            hismodel.question_id = model.id;

            //更细个人资料
            var user = Sqldb.Select<wx_user>().Where(s => s.open_id == dto.paient_openid).First();
            if (user == null)
            {
                user = new wx_user();
                user.nick_name = dto.nick_name;
                if (string.IsNullOrEmpty(dto.nick_name))
                {
                    user.nick_name = "匿名";
                }
                user.national = "";
                user.job_name = "";
                user.marriage_status = 0;
                user.educational_level = 0;
                user.avatar_url = "";
                user.create_time = DateTime.Now;
                user.national = "";
            }
            user.province = dto.province ?? "";
            user.city = dto.city ?? "";
            user.open_id = dto.paient_openid.Trim();
            user.gender = dto.gender;
            user.birth_year = dto.birth_year;
            try
            {

                Sqldb.Transaction(() =>
                {
                var affrows = Sqldb.Insert(model).ExecuteAffrows();
                if (affrows < 1)
                    throw new Exception("提问报错失败");
                if (imgList.Count > 0)
                    {
                        affrows=Sqldb.Insert(imgList).ExecuteAffrows();
                        if (affrows < 1)
                            throw new Exception("图片插入失败");
                    }
                affrows = Sqldb.Update<expert_info>()
                        .Set(s => new expert_info() { expert_count = s.expert_count + 1 })
                        .Where(s => s.open_id == expert.openId).ExecuteAffrows();
                    if(affrows<1)
                        throw new Exception("专家咨询数量更新失败");

                    if (user.id.EmptyId())
                    {
                        user.id = IdWorkerHelper.GenObjectId();
                        Sqldb.Insert(user).ExecuteAffrows();
                    }
                    else
                    {
                        Sqldb.Update<wx_user>().SetSource(user).ExecuteAffrows();
                    }
                    if (hismodel.id == 0)
                    {
                        Sqldb.Insert(hismodel).ExecuteAffrows();
                    }
                    else
                    {
                        Sqldb.Update<expert_history>().SetSource(hismodel).ExecuteAffrows();
                    }
                });
               

                ret.status = true;
                ret.expertName = model.expert_name;
                ret.expertOpenId = model.expert_id;
                ret.id = model.id;
                ret.patientOpenid = model.insert_id;
                ret.title = model.qtitle;
                return ret;
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                return ret;
            }
        }

        /// <summary>
        /// 获取剩余追问次数
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        public bool RemainAskTime(string pid)
        {
            long remainCount = Sqldb.Select<expert_question>().Where(s => s.pid == pid).Count();
           // question_timeline timeLine = GetTimeLine();
            if (remainCount >= (QuestionGlobalSet.RoundCount- 1))
            {
                return false;
            }
            return true;
        }
        /// <summary>
        /// 保存追问提问
        /// </summary>
        /// <param name="dto"></param>
        public QuestionPushDto SaveQuestionRepeat(QuestionDto dto,string question_no)
        {

            var ret = new QuestionPushDto();
            var expert = Sqldb.Queryable<expert_question>().Where(s => s.id == dto.pid).First();
            if (expert == null)
            {
                //状态，专家名称，专家opneid
                return ret;
            }
            //question_timeline timeline = GetTimeLine();
            List<string> sonIds = new List<string>();
            sonIds = Sqldb.Select<expert_question>().Where(s => s.pid == dto.pid).ToList(s => s.id);
            var model = new expert_question();
            model.provice = expert.provice;
            model.city = expert.city;
            model.sexual_orientation = expert.sexual_orientation;
            model.highrisk_time = expert.highrisk_time;
            model.id = dto.id;
            model.expert_name = expert.expert_name;
            model.qtitle = $"(追问){expert.qtitle}";
            model.qcontent = dto.qcontent;
            model.expert_id = expert.expert_id;
            model.expert_oid = expert.expert_oid;
            model.insert_time = DateTime.Now;
            model.insert_id =expert.insert_id;
            model.resp_time_one = TimeHelper.MinDateTime();
            model.resp_time_two = model.resp_time_one;
            model.pid = dto.pid;
            model.total_times = sonIds.Count + 2;
            model.round_num = sonIds.Count + 2;
            model.last_time = model.insert_time;
            model.question_no = question_no.ToInt64();
            model.serial_num = expert.serial_num;
            model.high_light = true;
            model.last_push_time = model.insert_time;
            model.comment_time = TimeHelper.MinDateTime();
            sonIds.Add(dto.pid);
            List<question_imgs> imgList = new List<question_imgs>();
            if (!string.IsNullOrEmpty(dto.imgs))
            {
                var imageArray = dto.imgs.Split(',');
                foreach (var img in imageArray)
                {
                    var imgModel = new question_imgs();
                    imgModel.img_url = img;
                    imgModel.pid = model.id;
                    imgList.Add(imgModel);
                }
            }
            //专家openId
            //string expertOpenId = Sqldb.Queryable<expert_info>().Where(s => s.id == model.expert_id)
            //    .Select(s => s.open_id).First();
            var hismodel = new expert_history();
            hismodel.id = Sqldb.Queryable<expert_history>()
                .Where(s => s.user_id == model.insert_id && s.expert_id == model.expert_id)
                .First(s => s.id);
            hismodel.expert_id = model.expert_id;
            hismodel.insert_time = model.insert_time;
            hismodel.user_id = model.insert_id;
            hismodel.question_id = model.id;
            try
            {
                Sqldb.Transaction(() =>
                {
                    var affrows = Sqldb.Insert(model).ExecuteAffrows();
                    if (affrows < 1)
                        throw new Exception("提问保持失败");
                    if (imgList.Count > 0)
                    {
                        affrows = Sqldb.Insert(imgList).ExecuteAffrows();
                        if (affrows < 1)
                            throw new Exception("图片插入失败");
                    }
                    //同步更新回合次数
                    affrows= Sqldb.Update<expert_question>()
                        .Set(s => new expert_question()
                        {
                            total_times = model.total_times,
                            last_time = model.insert_time,
                            high_light = true
                        }).Where(s => sonIds.Contains(s.id)).ExecuteAffrows();

                    affrows= Sqldb.Update<expert_info>()
                        .Set(s => new expert_info() { expert_count = s.expert_count + 1 })
                        .Where(s => s.id == model.expert_oid).ExecuteAffrows();
                    if (affrows < 1)
                        throw new Exception("专家咨询数量更新失败");

                    if (hismodel.id == 0)
                    {
                        Sqldb.Insert(hismodel).ExecuteAffrows();
                    }
                    else
                    {
                        Sqldb.Update<expert_history>().SetSource(hismodel).ExecuteAffrows();
                    }
                });

                ret.status = true;
                ret.expertName = model.expert_name;
                ret.expertOpenId = model.expert_id;
                ret.id = model.id;
                ret.patientOpenid = model.insert_id;
                ret.title = model.qtitle;
                return ret;
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                return ret;
            }
        }
        /// <summary>
        /// 获取诊单流水号
        /// </summary>
        /// <returns></returns>
        public string GetWaterNumber(string pid)
        {
            if (!string.IsNullOrEmpty(pid))
            {
                var qno = Sqldb.Select<expert_question>().Where(s => s.id == pid).First(s => s.question_no);
                return qno.ToString();
            }
            var time = DateTime.Now.ToString("yyyyMMdd").ToInt();
            var num = Sqldb.Select<water_number>().Where(s => s.id == time).First(s => s.serial_num);
            if (num == 0)
            {
                num = 1;
                var model = new water_number();
                model.id = time;
                model.serial_num = 1;
                Sqldb.Insert(model).ExecuteAffrows();
            }
            else
            {
                num++;
                Sqldb.Update<water_number>().Set(s => new water_number() { serial_num = s.serial_num + 1 })
                    .Where(s => s.id == time).ExecuteAffrows();

            }

            var sortNum = $"{time}{num.ToString().PadLeft(6, '0')}";
            return sortNum;

        }


        /// <summary>
        /// 获取最新流水
        /// </summary>
        /// <returns></returns>
        private int GetTotalNum()
        {
            var total = Sqldb.Queryable<serial_totals>().OrderBy(s => s.id).First();
            if (total == null)
            {
                var model = new serial_totals();
                model.serial_num = 1;
                Sqldb.Insert(model).ExecuteAffrows();
                return 1;
            }
            Sqldb.Update<serial_totals>().Set(s => new serial_totals() { serial_num = s.serial_num + 1 })
                .Where(s => s.id == total.id).ExecuteAffrows();
            return total.serial_num + 1;
        }


        /// <summary>
        /// 获取问题详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public QuestionDetailHistoryDto GetQuestionDetail(string id)
        {
            var model = new QuestionDetailHistoryDto();
            var question = Sqldb.Select<expert_question>().Where(s => s.id == id)
                .First(s => new QuestionDetailDto()
                {
                    id = s.id,
                    pid = s.pid,
                    qtime = s.insert_time,
                    qtitle = s.qtitle,
                    qcontent = s.qcontent,
                    repContentOne = s.resp_content_one,
                    replyTimeOne = s.resp_time_one,
                    repContentTwo = s.resp_content_two,
                    replyTimeTwo = s.resp_time_two,
                    expertName = s.expert_name,
                    expertOpenId = s.expert_id,
                    expertId = s.expert_oid,
                    total = s.total_times,
                    replyCount = s.resp_times,
                    qend = s.qend,
                    star_num = s.star_num,
                    pay = s.qpay,
                    pay_money=s.pay_money,
                    round_end = s.round_end,
                    patientOpenId=s.insert_id,
                    hasPatientComment=s.has_patient_remark,
                    patientComment=s.patient_remark,
                    commentTime=s.comment_time
                });
            if (question == null)
            {
                return model;
            }
            question.patientName = Sqldb.Select<wx_user>().Where(s => s.open_id == question.patientOpenId).First(s => s.nick_name);
            string questionBaseId = id;
            if (question.pid == IdWorkerHelper.GenOId())
            {
                model.baseQuestion = question;
              
            }
            else
            {
                questionBaseId = question.pid;
               model.baseQuestion= Sqldb.Select<expert_question>()
                    .Where(s => s.id == questionBaseId)
                .First(s => new QuestionDetailDto()
                {
                    id = s.id,
                    pid = s.pid,
                    qtime = s.insert_time,
                    qtitle = s.qtitle,
                    qcontent = s.qcontent,
                    repContentOne = s.resp_content_one,
                    replyTimeOne = s.resp_time_one,
                    repContentTwo = s.resp_content_two,
                    replyTimeTwo = s.resp_time_two,
                    expertName = s.expert_name,
                    expertOpenId = s.expert_id,
                    expertId = s.expert_oid,
                    total = s.total_times,
                    replyCount = s.resp_times,
                    qend = s.qend,
                    star_num = s.star_num,
                    pay = s.qpay,
                    round_end = s.round_end,
                    hasPatientComment = s.has_patient_remark,
                    patientComment = s.patient_remark
                });
            }

            var extraQuestions = Sqldb.Select<expert_question>().Where(s => s.pid == questionBaseId)
                 .OrderBy(s => s.round_num)
                .ToList(s => new QuestionDetailDto()
                {
                    id = s.id,
                    pid = s.pid,
                    qtime = s.insert_time,
                    qtitle = s.qtitle,
                    qcontent = s.qcontent,
                    repContentOne = s.resp_content_one,
                    replyTimeOne = s.resp_time_one,
                    repContentTwo = s.resp_content_two,
                    replyTimeTwo = s.resp_time_two,
                    expertName = s.expert_name,
                    expertOpenId = s.expert_id,
                    expertId = s.expert_oid,
                    total = s.total_times,
                    replyCount = s.resp_times,
                    qend = s.qend,
                    star_num = s.star_num,
                    pay = s.qpay,
                    round_end = s.round_end
                });
            //专家信息
            var expert = Sqldb.Queryable<expert_info>().Where(s => s.id == model.baseQuestion.expertId)
                   .Select(s => new { name = s.expert_name, postion = s.position_name }).First();
            model.baseQuestion.postion = expert.postion;
            model.baseQuestion.expertName = expert.name;

            var allQuestionIds = new List<string>();
            allQuestionIds.Add(model.baseQuestion.id);
            if (extraQuestions.Count > 0)
            {
                var extraQuestionIds = extraQuestions.Select(s => s.id).Distinct().ToList();
                allQuestionIds.AddRange(extraQuestionIds);
            }
            var images = Sqldb.Queryable<question_imgs>().Where(s => allQuestionIds.Contains(s.pid)).ToList();
            if (images.Count > 0)
            {
                model.baseQuestion.qimgs = images.Where(s => s.pid == questionBaseId).ToList();

                if (extraQuestions.Count > 0)
                {
                    extraQuestions.ForEach(s =>
                    {
                        s.postion = expert.postion;
                        s.expertName = expert.name;
                        s.qimgs = images.Where(a => a.pid ==s.id).ToList();
                    });
                }
            }
            model.extraQuestions = extraQuestions;
            
            return model;
        }

        /// <summary>
        /// 结束问题
        /// </summary>
        /// <param name="id"></param>
        public void EndQuestion(string id)
        {
            var question = Sqldb.Select<expert_question>().Where(s => s.id == id).Select(s =>new DicKeyStrDto { id =s.id,pid=s.pid}).First();
            if (question!=null)
            {
                string emptyId = IdWorkerHelper.GenOId();
                List<string> sonIds = new List<string>();
                if (question.pid== emptyId)
                {
                    sonIds = Sqldb.Select<expert_question>().Where(s => s.pid ==question.id).Select(s => s.id).ToList();
                    sonIds.Add(question.id);
                }
                else
                {
                    sonIds = Sqldb.Select<expert_question>().Where(s => s.pid ==question.pid).Select(s => s.id).ToList();
                    sonIds.Add(question.pid);
                }
                

                Sqldb.Update<expert_question>().Set(s => new expert_question()
                {
                    round_end = true,
                    qend = true,
                    patient_remark = "",
                    is_anonymous = 0,
                    has_patient_remark =0
                }).Where(s => sonIds.Contains(s.id)).ExecuteAffrows();
            }
        }

        /// <summary>
        /// 评分
        /// </summary>
        /// <param name="id"></param>
        /// <param name="score"></param>
        /// <returns></returns>
        public QuestionPushDto SaveScore(string id, int score,string paientReamrk,int share,int isAnonymous)
        {
            var question = Sqldb.Select<expert_question>().Where(s => s.id == id)
                .Select(s => new { id = s.id, pid = s.pid, expert_oid = s.expert_oid, 
                    expertId = s.expert_id, score = s.star_num,questonTitle=s.qtitle }).First();

            var result = new QuestionPushDto();

            if (question == null)
            {
                result.message = "禁止止评分";
                return result;
            }
            //已经评分
            if (question.score > 0)
            {
                result.message = "评分完成";
               
                return result;
            }
            List<string> qids = new List<string>();
            if (question.pid == IdWorkerHelper.GenOId())
            {
                //获取下面的追问数量
                qids = Sqldb.Select<expert_question>().Where(s => s.pid == id).ToList(s => s.id);
                qids.Add(id);
            }
            else
            {
                //获取下面的追问数量 不包含当前数量
                qids = Sqldb.Select<expert_question>().Where(s => s.pid == question.pid)
                    .Select(s => s.id).ToList();
                qids.Add(question.pid);
            }
            

            //更新专家评分
            var expert = Sqldb.Queryable<expert_info>().Where(s => s.id == question.expert_oid)
                .Select(s => new { ecount = s.expert_count, star = s.star_score }).First();
            decimal newStar = 0;
            if (expert != null)
            {
                decimal totalNum = decimal.Round(expert.ecount / (decimal)2.5, 1);
                decimal totalStar = expert.star * totalNum;
                newStar = Math.Round((totalStar + score) / (totalNum + 1), 1);
            }

            //确定是否分享
            share_question sharQuestion =null;
            if (share == 1)
            {
                var existCount = Sqldb.Queryable<share_question>()
                    .Where(s => s.question_id == id).Count();
                if (existCount == 0)
                {
                    sharQuestion = new share_question();
                    sharQuestion.question_id = id;
                    sharQuestion.question_title = question.questonTitle;
                    sharQuestion.share_time = DateTime.Now;
                    sharQuestion.share_status = 0;
                    sharQuestion.share_category = 0;
                    sharQuestion.share_title = sharQuestion.question_title;
                    sharQuestion.hit_count = 0;
                }

            }
           
            try
            {
                //int hasPatientRemark = 0;
                //if (!string.IsNullOrEmpty(paientReamrk))
                //{
                //    hasPatientRemark = 1;
                //}
                Sqldb.Transaction(() => {

                    int affrow = 0;
                    if (newStar > 0)
                    {
                        affrow = Sqldb.Update<expert_info>()
                        .Set(s => s.star_score,newStar)
                         .Where(s => s.id == question.expert_oid).ExecuteAffrows();
                        if (affrow < 1)
                            throw new Exception("更新评分失败");
                    }
                    if (share == 1&& sharQuestion!=null)
                    {
                        //sharQuestion = new share_question();
                        Sqldb.Insert(sharQuestion).ExecuteAffrows();
                    }
                    //更新咨询问题主体回合
                    affrow =Sqldb.Update<expert_question>().Set(s => new expert_question()
                    {
                        round_end = true,
                        qend = true,
                        star_num = score,
                        patient_remark = paientReamrk,
                        is_anonymous= isAnonymous,
                        has_patient_remark= 1,
                        comment_time=DateTime.Now
                    }).Where(s => qids.Contains(s.id)).ExecuteAffrows();

                    ////更新完整回合
                    //affrow = Sqldb.Update<expert_question>().UpdateColumns(s => new expert_question()
                    //{
                    //    qend = true
                    //}).Where(s => qids.Contains(s.id)).ExecuteAffrows();
                    if (affrow < 1)
                        throw new Exception("更新咨询回合失败");
                });

                result.expertOpenId = question.expertId;
                result.status = true;
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                result.message = "评分失败";
                return result;
            }

            return result;
        }

        #region 支付
        /// <summary>
        /// 支付更新
        /// </summary>
        /// <param name="id"></param>
        /// <param name="money"></param>
        public string UpdatePay(string id, int money)
        {
            var question= Sqldb.Queryable<expert_question>().Where(s => s.id == id)
                .Select(s => new { id = s.id, pay = s.pay_money,expertId=s.expert_id }).First();
            if (question != null)
            {
                Sqldb.Update<expert_question>().Set(s =>s.pay_money,question.pay + money)
                    .Set(s=>s.qpay,true)
                    .Where(s => s.id == id).ExecuteAffrows();
                return question.expertId;
            }
            return null;
        }

        /// <summary>
        /// 保存支付流水
        /// </summary>
        /// <param name="model"></param>
        public string SavePayHistory(pay_history model)
        {
            try
            {
                var count = Sqldb.Select<pay_history>().Where(s => s.out_trade_no == model.out_trade_no).Count();
                if (count == 0)
                {
                    var question = Sqldb.Select<expert_question>().Where(s => s.id == model.device_info)
                        .First(s => new { expertOpenId = s.expert_id, expert_did=s.expert_oid, expertname = s.expert_name });

                    if (question != null)
                    {
                        model.expert_id = question.expertOpenId;
                        model.expert_name = question.expertname;
                        model.expert_did = question.expert_did;
                    }
                    else
                    {
                        model.expert_id = IdWorkerHelper.GenOId();
                        model.expert_name ="";
                        model.expert_did =IdWorkerHelper.GenOId();
                    }
                    Sqldb.Insert(model).ExecuteAffrows();
                    //string openId = Sqldb.Queryable<expert_info>().Where(s => s.id == model.expert_id)
                    //    .Select(s => s.open_id).First();

                    
                }
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }
            return model.expert_id;
        }
        #endregion
        /// <summary>
        /// 患者咨询列表
        /// </summary>
        /// <param name="page"></param>
        /// <param name="psize"></param>
        /// <param name="openId"></param>
        public List<QListDto> QuestionRecord(int page, int psize,string openId)
        {
            string topId = IdWorkerHelper.GenOId();
            var list = Sqldb.Select<expert_question>()
                .Where(s => s.insert_id == openId && s.pid == topId&&s.is_delete==0)
                .OrderByDescending(s => s.last_time)
                .Page(page, psize).ToList(s => new QListDto
                {
                    id = s.id,
                    qtitle=s.qtitle,
                    time=s.last_time,
                    expertId=s.expert_oid,
                    qcontent=s.qcontent,
                    patientRemark=s.patient_remark
                }).ToList();
            if (list.Count > 0)
            {
                var expertIds = list.Select(s => s.expertId).Distinct().ToList();
                var experts = Sqldb.Select<expert_info>().Where(s => expertIds.Contains(s.id))
                    .ToList(s => new ExpertDetailDto { id = s.id, expert_name = s.expert_name, expert_title = s.expert_title });

                list.ForEach(s =>
                {
                    var  expert = experts.Where(a => a.id ==s.expertId).FirstOrDefault();
                    if (expert != null)
                    {
                        s.expert_name = expert.expert_name;
                        s.expert_title = expert.expert_title;
                    }
                });
            }
            return list;
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        public void DeleteQuestion(string id)
        {
            var question = Sqldb.Select<expert_question>().Where(s => s.id == id).Select(s => s.id).First();
            if (question != null)
            {
                var extQuestions = Sqldb.Select<expert_question>().Where(s => s.pid == id).ToList(s => s.id);

                Sqldb.Transaction(() =>
                {
                    int affectRow= Sqldb.Update<expert_question>().Set(s => s.is_delete, 1).Where(s => s.id == id).ExecuteAffrows();
                    if (affectRow < 1)
                        throw new Exception("删除咨询问题失败");
                    if (extQuestions.Count > 0)
                    {
                        affectRow=Sqldb.Update<expert_question>().Set(s => s.is_delete, 1)
                            .Where(s => extQuestions.Contains(s.id))
                            .ExecuteAffrows();
                        if (affectRow < 1)
                            throw new Exception("删除咨询问题失败");
                    }
                });

                
                
               
            }
        }


        /// <summary>
        /// 热门提问
        /// </summary>
        /// <param name="page"></param>
        /// <param name="psize"></param>
        /// <returns></returns>
        public List<HotQuestionDto> HotQuestion(int page,int psize)
        {
            var query = Sqldb.Queryable<hot_question>()
               .OrderByDescending(s => s.is_top)
               .OrderByDescending(s => s.hit_count)
               .Page(page, psize)
               .ToList(s=>new HotQuestionDto { 
                   id=s.id,hot_title=s.hot_title,hit_count=s.hit_count,
                   is_top=s.is_top,url=s.url
               });

            if (query.Count > 0)
            {
                var ids = query.Select(s => s.id).Distinct().ToList();
                var images = Sqldb.Select<hot_question_image>().Where(s => ids.Contains(s.pid)).ToList();
                query.ForEach(s =>
                {
                    s.images = images.Where(a => a.pid == s.id).Select(a => a.image_url).ToList();
                });
            }
            return query;
        }

        /// <summary>
        /// 分享列表
        /// </summary>
        /// <param name="page"></param>
        /// <param name="psize"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        public List<ShareQuestionDto> ShareQuestionList(int page,int psize,int category)
        {
            var query = Sqldb.Queryable<share_question>()
                .Where(s=>s.share_status==1)
                .WhereIf(category>0,s=>s.share_category==category)
               .OrderByDescending(s => s.hit_count)
               //.OrderByDescending(s => s.id)
               .Page(page, psize)
               .ToList(s => new ShareQuestionDto
               {
                   id = s.question_id,
                   share_title = s.share_title,
                   hit_count = s.hit_count,
                   share_time=s.share_time
               });

            if (query.Count > 0)
            {
                var ids = query.Select(s => s.id).Distinct().ToList();
                var questions = Sqldb.Select<expert_question>().Where(s => ids.Contains(s.id))
                    .ToList(s=>new DicKeyStrDto { id=s.id,name=s.qcontent});
                query.ForEach(s =>
                {
                    s.summary = questions.Where(a => a.id == s.id).Select(a => a.name).FirstOrDefault();
                });
            }
            return query;
        }
        /// <summary>
        /// 获取分享的分类
        /// </summary>
        /// <returns></returns>
        public List<DicKeyDto> GetShareCategory()
        {
            var query = Sqldb.Select<share_category>().OrderBy(s => s.sort_num)
                .ToList(s => new DicKeyDto { id = s.id, name = s.category_name });
            return query;
        }


        /// <summary>
        /// 点击量
        /// </summary>
        /// <param name="id"></param>
        /// <param name="hitType">1-热门咨询，2-咨询分享</param>
        public void Hit(string id, int hitType)
        {
            if (hitType == 1)
            {
                var hot = Sqldb.Select<hot_question>().Where(s => s.id == id).First(s => s.id);
                if (hot.EmptyId())
                {
                    return;
                }

                Sqldb.Update<hot_question>().Set(s => s.hit_count + 1).Where(s => s.id == id).ExecuteAffrows();
            }
            else
            {
               
                var share = Sqldb.Select<share_question>().Where(s => s.question_id == id).First(s => s.id);
                if (share > 0)
                {
                    Sqldb.Update<share_question>().Set(s => s.hit_count + 1).Where(s => s.id == share).ExecuteAffrows();
                }
            }
        }
    }
}
