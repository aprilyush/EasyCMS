using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Api
{
    public class UserCenterChartDto
    {
        public string openId { get; set; }
        public bool newQuestion { get; set; } = false;
        public bool newPay { get; set; } = false;
        public bool newComment { get; set; } = false;
        public bool newReply { get; set; } = false;
    }
}
