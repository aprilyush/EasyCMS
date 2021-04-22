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
        /// <summary>
        /// 权限标识
        /// #：只判断是否登录，不判断具体权限
        /// </summary>
        private string PermissionTag { get; set; }

        /// <summary>
        /// 角色的权限标识
        /// </summary>
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

        /// <summary>
        /// 执行前
        /// </summary>
        /// <param name="filterContext"></param>
        /// <param name="next"></param>
        /// <returns></returns>
        public override async Task OnActionExecutionAsync(ActionExecutingContext filterContext, ActionExecutionDelegate next)
        {
            //if (!ValidateToken(filterContext.HttpContext.Request.Headers["token"]))
            //{
            //    filterContext.Result = new UnauthorizedResult();
            //}
            //记录路由日志
            //IDictionary<string, string> RouteValues = filterContext.ActionDescriptor.RouteValues;
            //string route = GetRouteInfo(RouteValues);
            //LogNHelper.Info(route,"路由记录");


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
                if (GlobalContext.RuntimeEnvironment == 0&& requestHelper.IsAjax())
                {
                    if (PermissionTag.Contains("delete") || PermissionTag.Contains("clear"))
                    {
                        var result = new ResultAdaptDto();
                        result.message = "演示模式，禁止删除";
                        result.status = false;
                        result.statusCode = 401;
                        filterContext.Result = new JsonResult(result);
                        return;
                    }
                }
                //#只判断是否登录，不判断具体权限
                if (PermissionTag == "#")
                {
                    user.IsSuper = true;
                }
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
        /// 执行后
        /// </summary>
        /// <param name="context"></param>
        /// <param name="next"></param>
        /// <returns></returns>
        public override async Task OnResultExecutionAsync(ResultExecutingContext context, ResultExecutionDelegate next)
        {
            //if (context.HttpContext.Response.StatusCode == 404)
            //{
            //    context.HttpContext.Response.Redirect("login/InternalError");
            //}
            await base.OnResultExecutionAsync(context,next);
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
