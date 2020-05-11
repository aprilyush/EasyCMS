using Atlass.Framework.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class QuestionDetailInfoDto:expert_question
    {
        public string expertHeader { get; set; }
        public string patient_name { get; set; }
        public int highrisk_day { get; set; }
    }
}
