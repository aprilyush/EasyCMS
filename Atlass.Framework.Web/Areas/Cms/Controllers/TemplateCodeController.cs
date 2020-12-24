using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Cms;
using Atlass.Framework.Cache;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.Generate;
using Atlass.Framework.Models;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace Atlass.Framework.Web.Areas.Cms.Controllers
{
    [Area("Cms")]
    public class TemplateCodeController : BaseController
    {

        private readonly CmsTemplateAppService _templateApp;
        public TemplateCodeController(IServiceProvider service)
        {
            RequestHelper = service.GetRequiredService<IAtlassRequest>();
            _templateApp = service.GetRequiredService<CmsTemplateAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Form(int id)
        {
            var category =_templateApp.TemplateCategory();
            category.Add(new ZtreeSelIntDto { id =0, name = "请选择模板" });
            var model = _templateApp.GetModel(id);
            ViewBag.TempCategory = new SelectList(category, "id", "name", model.pid);
            ViewData.Model = model;
            return View();
        }

        public IActionResult GetData(BootstrapGridDto dto)
        {
            int pid = RequestHelper.GetQueryInt("pid");
            var data = _templateApp.GetData(dto, pid);
            return Data(data);
        }


        public IActionResult Save(cms_template dto)
        {
            if (dto.pid == 0)
            {
                dto.pid = 1;
            }
            dto.template_mode = dto.pid;
            dto.file_name = dto.file_name ?? "";

            var user = RequestHelper.AdminInfo();
            if (dto.id == 0)
            {
                dto.insert_id = user.Id;
                dto.insert_time = DateTime.Now;
                dto.edit_id= user.Id;
                dto.edit_time = dto.insert_time;
                dto=_templateApp.InsertTemplate(dto);
            }
            else
            {
                dto.edit_id = user.Id;
                dto.edit_time = DateTime.Now;
                dto = _templateApp.UpdateTemplate(dto);
            }
            if (dto != null)
            {
                TemplateManagerCache.AddTemplate(dto);
                RenderDocumentCache.Clear();
            }
            GenerateTemplate.Create(dto.template_mode, dto.template_file, dto.template_content);
            return Success("模板保存成功");
        }

        public IActionResult TemplateCategory()
        {
            var result = new ResultAdaptDto();
            var templates = _templateApp.TemplateCategory();
            result.data.Add("templates", templates);
            return Data(result);
        }

        public IActionResult GetTemplateTree()
        {
            var result = new ResultAdaptDto();
            var templates = _templateApp.TemplateZtree();
            result.data.Add("templates", templates);
            return Data(result);
        }

        [HttpGet]
        public IActionResult DeleteById(int id)
        {
            string templateFile = _templateApp.DeleteById(id);
            if (templateFile != null)
            {
                string filePath = Path.Combine(GlobalParamsDto.WebRoot, templateFile);
                FileUtils.DeleteFileIfExists(filePath);
                RenderDocumentCache.Clear();
            }

            return Success("删除成功");
        }
        /// <summary>
        /// 复制模板
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult CopyFile(int id)
        {
            var template = _templateApp.GetModel(id);
            if (template.id>0)
            {
                string templateFile = template.template_file;
                if (template.template_mode == 1)
                {
                    templateFile = $"Template/{templateFile}";
                }
                else if (template.template_mode ==2)
                {
                    templateFile = $"Template/Channel/{templateFile}";
                }else if (template.template_mode == 3)
                {
                    templateFile = $"Template/Content/{templateFile}";
                }
                else if (template.template_mode == 4)
                {
                    templateFile = $"Template/Single/{templateFile}";
                }
                else if (template.template_mode ==5)
                {
                    templateFile = $"Template/include/{templateFile}";
                }

                string filePath = Path.Combine(GlobalParamsDto.WebRoot, templateFile);
                FileInfo file = new FileInfo(filePath);

                string copyFile = filePath.Replace(file.Name, "副本" + file.Name);
                //Path.Combine(file.DirectoryName, "副本"+ file.Name);
                bool status=FileUtils.CopyFile(filePath, copyFile);
                if (status)
                {
                    template.id = 0;
                    template.template_name = "副本" + template.template_name;
                    template.template_file= template.template_file.Replace(file.Name, "副本" + file.Name);
                    var dto =_templateApp.InsertTemplate(template);
                    if (dto != null)
                    {
                        TemplateManagerCache.AddTemplate(dto);
                    }
                }
            }

            return Success("删除成功");
        }

        /// <summary>
        /// 复制模板
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult SyncTemplate(int id)
        {
            var template = _templateApp.GetModel(id);
            if (template.id > 0)
            {
                string templateFile = template.template_file;
                if (template.template_mode == 1)
                {
                    templateFile = $"Template/{templateFile}";
                }else if(template.template_mode == 2)
                {
                    templateFile = $"Template/Channel/{templateFile}";
                }
                else if (template.template_mode == 3)
                {
                    templateFile = $"Template/Content/{templateFile}";
                }
                else if (template.template_mode == 4)
                {
                    templateFile = $"Template/Single/{templateFile}";
                }
                else if (template.template_mode == 5)
                {
                    templateFile = $"Template/include/{templateFile}";
                }

                string filePath = Path.Combine(GlobalParamsDto.WebRoot, templateFile);
                string newContent=FileUtils.ReadText(filePath);
                if (newContent.IsEmpty())
                {
                    return Error("同步失败");
                }
                template.template_content = newContent;
                var dto = _templateApp.UpdateTemplate(template);
                if (dto != null)
                {
                    TemplateManagerCache.AddTemplate(dto);
                    RenderDocumentCache.Clear();
                }
            }
            return Success("同步成功");
        }
    }
}