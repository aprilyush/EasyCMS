using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class QuestionPushDto
    {
        public bool status { get; set; }
        public string title { get; set; }
        public string patientOpenid { get; set; }
        public string expertName { get; set; }
        public string expertOpenId { get; set; }
        public string id { get; set; }

        public string message { get; set; }
    }
}
