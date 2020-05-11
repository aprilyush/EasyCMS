using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Wx
{
    public class QuestionDetailImagesDto
    {
        public List<string> QuestionImages { get; set; } = new List<string>();
        public List<string> ResponseImages { get; set; } = new List<string>();
        public List<string> ResponseImagesTwo { get; set; } = new List<string>();
    }
}
