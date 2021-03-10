using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Common
{
    public class BootstrapGridDto
    {
        public object rows { get; set; }
        public long total { get; set; }
        public int offset { get; set; }
        public int page { get { return this.pageNumber; } }
        public int limit { get { return this.pageSize; } }
        public int pageNumber { get; set; }
        public int pageSize { get; set; }
    }

    public class LigerGridDto
    {
        public object Rows { get; set; }
        public int Total { get; set; }
        public int page { get; set; }
        public int pagesize { get; set; }
    }
}
