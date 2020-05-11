using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Senparc.NeuChar.Context;
using Senparc.NeuChar.Entities;
using Senparc.Weixin.MP.Entities;
using Senparc.Weixin.MP.Entities.Request;
using Senparc.Weixin.MP.MessageHandlers;
using Atlass.Framework.Web.WeChat;

namespace Atlass.Framework.Web
{
    public class CustomMessageHandler : MessageHandler<CustomMessageContext>
    {
        public CustomMessageHandler(Stream inputStream, PostModel postModel, int maxRecordCount = 10) 
            : base(inputStream, postModel, maxRecordCount)
        {

        }

        public override IResponseMessageBase OnEventRequest(IRequestMessageEventBase requestMessage)
        {
            return base.OnEventRequest(requestMessage);
        }

        public override IResponseMessageBase DefaultResponseMessage(IRequestMessageBase requestMessage)
        {
            var responseMessage = this.CreateResponseMessage<ResponseMessageText>();
            responseMessage.Content = "这条消息来自于DefaultResponseMessage";
            return responseMessage;
        }

        public override IResponseMessageBase OnTextRequest(RequestMessageText requestMessage)
        {
            var responseMessage = base.CreateResponseMessage<ResponseMessageText>();
            //responseMessage.Content = "您的OpenID是：" + responseMessage.FromUserName+".\r\n您发送的文字是："+requestMessage.Content;
            if (requestMessage.Content == "ID")
                responseMessage.Content = "您的OpenID是：" + responseMessage.ToUserName;
            else
            {
                responseMessage.Content = "抱歉，还未开通此功能！";
            }
            //if (requestMessage.Content == "天气")
            //    responseMessage.Content = "抱歉，还未开通此功能！";
            return responseMessage;
        }
    }
}
