using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Api;
using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Senparc.Weixin.Entities;

namespace Atlass.Framework.Web.ApiControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApiUserController : ControllerBase
    {
        private readonly IAtlassReuqestHelper RequestHelper;
        private readonly ApiUserAppService _userApp;
        public SenparcWeixinSetting _wxSetting;
        public ApiUserController(IServiceProvider service, IOptionsMonitor<SenparcWeixinSetting> senparcWeixinSetting)
        {
            _wxSetting = senparcWeixinSetting.CurrentValue;
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _userApp = service.GetRequiredService<ApiUserAppService>();
        }
        /// <summary>
        /// 获取个人中心
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetUserInfo")]
        public ActionResult GetUserInfo()
        {
            var result = new ResultAdaptDto();
            try
            {
                string openId =RequestHelper.GetQueryString("openId", "");
                //int seconds = 10 * 60 & 60;
                //RequestHelper.SetOpenId(openId.Trim(), seconds);
                //string paient_openid = RequestHelper.OpenId();
                var user = _userApp.GetPatientInfo(openId.Trim());
                var isDoctor = _userApp.IsDoctor(openId.Trim());
                result.data.Add("user", user);
                result.data.Add("isDoctor", isDoctor);

            }
            catch (Exception e)
            {
                LogNHelper.Exception(e.ToString());
                result.status = false;
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 更新个人信息
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost("UpdateUserInfo")]
        public ActionResult UpdateUserInfo([FromForm] wx_user user)
        {
            var result = new ResultAdaptDto();
            try
            {
                _userApp.UpdateUserInfo(user);

            }
            catch (Exception e)
            {
                LogNHelper.Exception(e.ToString());
                result.status = false;
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 咨询统计
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        [HttpGet("QuestionChart")]
        public IActionResult QuestionChart(string openId)
        {
            var result = new ResultAdaptDto();
            try
            {
                var chart=_userApp.QuestionChart(openId);

                result.data.Add("chart", chart);
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e.ToString());
                result.status = false;
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 打赏统计
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        [HttpGet("PayChart")]
        public IActionResult PayChart(string openId)
        {
            var result = new ResultAdaptDto();
            try
            {
                var chart = _userApp.PayChart(openId);

                result.data.Add("chart", chart.chart);
                result.data.Add("unPayedMoney", chart.unpayedMoney);

                var user = UserCenterCacheHelper.GetUserCenterChart(openId.Trim());
                user.newPay = false;
                UserCenterCacheHelper.SetUserCenterChart(user);
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e.ToString());
                result.status = false;
            }
            return Content(result.ToJson());
        }

        /// <summary>
        /// 用户评价
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        [HttpGet("CommentList")]
        public IActionResult CommentList(string openId,int page,int pszie)
        {
            var result = new ResultAdaptDto();
            var comments = _userApp.CommentList(openId.Trim(), page, pszie);
            result.data.Add("comments", comments);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 是否有新的消息
        /// </summary>
        /// <param name="openId"></param>
        /// <returns></returns>
        [HttpGet("UserCenterSummary")]
        public IActionResult UserCenterSummary(string openId)
        {
            var result = new ResultAdaptDto();
            var user = UserCenterCacheHelper.GetUserCenterChart(openId.Trim());
            result.data.Add("summary", user);
            return Content(result.ToJson());
        }
    }
}