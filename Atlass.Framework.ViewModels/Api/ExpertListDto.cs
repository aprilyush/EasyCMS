using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Api
{
    public class ExpertListDto
    {
        public string category_name { get; set; }
        public List<ExpertDetailDto> list { get; set; }
    }

}
