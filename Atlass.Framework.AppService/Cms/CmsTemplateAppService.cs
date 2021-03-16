using Atlass.Framework.Models;
using Atlass.Framework.Models.Cms;
using Atlass.Framework.ViewModels.Cms;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.AppService.Cms
{
    public class CmsTemplateAppService
    {
        private readonly IFreeSql Sqldb;
        public CmsTemplateAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }

        public DataTableDto GetData(DataTableDto dto, int pid)
        {
            var query = Sqldb.Select<cms_template>()
                      .WhereIf(pid > 0, s => s.pid == pid)
                      .OrderBy(s=>s.pid)
                      .OrderByDescending(s => s.id)
                      .Count(out long total)
                      .Page(dto.page, dto.limit)
                      .ToList(s => new cms_template
                      {
                          id = s.id,
                          template_name = s.template_name,
                          template_file = s.template_file,
                          is_default = s.is_default,
                          template_mode=s.template_mode,
                          file_name=s.file_name
                      });

            dto.total = total;
            dto.rows = query;
            return dto;
        }

        public cms_template InsertTemplate(cms_template dto)
        {
            if (dto.template_mode < 4)
            {
                var count = Sqldb.Select<cms_template>().Where(s => s.pid == dto.pid && s.is_default == 1).Count();
                if (count == 0)
                {
                    dto.is_default = 1;
                }
            }

            Sqldb.Insert(dto).ExecuteAffrows();
            return dto;
        }

        public cms_template UpdateTemplate(cms_template dto)
        {
            var oldTemp = Sqldb.Select<cms_template>()
                .Where(s => s.id == dto.id).First(s => new cms_template
                {
                    id = s.id,
                    template_name = s.template_name,
                    template_file = s.template_file,
                    is_default = s.is_default
                });
            if (oldTemp == null)
            {
                return null;
            }
            dto.is_default = oldTemp.is_default;
            Sqldb.Update<cms_template>().SetSource(dto).IgnoreColumns(s => new { s.insert_id, s.insert_time }).ExecuteAffrows();
            return dto;

        }
        public cms_template GetModel(int id)
        {
            if (id == 0)
            {
                return new cms_template();
            }
            var model = Sqldb.Select<cms_template>().Where(s => s.id == id).First();
            if (model == null)
            {
                model = new cms_template();
            }
            return model;
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string DeleteById(int id)
        {
            var temp = Sqldb.Select<cms_template>().Where(s => s.id == id).First();
            if (temp == null)
            {
                return null;
            }
            //删除文件时，如果当前文件是默认文件需要重新设置一个默认文件
            int setDefaultId = 0;
            if (temp.template_mode < 4&&temp.is_default==1)
            {
                setDefaultId = Sqldb.Select<cms_template>().Where(s =>s.id!=id&&s.pid ==temp.pid).OrderBy(s=>s.id).First(s=>s.id);
            }

            if (setDefaultId > 0)
            {
                Sqldb.Update<cms_template>().Set(s => s.is_default, 1).Where(s => s.id == setDefaultId).ExecuteAffrows();
            }
            Sqldb.Delete<cms_template>().Where(s => s.id == id).ExecuteAffrows();
            return temp.template_file;
        }

        /// <summary>
        /// 获取分类
        /// </summary>
        /// <returns></returns>
        public List<ZtreeSelIntDto> TemplateCategory()
        {
            var list = new List<ZtreeSelIntDto>();
            list.Insert(0, new ZtreeSelIntDto { id = 1, name = "首页模板" });
            list.Insert(1, new ZtreeSelIntDto { id = 2, name = "栏目模板" });
            list.Insert(2, new ZtreeSelIntDto { id = 3, name = "内容模板" });
            list.Insert(3, new ZtreeSelIntDto { id = 4, name = "单页模板" });
            list.Insert(4, new ZtreeSelIntDto { id = 5, name = "包含文件" });
            return list;
        }
        public List<ZtreeSelIntDto> TemplateZtree()
        {
            var list = Sqldb.Select<cms_template>().ToList(s => new ZtreeSelIntDto
            {
                id = s.id,
                name = s.template_name,
                pId = s.pid,
                title = s.template_file

            });
            list.Insert(0, new ZtreeSelIntDto { id = 1, name = "首页模板" });
            list.Insert(1, new ZtreeSelIntDto { id = 2, name = "栏目模板" });
            list.Insert(2, new ZtreeSelIntDto { id = 3, name = "内容模板" });
            list.Insert(3, new ZtreeSelIntDto { id = 4, name = "单页模板" });
            list.Insert(4, new ZtreeSelIntDto { id = 5, name = "包含文件" });
            return list;
        }


        #region 模板匹配
        /// <summary>
        /// 模板匹配列表
        /// </summary>
        /// <returns></returns>
        public (List<TemplateMatchListDto> matchs, List<ZtreeSelIntDto> templates) MatchList()
        {
            var channels = Sqldb.Select<cms_channel>().ToList();
            var templates = Sqldb.Select<cms_template>().ToList();
            var list = new List<TemplateMatchListDto>();
            foreach (var channel in channels)
            {
                var model = new TemplateMatchListDto();
                model.Id = channel.id;
                model.ParentId = channel.parent_id;
                model.ChannelName = channel.channel_name;
                if (channel.channel_template == 0)
                {
                    model.ChannelTemplateName = templates.Where(s => s.template_mode == 2 && s.is_default == 1)
                        .Select(s => s.template_name).FirstOrDefault();
                }
                else
                {
                    var channelTemplate = templates.Where(s => s.id == channel.channel_template).FirstOrDefault();
                    if (channelTemplate != null)
                    {
                        model.ChannelTemplateName = channelTemplate.template_name;
                    }
                    else
                    {
                        model.ChannelTemplateName = templates.Where(s => s.template_mode == 2 && s.is_default == 1)
                        .Select(s => s.template_name).FirstOrDefault();
                    }
                }

                if (channel.channel_index != "首页")
                {
                    if (channel.content_template == 0)
                    {
                        model.ContentTemplateName = templates.Where(s => s.template_mode == 3 && s.is_default == 1)
                            .Select(s => s.template_name).FirstOrDefault();
                    }
                    else
                    {
                        var contentTemplate = templates.Where(s => s.id == channel.content_template).FirstOrDefault();
                        if (contentTemplate != null)
                        {
                            model.ContentTemplateName = contentTemplate.template_name;
                        }
                        else
                        {
                            model.ContentTemplateName = templates.Where(s => s.template_mode == 3 && s.is_default == 1)
                            .Select(s => s.template_name).FirstOrDefault();
                        }
                    }
                }
                else
                {
                    if (channel.channel_template == 0)
                    {
                        model.ChannelTemplateName = templates.Where(s => s.template_mode == 1 && s.is_default == 1)
                            .Select(s => s.template_name).FirstOrDefault();
                    }
                    else
                    {
                        var channelTemplate = templates.Where(s => s.id == channel.channel_template).FirstOrDefault();
                        if (channelTemplate != null)
                        {
                            model.ChannelTemplateName = channelTemplate.template_name;
                        }
                        else
                        {
                            model.ChannelTemplateName = templates.Where(s => s.template_mode == 1&& s.is_default == 1)
                            .Select(s => s.template_name).FirstOrDefault();
                        }
                    }
                }
              
                list.Add(model);
            }
            var templateTrees = templates.Select(s => new ZtreeSelIntDto { id = s.id, name = s.template_name, pId = s.pid }).ToList();
            return (list, templateTrees);
        }

        /// <summary>
        /// 匹配
        /// </summary>
        /// <param name="channelId"></param>
        /// <param name="templateId"></param>
        /// <param name="channelType">2-栏目模板,3-内容模板</param>
        public void SetMatch(int channelId, int templateId, int channelType)
        {
            if (channelType == 2)
            {
                Sqldb.Update<cms_channel>().Set(s => s.channel_template, templateId)
                         .Where(s => s.id == channelId).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<cms_channel>().Set(s => s.content_template, templateId)
                        .Where(s => s.id == channelId).ExecuteAffrows();
            }

        }
        #endregion
    }
}
