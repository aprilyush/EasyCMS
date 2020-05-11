using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class EchartsDto
    {
        public List<string> Title { get; set; } = new List<string>();
        public List<string> Xdata { get; set; } = new List<string>();
        public List<EchartsYDto> Ydata { get; set; } = new List<EchartsYDto>();
    }

    public class EchartsYDto
    {
        public string name { get; set; }
        public string type { get; set; } = "line";
        // public string stack { get; set; }
        public int maxnum { get; set; }
        public int yAxisIndex { get; set; }
        public string unitname { get; set; }
        public List<int> data { get; set; } = new List<int>();
    }
}
