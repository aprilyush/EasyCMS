using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Core.Web
{
    public interface IAtlassReuqestHelper
    {
        public bool IsAdminLoggin();
        public LoginUserDto AdminInfo();
        public void SetCookie(string cliamsString);
        public void SetCookie(string key,string value,int expires_in);
        public void RemoveCookie();
        public void RemoveCookie(string key);
        public bool GetPostBool(string name, bool defaultValue = false);
        public decimal GetPostDecimal(string name, decimal defaultValue = 0);
        public int GetPostInt(string name, int defaultValue = 0);
        public long GetPostBigInt(string name, long defaultValue = 0);
        // T GetPostObject<T>(string name = "");
        public string GetPostString(string name);
        public string GetPostString(string name, string defaultValue = "");
        public bool GetQueryBool(string name, bool defaultValue = false);
        public decimal GetQueryDecimal(string name, decimal defaultValue = 0);
        public int GetQueryInt(string name, int defaultValue = 0);
        public string GetQueryString(string name);
        public string GetQueryString(string name, string defaultValue = "");
        public bool IsPostExists(string name);
        public bool IsQueryExists(string name);
        public HttpRequest Request();
        public string OpenId();
        public void SetOpenId(string openId, int expireSecond);

        public string GetClientIp();
    }
}
