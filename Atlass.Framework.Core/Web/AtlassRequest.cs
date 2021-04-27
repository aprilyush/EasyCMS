using Atlass.Framework.Common;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.Net.Http.Headers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UAParser;

namespace Atlass.Framework.Core.Web
{
    public class AtlassRequest: IAtlassRequest
    {
        private readonly HttpContext _context;
        private readonly HttpRequest HttpRequest;
        private readonly IQueryCollection QueryString;
        private Dictionary<string, object> _postData;
        private string _bodyJson = string.Empty;

        private string CookieClaim = "easycms_user";
        private bool _isAdminLoggin = false;
        private LoginUserDto _adminInfo;
        public AtlassRequest(IHttpContextAccessor context)
        {
            _context = context.HttpContext;
            HttpRequest = _context.Request;
            QueryString = HttpRequest.Query;


            try {
                var userClaims = GetUser();
                if (userClaims != null)
                {

                    _adminInfo = userClaims.ToObject<LoginUserDto>();
                    _isAdminLoggin = true;
                }
            }
            catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

            
        }

        public HttpRequest Request()
        {
            return HttpRequest;
        }
        public bool IsAdminLoggin() {
            return _isAdminLoggin;
        }
        public LoginUserDto AdminInfo() {
            return _adminInfo;
        }
        public Dictionary<string, object> PostData
        {
            get
            {
                if (_postData != null) return _postData;

               // var bodyJson = string.Empty;
                //HttpRequest.EnableBuffering();
                // HttpRequest.Body.Position = 0;
                _postData = new Dictionary<string, object>(StringComparer.OrdinalIgnoreCase);
                if (HttpRequest.HasFormContentType)
                {
                    var forms = HttpRequest.Form;
                    foreach (var form in forms)
                    {
                        _postData.Add(form.Key, forms[form.Key]);
                    }
                }
                else
                {
                    using (var buffer = new StreamReader(HttpRequest.Body))
                    {
                        buffer.BaseStream.Seek(0, SeekOrigin.Begin);
                        _bodyJson = buffer.ReadToEnd();
                    }
                }

                if (string.IsNullOrEmpty(_bodyJson)) return _postData;

                var dict = _bodyJson.ToDictionary();
                if (dict == null)
                {
                    return _postData;
                }
                foreach (var key in dict.Keys)
                {
                    _postData[key] = dict[key];
                }

                return _postData;
            }
        }


