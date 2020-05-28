
using Atlass.Framework.Cache;
using Atlass.Framework.Common.IdHelper;
using Atlass.Framework.DbContext;
using Atlass.Framework.Generate;
using Atlass.Framework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.Generate
{
    /// <summary>
    /// 模板数据源，通用包含了新闻内容，面包屑，栏目信息的基本数据
    /// </summary>
    public class GenerateContentAppService
    {
        private readonly  IFreeSql Sqldb;
        public GenerateContentAppService() {
            Sqldb =FreesqlDbInstance.GetInstance();
        }

        #region 内容数据
        /// <summary>
        /// 获取新闻详情数据
        /// </summary>
        /// <param name="contentId"></param>
        /// <returns></returns>
        public ContentModel GetContentInfo(int contentId)
        {
            var model = Sqldb.Select<cms_content>()
                .Where(s=>s.id==contentId)
                .First(s => new ContentModel
                {
                    id = s.id,
                    title = s.title,
                    sub_title = s.sub_title,
                    content = s.content,
                    summary = s.summary,
                    cover_image = s.cover_image,
                    author = s.author,
                    source = s.source,
                    channel_id = s.channel_id,
                    ip_limit = s.ip_limit,
                    is_top = s.is_top,
                    tags = s.tags,
                    content_href = s.content_href,
                    hit_count = s.hit_count,
                    publish_time = s.insert_time,
                    last_edit_time = s.update_time
                });
            if (model != null)
            {
                model.navigation = GetNaviLocation(model.channel_id);
            }
            return model;
        }

        /// <summary>
        /// 获取数据详情
        /// </summary>
        /// <param name="contentIds"></param>
        /// <returns></returns>
        public List<ContentModel> GetContentSummary(int channelId, int psize = 10)
        {
            var list = Sqldb.Select<cms_content>()
               .Where(s => s.channel_id == channelId)
               .OrderByDescending(s=>s.is_top)
               .OrderByDescending(s=>s.update_time)
               .Page(1,psize)
               .ToList(s => new ContentModel
               {
                   id = s.id,
                   title = s.title,
                   sub_title = s.sub_title,
                   summary = s.summary,
                   cover_image = s.cover_image,
                   author = s.author,
                   source = s.source,
                   channel_id = s.channel_id,
                   ip_limit = s.ip_limit,
                   is_top = s.is_top,
                   tags = s.tags,
                   content_href = s.content_href,
                   hit_count = s.hit_count,
                   publish_time = s.insert_time,
                   last_edit_time = s.update_time
               });
            if (list.Count == 0)
            {
                return list;
            }
            list.ForEach(s =>
            {
                s.navigation = GetNaviLocation(s.channel_id);
                if (string.IsNullOrEmpty(s.content_href))
                {
                    s.content_href = $"/news/{s.channel_id}/{s.id}";
                }
            });
            return list;
        }

        /// <summary>
        /// 根据栏目索引获取数据详情
        /// </summary>
        /// <param name="contentIds"></param>
        /// <returns></returns>
        public List<ContentModel> GetContentSummary(string channelIndex,int page=1, int psize = 10)
        {
            int channelId = Sqldb.Select<cms_channel>().Where(s => s.channel_index == channelIndex)
                .OrderBy(s=>s.id).First(s => s.id);
            if (channelId == 0)
            {
                return new List<ContentModel>();
            }
            var list = Sqldb.Select<cms_content>()
               .Where(s => s.channel_id == channelId)
               .OrderByDescending(s => s.is_top)
               .OrderByDescending(s => s.update_time)
               .Page(page, psize)
               .ToList(s => new ContentModel
               {
                   id = s.id,
                   title = s.title,
                   sub_title = s.sub_title,
                   summary = s.summary,
                   cover_image = s.cover_image,
                   author = s.author,
                   source = s.source,
                   channel_id = s.channel_id,
                   ip_limit = s.ip_limit,
                   is_top = s.is_top,
                   tags = s.tags,
                   content_href = s.content_href,
                   hit_count = s.hit_count,
                   publish_time = s.insert_time,
                   last_edit_time = s.update_time
               });
            if (list.Count == 0)
            {
                return list;
            }
            list.ForEach(s =>
            {
                s.navigation = GetNaviLocation(s.channel_id);
                if (string.IsNullOrEmpty(s.content_href))
                {
                    s.content_href = $"/news/{s.channel_id}/{s.id}";
                }
            });
            return list;
        }

        /// <summary>
        /// 根据栏目id获取数据详情
        /// </summary>
        /// <param name="contentIds"></param>
        /// <returns></returns>
        public List<ContentModel> GetContentSummary(int channelId, int page = 1, int psize = 10)
        {
            var list = Sqldb.Select<cms_content>()
               .Where(s => s.channel_id == channelId)
               .OrderByDescending(s => s.is_top)
               .OrderByDescending(s => s.update_time)
               .Page(page, psize)
               .ToList(s => new ContentModel
               {
                   id = s.id,
                   title = s.title,
                   sub_title = s.sub_title,
                   summary = s.summary,
                   cover_image = s.cover_image,
                   author = s.author,
                   source = s.source,
                   channel_id = s.channel_id,
                   ip_limit = s.ip_limit,
                   is_top = s.is_top,
                   tags = s.tags,
                   content_href = s.content_href,
                   hit_count = s.hit_count,
                   publish_time = s.insert_time,
                   last_edit_time = s.update_time
               });
            if (list.Count == 0)
            {
                return list;
            }
            list.ForEach(s =>
            {
                s.navigation = GetNaviLocation(s.channel_id);
                if (string.IsNullOrEmpty(s.content_href))
                {
                    s.content_href = $"/news/{s.channel_id}/{s.id}";
                }
            });
            return list;
        }

        #endregion

        #region 栏目数据 栏目数据必须存在首页栏目，并且为唯一顶级栏目，这是一个约束

        /// <summary>
        /// 获取栏目数据
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public ChannelModel GetChannel(int channelId)
        {
            var channel = ChannelManagerCache.GetChannel(channelId);
            if (channel == null)
            {
                return null;
            }

            var model = new ChannelModel();
            model.id = channel.id;
            model.parent_id = channel.parent_id;
            model.sort_num = channel.sort_num;
            model.channel_name = channel.channel_name;
            model.channel_index = channel.channel_index;
            model.channel_image = channel.channel_image;
            model.channel_href = channel.channel_href;
            model.channel_template = channel.channel_template;
            model.dis_drawing = channel.dis_drawing;
            model.current = 1;
            if (string.IsNullOrEmpty(model.channel_href))
            {
                model.channel_href = $"/news/{channelId}";
            }
            model.navigation = GetNaviLocation(channelId);
            return model;

        }
        /// <summary>
        /// 获取栏目数据列表 必须设置首页栏目
        /// </summary>
        /// <returns></returns>
        public List<ChannelModel> GetChannelTree(int channleId=0)
        {
            var channels = ChannelManagerCache.GetChannelList();
            var homeId = channels.Where(s => s.channel_index == "首页").Select(s=>s.id).FirstOrDefault();
            if (homeId == 0)
            {
                return new List<ChannelModel>();
            }
            //获取首页栏目下的第一层栏目
            //var topChannels = channels.Where(s => s.parent_id == homeId)
            //    .OrderBy(s => s.sort_num)
            //    .Select(s => new ChannelModel {
            //        id =s.id, parent_id =s.parent_id ,
            //        sort_num=s.sort_num,
            //        channel_name=s.channel_name,
            //        channel_index=s.channel_index,
            //        channel_image=s.channel_image,
            //        channel_href=s.channel_href,
            //        channel_template=s.channel_template,
            //    }).ToList();
            //if (topChannels.Count == 0)
            //{
            //    return topChannels;
            //}
            ////设置连接和导航
            //topChannels.ForEach(s =>
            //{
            //    if (string.IsNullOrEmpty(s.channel_href))
            //    {
            //        s.channel_href = $"/news/{s.id}";
            //        s.navigation = GetNaviLocation(s.id);
            //    }
            //});
            var list = InitChild(homeId, channels, channleId);
            var home = new ChannelModel { id = 0, channel_href = "/index.html", channel_name = "首页" };
            if (channleId == 0)
            {
                home.current = 1;
            }
            list.Insert(0, home);
            return list;
        }

        /// <summary>
        /// 迭代子栏目
        /// </summary>
        /// <param name="pid"></param>
        /// <param name="channels"></param>
        /// <returns></returns>
        private List<ChannelModel> InitChild(int pid, List<cms_channel> channels,int channleId)
        {
            var list = new List<ChannelModel>();
            var topChannels = channels.Where(s => s.parent_id == pid)
              .OrderBy(s => s.sort_num)
              .Select(s => new ChannelModel
              {
                  id = s.id,
                  parent_id = s.parent_id,
                  sort_num = s.sort_num,
                  channel_name = s.channel_name,
                  channel_index = s.channel_index,
                  channel_image = s.channel_image,
                  channel_href = s.channel_href,
                  channel_template = s.channel_template,
                  dis_drawing=s.dis_drawing
              }).ToList();

            //设置连接和导航
            foreach (var channel in topChannels)
            {
                if (string.IsNullOrEmpty(channel.channel_href))
                {
                    channel.channel_href = $"/news/{channel.id}";
                    channel.navigation = GetNaviLocation(channel.id);
                }
                if (channel.id == channleId)
                {
                    channel.current = 1;
                }
                var subChannels = channels.Where(s => s.parent_id == channel.id).ToList();
                if (subChannels.Count > 0)
                {
                    var childs = InitChild(channel.id, channels, channleId);
                    channel.sub_count = childs.Count;
                    if (channel.sub_count > 0)
                    {
                        channel.sub_channels = childs;

                    }
                }

                list.Add(channel);
            }

            return list;
        }
        #endregion





        /// <summary>
        /// 获取栏目定位  
        /// </summary> 
        /// <param name="channelId"></param>
        /// <returns>首页>新闻中心</returns>
        private string GetNaviLocation(int channelId)
        {
            List<string> channelNames = new List<string>();

            var channel = ChannelManagerCache.GetChannel(channelId);
            if (channel != null)
            {
                string channelHref = $"&nbsp;&nbsp;<a href='/news/{channel.id}'>{channel.channel_name}</a>";
                channelNames.Insert(0, channelHref);
                int channelPid = channel.parent_id;
                while (channelPid > 0)
                {
                    channel= ChannelManagerCache.GetChannel(channelPid);
                    if (channel != null)
                    {
                        string channelHref2 = "<a href='/index.html'>首页</a>";
                        if (channel.channel_index != "首页")
                        {
                            channelHref2 = $"&nbsp;&nbsp;<a href='/news/{channel.id}'>{channel.channel_name}</a>";
                        }
                        channelNames.Insert(0,channelHref2);
                        channelPid = channel.parent_id;
                    }
                }

            }

            if (channelNames.Count == 0)
            {
                return "<a href='/index.html'>首页</a>";
            }

            return string.Join('>', channelNames);
        }
    }
}
