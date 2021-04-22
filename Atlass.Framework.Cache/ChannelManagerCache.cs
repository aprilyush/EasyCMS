﻿using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Cache
{
    public static class ChannelManagerCache
    {
        private static ConcurrentDictionary<int, cms_channel> _channels;
        private static ConcurrentDictionary<string, cms_channel> _indexChannels;
        static ChannelManagerCache()
        {
            _channels = new ConcurrentDictionary<int, cms_channel>();
            _indexChannels = new ConcurrentDictionary<string, cms_channel>();
        }

        /// <summary>
        /// 添加栏目
        /// </summary>
        /// <param name="channel"></param>
        public static void AddChannel(cms_channel channel)
        {
            _channels[channel.id] = channel;
            _indexChannels[channel.channel_index] = channel;
        }

        /// <summary>
        /// 移除栏目
        /// </summary>
        /// <param name="channelId"></param>
        public static void RemoveChannel(int channelId)
        {
            if (_channels.ContainsKey(channelId))
            {
                _channels.TryRemove(channelId,out cms_channel channel);
                if (channel != null)
                {
                    _indexChannels.TryRemove(channel.channel_index, out cms_channel channel2);
                }
            }
        }
        /// <summary>
        /// 获取栏目
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public static cms_channel GetChannel(int channelId)
        {
            if (_channels.ContainsKey(channelId))
            {
                return _channels[channelId];
            }
            var sql = DbInstanceFactory.GetInstance();
            var model = sql.Select<cms_channel>().Where(s => s.id == channelId).First();
            if (model != null)
            {
                AddChannel(model);
            }
            return model;
        }
        /// <summary>
        /// 获取栏目
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public static cms_channel GetChannelByIndex(string channelIndex)
        {
            if (_indexChannels.ContainsKey(channelIndex))
            {
                return _indexChannels[channelIndex];
            }
            var sql = DbInstanceFactory.GetInstance();
            var model = sql.Select<cms_channel>().Where(s => s.channel_index == channelIndex)
                .OrderBy(s => s.id).First();
            if (model != null)
            {
                AddChannel(model);
            }
            return model;
        }

        /// <summary>
        /// 设置栏目链接方式为1的栏目链接
        /// </summary>
        /// <param name="channelId"></param>
        /// <param name="contentId"></param>
        public static void SetChannelLink(int channelId, int contentId)
        {
            var channel = GetChannel(channelId);
            if (channel == null)
            {
                return;
            }
            if (channel.link_type==1)
            {
                channel.channel_href = $"/news/{channelId}/{contentId}";
                AddChannel(channel);
            }
        }
        /// <summary>
        /// 获取栏目列表
        /// </summary>
        /// <returns></returns>
        public static List<cms_channel> GetChannelList()
        {
            var list = new List<cms_channel>();
            foreach (var dic in _channels)
            {
                list.Add(dic.Value);
            }
            return list;
        }
        /// <summary>
        /// 清空列表
        /// </summary>
        public static void ClearChannels()
        {
            _channels.Clear();
        }

        /// <summary>
        /// 获取栏目模板
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public static cms_template GetChannelTemplate(int channelId)
        {
            var channel = GetChannel(channelId);
            if (channel == null)
            {
                return null;
            }

           return  TemplateManagerCache.GetChannelTemplate(channel.channel_template);
        }


        /// <summary>
        /// 获取栏目的文章模板
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public static cms_template GetContentTemplate(int channelId)
        {
            var channel = GetChannel(channelId);
            if (channel == null)
            {
                return null;
            }
            
            return TemplateManagerCache.GetContentTemplate(channel.content_template);
        }

        
    }
}
