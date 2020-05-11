using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.AppService.Consulting;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels.Common;
using CsvHelper;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Areas.Consulting.Controllers
{
    [Area("Consulting")]
    public class PayHistoryController : BaseController
    {
        private readonly PayHistoryAppService _historyApp;

        public PayHistoryController(PayHistoryAppService historyApp,IAtlassReuqestHelper atlassReuqest)
        {
            RequestHelper = atlassReuqest;
            _historyApp = historyApp;
        }
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public ActionResult GetData(BootstrapGridDto dto)
        {
            string stime = RequestHelper.GetQueryString("stime");
            string etime = RequestHelper.GetQueryString("etime");
            var user = RequestHelper.AdminInfo();
            var data = _historyApp.GetData(dto, stime,etime, user);
            return Content(data.ToJson());
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
                var list = _historyApp.GetOutList(stime.ToDate(), etime.ToDate());
                MemoryStream stream = new MemoryStream();
                var writeFile = new StreamWriter(stream);
                var csv = new CsvWriter(writeFile,new System.Globalization.CultureInfo("zh-CN"));
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