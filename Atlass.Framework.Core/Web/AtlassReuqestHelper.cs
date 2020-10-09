using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.Net.Http.Headers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Atlass.Framework.Core.Web
{
    public class AtlassReuqestHelper: IAtlassReuqestHelper
    {
        private readonly HttpContext _context;
        private readonly HttpRequest HttpRequest;
        private readonly IQueryCollection QueryString;
        private Dictionary<string, object> _postData;

        private string CookieClaim = "easycms_user";
        private bool _isAdminLoggin = false;
        private LoginUserDto _adminInfo;
        public AtlassReuqestHelper(IHttpContextAccessor context)
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
                LogNHelper.Exception(ex);
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

                var bodyJson = string.Empty;
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
                        bodyJson = buffer.ReadToEnd();
                    }
                }

                if (string.IsNullOrEmpty(bodyJson)) return _postData;

                var dict = TranslateUtils.JsonDeserialize<Dictionary<string, object>>(bodyJson);
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


        public bool IsQueryExists(string name)
        {
            return QueryString.ContainsKey(name);
        }

        public string GetQueryString(string name)
        {
            if (IsQueryExists(name))
            {
                return QueryString[name];
            }
            return null;
        }
        public string GetQueryString(string name, string defaultValue = "")
        {
            if (IsQueryExists(name))
            {
                return QueryString[name];
            }
            return defaultValue;
        }
        public int GetQueryInt(string name, int defaultValue = 0)
        {
            if (IsQueryExists(name))
            {
                return TranslateUtils.ToIntWithNagetive(QueryString[name]);
            }
            return defaultValue;

        }

        public decimal GetQueryDecimal(string name, decimal defaultValue = 0)
        {
            if (IsQueryExists(name))
            {
                return TranslateUtils.ToDecimalWithNagetive(QueryString[name]);
            }
            return defaultValue;

        }

        public bool GetQueryBool(string name, bool defaultValue = false)
        {
            if (IsQueryExists(name))
            {
                return TranslateUtils.ToBool(QueryString[name]);
            }
            return defaultValue;

        }

        public bool IsPostExists(string name)
        {
            return PostData.ContainsKey(name);
        }

        //public T GetPostObject<T>(string name = "")
        //{
        //    string json;
        //    if (string.IsNullOrEmpty(name))
        //    {
        //        var bodyStream = new StreamReader(HttpRequest.InputStream);
        //        bodyStream.BaseStream.Seek(0, SeekOrigin.Begin);
        //        json = bodyStream.ReadToEnd();
        //    }
        //    else
        //    {
        //        json = GetPostString(name);
        //    }

        //    return TranslateUtils.JsonDeserialize<T>(json);
        //}

        private object GetPostObject(string name)
        {
            if (string.IsNullOrEmpty(name)) return null;

            return PostData.TryGetValue(name, out var value) ? value : null;
        }

        public string GetPostString(string name)
        {
            var value = GetPostObject(name);
            if (value == null) return null;
            if (value is string) return (string)value;
            return value.ToString();
        }
        public string GetPostString(string name, string defaultValue = "")
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is string) return (string)value;
            return value.ToString();
        }

        public int GetPostInt(string name, int defaultValue = 0)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is int) return (int)value;
            return TranslateUtils.ToIntWithNagetive(value.ToString(), defaultValue);
        }
        public long GetPostBigInt(string name, long defaultValue = 0)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is long) return (long)value;
            return TranslateUtils.ToBigIntWithNagetive(value.ToString(), defaultValue);
        }
        public decimal GetPostDecimal(string name, decimal defaultValue = 0)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is decimal) return (decimal)value;
            return TranslateUtils.ToDecimalWithNagetive(value.ToString(), defaultValue);
        }

        public bool GetPostBool(string name, bool defaultValue = false)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is bool) return (bool)value;
            return TranslateUtils.ToBool(value.ToString(), defaultValue);
        }

        public DateTime GetPostDateTime(string name, DateTime defaultValue)
        {
            var value = GetPostObject(name);
            if (value == null) return defaultValue;
            if (value is DateTime) return (DateTime)value;
            return TranslateUtils.ToDateTime(value.ToString(), defaultValue);
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
        /// 获取访问信息
        /// </summary>
        /// <returns></returns>
        public cms_visit Visit()
        {
            var model =new cms_visit();
            model.ip = GetClientIp();
            model.visit_time = DateTime.Now;
            model.browser= this.HttpRequest.Headers["User-Agent"];
            return model;
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
                Secure = true,
                SameSite = Microsoft.AspNetCore.Http.SameSiteMode.None
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
                Secure = true,
                SameSite= Microsoft.AspNetCore.Http.SameSiteMode.None
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
                Secure = true,
                SameSite = Microsoft.AspNetCore.Http.SameSiteMode.None
            });
        }
        #endregion 
    }
}
