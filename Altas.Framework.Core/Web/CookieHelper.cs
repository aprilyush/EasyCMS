using System;
using System.Collections.Generic;
using System.Text;
using Altas.Framework.Common;
using Altas.Framework.Core.Web;
using Microsoft.AspNetCore.Http;

namespace Altas.Framework.Core.Web
{
    public class LoginCookieDto
    {
        public static string CookieScheme = "altas_au_auth";
        public static string CookieClaim = "altas_au_user";
    }
    public class CookieHelper
    {
        public static void WriteLoginCookie(string cliamsStr)
        {
            //var claimsIdentity = new ClaimsIdentity(new Claim[] { new Claim(LoginCookieDto.CookieClaim, cliamsStr) }, "Forms");
            //var userPrincipal = new ClaimsPrincipal(claimsIdentity);
            //HttpContextExt.Current.SignInAsync(LoginCookieDto.CookieScheme, userPrincipal, new AuthenticationProperties
            //{
            //    ExpiresUtc = DateTime.UtcNow.AddHours(10),
            //    IsPersistent = true,
            //    AllowRefresh = false
            //});

            cliamsStr = Encrypt.AesEncrypt(cliamsStr);
            HttpContextExt.Current.Response.Cookies.Append(LoginCookieDto.CookieClaim, cliamsStr, new CookieOptions()
            {
                Expires = DateTime.UtcNow.AddHours(10),
                Path = "/",
                HttpOnly = false,
                Secure = false
            });
        }

        public static bool ExistUserCookie()
        {

            var result = HttpContextExt.Current.Request.Cookies[LoginCookieDto.CookieClaim];
            if (result != null)
                return true;
            return false;
        }
        public static string GetUserLoginCookie()
        {
            //string cookieClaims = LoginCookieDto.CookieClaim;
            //var userPrincipal = HttpContextExt.Current.User;
            //var userCookie = (from c in userPrincipal.Claims
            //                  where c.Type == cookieClaims
            //                  select c.Value).FirstOrDefault();

            var userCookie = HttpContextExt.Current.Request.Cookies[LoginCookieDto.CookieClaim];
            if (userCookie != null)
            {
                return Encrypt.AesDecrypt(userCookie);
            }
            return null;
            // return userCookie;
        }

        public static void RemoveCooke()
        {
            //var userCookie = HttpContextExt.Current.Request.Cookies[LoginCookieDto.CookieClaim];
            HttpContextExt.Current.Response.Cookies.Delete(LoginCookieDto.CookieClaim);
        }
    }
}
