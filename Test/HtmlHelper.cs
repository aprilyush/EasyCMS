using Fizzler.Systems.HtmlAgilityPack;
using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class HtmlHelper
    {

        public static void Replace()
        {
            string html = "<div class=\"videoPlayer\"><img class=\"easycms-player\" src=\"/static/images/video-clip.png\" playurl=\"/upfile/videos/1.mp4\" style=\"width: 333px; height: 333px;\"></div>";
            html += "<div class=\"videoPlayer\"><img class=\"easycms-player\" src=\"/static/images/video-clip.png\" playurl=\"/upfile/videos/22.mp4\" style=\"width: 333px; height: 333px;\"></div>";
            string newHtml = VideoReplace(html);
            Console.WriteLine(newHtml);
        }
      private static string VideoReplace(string html)
        {
            var htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(html);
           // var htmlBody = htmlDoc.DocumentNode.SelectNodes("//body");
            var videoNodes=htmlDoc.DocumentNode.SelectNodes("//img[@class='easycms-player']"); 
            foreach(var node in videoNodes)
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
      
    }
}
