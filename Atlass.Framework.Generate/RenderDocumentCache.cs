using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;
using VTemplate.Engine;

namespace Atlass.Framework.Generate
{
    public class RenderDocumentCache
    {
        private static ConcurrentDictionary<int, TemplateDocument> _douments;
        static RenderDocumentCache()
        {
            _douments = new ConcurrentDictionary<int, TemplateDocument>();
        }


        /// <summary>
        /// 添加渲染模板缓存
        /// </summary>
        /// <param name="channel"></param>
        public static void AddRenderDocument(int templateId,TemplateDocument douments)
        {
            if (_douments.ContainsKey(templateId))
            {
                _douments[templateId] = douments;
                return;
            }

            _douments.TryAdd(templateId, douments);
        }

        /// <summary>
        /// 移除渲染模板缓存
        /// </summary>
        /// <param name="channelId"></param>
        public static void RemoveRenderDocument(int templateId)
        {
            if (_douments.ContainsKey(templateId))
            {
                _douments.TryRemove(templateId, out TemplateDocument channel);
            }
        }
        /// <summary>
        /// 获取渲染模板缓存
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public static TemplateDocument GetRenderDocument(int templateId)
        {
            if (_douments.ContainsKey(templateId))
            {
                return _douments[templateId];
            }
            return null;
        }
    }
}
