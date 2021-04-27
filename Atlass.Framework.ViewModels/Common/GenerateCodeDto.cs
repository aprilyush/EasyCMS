using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels.Common
{
    public class GenerateCodeDto
    {
        public string Controller { get; set; }
        public string Service { get; set; }
        public string Entity { get; set; }
        public string Form { get; set; }
        public string List { get; set; }
    }
}
