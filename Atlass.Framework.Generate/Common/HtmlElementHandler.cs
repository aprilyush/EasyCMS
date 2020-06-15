using Atlass.Framework.Common.NLog;
using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Generate
{
    public class HtmlElementHandler
    {
        public static string CreateVideo(string html)
        {
            try
            {
                var htmlDoc = new HtmlDocument();
                htmlDoc.LoadHtml(html);
                // var htmlBody = htmlDoc.DocumentNode.SelectNodes("//body");
                var videoNodes = htmlDoc.DocumentNode.SelectNodes("//img[@class='easycms-player']");
                foreach (var node in videoNodes)
                {
                    string videoUrl = node.Attributes["playurl"].Value;
                    string videoPlayer = $"<embed src=\"/plugins/ckplayer/ckplayer.swf\" flashvars =\"video={videoUrl}\" quality=\"high\" width = \"400\" height =\"400\" align =\"middle\" allowScriptAccess =\"always\" allowFullscreen = \"true\" type = \"application/x-shockwave-flash\"></embed>";
                    HtmlNode newChild = HtmlNode.CreateNode(videoPlayer);
                    node.ParentNode.InsertAfter(newChild, node);
                    //node.ReplaceChild(newChild, node);
                    node.Remove();
                }


                return htmlDoc.DocumentNode.InnerHtml; ;
            }
            catch(Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return html;
        }
    }
}
