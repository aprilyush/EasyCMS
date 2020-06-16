using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models
{
    public class cms_upload_set
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        /// <summary>
        /// 水印功能 0-关闭，1-开启
        /// </summary>
        public int open_watermark { get; set; } = 0;

        /// <summary>
        /// 0-文字，1-图片
        /// </summary>
        public int watermark_type { get; set; } = 1;
        /// <summary>
        /// 水印条件,图片宽度 单位像素(px)
        /// </summary>
        public int image_width { get; set; } = 200;
        /// <summary>
        /// 水印条件,图片高度 单位像素(px)
        /// </summary>
        public int image_height { get; set; } = 50;
        /// <summary>
        /// 水印图片
        /// </summary>
        public string watermark_image { get; set; } = "/static/images/logo.png";
        /// <summary>
        /// 水印透明度 0-100
        /// </summary>
        public int image_opacity { get; set; } = 80;
        /// <summary>
        /// JPEG 水印质量0-100
        /// </summary>
        public int image_quality { get; set; } = 60;
        /// <summary>
        /// 水印位置
        /// </summary>
        public int water_postion { get; set; } = 9;

        /// <summary>
        /// 水印文字
        /// </summary>
        public string watermark_word { get; set; } = "EasyCMS";
        /// <summary>
        /// 字体大小
        /// </summary>
        public int font_size { get; set; } = 30;
        /// <summary>
        /// 文字颜色
        /// </summary>
        public string font_color { get; set; } = "#000000";
        /// <summary>
        /// 图片
        /// </summary>
        public string image_extname { get; set; } = "gif,jpg,jpeg,bmp,png,pneg,swf,webp";
        /// <summary>
        /// 媒体
        /// </summary>
        public string media_extname { get; set; } = "asf,asx,avi,flv,mid,midi,mov,mp3,mp4,mpg,mpeg,ogg,ra,rm,rmb,rmvb,rp,rt,smi,swf,wav,webm,wma,wmv,viv";
        
        /// <summary>
        /// 附件
        /// </summary>
        public string attache_extname { get; set; } = "zip,rar,7z,js,css,txt,doc,docx,ppt,pptx,xls,xlsx,pdf";
        /// <summary>
        /// 文件最大大小
        /// </summary>
        public long max_file_size { get; set; } = 10;
        public long max_media_size { get; set; } = 100;
    }
}
