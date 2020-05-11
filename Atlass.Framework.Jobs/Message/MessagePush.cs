using Atlass.Framework.Common.NLog;
using Atlass.Framework.Jobs.Data;
using Atlass.Framework.ViewModels;
using Senparc.Weixin.MP.AdvancedAPIs;
using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Atlass.Framework.Jobs.Message
{
    public class MessagePush
    {
        /// <summary>
        /// 咨询成功消息发送
        /// </summary>
        /// <param name="openid">用户openid</param>
        /// <param name="questionid">问题id</param>
        /// <param name="expertName">专家名称</param>
        public static void ConsultingSuccess(string appid, string openid, string questionid, string expertName)
        {
            try
            {

                // var templateId = "SRLy7wVm-Ys8Ru0heIsWS41N6pR5y1ldkpZvv0V7Vrk";
                // var templateId = "V53HRzWJDQ2lhAJpI9B6pGbPqJgZTYZoCDdaKEBBwTM";
                var model = MessageSetData.GetModel();
                string templateId = model.consulting_success;
                var time = DateTime.Now;
                //string first = $"{time.ToString("M月dd日")}\r\n\r\n";
                var msgData = new
                {
                    first = new TemplateDataItem("您咨询的问题已经成功提交，专家将于1小时内回复您的问题。"),
                    keyword1 = new TemplateDataItem(expertName),
                    keyword2 = new TemplateDataItem(time.ToString("yyyy-MM-dd HH:mm")),
                    remark = new TemplateDataItem("请留意公众号专家反馈通知~")
                };
                string url = model.site_host + "/wechat/reply.html?qid=" + questionid+ "&openId="+openid;
                //string key = "{access_token}:wxtoken";
                //var tokenResult = RedisHelper.Get<OAuthAccessTokenResult>(key);
                var result = TemplateApi.SendTemplateMessage(appid, openid, templateId, url, msgData);
                // var json= result.ToJson();
                // LogNHelper.Info(json);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
        }

        /// <summary>
        /// 新诊单消息发送
        /// </summary>
        /// <param name="openid">专家openid</param>
        /// <param name="questionNo">诊单号</param>
        public static void NewQuestion(string appid, string openid, string questionNo, string questionTitle)
        {
            try
            {
                //var templateId = "S2EpZpMWh4vm9ULEGenGPNri-NrtVtJ5CcqzkfyH6SM";
                //var templateId = "Gu4rKoTKdLLX9TdtesxduOUVF8GG5fGZ2gJPiAvMkOQ";
                var model = MessageSetData.GetModel();
                string templateId = model.new_question;
                var time = DateTime.Now;
                // string first = $"{time.ToString("M月dd日")}\r\n\r\n";
                var msgData = new
                {
                    first = new TemplateDataItem("您有一条新的咨询诊单，请于1小时内回复。"),
                    keyword1 = new TemplateDataItem(questionNo),
                    keyword2 = new TemplateDataItem("保密"),
                    keyword3 = new TemplateDataItem(questionTitle),
                    keyword4 = new TemplateDataItem(time.ToString("yyyy-MM-dd HH:mm")),
                    remark = new TemplateDataItem("请及时查看问题并回复，谢谢~")
                };
                //string key = "{access_token}:wxtoken";
                //var tokenResult=RedisHelper.Get<OAuthAccessTokenResult>(key);
                string url = model.site_host + "/wechat/advistoryList.html?openId=" + openid;
                var result = TemplateApi.SendTemplateMessage(appid, openid, templateId, url, msgData);
                //var json = result.ToJson();
                //  LogNHelper.Info(json);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
        }

        /// <summary>
        /// 反馈结果通知
        /// </summary>
        /// <param name="appid"></param>
        /// <param name="openid"></param>
        /// <param name="questionid"></param>
        /// <param name="expertName"></param>
        public static void FeedBack(string appid, string openid, string questionid, string expertName)
        {
            try
            {
                //var templateId = "xIdklpl8end08LLZWTb08llvP15-SevlCf7h-5w-E5M";
                //  var templateId = "HZNVwJrvU2ksFro1K22XimQPumcnC-u3bd3VO0qcgys";
                var model = MessageSetData.GetModel();
                string templateId = model.feed_back;
                var time = DateTime.Now;
                // string first = $"{time.ToString("M月dd日")}\r\n\r\n";
                var msgData = new
                {
                    first = new TemplateDataItem("您咨询的问题已经得到专家的回复。"),
                    keyword1 = new TemplateDataItem(expertName),
                    keyword2 = new TemplateDataItem("岭南伙伴"),
                    keyword3 = new TemplateDataItem(time.ToString("yyyy-MM-dd HH:mm")),
                    keyword4 = new TemplateDataItem("专家已回复"),
                    remark = new TemplateDataItem("请及时查看，谢谢~")
                };
                string url = model.site_host + "/wechat/reply.html?qid=" + questionid + "&openId=" + openid;
                var result = TemplateApi.SendTemplateMessage(appid, openid, templateId, url, msgData);
                //var json = result.ToJson();
                //  LogNHelper.Info(json);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
        }
        /// <summary>
        /// 咨询结束
        /// </summary>
        /// <param name="appid"></param>
        /// <param name="openid"></param>
        /// <param name="questionid"></param>
        /// <param name="expertName"></param>
        public static void End(string appid, string openid, string questionid, string msg)
        {
            try
            {
                // var templateId = "HZNVwJrvU2ksFro1K22XimQPumcnC-u3bd3VO0qcgys";
                // var templateId = "XW3ZCr56TWDaVQKjG_dcRMDqnOWx2ciJGrOlaDSFXgw";
                var model = MessageSetData.GetModel();
                string templateId = model.question_end;
                var time = DateTime.Now;
                // string first = $"{time.ToString("M月dd日")}\r\n\r\n";
                var msgData = new
                {
                    first = new TemplateDataItem(msg),
                    keyword1 = new TemplateDataItem("岭南伙伴"),
                    keyword2 = new TemplateDataItem("岭南伙伴"),
                    keyword3 = new TemplateDataItem(time.ToString("yyyy-MM-dd HH:mm")),
                    keyword4 = new TemplateDataItem("咨询已终止"),
                    remark = new TemplateDataItem("请点击查看问题详情，并对本次咨询进行评分，谢谢~")
                };
                string url = model.site_host + "/wechat/reply.html?qid=" + questionid + "&openId=" + openid;
                var result = TemplateApi.SendTemplateMessage(appid, openid, templateId, url, msgData);
                //var json = result.ToJson();
                //  LogNHelper.Info(json);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
        }

        /// <summary>
        /// 咨询结束
        /// </summary>
        /// <param name="appid"></param>
        /// <param name="openid"></param>
        /// <param name="questionid"></param>
        /// <param name="expertName"></param>
        public static void PayNotice(string appid, string openid, string questionid, int money)
        {
            try
            {
                //var templateId = "63F4TvWfHrfyn0IQzBGH_bLW0PX5OMdWkET70hdntKo";
                // var templateId = "XW3ZCr56TWDaVQKjG_dcRMDqnOWx2ciJGrOlaDSFXgw";
                var model = MessageSetData.GetModel();
                string templateId = model.pay_notice;
                var time = DateTime.Now;
                // string first = $"{time.ToString("M月dd日")}\r\n\r\n";
                string money1 = $"{decimal.Round((decimal)money / 100, 2)}元";
                var msgData = new
                {
                    first = new TemplateDataItem("收到一笔新的打赏"),
                    keyword1 = new TemplateDataItem(money1),
                    keyword2 = new TemplateDataItem(time.ToString("yyyyMMddHHmmss")),
                    keyword3 = new TemplateDataItem("微信支付"),
                    // keyword4 = new TemplateDataItem("岭南伙伴"),
                    remark = new TemplateDataItem("谢谢支持~")
                };
                string url = model.site_host + "/wechat/doctorReply.html?id=" + questionid + "&openId=" + openid;
                var result = TemplateApi.SendTemplateMessage(appid, openid, templateId, url, msgData);
                //var json = result.ToJson();
                //  LogNHelper.Info(json);
            }
            catch (Exception ex)
            {
                LogNHelper.Exception(ex);
            }
        }
    }
}
