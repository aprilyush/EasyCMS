using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Api
{
    public class CommentListDto
    {
        public string id { get; set; }
        public DateTime commentTime { get; set; }
        public string  content { get; set; }
        public string expertName { get; set; }
        public string expertId { get; set; }
        public string expertOpenId { get; set; }
        public string expertTitle { get; set; }
        public string comment { get; set; }
        public int star { get; set; }
        public int isAnonymous { get; set; }
        public string patientOpenId { get; set; }
        public string patientName { get; set; }
    }
}
