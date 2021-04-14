using Atlass.Framework.AppService;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.DI;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Autofac;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Core.Base
{

    /// <summary>
    /// 需要先注入容器，如果不想注入容器可以使用TypeFilterAttribute
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true)]
    public class RequirePermissionAttribute: ActionFilterAttribute
    {
        public RequirePermissionAttribute()
        {
            
        }
        private string PermissionTag { get; set; }
        public string RoleTag { get; set; }
        public RequirePermissionAttribute(string permissions)
        {
            PermissionTag = permissions;
        }
        public RequirePermissionAttribute(string roles,string permissions)
        {
            PermissionTag = permissions;
            RoleTag = roles;
        }

        public override async Task OnActionExecutionAsync(ActionExecutingContext filterContext, ActionExecutionDelegate next)
        {
            //if (!ValidateToken(filterContext.HttpContext.Request.Headers["token"]))
            //{
            //    filterContext.Result = new UnauthorizedResult();
            //}
            IDictionary<string, string> RouteValues = filterContext.ActionDescriptor.RouteValues;
            string route = GetRouteInfo(RouteValues);

            LogNHelper.Info(route,"路由记录");
            IAtlassRequest requestHelper = GetAtlassRequest();
            var user = requestHelper.AdminInfo();
            if (user==null)
            {
                //ajax请求打回
                if (requestHelper.IsAjax())
                {
                    var result =new ResultAdaptDto();
                    result.message = "用户信息已过期，请重新登录";
                    result.status = false;
                    result.statusCode = 403;
                    filterContext.Result = new JsonResult(result);
                    return;
                }
                else
                {
                    filterContext.Result = new RedirectResult("~/Login/index");
                    return;
                }

            }
            else
            {
                if (!user.IsSuper)
                {
                    var roleApp = GetRoleAppService();
                    bool hasPermission =roleApp.HasPermission(user.RoleId, PermissionTag);
                    if (!hasPermission)
                    {
                        //ajax请求打回
                        if (requestHelper.IsAjax())
                        {
                            var result = new ResultAdaptDto();
                            result.message = "抱歉，没有操作权限";
                            result.status = false;
                            result.statusCode = 401;
                            filterContext.Result = new JsonResult(result);
                            return;
                        }
                        else
                        {
                            filterContext.Result = new RedirectResult("~/Login/NoPermission");
                            return;
                        }
                    }
                }

            }

            await base.OnActionExecutionAsync(filterContext, next);
        }



        /// <summary>
        /// 获取路由信息
        /// </summary>
        /// <param name="routes"></param>
        /// <returns></returns>
        private string GetRouteInfo(IDictionary<string,string> routes)
        {
            StringBuilder  route =new StringBuilder();
            string area = routes["area"];
            if (area.IsEmpty())
            {
                route.Append(area);
                route.Append("_");
            }
            route.Append(routes["controller"]);
            route.Append("_");
            route.Append(routes["action"]);

            return route.ToString().ToLower();
        }


        /// <summary>
        /// 获取请求
        /// </summary>
        /// <returns></returns>
        private IAtlassRequest GetAtlassRequest()
        {
            return AutofacUtil.GetScopeService<IAtlassRequest>();
        }

        private SysRoleAppService GetRoleAppService()
        {
            return AutofacUtil.GetScopeService<SysRoleAppService>();
        }
    }
}
