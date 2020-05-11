using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class ReqQuestionDto
    {
        public string id { get; set;}
        public string question_title { get; set; }
        public string question_content { get; set; }
        public DateTime question_time { get; set; }
    }
}
