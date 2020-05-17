using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Cms;
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
            RequestHelper = service.GetRequiredService<IAtlassReuqestHelper>();
            _templateApp = service.GetRequiredService<CmsTemplateAppService>();
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Form(int id)
        {
            var list = new List<DicKeyDto>();
            list.Add(new DicKeyDto { id =0, name = "请选择模板" });
            list.Add(new DicKeyDto { id =1, name = "首页模板" });
            list.Add(new DicKeyDto { id = 2, name = "栏目模板" });
            list.Add(new DicKeyDto { id = 3, name = "内容模板" });
            list.Add(new DicKeyDto { id = 4, name = "单页模板" });

            var model = _templateApp.GetModel(id);
            ViewBag.TempCategory = new SelectList(list, "id", "name", model.pid);
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
                _templateApp.InsertTemplate(dto);
            }
            else
            {
                dto.edit_id = user.Id;
                dto.edit_time = DateTime.Now;
                _templateApp.UpdateTemplate(dto);
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
            }

            return Success("删除成功");
        }
    }
}