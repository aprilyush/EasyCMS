using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class WxPayDto
    {
        public string appId { get; set; }
        public string timeStamp { get; set; }
        public string nonceStr { get; set; }
        public string package { get; set; }
        public string prepay_id { get; set; }
        public string paySign { get; set; }
    }
}
