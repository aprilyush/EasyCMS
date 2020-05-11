using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class ShareQuestionDto
    {
        public string id { get; set; }
        public string share_title { get; set; }
        public int hit_count { get; set; }
        public string summary { get; set; }
        public DateTime share_time { get; set; }
    }
}
