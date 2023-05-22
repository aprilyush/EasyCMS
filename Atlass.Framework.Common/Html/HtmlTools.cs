﻿using Ganss.Xss;
using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Atlass.Framework.Common.Html
{
    public static partial class HtmlTools
    {
        private static readonly HtmlSanitizer Sanitizer = new HtmlSanitizer();

        static HtmlTools()
        {
            Sanitizer.AllowedAttributes.Remove("id");
            Sanitizer.AllowedAttributes.Remove("alt");
            Sanitizer.AllowedCssProperties.Remove("font-family");
            Sanitizer.AllowedCssProperties.Remove("background-color");
            Sanitizer.KeepChildNodes = true;
            Sanitizer.AllowedTags.Remove("input");
            Sanitizer.AllowedTags.Remove("button");
            Sanitizer.AllowedTags.Remove("iframe");
            Sanitizer.AllowedTags.Remove("frame");
            Sanitizer.AllowedTags.Remove("textarea");
            Sanitizer.AllowedTags.Remove("select");
            Sanitizer.AllowedTags.Remove("form");
            Sanitizer.AllowedAttributes.Add("src");
            Sanitizer.AllowedAttributes.Add("class");
            Sanitizer.AllowedAttributes.Add("style");
        }

        /// <summary>
        /// 标准的防止html的xss净化器
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
        public static string HtmlSantinizerStandard(this string html)
        {
            return Sanitizer.Sanitize(html);
        }

        /// <summary>
        /// 自定义的防止html的xss净化器
        /// </summary>
        /// <param name="html">源html</param>
        /// <param name="labels">需要移除的标签集合</param>
        /// <param name="attributes">需要移除的属性集合</param>
        /// <param name="styles">需要移除的样式集合</param>
        /// <returns></returns>
        public static string HtmlSantinizerCustom(this string html, string[] labels = null, string[] attributes = null, string[] styles = null)
        {
            if (labels != null)
            {
                foreach (string label in labels)
                {
                    Sanitizer.AllowedTags.Remove(label);
                }
            }

            if (attributes != null)
            {
                foreach (string attr in attributes)
                {
                    Sanitizer.AllowedAttributes.Remove(attr);
                }
            }

            if (styles != null)
            {
                foreach (string p in styles)
                {
                    Sanitizer.AllowedCssProperties.Remove(p);
                }
            }

            Sanitizer.KeepChildNodes = true;
            return Sanitizer.Sanitize(html);
        }
        /// <summary>
        /// 去除html标签后并截取字符串
        /// </summary>
        /// <param name="html">源html</param>
        /// <param name="length">截取长度</param>
        /// <returns></returns>
        public static string RemoveHtmlTag(this string html, int length = 0)
        {
            var doc = new HtmlDocument();
            doc.LoadHtml(html);
            var strText = doc.DocumentNode.InnerText;
            if (length > 0 && strText.Length > length)
            {
                return strText.Substring(0, length);
            }

            return strText;
        }

        /// <summary>
        /// 清理Word文档转html后的冗余标签属性
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
        public static string ClearHtml(this string html)
        {
            string s = Regex.Match(Regex.Replace(html, @"background-color:#?\w{3,7}|font-family:'?[\w|\(|\)]*'?;?", string.Empty), @"<body[^>]*>([\s\S]*)<\/body>").Groups[1].Value.Replace("&#xa0;", string.Empty);
            s = Regex.Replace(s, @"\w+-?\w+:0\w+;?", string.Empty); //去除多余的零值属性
            s = Regex.Replace(s, "alt=\"(.+?)\"", string.Empty); //除去alt属性
            s = Regex.Replace(s, @"-aw.+?\s", string.Empty); //去除Word产生的-aw属性
            return s;
        }

        /// <summary>
        /// 替换html的img路径为绝对路径
        /// </summary>
        /// <param name="html"></param>
        /// <param name="imgDest"></param>
        /// <returns></returns>
        public static string ReplaceHtmlImgSource(this string html, string imgDest) => html.Replace("<img src=\"", "<img src=\"" + imgDest + "/");

        /// <summary>
        /// 将src的绝对路径换成相对路径
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static string ConvertImgSrcToRelativePath(this string s)
        {
            return Regex.Replace(s, @"<img src=""(http:\/\/.+?)/", @"<img src=""/");
        }

        /// <summary>
        /// 匹配html的所有img标签集合
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
        public static IEnumerable<HtmlNode> MatchImgTags(this string html)
        {
            var doc = new HtmlDocument();
            doc.LoadHtml(html);
            var nodes = doc.DocumentNode.Descendants("img");
            return nodes;
        }

        /// <summary>
        /// 匹配html的所有img标签的src集合
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
        public static IEnumerable<string> MatchImgSrcs(this string html)
        {
            return MatchImgTags(html).Where(n => n.Attributes.Contains("src")).Select(n => n.Attributes["src"].Value);
        }

        /// <summary>
        /// 获取html中第一个img标签的src
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
        public static string MatchFirstImgSrc(this string html)
        {
            return MatchImgSrcs(html).FirstOrDefault();
        }

        /// <summary>
        /// 随机获取html代码中的img标签的src属性
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
        public static string MatchRandomImgSrc(this string html)
        {
            int count = MatchImgSrcs(html).Count();
            var rnd = new Random();
            return MatchImgSrcs(html).ElementAtOrDefault(rnd.Next(count));
        }

        /// <summary>
        /// 替换回车换行符为html换行符
        /// </summary>
        /// <param name="str">html</param>
        public static string StrFormat(this string str)
        {
            return str.Replace("\r\n", "<br />").Replace("\n", "<br />");
        }

        /// <summary>
        /// 替换html字符
        /// </summary>
        /// <param name="strHtml">html</param>
        public static string EncodeHtml(this string strHtml)
        {
            if (strHtml != "")
            {
                return strHtml.Replace(",", "&def").Replace("'", "&dot").Replace(";", "&dec");
            }

            return "";
        }

        /// <summary>
        /// 移除html标签
        /// </summary>
        /// <param name="Htmlstring"></param>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string NoHTML(this string Htmlstring,int length=0)  //替换HTML标记
        {
            if (Htmlstring.IsEmpty())
            {
                return "";
            }
            //删除脚本
            Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);

            Htmlstring = Regex.Replace(Htmlstring, @"\[[^\]]+\]", "", RegexOptions.IgnoreCase);

            //删除HTML
            Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&#(\d+);", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"<img[^>]*>;", "", RegexOptions.IgnoreCase);
            Htmlstring.Replace("<", "");
            Htmlstring.Replace(">", "");
            Htmlstring.Replace("\r\n", "");
            Htmlstring = Htmlstring.EncodeHtml();

            if (length > 0 && Htmlstring.Length > length)
            {
                return Htmlstring.Substring(0, length);
            }
            return Htmlstring;
        }
    }
}
