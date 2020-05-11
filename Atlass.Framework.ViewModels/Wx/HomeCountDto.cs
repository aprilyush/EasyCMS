using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class HomeChartDto
    {
        public EchartsDto chart { get; set; }
        /// <summary>
        /// 当日咨询数量
        /// </summary>
        public int TodayQuestionCount { get; set; }
        /// <summary>
        /// 当月咨询数量
        /// </summary>
        public int MonthQuestionCount { get; set; }
        public long TotalQuestion { get; set; }
        /// <summary>
        /// 当月打赏总额
        /// </summary>
        public decimal MonthPayCount { get; set; }
    }
}
