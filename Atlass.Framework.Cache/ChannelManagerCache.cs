using Atlass.Framework.DbContext;
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
        static ChannelManagerCache()
        {
            _channels = new ConcurrentDictionary<int, cms_channel>();
        }

        /// <summary>
        /// 添加栏目
        /// </summary>
        /// <param name="channel"></param>
        public static void AddChannel(cms_channel channel)
        {
            if (_channels.ContainsKey(channel.id))
            {
                _channels[channel.id]= channel;
                return;
            }
            _channels.TryAdd(channel.id, channel);
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
            var sql = FreesqlDbInstance.GetInstance();
            var model = sql.Select<cms_channel>().Where(s => s.id == channelId).First();
            if (model != null)
            {
                AddChannel(model);
            }
            return model;
        }

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
