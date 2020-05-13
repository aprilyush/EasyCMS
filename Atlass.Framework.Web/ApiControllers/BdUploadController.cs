using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Atlass.Framework.Core.Web;

namespace Atlass.Framework.Web.ApiControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BdUploadController : ControllerBase
    {
        private readonly IAtlassReuqestHelper RequestHelper;
        public BdUploadController(IAtlassReuqestHelper atlassReuqest)
        {
            RequestHelper = atlassReuqest;
        }
        [HttpGet("Index")]
        public ActionResult Index()
        {
            string action = RequestHelper.GetQueryString("action");
            if (action == "config")
            {
                string configPath = $@"plugins\ueditor\config.json";
                string serverPath = Path.Combine(GlobalParamsDto.WebRoot, configPath);
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
                    string configPath = $@"plugins\ueditor\config.json";
                    string serverPath = Path.Combine(GlobalParamsDto.WebRoot, configPath);
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
                //uploadimage
                string url = $"/upfiles/images/{DateTime.Now.ToString("yyyyMMdd")}";
                if(action== "uploadfile")
                {
                    url = $"/upfiles/attachments/{DateTime.Now.ToString("yyyyMMdd")}";
                }
                var folder = GlobalParamsDto.WebRoot + url;

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
                var file = files[0];
                var filename = file.FileName;
                int index = filename.LastIndexOf('.');
                string extName = filename.Substring(index);
                string guidstr = IdWorkerHelper.GenObjectId();
                string guidFileName = guidstr + extName;
                //这个hostingEnv.WebRootPath就是要存的地址可以改下
                string newfilename = $"{folder}/{guidFileName}";

                using (FileStream fs = System.IO.File.Create(newfilename))
                {
                    file.CopyTo(fs);
                    fs.Flush();
                }
                result.original = filename;
                result.title = filename;
                result.url = $"{url}/{guidFileName}";
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
                result.state = "FAIL";
                result.error = "内部异常，请联系管理员";
            }


            return Content(result.ToJson());
        }
    }
}