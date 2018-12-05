using System;
using System.Collections.Generic;
using System.Text;

namespace Altas.Framework.ViewModels.Common
{
    public class BootstrapGridDto
    {
        public object rows { get; set; }
        public int total { get; set; }
        public int offset { get; set; }
        public int page { get { return (this.offset/limit) + 1; } }
        public int limit { get; set; }
    }

    public class LigerGridDto
    {
        public object Rows { get; set; }
        public int Total { get; set; }
        public int page { get; set; }
        public int pagesize { get; set; }
    }
}
