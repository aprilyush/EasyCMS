using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Web
{
    public interface IAtlassRequest
    {

        /// <summary>
        /// 是否登录
        /// </summary>
        /// <returns></returns>
        public bool IsAdminLoggin();
        /// <summary>
        /// 用户cookie信息
        /// </summary>
        /// <returns></returns>
        public LoginUserDto AdminInfo();
        /// <summary>
        /// 设置cookie
        /// </summary>
        /// <param name="cliamsString"></param>
        public void SetCookie(string cliamsString);
        /// <summary>
        /// 设置某个cookie
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="expires_in"></param>
        public void SetCookie(string key,string value,int expires_in);
        /// <summary>
        /// 移除全部cookie
        /// </summary>
        public void RemoveCookie();
        /// <summary>
        /// 移除某个cookie
        /// </summary>
        /// <param name="key"></param>
        public void RemoveCookie(string key);
        /// <summary>
        /// Post请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool GetPostBool(string name, bool defaultValue = false);
        /// <summary>
        /// Post请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public decimal GetPostDecimal(string name, decimal defaultValue = 0);
        /// <summary>
        /// Post请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public int GetPostInt(string name, int defaultValue = 0);
        /// <summary>
        /// Post请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public long GetPostInt64(string name, long defaultValue = 0);
        /// <summary>
        /// Get请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetPostString(string name);
        /// <summary>
        /// Get请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetPostString(string name, string defaultValue = "");
        /// <summary>
        /// Get请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool GetQueryBool(string name, bool defaultValue = false);
        /// <summary>
        /// Get请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public decimal GetQueryDecimal(string name, decimal defaultValue = 0);
        /// <summary>
        /// Get请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public int GetQueryInt(string name, int defaultValue = 0);
        /// <summary>
        /// Get请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetQueryString(string name);
        /// <summary>
        /// Get请求 获取参数值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetQueryString(string name, string defaultValue = "");
        /// <summary>
        /// 判断参数是否存在
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool IsPostExists(string name);
        /// <summary>
        /// 判断参数是否存在
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool IsQueryExists(string name);
        /// <summary>
        /// 当前请求
        /// </summary>
        /// <returns></returns>
        public HttpRequest Request();

       
        /// <summary>
        /// 获取客户端ip
        /// </summary>
        /// <returns></returns>
        public string GetClientIp();

        /// <summary>
        /// 获取浏览器用户信息
        /// </summary>
        /// <returns></returns>
        public UserAgentDto UserAgent();
        /// <summary>
        /// 是否是ajax请求
        /// </summary>
        /// <returns></returns>
        public bool IsAjax();

        /// <summary>
        /// 微信相关
        /// </summary>
        /// <returns></returns>
        public string OpenId();
        public void SetOpenId(string openId, int expireSecond);
    }
}
