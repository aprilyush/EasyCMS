using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.ApiControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <returns></returns>
        [HttpPost("Uploadimg")]
        public ActionResult Uploadimg()
        {
            var result = new ResultAdaptDto();
            //long size = 0;
            var files = Request.Form.Files;
            if (files.Count == 0)
            {
                result.status = false;
                result.msg = "没有文件信息";
                return Content(result.ToJson());
            }
            string url = $"/upfiles/images/{DateTime.Now.ToString("yyyyMMdd")}";
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
    }
}