using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.BigFile;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.ApiControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly IAtlassRequest RequestHelper;
        public UploadController(IAtlassRequest requestHelper)
        {
            RequestHelper = requestHelper;
        }

        [RequirePermission("#")]
        [HttpGet("GetUploadSet")]
        public IActionResult GetUploadSet()
        {
            var result = new ResultAdaptDto();
            var set = SiteManagerCache.GetUploadInfo();
            result.data.Add("uploadSet", set);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 上传图片
        /// </summary>
        /// <returns></returns>
        [HttpPost("Uploadimg")]
        [RequirePermission("#")]
        public ActionResult Uploadimg()
        {
            var result = new ResultAdaptDto();
            //long size = 0;
            //当设置了开始水印的时候，可以使用nomark来过滤图片不加水印
            int nomark = RequestHelper.GetPostInt("nomark");
            var files = Request.Form.Files;
            if (files.Count == 0)
            {
                result.status = false;
                result.message = "没有文件信息";
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
            var firstFileInfo = new FileInfo(filename);
            if (firstFileInfo.Length > 200 * 1024)
            {
                string compressFileName = IdHelper.ObjectId() + extName;
                string compressFile = $"{folder}/{compressFileName}";
                ImageUtilities.CompressImage(filename, compressFile, 90, 200);
                guidFileName = compressFileName;
            }
            if (nomark == 0)
            {
                var imageSet = SiteManagerCache.GetUploadInfo();
                if (imageSet.open_watermark == 1)
                {
                    try
                    {
                        string sourcePath = $"{folder}/{guidFileName}";
                        if (System.IO.File.Exists(sourcePath))
                        {
                            FileStream fs = new FileStream(sourcePath, FileMode.Open);
                            //把文件读取到字节数组 
                            byte[] data = new byte[fs.Length];
                            fs.Read(data, 0, data.Length);
                            fs.Close();
                            //实例化一个内存流--->把从文件流中读取的内容[字节数组]放到内存流中去 
                            MemoryStream ms = new MemoryStream(data);
                            Image image = Image.FromStream(ms);
                            if (image.Width > imageSet.image_width && image.Height > imageSet.image_height)
                            {
                                ImageWatermarker marker = new ImageWatermarker();
                                //图片水印
                                if (imageSet.watermark_type == 1)
                                {
                                    string waterMarkIamge = GlobalParamsDto.WebRoot + imageSet.watermark_image;
                                    if (System.IO.File.Exists(waterMarkIamge))
                                    {
                                        marker.AddImageSignPic(image, sourcePath, waterMarkIamge, imageSet.water_postion, imageSet.image_quality, imageSet.image_opacity);
                                    }
                                   
                                }
                                else
                                {
                                    marker.AddWatermarkText(image, sourcePath, imageSet.watermark_word, imageSet.water_postion, imageSet.font_size, imageSet.font_color);
                                }
                            }
                        }
                    }
                    catch(Exception ex)
                    {
                        LogNHelper.Exception(ex);
                    }
                    
                }
            }
            string imgurl = $"{ url}/{guidFileName}";
            result.data.Add("url", imgurl);
            return Content(result.ToJson());
        }

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <returns></returns>
        [HttpPost("UploadLogo")]
        [RequirePermission("#")]
        public ActionResult UploadLogo(int imageType)
        {
            var result = new ResultAdaptDto();
            //long size = 0;
            var files = Request.Form.Files;
            if (files.Count == 0)
            {
                result.status = false;
                result.message = "没有文件信息";
                return Content(result.ToJson());
            }
            string url = $"/static/images";
            if (imageType == 2)
            {
                url = "";
            }
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
            string guidFileName = "logo" + extName;
            if (imageType == 2)
            {
                guidFileName = "favicon.ico";
            }
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
        #region 分片上传文件，可断点续传

        /// <summary>
        /// 保存文件或者分块
        /// </summary>
        /// <param name="md5">文件md5</param>
        /// <param name="chunk">分块号</param>
        /// <param name="chunks">分块总数</param>
        /// <returns></returns>
        [HttpPost("SaveChunkFile")]
        [RequirePermission("#")]
        public IActionResult SaveChunkFile()
        {
            //uploadfile,uploadvideo
            string action = RequestHelper.GetPostString("action");
            string guid = RequestHelper.GetPostString("guid");
            string fileName = RequestHelper.GetPostString("name");
            string chunk= RequestHelper.GetPostString("chunk");
            var tempDir = GlobalParamsDto.WebRoot + "/UploadTemp/"+ guid; // 缓存文件夹
            var targetDir = GlobalParamsDto.WebRoot+"/upfiles/videos/"+DateTime.Now.ToString("yyyyMMdd"); // 目标文件夹

            var file = Request.Form.Files[0];
            int index = fileName.LastIndexOf('.');
            string extName = fileName.Substring(index);
            if (!System.IO.Directory.Exists(tempDir))
            {
                System.IO.Directory.CreateDirectory(tempDir);
            }
            string filePath = tempDir+"/"+ chunk.ToString()+ extName;
            //file.SaveFile(filePath);
            using (FileStream fs = System.IO.File.Create(filePath))
            {
                file.CopyTo(fs);
                fs.Flush();
            }
            var result = new ResultAdaptDto();
            return Content(result.ToJson());
        }
        /// <summary>
        /// 保存文件或者分块
        /// </summary>
        /// <param name="md5">文件md5</param>
        /// <param name="chunk">分块号</param>
        /// <param name="chunks">分块总数</param>
        /// <returns></returns>
        [HttpGet("Merge")]
        [RequirePermission("#")]
        public IActionResult Merge()
        {
            var result = new ResultAdaptDto();
            try
            {
                string guid = RequestHelper.GetQueryString("guid");
                string fileName = RequestHelper.GetQueryString("fileName");
                var tempDir = GlobalParamsDto.WebRoot + "/UploadTemp/" + guid; // 缓存文件夹
                var targetDir = GlobalParamsDto.WebRoot + "/upfiles/videos/" + DateTime.Now.ToString("yyyyMMdd"); // 目标文件夹
                 //uploadfile,uploadvideo
                string action = RequestHelper.GetPostString("action");
                if(action== "uploadfile")
                {
                    targetDir = GlobalParamsDto.WebRoot + "/upfiles/attachments/" + DateTime.Now.ToString("yyyyMMdd"); // 目标文件夹

                }
                if (!System.IO.Directory.Exists(targetDir))
                {
                    System.IO.Directory.CreateDirectory(targetDir);
                }

                int index = fileName.LastIndexOf('.');
                string extName = fileName.Substring(index);
                string guidFileName = IdHelper.ObjectId() + extName;
                var finalPath = Path.Combine(targetDir, guidFileName);

                var files = System.IO.Directory.GetFiles(tempDir);//获得下面的所有文件
                using (FileStream fs = System.IO.File.Create(finalPath))
                {
                    foreach (var part in files.OrderBy(x => x.Length).ThenBy(x => x))//排一下序，保证从0-N Write
                    {
                        var bytes = System.IO.File.ReadAllBytes(part);
                        fs.Write(bytes, 0, bytes.Length);
                        bytes = null;
                        System.IO.File.Delete(part);//删除分块
                    }
                    fs.Flush();
                }
                string returnPath = "/upfiles/videos/" + DateTime.Now.ToString("yyyyMMdd") + "/" + guidFileName;
                result.data.Add("url", returnPath);
                result.data.Add("fileName", fileName);
            }
            catch(Exception ex)
            {
                result.status = false;
                result.message = ex.Message;
            }
            return Content(result.ToJson());
        }


        /// <summary>
        /// 合并文件
        /// </summary>
        /// <param name="md5">文件md5</param>
        /// <param name="fileName">文件名</param>
        /// <param name="chunks">分块数</param>
        /// <returns></returns>
        [HttpPost("MergeFile")]
        [RequirePermission("#")]
        public IActionResult MergeFile(string md5, string fileName, int chunks)
        {
            var tempDir = "UploadTemp";
            var targetDir = "UploadFile";

            var (res, msg) = tempDir.Merge(targetDir, fileName, md5, chunks);
            var result = new ResultAdaptDto();
           
           
            if (!res)
            {
                result.message = msg;
                result.status = false;
            }
            else
            {
                result.data.Add("md5", md5);
                result.data.Add("url", Path.Combine("/", targetDir, fileName));
            }

            return Content(result.ToJson());

        }

        /// <summary>
        /// 检查文件或分块是否存在
        /// </summary>
        /// <param name="md5">文件md5</param>
        /// <param name="fileName">文件名</param>
        /// <param name="chunk">分块号</param>
        /// <returns></returns>
        [HttpPost("CheckFile")]
        [RequirePermission("#")]
        public IActionResult CheckFile(string md5, string fileName, int? chunk)
        {
            var tempDir = "UploadTemp";
            var targetDir = "UploadFile";

            string filePath;

            //分片文件
            if (chunk != null)
            {
                filePath = Path.Combine(tempDir, md5, $"{chunk}.part");
            }
            else
            {
                filePath = Path.Combine(targetDir, fileName);
            }

            var exists = System.IO.File.Exists(filePath);
            var Data = fileName != null && exists ? (object)new { md5 = md5, url = Path.Combine("/", targetDir, fileName) } : null;
            var result = new ResultAdaptDto();
            result.status = exists;
            result.data.Add("file", Data);
            return Content(result.ToJson());
        }
        #endregion
    }
}