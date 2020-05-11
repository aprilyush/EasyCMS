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
using Atlass.Framework.Jobs.Message;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.Web.Controllers.WeiXin;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Headers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Senparc.Weixin.Entities;
using Senparc.Weixin.MP.AdvancedAPIs;
using Senparc.Weixin.MP.AdvancedAPIs.User;
using Senparc.Weixin.MP.Containers;

namespace Atlass.Framework.Web.ApiControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiExpertController : ControllerBase
    {
        private readonly IAtlassReuqestHelper RequestHelper;
        private readonly ApiExpertAppService _expertApp;
        public SenparcWeixinSetting _wxSetting;
        public ApiExpertController(IServiceProvider service, IOptionsMonitor<SenparcWeixinSetting> senparcWeixinSetting)
        {
            _wxSetting = senparcWeixinSetting.CurrentValue;
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _expertApp = service.GetRequiredService<ApiExpertAppService>();
        }
        /// <summary>
        /// 专家列表
        /// </summary>
        /// <returns></returns>
        [HttpGet("List")]
        public ActionResult List()
        {
            var result =new ResultAdaptDto();
            var experts = _expertApp.GetAllList();
            var banners = _expertApp.GetBanner();
            var hotQuestions = _expertApp.GetHostQuestion();
            result.data.Add("experts", experts);
            result.data.Add("banners", banners);
            result.data.Add("hotQuestions", hotQuestions);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 专家详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("Detail")]
        [ServiceFilter(typeof(WeChatActionFilterAttribute))]
        public ActionResult Detail(string id)
        {
           // string token = AccessTokenContainer.GetAccessToken(_wxSetting.WeixinAppId);
            //UserInfoJson userInfos = UserApi.Info(token, ReuqestHelper.OpenId());
            var model = _expertApp.GetExpertInfo(id.Trim());
            var buttons = _expertApp.GetButtons(id.Trim());
            var result = new ResultAdaptDto();
            //result.data.Add("subscribe", userInfos.subscribe);
            result.data.Add("subscribe",true);
            result.data.Add("detail", model);
            result.data.Add("buttons", buttons);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 快捷回复和私人资料内容详情
        /// </summary>
        /// <returns></returns>
        [HttpGet("QuestionList")]
        public ActionResult QuestionList( )
        {
            var result = new ResultAdaptDto();
            string openId = RequestHelper.GetQueryString("openId");
            int page = RequestHelper.GetQueryInt("page",1);
            int psize = RequestHelper.GetQueryInt("psize",10);
            var list = _expertApp.QuestionList(openId,page,psize);
            result.data.Add("list", list);
            return Content(result.ToJson());
        }


        /// <summary>
        ///提交回复
        /// </summary>
        /// <param name="id"></param>
        /// <param name="content"></param>
        /// <param name="repeat">追加回复</param>
        /// <returns></returns>
        [HttpPost("SaveReply")]
        public ActionResult SaveReply()
        {
            var result = new ResultAdaptDto();
            try
            {
                
                string id= RequestHelper.GetPostString("id");
                string content = RequestHelper.GetPostString("content");
                string images = RequestHelper.GetPostString("images");
                if (id.IsEmpty())
                {
                    result.msg = "回复失败";
                    result.status = false;
                    return Content(result.ToJson());
                }
                if (content.IsEmpty())
                {
                    result.msg = "请填写回复内容";
                    result.status = false;
                    return Content(result.ToJson());
                }
                var ret = _expertApp.SaveReply(id, content,images);
                if (ret.status)
                {

                    Task.Factory.StartNew(() =>
                        MessagePush.FeedBack(_wxSetting.WeixinAppId, ret.patientOpenid.Trim(), id, ret.expertName));
                    //更新状态
                    var userCenter = UserCenterCacheHelper.GetUserCenterChart(ret.patientOpenid.Trim());
                    userCenter.newReply = true;
                    UserCenterCacheHelper.SetUserCenterChart(userCenter);
                }
                else
                {
                    result.status = false;
                    result.msg = ret.message;
                   
                }
            }
            catch (Exception e)
            {
                result.status = false;
                LogNHelper.Exception(e);
            }
            return Content(result.ToJson());
        }



        /// <summary>
        /// 快捷回复和私人资料内容列表
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetQuickReplyList")]
        public ActionResult GetQuickReplyList(string openId)
        {
            var result = new ResultAdaptDto();
            var list = _expertApp.GetQuickList(openId.Trim());
            var ngoService = _expertApp.NgoService();
            result.data.Add("list", list);
            result.data.Add("ngoService", ngoService);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 快捷回复和私人资料内容
        /// </summary>
        /// <returns></returns>
        [HttpPost("SaveQuickReply")]
        public ActionResult SaveQuickReply([FromForm]quick_reply dto)
        {
            string images = RequestHelper.GetPostString("images", "");
            var result = new ResultAdaptDto();
            _expertApp.SaveQuickReply(dto, images);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 删除快捷回复和私人资料内容
        /// </summary>
        /// <returns></returns>
        [HttpGet("DeleteQuickReply")]
        public ActionResult DeleteQuickReply(string id)
        {

            var result = new ResultAdaptDto();
            _expertApp.DeleteQuickReply(id);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 快捷回复和私人资料内容详情
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetQuickReplyModel")]
        public ActionResult GetQuickReplyModel(string id)
        {
            var result = new ResultAdaptDto();
            var model=_expertApp.GetQuickReplyModel(id);
            result.data.Add("model", model);
            return Content(result.ToJson());
        }
    }
}