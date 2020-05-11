using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Xml;
using Atlass.Framework.AppService.Api;
using Atlass.Framework.Common;
using Atlass.Framework.Common.NLog;
using Atlass.Framework.Jobs.Message;
using Atlass.Framework.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Senparc.Weixin.Entities;
using Senparc.Weixin.TenPay.V3;

namespace Atlass.Framework.Web.Controllers.WeiXin
{
    public class WxPayController : Controller
    {
        private readonly SenparcWeixinSetting _senparcWeixinSetting;
        private readonly ApiQuestionAppService _questionApp;
        public WxPayController(IOptions<SenparcWeixinSetting> senparcWeixinSetting,
            ApiQuestionAppService questionApp)
        {
            _senparcWeixinSetting = senparcWeixinSetting.Value;
            _questionApp = questionApp;
        }
        /// <summary>
        /// JS-SDK支付回调地址（在统一下单接口中设置notify_url）
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            try
            {
                ResponseHandler resHandler = new ResponseHandler(HttpContext);

                string return_code = resHandler.GetParameter("return_code");
                //string return_msg = res.Element("xml").Element("return_msg").Value;
                resHandler.SetKey(_senparcWeixinSetting.TenPayV3_Key);
                //验证请求是否从微信发过来（安全）
                if (resHandler.IsTenpaySign() && return_code.ToUpper() == "SUCCESS")
                {
                    var resultCode = resHandler.GetParameter("result_code");
                    if (resultCode == "SUCCESS")
                    {

                        var model = new pay_history();
                        model.out_trade_no = resHandler.GetParameter("out_trade_no");
                        model.transaction_id = resHandler.GetParameter("transaction_id");
                        model.openid = resHandler.GetParameter("openid");
                        model.total_fee = resHandler.GetParameter("total_fee").ToInt();
                        model.time_end = resHandler.GetParameter("time_end").ToInt64();
                        model.pay_time = DateTime.ParseExact(model.time_end.ToString(), "yyyyMMddHHmmss", CultureInfo.CurrentCulture);
                        model.device_info = resHandler.GetParameter("device_info");
                        //string json = model.ToJson();
                        //LogNHelper.Info(json);
                       string openid = _questionApp.SavePayHistory(model);

                        //支付打赏
                        if (openid != IdWorkerHelper.GenOId())
                        {
                            Task.Factory.StartNew(() =>
                                MessagePush.PayNotice(_senparcWeixinSetting.WeixinAppId, openid, "", model.total_fee));
                        }

                    }
                }
                //else
                //{
                //   // _userApp.UpdatePayOrder(transaction_id, orderId.ToInt64(), openid);
                //    // res = "wrong";//错误的订单处理
                //}
                string success =
                    $"<xml>< return_code >< ![CDATA[SUCCESS]]></ return_code >< return_msg >< ![CDATA[ok]]></ return_msg ></ xml > ";


                return Content(success, "text/xml");
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
                string err =
                    $"<xml>< return_code >< ![CDATA[FAIL]]></ return_code >< return_msg >< ![CDATA[fuck]]></ return_msg ></ xml > ";
                return Content(err, "text/xml");

            }

            
        }


        public XmlDocument GetWxXmlData()
        {
            XmlDocument xmlDoc = new XmlDocument();
            using (var buffer = new StreamReader(Request.Body))
            {
                xmlDoc.Load(buffer);
            }
            return xmlDoc;
        }
    }
}