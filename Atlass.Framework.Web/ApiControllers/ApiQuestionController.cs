using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Api;
using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Jobs.Data;
using Atlass.Framework.Jobs.Message;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Wx;
using Atlass.Framework.Web.Controllers.WeiXin;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Senparc.Weixin.Entities;
using Senparc.Weixin.MP.Helpers;
using Senparc.Weixin.TenPay.V2;
using Senparc.Weixin.TenPay.V3;

namespace Atlass.Framework.Web.ApiControllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[ServiceFilter(typeof(WeChatActionFilterAttribute))]
    public class ApiQuestionController : ControllerBase
    {
        private readonly IAtlassReuqestHelper RequestHelper;
        public SenparcWeixinSetting _wxSetting;
        private readonly ApiQuestionAppService _questionApp;
        public ApiQuestionController(IServiceProvider service, ApiQuestionAppService questionApp,
            IOptionsMonitor<SenparcWeixinSetting> senparcWeixinSetting)
        {
            _wxSetting = senparcWeixinSetting.CurrentValue;
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _questionApp = questionApp;
        }

        /// <summary>
        /// 获取个人信息和咨询主题
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetQuestionInit")]
        public ActionResult GetQuestionInit(string openId)
        {
            var result = new ResultAdaptDto();
            try
            {
                //string paient_openid = RequestHelper.OpenId();
                var themes = _questionApp.GetTheme();
                var user = _questionApp.GetPatientInfo(openId.Trim());
                result.data.Add("themes", themes);
                result.data.Add("user", user);

            }
            catch (Exception e)
            {
                LogNHelper.Exception(e.ToString());
                result.status = false;
            }
            return Content(result.ToJson());
        }
        

        /// <summary>
        /// 保存提问
        /// </summary>
        /// <returns></returns>
        [HttpPost("SaveQuestion")]
        public ActionResult SaveQuestion([FromForm]QuestionDto dto)
        {
            var result = new ResultAdaptDto();
            try
            {
                dto.id = IdWorkerHelper.GenObjectId();
                //dto.paient_openid = RequestHelper.OpenId();


                var sortNum = _questionApp.GetWaterNumber("");

                //状态，专家名称，专家opneid
                var ret = _questionApp.SaveQuestion(dto, sortNum);
                if (ret.status)
                {
                    //更新状态
                    var userCenter = UserCenterCacheHelper.GetUserCenterChart(ret.expertOpenId.Trim());
                    userCenter.newQuestion = true;
                    UserCenterCacheHelper.SetUserCenterChart(userCenter);

                    //LogNHelper.Info("用户："+_userId);
                    //LogNHelper.Info("专家：" + dto.expert_id);
                    Task.Factory.StartNew(() =>
                        MessagePush.ConsultingSuccess(_wxSetting.WeixinAppId, ret.patientOpenid, dto.id, ret.expertName));
                    Task.Factory.StartNew(() =>
                        MessagePush.NewQuestion(_wxSetting.WeixinAppId, ret.expertOpenId, sortNum, ret.title));

                }
                else
                {
                    result.status = false;
                    result.msg = "问题提交失败";
                }

            }
            catch (Exception e)
            {
                LogNHelper.Exception(e.ToString());
                result.status = false;
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 追问保存
        /// </summary>
        /// <returns></returns>
        [HttpPost("SaveQuestionRepeat")]
        public ActionResult SaveQuestionRepeat([FromForm]QuestionDto dto)
        {
            var result = new ResultAdaptDto();
            try
            {
                bool canAsk = _questionApp.RemainAskTime(dto.pid);
                if (!canAsk)
                {
                    result.status = false;
                    result.msg = "您的追问次数已经用完";
                    return Content(result.ToJson());
                }
                dto.id = IdWorkerHelper.GenObjectId();
                //dto.paient_openid = RequestHelper.OpenId();
                var sortNum = _questionApp.GetWaterNumber(dto.pid);

                //状态，专家名称，专家opneid
                var ret = _questionApp.SaveQuestionRepeat(dto,sortNum);
                if (ret.status)
                {                    //更新状态
                    var userCenter = UserCenterCacheHelper.GetUserCenterChart(ret.expertOpenId.Trim());
                    userCenter.newQuestion = true;
                    UserCenterCacheHelper.SetUserCenterChart(userCenter);
                    //咨询成功推送
                    Task.Factory.StartNew(() =>
                     MessagePush.ConsultingSuccess(_wxSetting.WeixinAppId, ret.patientOpenid, dto.id, ret.expertName));
                    //新诊单推送
                    Task.Factory.StartNew(() =>
                        MessagePush.NewQuestion(_wxSetting.WeixinAppId, ret.expertOpenId, sortNum, ret.title));
                }
                else
                {
                    result.status = false;
                    result.msg = "问题提交失败";
                }
                //  result.data.Add("total",ret.Item3);
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                result.status = false;
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 咨询详情
        /// </summary>
        /// <param name="questionId"></param>
        /// <returns></returns>
        [HttpGet("QuestionDetail")]
        public ActionResult QuestionDetail(string questionId)
        {
            var result = new ResultAdaptDto();
            try
            {
                var question = _questionApp.GetQuestionDetail(questionId);
                result.data.Add("question", question);
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                result.status = false;
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 结束咨询
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("EndQuestion")]
        public ActionResult EndQuestion(string id)
        {
            var result = new ResultAdaptDto();
            _questionApp.EndQuestion(id);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 评分
        /// </summary>
        /// <param name="id"></param>
        /// <param name="score"></param>
        /// <returns></returns>
        [HttpPost("SaveScore")]
        public ActionResult SaveScore()
        {
            var result = new ResultAdaptDto();
            string id = RequestHelper.GetPostString("id");
            int score = RequestHelper.GetPostInt("score");
            string patientReamrk = RequestHelper.GetPostString("patientReamrk");
            int share = RequestHelper.GetPostInt("share");
            int isAnonymous = RequestHelper.GetPostInt("isAnonymous");//是否匿名
            if (score < 1 || score > 5)
            {
                result.status = false;
                result.msg = "请选择评分";
                return Content(result.ToJson());
            }
            if (string.IsNullOrEmpty(patientReamrk))
            {
                patientReamrk = "默认好评";
            }
            if (string.IsNullOrEmpty(patientReamrk.Trim()))
            {
                patientReamrk = "默认好评";
            }
            var ret=_questionApp.SaveScore(id, score, patientReamrk, share,isAnonymous);
            result.status = ret.status;
            result.msg = ret.message;
            if (ret.status)
            {
                //更新状态
                var userCenter = UserCenterCacheHelper.GetUserCenterChart(ret.expertOpenId.Trim());
                userCenter.newComment = true;
                UserCenterCacheHelper.SetUserCenterChart(userCenter);
            }
           
            return Content(result.ToJson());
        }


        /// <summary>
        /// 支付初始化
        /// </summary>
        /// <returns></returns>
        [HttpGet("PayInit")]
        public ActionResult PayInit()
        {
            var result = new ResultAdaptDto();
            try
            {
                string url = RequestHelper.Request().AbsoluteUri();
                var jssdkUiPackage = JSSDKHelper.GetJsSdkUiPackage(_wxSetting.WeixinAppId, _wxSetting.WeixinAppSecret, url);

                result.data.Add("jssdk", jssdkUiPackage);

            }
            catch(Exception ex)
            {
                LogNHelper.Exception(ex);
                result.status = false;
                result.msg = "支付参数错误";
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 发起支付
        /// </summary>
        /// <param name="id">专家openid</param>
        /// <param name="money"></param>
        /// <returns></returns>
        [HttpGet("Pay")]
        public ActionResult Pay()
        {
            var result = new ResultAdaptDto();

            string questionId = RequestHelper.GetQueryString("questionId");
            int money = RequestHelper.GetQueryInt("money");
            string paientOpenId = RequestHelper.GetQueryString("openId");
            if (money < 1)
            {
                result.status = false;
                result.msg = "请选择打赏金额";
                return Content(result.ToJson());
            }
            try
            {
                var pushSetModel=MessageSetData.GetModel();
                if (pushSetModel == null)
                {
                    result.status = false;
                    result.msg = "请先设置网站域名";
                    return Content(result.ToJson());
                }

                _wxSetting.TenPayV3_TenpayNotify = $"{pushSetModel.site_host}/wxpay/index";
                //订单号
                string orderNo = IdWorkerHelper.GenObjectId();
                //随机数
                var nonceStr = TenPayV3Util.GetNoncestr();
                int fenmoney = money * 100;//微信支付单位为分
                var userip = RequestHelper.GetClientIp();
                
                var xmlDataInfo = new TenPayV3UnifiedorderRequestData(_wxSetting.TenPayV3_AppId,
                    _wxSetting.TenPayV3_MchId, "咨询打赏", orderNo, fenmoney,
                    userip, _wxSetting.TenPayV3_TenpayNotify, Senparc.Weixin.TenPay.TenPayV3Type.JSAPI, paientOpenId,
                    _wxSetting.TenPayV3_Key,
                    nonceStr, questionId);
                //调用统一订单接口
                var wxresult = TenPayV3.Unifiedorder(xmlDataInfo);//调用统一订单接口

                if (wxresult.return_code == "SUCCESS")
                {
                    var package = string.Format("prepay_id={0}", wxresult.prepay_id);

                    var model = new WxPayDto();
                    var timeStamp = TenPayV3Util.GetTimestamp();
                    model.appId = _wxSetting.TenPayV3_AppId;
                    model.timeStamp = timeStamp;
                    model.nonceStr = nonceStr;
                    model.package = package;
                    model.prepay_id = wxresult.prepay_id;
                    model.paySign = TenPayV3.GetJsPaySign(_wxSetting.TenPayV3_AppId, timeStamp, nonceStr,
                        package, _wxSetting.TenPayV3_Key);


                    //_productApp.InsertPayInfo(product.prepay_id, orderId.ToInt64(), "NOTPAY", product.price.ToString(), uname);
                    result.data.Add("pay", model);
                }
                else
                {
                    result.status = false;
                    result.msg = "支付发起失败";
                    result.data.Add("pay", null);
                }
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                result.status = false;
            }
            return Content(result.ToJson());
        }


        /// <summary>
        /// 更新支付
        /// </summary>
        /// <param name="id"></param>
        /// <param name="money"></param>
        /// <returns></returns>
        [HttpGet("UpdatePay")]
        public ActionResult UpdatePay(string id, int money)
        {
            var result = new ResultAdaptDto();
            if (string.IsNullOrEmpty(id))
            {
                return Content("");
            }
            if (money < 1)
            {
                return Content("");
            }

            var ret=_questionApp.UpdatePay(id.Trim(), money);


            if (ret!=null)
            {
                //更新状态
                var userCenter = UserCenterCacheHelper.GetUserCenterChart(ret.Trim());
                userCenter.newPay = true;
                UserCenterCacheHelper.SetUserCenterChart(userCenter);
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 患者咨询历史
        /// </summary>
        /// <param name="page"></param>
        /// <param name="psize"></param>
        /// <returns></returns>
        [HttpGet("QuestionRecord")]
        public ActionResult QuestionRecord(int page,int psize)
        {
            var result = new ResultAdaptDto();
            string openId = RequestHelper.GetQueryString("openId");
           // string openId = RequestHelper.OpenId();
            var records=_questionApp.QuestionRecord(page, psize, openId.Trim());
            result.data.Add("records", records);

            //更新状态
            var userCenter = UserCenterCacheHelper.GetUserCenterChart(openId.Trim());
            userCenter.newReply = false;
            UserCenterCacheHelper.SetUserCenterChart(userCenter);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 删除咨询问题
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("DeleteQuestion")]
        public ActionResult DeleteQuestion(string id)
        {
            var result = new ResultAdaptDto();
            _questionApp.DeleteQuestion(id);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 热门提问
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("HotQuestion")]
        public ActionResult HotQuestion(int page,int psize)
        {
            var result = new ResultAdaptDto();
            var questions=_questionApp.HotQuestion(page, psize);
            result.data.Add("hotQuestions", questions);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 分享的问题列表
        /// </summary>
        /// <param name="page"></param>
        /// <param name="psize"></param>
        /// <returns></returns>
        [HttpGet("ShareQuestionList")]
        public ActionResult ShareQuestionList(int page,int psize)
        {
            var result = new ResultAdaptDto();
            int shareCategory = RequestHelper.GetQueryInt("category");
            var questions = _questionApp.ShareQuestionList(page, psize, shareCategory);
            result.data.Add("hotQuestions", questions);
            if (shareCategory == 0)
            {
                var categoryList = _questionApp.GetShareCategory();
                result.data.Add("category", categoryList);
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 点击量更新
        /// </summary>
        /// <param name="id"></param>
        /// <param name="hitType">1-热门咨询，2-咨询分享</param>
        /// <returns></returns>
        [HttpGet("Hit")]
        public IActionResult Hit(string id,int hitType)
        {
            var result = new ResultAdaptDto();

            _questionApp.Hit(id.Trim(), hitType);
            return Content(result.ToJson());
        }
    }
}