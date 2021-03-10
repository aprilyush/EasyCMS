using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels
{
    public class ResultAdaptDto
    {
        public ResultAdaptDto()
        {
            status = true;
            statusCode = 0;
            this.data = new Dictionary<string, object>();
        }

        public bool status { get; set; }
        public int statusCode { get; set; }
        public string msg { get; set; }
        public Dictionary<string, object> data { get; set; }
        public void Add(string key,object val)
        {
            this.data[key] = val;
        }
    }
}
