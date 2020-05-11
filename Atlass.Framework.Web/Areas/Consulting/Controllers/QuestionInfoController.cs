using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Consulting;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using CsvHelper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using NPOI.SS.Formula.Functions;

namespace Atlass.Framework.Web.Areas.Consulting
{
    /// <summary>
    /// 咨询信息
    /// </summary>
    [Area("Consulting")]
    public class QuestionInfoController : BaseController
    {

        private readonly QuestionInfoAppService _infoApp;

        public QuestionInfoController(QuestionInfoAppService infoApp, IAtlassReuqestHelper reuqestHelper)
        {
            RequestHelper = reuqestHelper;
            _infoApp = infoApp;
        }
        public IActionResult Index()
        {
            var user = RequestHelper.AdminInfo();
            var data = _infoApp.ExpertList(user);
            data.Insert(0, new DicKeyStrDto() { pid = "", name = "请选择" });
            ViewBag.ExpertList = new SelectList(data, "pid", "name");
            return View();
        }


        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GetData(BootstrapGridDto param)
        {
            string id = RequestHelper.GetQueryString("id", "");
            string stime = RequestHelper.GetQueryString("stime", "");
            string etime = RequestHelper.GetQueryString("etime", "");
            var user = RequestHelper.AdminInfo();
            var data = _infoApp.GetData(param, id.Trim(), stime.Trim(), etime.Trim(), user);
            return Content(data.ToJson());
        }

        /// <summary>
        /// 问题详情
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Detail(string id)
        {
            ViewBag.Id = id;
            return View();
        }

        public IActionResult NewDetail(string id)
        {
            ViewBag.Id = id;
            return View();
        }
        [HttpGet]
        public ActionResult GetDetail(string id)
        {
            var model = _infoApp.GetQuestion(id.Trim());
            var imgs = _infoApp.GetImages(id.Trim());
            var patient = _infoApp.GetPatient(model.insert_id);
            var refQuestions = _infoApp.GetRefQuestions(model.id, model.pid);
            var result = new ResultAdaptDto();
            result.data.Add("model", model);
            result.data.Add("imgs", imgs);
            result.data.Add("patient", patient);
            result.data.Add("refQuestions", refQuestions);
            return Content(result.ToJson());
        }

        [HttpPost]
        public ActionResult UpdateAdminRemark(string id,string content)
        {
            if (content.IsEmpty())
            {
                return Error("请输入备注内容");
            }
            _infoApp.UpdateAdminRemark(id, content);
            return Success("备注成功");
        }

        /// <summary>
        /// 导出文件
        /// </summary>
        /// <param name="id"></param>
        /// <param name="stime"></param>
        /// <param name="etime"></param>
        /// <returns></returns>
        public ActionResult OutFile(string id, string stime, string etime)
        {
            try
            {


                //var list=new List<QuestionExport>();
                // var model=new QuestionExport();
                // model.Name = "晨曦器";
                // model.Qtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                // model.Qcontent = "这是我的咨询内容";
                // model.ReplyTime = model.Qtime;
                // model.ReplyContentOne = "回答内容";
                // model.ReplyTimeTwo = model.Qtime;
                // model.ReplyContentTwo = "追答内容";
                // model.RountNum = 1;
                // model.Star = 5;
                // model.PayMoney = 50;
                // model.Openid = "widisajdijsa";
                // list.Add(model);

                var list = _infoApp.GetExportList(id.Trim(), stime.ToDate(), etime.ToDate());
                MemoryStream stream = new MemoryStream();
                var writeFile = new StreamWriter(stream);
                var csv = new CsvWriter(writeFile, new CultureInfo("zh-CN"));
                csv.WriteRecords(list);

                writeFile.Flush();
                stream.Position = 0; //reset stream
                string fileName = IdWorkerHelper.GenObjectId() + ".csv";
                return File(stream, "text/comma-separated-values", fileName);
                //using (var writer = new StreamWriter("D:\\daochu\\file.csv"))
                //using (var csv = new CsvWriter(writer))
                //{
                //    csv.WriteRecords(list);
                //}
            }
            catch (Exception e)
            {
                LogNHelper.Exception(e);
            }
            return Content("文件导出失败");
        }
    }
}