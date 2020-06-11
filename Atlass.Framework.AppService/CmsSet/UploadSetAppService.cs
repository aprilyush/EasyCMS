using Atlass.Framework.Models;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.AppService.CmsSet
{
    public class UploadSetAppService
    {
        private readonly IFreeSql Sqldb;
        public UploadSetAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public cms_upload_set GetModel()
        {
            var model = Sqldb.Select<cms_upload_set>().OrderBy(s => s.id).First();
            if (model == null)
            {
                model = new cms_upload_set();
            }
            return model;

        }

        public cms_upload_set SaveSite(cms_upload_set dto)
        {
            dto.watermark_image = dto.watermark_image ?? "/static/images/logo.png";
          
            dto.watermark_word = dto.watermark_word ?? "EasyCMS";
            dto.font_color = dto.font_color ?? "#000000";
            dto.image_extname = dto.image_extname ?? "gif,jpg,jpeg,bmp,png,pneg,swf,webp";
            dto.media_extname = dto.media_extname ?? "asf,asx,avi,flv,mid,midi,mov,mp3,mp4,mpg,mpeg,ogg,ra,rm,rmb,rmvb,rp,rt,smi,swf,wav,webm,wma,wmv,viv";
            dto.attache_extname = dto.attache_extname ?? "zip,rar,7z,js,css,txt,doc,docx,ppt,pptx,xls,xlsx,pdf";
            if (dto.id == 0)
            {
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<cms_upload_set>().SetSource(dto).ExecuteAffrows();
            }
            return dto;
        }
    }
}
