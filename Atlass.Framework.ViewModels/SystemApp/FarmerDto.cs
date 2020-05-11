using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels
{
   public class FarmerDto
    {
        public string name { get; set; }
        public long id { get; set; }
        public long county { get; set; }
        public long town { get; set; }
        public long village { get; set; }
        public int identity { get; set; }
        public bool status { get { return identity == 0 ? false : true; }}

    }
}
