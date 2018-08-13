using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Altas.Framework.Models
{
    public class ResultAdaptDto
    {
        public ResultAdaptDto()
        {
            statusCode = 200;
            this.data = new Dictionary<string, object>();
        }
        public int statusCode { get; set; }
        public string msg { get; set; }
        public Dictionary<string, object> data { get; set; }
    }
}
