using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class WxPayBackDto
    {
        public string appid { get; set; }
        public string mch_id { get; set; }
        public string device_info { get; set; }
        public string is_subscribe { get; set; }
        public string openid { get; set; }
        public string trade_type { get; set; }
        public string transaction_id { get; set; }
        public string out_trade_no { get; set; }
        public string time_end { get; set; }
        public int total_fee { get; set; }
    }
}
