using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Doctor;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Doctor.Controllers
{
    /// <summary>
    /// 专家信息
    /// </summary>
    [Area("Doctor")]
    public class ExpertInfoController : BaseController
    {
        private readonly ExpertInfoAppService _infoApp;

        public ExpertInfoController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _infoApp = service.GetRequiredService<ExpertInfoAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetData(BootstrapGridDto param)
        {
            var data = _infoApp.GetData(param);
            return Content(data.ToJson());
        }


        public ActionResult Form(string id)
        {
            ViewBag.Id = id;

            var typeList = _infoApp.GetExpertTypeList();
            ViewBag.TypeList = new SelectList(typeList, "id", "name");
            return View();
        }

        [HttpPost]
        public ActionResult Save(expert_info dto, string btns)
        {
            dto.expert_title = dto.expert_title ?? string.Empty;
            dto.position_name = dto.position_name ?? string.Empty;
            dto.company_name = dto.company_name ?? string.Empty;
            dto.remark = "";
            if (string.IsNullOrEmpty(dto.id))
            {
                _infoApp.InsertData(dto, btns,RequestHelper.AdminInfo());
            }
            else
            {
                _infoApp.UpdateData(dto, btns);
            }
            return Success("保存成功");
        }

        public ActionResult GetDataById(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Error("数据不存在");
            }
            var result = new ResultAdaptDto();
            var data = _infoApp.GetDataById(id.Trim());
            var buttons = _infoApp.GetButtons(id.Trim());
            result.data.Add("model", data);
            result.data.Add("buttons", buttons);
            return Content(result.ToJson());
        }


        public ActionResult Delbtn(int id)
        {
            if (id > 0)
            {
                _infoApp.Delbtn(id);
            }

            return Success("删除成功");
        }
        public ActionResult DeleteById(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Error("删除失败");
            }
            _infoApp.DeleteById(id.Trim());
            return Success("删除成功");
        }

        [HttpPost]
        public ActionResult Uploadimg()
        {
            var result = new ResultAdaptDto();
            //long size = 0;
            var files = Request.Form.Files;
            if (files.Count == 0)
            {
                result.statusCode = 300;
                result.msg = "没有文件信息";
                return Content(result.ToJson());
            }
            string url = "/upfiles/heads";
            var folder = GlobalParamsDto.WebRoot + url;

            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            var file = files[0];
            var filename = ContentDispositionHeaderValue
                .Parse(file.ContentDisposition)
                .FileName
                .Trim('"');
            int index = filename.LastIndexOf('.');
            string extName = filename.Substring(index);
            string guidstr = Guid.NewGuid().ToString("N");
            string guidFileName = guidstr + extName;
            //这个hostingEnv.WebRootPath就是要存的地址可以改下
            filename = $"{folder}/{guidFileName}";
            using (FileStream fs = System.IO.File.Create(filename))
            {
                file.CopyTo(fs);
                fs.Flush();
            }
            string imgurl = $"{ url}/{guidFileName}";
            result.data.Add("url", imgurl);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 删除图片
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public ActionResult delimg(string url)
        {
            try
            {
                var filePath = GlobalParamsDto.WebRoot + url;
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }

                return Success();
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }

            return Error();
        }
    }
}