        /// <summary>
        /// 判断是否存在参数
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool IsQueryExists(string name)
        {
            return QueryString.ContainsKey(name);
        }
        /// <summary>
        /// 获取GET请求参数的值 string
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetQueryString(string name)
        {
            if (IsQueryExists(name))
            {
                return QueryString[name];
            }
            return null;
        }
        /// <summary>
        /// 获取GET请求参数的值 string
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetQueryString(string name, string defaultValue = "")
        {
            if (IsQueryExists(name))
            {
                return QueryString[name];
            }
            return defaultValue;
        }
        /// <summary>
        /// 获取GET请求参数的值 int
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public int GetQueryInt(string name, int defaultValue = 0)
        {
            if (IsQueryExists(name))
            {
                return QueryString[name].ToInt();
            }
            return defaultValue;

        }
        /// <summary>
        /// 获取GET参数的值 Int64
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public long GetQueryInt64(string name, long defaultValue = 0)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is long) return (long)value;
            return value.ToInt64();
        }



        /// <summary>
        /// 获取GET请求参数的值 Decimal
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public decimal GetQueryDecimal(string name, decimal defaultValue = 0)
        {
            if (IsQueryExists(name))
            {
                return QueryString[name].ToDecimal();
            }
            return defaultValue;

        }
        /// <summary>
        /// 获取GET请求参数的值 Bool
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool GetQueryBool(string name, bool defaultValue = false)
        {
            if (IsQueryExists(name))
            {
                return QueryString[name].ToBool();
            }
            return defaultValue;

        }
        /// <summary>
        /// 判断Post请求参数是否存在
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool IsPostExists(string name)
        {
            return PostData.ContainsKey(name);
        }

        /// <summary>
        /// 参数转为对象T
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="name"></param>
        /// <returns></returns>
        public T GetPostObject<T>(string name = "")
        {
            string json;
            try
            {
                if (string.IsNullOrEmpty(name))
                {
                   if(!_bodyJson.IsEmpty())
                    return _bodyJson.ToObject<T>();
                }
                else
                {
                    json = GetPostString(name);
                    return json.ToObject<T>();
                }
            }
            catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
            }
          

            return default(T);
        }

        /// <summary>
        /// 获取Post参数的值
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        private object GetPostObject(string name)
        {
            if (string.IsNullOrEmpty(name)) return null;

            return PostData.TryGetValue(name, out var value) ? value : null;
        }
        /// <summary>
        /// 获取Post参数的值 String
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetPostString(string name)
        {
            var value = GetPostObject(name);
            if (value == null) return null;
            if (value is string) return (string)value;
            return value.ToString();
        }

        /// <summary>
        /// 获取Post参数的值 String
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetPostString(string name, string defaultValue = "")
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is string) return (string)value;
            return value.ToString();
        }

        /// <summary>
        /// 获取Post参数的值 Int
        /// </summary> 
        /// <param name="name"></param>
        /// <returns></returns>
        public int GetPostInt(string name, int defaultValue = 0)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is int) return (int)value;
            return value.ToInt() ;
        }

        /// <summary>
        /// 获取Post参数的值 Int64
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public long GetPostInt64(string name, long defaultValue = 0)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is long) return (long)value;
            return value.ToInt64();
        }

        /// <summary>
        /// 获取Post参数的值 Decimal
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public decimal GetPostDecimal(string name, decimal defaultValue = 0)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is decimal) return (decimal)value;
            return value.ToDecimal();
        }
        /// <summary>
        /// 获取Post参数的值 Bool
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool GetPostBool(string name, bool defaultValue = false)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is bool) return (bool)value;
            return value.ToBool();
        }
        /// <summary>
        /// 获取Post参数的值 DateTime
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public DateTime GetPostDateTime(string name, DateTime defaultValue)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is DateTime) return (DateTime)value;
            return value.ToDate();
        }

        /// <summary>
        /// 获取ip地址
        /// </summary>
        /// <returns></returns>
        public string GetClientIp()
        {
            var ip = this.HttpRequest.Headers["X-Forwarded-For"].FirstOrDefault();
            if (string.IsNullOrEmpty(ip))
            {
                ip = this.HttpRequest.Headers["HTTP_X_FORWARDED_FOR"];
            }
            if (string.IsNullOrEmpty(ip))
            {
                ip = this.HttpRequest.Headers["X-Real-IP"];
            }
            if (string.IsNullOrEmpty(ip))
            {
                ip = this.HttpRequest.Headers["REMOTE_ADDR"];
            }
            if (string.IsNullOrEmpty(ip))
            {
                var addr = this._context.Connection?.RemoteIpAddress;
                if (addr != null)
                {
                    if (addr.IsIPv4MappedToIPv6) addr = addr.MapToIPv4();
                    ip = addr + "";
                }
            }
            return ip;
        }

        /// <summary>
        /// 获取浏览器用户信息
        /// </summary>
        /// <returns></returns>
         public UserAgentDto UserAgent()
        {
            string agent= this.HttpRequest.Headers["User-Agent"];
            if (string.IsNullOrEmpty(agent))
            {
                return null;
            }
            try
            {
                var uaParser = UAParser.Parser.GetDefault();
                ClientInfo c = uaParser.Parse(agent);
                if (c == null)
                {
                    return null;
                }
                var model = new UserAgentDto();
                model.Browser = $"{c.UA.Family} {c.UA.Major}";
                model.Device = c.Device.Family;
                model.OS= $"{c.OS.Family} {c.OS.Major}";
                model.Ip = GetClientIp();
                return model;
            }
            catch
            {
                return null;
            }
            

        }
        /// <summary>
        /// 是否是ajax请求
        /// </summary>
        /// <returns></returns>
        public bool IsAjax()
        {
            if (this.HttpRequest.Headers != null)
            {
                return this.HttpRequest.Headers["X-Requested-With"] == "XMLHttpRequest";
            }
            string accept = this.HttpRequest.Headers["accept"];
            if (accept != null && accept.IndexOf("application/json") != -1)
            {
                return true;
            }

            string xRequestedWith = this.HttpRequest.Headers["X-Requested-With"];
            if (xRequestedWith != null && xRequestedWith == "XMLHttpRequest")
            {
                return true;
            }

            string uri = this.HttpRequest.AbsoluteUri();
            if (uri.Contains(".json")|| uri.Contains(".xml"))
            {
                return true;
            }
            return false;
        }

        #region cookie
        public void SetCookie(string cliamsString)
        {
            cliamsString = Encrypt.AesEncrypt(cliamsString);
            _context.Response.Cookies.Append(CookieClaim, cliamsString, new CookieOptions()
            {
                Expires = DateTime.UtcNow.AddHours(10),
                Path = "/",
                HttpOnly = false,
                IsEssential = true,
                Secure = false
                //Secure = true,
                //SameSite = Microsoft.AspNetCore.Http.SameSiteMode.None
            });
        }
        public void RemoveCookie()
        {
            _context.Response.Cookies.Delete(CookieClaim);
        }

        public void SetCookie(string key, string value, int expireSecond)
        {
            string cliamsString = Encrypt.AesEncrypt(value);
            _context.Response.Cookies.Append(key, cliamsString, new CookieOptions()
            {
                Expires = DateTime.UtcNow.AddSeconds(expireSecond),
                Path = "/",
                HttpOnly = false,
                IsEssential = true,
                Secure = false,
                //Secure = true,
                //SameSite= Microsoft.AspNetCore.Http.SameSiteMode.None
            });
        }
        public void RemoveCookie(string key)
        {
            _context.Response.Cookies.Delete(key);
        }

        private string GetUser()
        {
            var userCookie = HttpRequest.Cookies[CookieClaim];
            if (!string.IsNullOrEmpty(userCookie))
            {
                return Encrypt.AesDecrypt(userCookie);
            }
            return null;
        }
        #endregion


        #region 微信openid
        /// <summary>
        /// 患者的openid
        /// </summary>
        /// <returns></returns>
        public string OpenId()
        {
            var userCookie = HttpRequest.Cookies["openId"];
            if (!string.IsNullOrEmpty(userCookie))
            {
                return userCookie.Trim();
               // return Encrypt.AesDecrypt(userCookie);
            }
            return null;
        }
        public void SetOpenId(string openId, int expireSecond)
        {
            // SetCookie("openId", openId, expireSecond);
            _context.Response.Cookies.Append("openId", openId, new CookieOptions()
            {
                Expires = DateTime.UtcNow.AddSeconds(expireSecond),
                Path = "/",
                HttpOnly = false,
                IsEssential=true,
                Secure=false
                //Secure = true,
                //SameSite = Microsoft.AspNetCore.Http.SameSiteMode.None
            });
        }
        #endregion 
    }
}
