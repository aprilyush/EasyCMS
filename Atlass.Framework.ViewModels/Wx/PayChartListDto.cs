using Atlass.Framework.Models.doctor;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class PayChartListDto:pay_chart
    {
        public string expertName { get; set; }
        public decimal totalFee { get; set; }
        public string yearNumString { get; set; }
    }
}
