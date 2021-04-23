using Atlass.Framework.Common.NLog;
using HtmlAgilityPack;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Generate
{
    public class HtmlPlayerHandler
    {
        public static string CreateVideo(string html)
        {
            try
            {
                var htmlDoc = new HtmlDocument();
                htmlDoc.LoadHtml(html);
                var bodyNode = htmlDoc.DocumentNode.SelectSingleNode("//body");
                var videoNodes = bodyNode.SelectNodes("//img[@class='easycms-player']");
                if (videoNodes == null || videoNodes.Count == 0)
                {
                    return html;
                }
                Dictionary<string, string> playList = new Dictionary<string, string>();
                byte needPlayer = 0;
                foreach (var node in videoNodes)
                {
                    string videoUrl = node.Attributes["playurl"].Value;
                    string videoId = node.Attributes["id"].Value;
                    string player= node.Attributes["player"].Value;
                    string videoPlayer = "";
                    if (player == "h5")
                    {
                        videoPlayer = H5Player(videoId);
                        playList.Add(videoId, videoUrl);
                        needPlayer = 1;
                    }
                    else
                    {
                        needPlayer = 1;
                        videoPlayer = FlashPlayer(videoUrl);
                    }
                    HtmlNode newChild = HtmlNode.CreateNode(videoPlayer);
                    node.ParentNode.InsertAfter(newChild, node);
                    //node.ReplaceChild(newChild, node);
                    node.Remove();
                }

                //获取ckplayerjs引用
                if (needPlayer == 1)
                {
                    HtmlNode CkPlayerNode = HtmlNode.CreateNode(CkPlayerJs());
                    bodyNode.AppendChild(CkPlayerNode);

                    //如果是h5播放器，需要添加额外控制脚本
                    if (playList.Count > 0)
                    {
                        var h5PlayerScript = H5PlayerJs(playList);
                        HtmlNode h5PlayerJsNode = HtmlNode.CreateNode(h5PlayerScript);

                        bodyNode.AppendChild(h5PlayerJsNode);
                    }
                }

                return htmlDoc.DocumentNode.InnerHtml; ;
            }
            catch(Exception ex)
            {
                LogNHelper.Exception(ex);
            }
            return html;
        }

        /// <summary>
        /// flashPlayer
        /// </summary>
        /// <param name="videoUrl"></param>
        /// <returns></returns>
        private static string FlashPlayer(string videoUrl)
        {
            string videoPlayer = $"<embed src=\"/ui/plugins/ckplayer/ckplayer.swf\" flashvars =\"video={videoUrl}\"";
            videoPlayer += " quality=\"high\" width = \"400\" height =\"400\" align =\"middle\" allowScriptAccess =\"always\"";
            videoPlayer += " allowFullscreen = \"true\" type = \"application/x-shockwave-flash\"></embed>";
            return videoPlayer;
        }

        /// <summary>
        /// Html5播放器
        /// </summary>
        /// <param name="videoUrl"></param>
        /// <returns></returns>
        private static string H5Player(string videoId)
        {
            string videoPlayer = $"<div id=\"{videoId}\" class=\"video_player\" style=\"width: 600px; height: 400px;position: absolute;left: 25%;\" ></div>";

            return videoPlayer;
        }

        /// <summary>
        /// ckplayerjs引用
        /// </summary>
        /// <returns></returns>
        private static string CkPlayerJs()
        {
            string html = "<script id=\"ckplayer\" src=\"/ui/plugins/ckplayer/ckplayer.min.js\"></script>\n";
            return html;
        }
        /// <summary>
        /// 获取h5播放器脚本
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        private static string H5PlayerJs(Dictionary<string,string> list)
        {
            
            string html = "<script type=\"text/javascript\">\n";
            int index = 1;
            foreach(var dic in list)
            {
                var videoObject = "videoObject" + index;
                var variable = "variable" + index;
                html += $"var {videoObject}={{ \n";
                html += $"           container:'#{dic.Key}',\n";//“#”代表容器的ID，“.”或“”代表容器的class
                html += $"           variable:'{variable}',\n";//该属性必需设置，值等于下面的new chplayer()的对象
                html += "            flashplayer: false,\n";//如果强制使用flashplayer则设置成true
                html += $"           video: '{dic.Value}'\n";
                html += "            };\n";
                html += $"     var {variable} = new ckplayer({videoObject});\n";
                index++;
            }
           html +="</script>";

            return html;
        }
    }
}
