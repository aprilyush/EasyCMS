using Atlass.Framework.DbContext;
using Atlass.Framework.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Cache
{
    public class TemplateManagerCache
    {
        private static ConcurrentDictionary<int,cms_template> _templates;
        private static ConcurrentDictionary<int, cms_template> _defaultTemplates;
        static TemplateManagerCache()
        {
            _templates = new ConcurrentDictionary<int, cms_template>();
            _defaultTemplates = new ConcurrentDictionary<int, cms_template>();
            AddDefaultTemplate();
        }

        /// <summary>
        /// 1-首页，2-栏目模板，3-内容模板，4-单页模板
        /// </summary>
        private static void AddDefaultTemplate()
        {
            _defaultTemplates.TryAdd(1, new cms_template());
            _defaultTemplates.TryAdd(2, new cms_template());
            _defaultTemplates.TryAdd(3, new cms_template());
        }

        /// <summary>
        /// 添加栏目
        /// </summary>
        /// <param name="channel"></param>
        public static void AddTemplate(cms_template template)
        {
            if (template.is_default == 1)
            {
                if(template.template_mode == 1)
                {
                    _defaultTemplates[1] = template;
                }
                else if(template.template_mode == 2)
                {
                    _defaultTemplates[2] = template;
                }else if (template.template_mode == 3)
                {
                    _defaultTemplates[3] = template;
                }
            }
            if (_templates.ContainsKey(template.id))
            {
                _templates[template.id] = template;
                return;
            }
            _templates.TryAdd(template.id, template);
        }

        /// <summary>
        /// 获取首页模板
        /// </summary>
        /// <returns></returns>
        public static cms_template GetHomeTemplate()
        {
            return _defaultTemplates[1];
        }
        /// <summary>
        /// 获取栏目
        /// </summary>
        /// <param name="template"></param>
        /// <returns></returns>
        public static cms_template GetTemplate(int template)
        {
            if (_templates.ContainsKey(template))
            {
                return _templates[template];
            }
            var sql = FreesqlDbInstance.GetInstance();
            var model = sql.Select<cms_template>().Where(s => s.id == template).First();
            if (model != null)
            {
                AddTemplate(model);
            }
            return model;
        }

        public static void ClearTemplates()
        {
            _defaultTemplates[1] = new cms_template();
            _defaultTemplates[2] = new cms_template();
            _defaultTemplates[3] = new cms_template();
            _templates.Clear();
        }

        /// <summary>
        /// 获取栏目模板
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public static cms_template GetChannelTemplate(int templateId)
        {
            if (templateId == 0)
            {
                var defaultChannelTemplate = _defaultTemplates[2];
                if (defaultChannelTemplate.id == 0)
                {
                    return null;
                }
                return defaultChannelTemplate;
            }

           return  GetTemplate(templateId);
        }


        /// <summary>
        /// 获取内容模板
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public static cms_template GetContentTemplate(int templateId)
        {
            if (templateId == 0)
            {
                var defaultContentTemplate = _defaultTemplates[3];
                if (defaultContentTemplate.id == 0)
                {
                    return null;
                }
                return defaultContentTemplate;
            }

            return GetTemplate(templateId);
        }
    }
}
