using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Common.Log;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Cache;
using Atlass.Framework.Core;

namespace Atlass.Framework.Web.ApiControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BdUploadController : ControllerBase
    {
        private readonly IAtlassRequest RequestHelper;
        public BdUploadController(IAtlassRequest atlassReuqest)
        {
            RequestHelper = atlassReuqest;
        }
        [HttpGet("Index")]
        public ActionResult Index()
        {
            string action = RequestHelper.GetQueryString("action");
            if (action == "config")
            {
                string configPath = $@"ui\plugins\ueditor\config.json";
                string serverPath = Path.Combine(GlobalContext.WebRootPath, configPath);
                if (System.IO.File.Exists(serverPath))
                {
                    string json = System.IO.File.ReadAllText(serverPath);
                    return Content(json);
                }
                return Content("");
            }
            return Content("");
        }

        [HttpPost("Index")]
        public ActionResult Index(string action)
        {
            var result = new UeditorUploadDto();
            try
            {
                if (action == "config")
                {
                    string configPath = $@"ui\plugins\ueditor\config.json";
                    string serverPath = Path.Combine(GlobalContext.WebRootPath, configPath);
                    if (System.IO.File.Exists(serverPath))
                    {
                        string json = System.IO.File.ReadAllText(serverPath);
                        return Content(json);
                    }
                    return Content("");
                }

                var files = Request.Form.Files;
                if (files.Count == 0)
                {
                    result.state = "FAIL";
                    result.error = "请选择文件";
                    return Content(result.ToJson());
                }
                var file = files[0];
                var filename = file.FileName;
                int index = filename.LastIndexOf('.');
                string extName = filename.Substring(index+1);
                //uploadimage
                string url = $@"upfiles\images\{DateTime.Now.ToString("yyyyMMdd")}";
                var uploadSet = SiteManagerCache.GetUploadInfo();
                if (action == "uploadimage") {
                    var imageExt = uploadSet.image_extname.Split(',');
                    if (!imageExt.Contains(extName))
                    {
                        result.state = "FAIL";
                        result.error = $"禁止上传图片类型:{extName}";
                        return Content(result.ToJson());
                    }

                }else if (action== "uploadfile")
                {
                    var fileExt = uploadSet.attache_extname.Split(',');
                    if (!fileExt.Contains(extName))
                    {
                        result.state = "FAIL";
                        result.error = $"禁止上传附件类型:{extName}";
                        return Content(result.ToJson());
                    }

                    if (file.Length > (uploadSet.max_file_size * 1024 * 1024))
                    {
                        result.state = "FAIL";
                        result.error = $"上传附件超过{uploadSet.max_file_size}MB限制,禁止上传";
                        return Content(result.ToJson());
                    }
                    url = $@"upfiles\attachments\{DateTime.Now.ToString("yyyyMMdd")}";
                }
                else if(action=="uploadvideo"){

                    var mediaExt = uploadSet.media_extname.Split(',');
                    if (!mediaExt.Contains(extName))
                    {
                        result.state = "FAIL";
                        result.error = $"禁止上传视频类型:{extName}";
                        return Content(result.ToJson());
                    }
                    if (file.Length > (uploadSet.max_file_size * 1024 * 1024))
                    {
                        result.state = "FAIL";
                        result.error = $"上传视频超过{uploadSet.max_file_size}MB限制,禁止上传";
                        return Content(result.ToJson());
                    }
                    url = $@"upfiles\videos\{DateTime.Now.ToString("yyyyMMdd")}";
                }
                var folder = Path.Combine(GlobalContext.WebRootPath, url); 

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
                
                string guidFileName = $"{IdHelper.ObjectId()}.{extName}";
                //这个hostingEnv.WebRootPath就是要存的地址可以改下
                string newfilename = Path.Combine(folder, guidFileName); 

                using (FileStream fs = System.IO.File.Create(newfilename))
                {
                    file.CopyTo(fs);
                    fs.Flush();
                }
                if(action== "uploadimage")
                {
                    var firstFileInfo = new FileInfo(newfilename);
                    if (firstFileInfo.Length > 200 * 1024)
                    {
                        string compressFileName =$"{IdHelper.ObjectId()}.{extName}";
                        string compressFile = $@"{folder}\{compressFileName}";
                        ImageUtilities.CompressImage(newfilename, compressFile, 90, 200);
                        guidFileName = compressFileName;
                    }
                }
                result.original = filename;
                result.title = filename;
                result.url = $@"\{url}\{guidFileName}";
            }
            catch (Exception e)
            {
                LoggerHelper.Exception(e);
                result.state = "FAIL";
                result.error = "内部异常，请联系管理员";
            }


            return Content(result.ToJson());
        }
    }
}