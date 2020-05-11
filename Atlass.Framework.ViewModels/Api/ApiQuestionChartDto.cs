using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Api
{
    public class ApiQuestionChartDto
    {
        public int year { get; set; }
        public string questionCount { get; set; }

        public List<ApiQuestionChartMonthDto> items { get; set; } = new List<ApiQuestionChartMonthDto>();
    }
    public class ApiQuestionChartMonthDto
    {
        public string month { get; set; }
        public int questionCount { get; set; }

    }
}
