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


        /// <summary>
        /// 模板数据列表
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="pid"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public DataTableDto GetData(DataTableDto dto, int pid,string name)
        {
            var query = Sqldb.Select<cms_template>()
                      .WhereIf(pid > 0, s => s.pid == pid)
                      .WhereIf(!name.IsEmpty(),s=>s.template_name.Contains(name))
                      .OrderBy(s=>s.pid)
                      .OrderByDescending(s => s.id)
                      .Count(out long total)
                      .Page(dto.pageNumber, dto.pageSize)
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

        /// <summary>
        /// 添加模板
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
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

        /// <summary>
        /// 更新模板
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
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
            Sqldb.Update<cms_template>().SetSource(dto).ExecuteAffrows();
            return dto;

        }

       /// <summary>
       /// 模板信息
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
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
        /// 获取所有模板
        /// </summary>
        /// <returns></returns>
        public List<cms_template> GetAllTemplates()
        {
            var templates = Sqldb.Select<cms_template>().ToList();
            return templates;
        }
        /// <summary>
        /// 模板匹配列表
        /// </summary>
        /// <returns></returns>
        public List<TemplateMatchListDto> MatchList()
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
           
            return list;
        }


        /// <summary>
        /// 获取匹配
        /// </summary>
        /// <param name="channelId"></param>
        /// <returns></returns>
        public cms_channel TemplateMatch(int channelId)
        {
            var channel= Sqldb.Select<cms_channel>()
                .Where(s => s.id == channelId).First(s=>new cms_channel { 
                    channel_name=s.channel_name,
                    channel_template=s.channel_template,
                    content_template=s.content_template
                });
            if (channel == null)
            {
                channel = new cms_channel();
            }

            return channel;
        }

        /// <summary>
        /// 匹配
        /// </summary>
        /// <param name="channelId"></param>
        /// <param name="templateChannelId">栏目模板</param>
        /// <param name="templateContentId">内容模板</param>
        public void SetMatch(int channelId, int templateChannelId, int templateContentId)
        {
            Sqldb.Update<cms_channel>()
                .Set(s => s.channel_template, templateChannelId)
                .Set(s => s.content_template, templateContentId)
                          .Where(s => s.id == channelId).ExecuteAffrows();

        }
        #endregion
    }
}
