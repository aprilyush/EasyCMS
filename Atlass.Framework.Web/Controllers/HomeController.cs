using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Atlass.Framework.Web.Models;
using Senparc.Weixin.MP.Entities.Request;
using Atlass.Framework.Common.Log;
using Senparc.Weixin.MP.AdvancedAPIs.OAuth;
using Senparc.Weixin.MP.AdvancedAPIs;
using Senparc.CO2NET.AspNet.HttpUtility;
using Atlass.Framework.Common;
using Senparc.Weixin.MP;
using Senparc.Weixin;
using Microsoft.AspNetCore.Http;
using Senparc.Weixin.Entities;
using Microsoft.Extensions.Options;
using Senparc.Weixin.MP.Containers;
using Atlass.Framework.Core.Web;
using Senparc.CO2NET.Extensions;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Cache;

namespace Atlass.Framework.Web.Controllers
{
    public class HomeController : Controller
    {

        public SenparcWeixinSetting _wxSetting;
        private readonly IAtlassRequest RequestHelper;
        public HomeController(IOptions<SenparcWeixinSetting> senparcWeixinSetting, IAtlassRequest requestHelper)
        {
            _wxSetting = senparcWeixinSetting.Value;
            RequestHelper = requestHelper;
        }

        [ServiceFilter(typeof(WeChatActionFilterAttribute))]
        public ActionResult Go()
        {
            //return Content("ok");
            string openId = RequestHelper.OpenId();
            return Redirect("/wechat/index.html?openId="+ openId);
        }
        public IActionResult Auth(string code, string state)
        {

            AccessTokenContainer.RegisterAsync(_wxSetting.WeixinAppId, _wxSetting.WeixinAppSecret, "doctor_platform");
            string state1 = IdHelper.ObjectId();//随机数，用于识别请求可靠性
            HttpContext.Session.SetString("State", state1);//储存随机数到Session
            string signUrl =Request.AbsoluteUri();
            // LoggerHelper.Info(signUrl);
            // MemoryCacheHelper.Set("test", "nihao", TimeSpan.FromMinutes(1));
            // var keys= MemoryCacheHelper.GetCacheKeys();
            if (!string.IsNullOrEmpty(code))
            {

                var result = OAuthApi.GetAccessToken(_wxSetting.WeixinAppId, _wxSetting.WeixinAppSecret, code);
                if (result.errcode != ReturnCode.请求成功)
                {
                    return Content("错误：" + result.errmsg);
                }
                //LoggerHelper.Info(result.openid);
                //尝试获取用户信息
                //OAuthUserInfo userInfo = OAuthApi.GetUserInfo(result.access_token, result.openid);
                //string json = userInfo.ToJson();
                //LoggerHelper.Info(json);
                //Task.Factory.StartNew(() => GetUserInfo(result.access_token, result.openid));
                string key = "{access_token}:wxtoken";
                var redisClient = RedisFactory.GetRedisClient();
                redisClient.Set(key, result, result.expires_in);

                RequestHelper.SetOpenId(result.openid, result.expires_in);
                string homeUrl = $"/wechat/index.html?openId={result.openid}"; 
                return Redirect(homeUrl); 
            }
            else
            {
                // signUrl = signUrl + "/WxExpert/Index";snsapi_userinfo snsapi_base
                var url = string.Format("https://open.weixin.qq.com/connect/oauth2/authorize?appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_base&state={2}#wechat_redirect", 
                    _wxSetting.WeixinAppId, signUrl.UrlEncode(), state1);
                return Redirect(url);
            }



        }

        /// <summary>
        /// 返回openid
        /// </summary>
        /// <param name="code"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        public ActionResult Id(string code, string state)
        {

            string signUrl = RequestHelper.Request().AbsoluteUri();

            if (!string.IsNullOrEmpty(code))
            {
                var result = OAuthApi.GetAccessToken(_wxSetting.WeixinAppId, _wxSetting.WeixinAppSecret, code);
                if (result.errcode != ReturnCode.请求成功)
                {
                    return Content("错误：" + result.errmsg);
                }
                string id = $"你的openid为：{result.openid}";
                return Content(id);
            }
            else
            {
                string state1 = IdHelper.ObjectId();//随机数，用于识别请求可靠性
                // signUrl = signUrl + "/WxExpert/Index";
                var url = string.Format("https://open.weixin.qq.com/connect/oauth2/authorize?appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_base&state={2}#wechat_redirect", _wxSetting.WeixinAppId, signUrl.UrlEncode(), state1);
                return Redirect(url);
            }



        }
        /// <summary>
        /// 微信后台验证地址（使用Get），微信后台的“接口配置信息”的Url填写如：http://sdk.weixin.senparc.com/weixin
        /// </summary>
        [HttpGet]
        public ActionResult Index(PostModel postModel, string echostr)
        {
            if (CheckSignature.Check(postModel.Signature, postModel.Timestamp, postModel.Nonce, _wxSetting.Token))
            {
                return Content(echostr); //返回随机字符串则表示验证通过
            }
            else
            {
                return Content("failed:" + postModel.Signature + "," + CheckSignature.GetSignature(postModel.Timestamp, postModel.Nonce, _wxSetting.Token) + "。" +
                               "如果你在浏览器中看到这句话，说明此地址可以被作为微信公众账号后台的Url，请注意保持Token一致。");
            }
        }
        /// <summary>
        /// 用户发送消息后，微信平台自动Post一个请求到这里，并等待响应XML。
        /// PS：此方法为简化方法，效果与OldPost一致。
        /// v0.8之后的版本可以结合Senparc.Weixin.MP.MvcExtension扩展包，使用WeixinResult，见MiniPost方法。
        /// </summary>
        [HttpPost]
        public ActionResult Index(PostModel postModel)
        {
            if (!CheckSignature.Check(postModel.Signature, postModel.Timestamp, postModel.Nonce,_wxSetting.Token))
            {
                return Content("参数错误！");
            }

            #region 打包 PostModel 信息

            postModel.Token = _wxSetting.Token;//根据自己后台的设置保持一致
            postModel.EncodingAESKey = _wxSetting.EncodingAESKey;//根据自己后台的设置保持一致
            postModel.AppId = _wxSetting.WeixinAppId;//根据自己后台的设置保持一致（必须提供）

            #endregion
            try
            {
                var messageHandler = new CustomMessageHandler(RequestHelper.Request().GetRequestMemoryStream(), postModel, 10);

                messageHandler.Execute();//执行微信处理过程
                                         //return Content(messageHandler.ResponseDocument.ToString());//v0.7-
                                         //return new WeixinResult(messageHandler);//v0.8+
                return Content(messageHandler.ResponseDocument.ToString());
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
                return Content("");
            }
        }
        /// <summary>
        /// 尝试获取用户信息
        /// </summary>
        private void GetUserInfo(string access_token, string openid)
        {
            try
            {
                //已关注，可以得到详细信息
                OAuthUserInfo userInfo = OAuthApi.GetUserInfo(access_token, openid);
                if (userInfo != null)
                {
                    string json = userInfo.ToJson();
                    LoggerHelper.Info(json);
                }
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }
        }
    }
}
