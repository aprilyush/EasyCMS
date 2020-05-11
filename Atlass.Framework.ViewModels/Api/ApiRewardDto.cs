using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Api
{
    /// <summary>
    /// 打赏列表
    /// </summary>
    public class ApiRewardDto
    {
        public int year { get; set; }
        public string totalMoney { get; set; }

        public int payed { get; set; }
        public List<ApiRewardMonthDto> items { get; set; } = new List<ApiRewardMonthDto>();

    }

    public class ApiRewardMonthDto {
        public string month { get; set; }
        public string totalMoney { get; set; }

        public int payed { get; set; }
    }

}
