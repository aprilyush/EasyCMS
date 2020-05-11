using System;
using System.Collections.Generic;
using System.Text;
using CsvHelper.Configuration.Attributes;

namespace Atlass.Framework.ViewModels.Wx
{
public class PayHistoryExportDto
    {
        [Name("商家订单号")]
        public string OrderId { get; set; }
        [Name("打赏人")]
        public string OpenId { get; set; }
        [Name("专家名称")]
        public string Ename { get; set; }
        [Name("打赏金额")]
        public string PayCount { get; set; }
        [Name("打赏时间")]
        public string PayTime { get; set; }
    }
}
