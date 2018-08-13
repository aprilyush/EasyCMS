using System;
using System.Collections.Generic;
using System.Text;

namespace Altas.Framework.ViewModels.Common
{
    public class DicKeyDto
    {
        public int id { get; set; }
        public string name { get; set; }
        public int pid { get; set; }
    }
    public class DicKeyStrDto
    {
        public string id { get; set; }
        public string name { get; set; }
        public string pid { get; set; }
    }
    public class DicKeyInt64Dto
    {
        public long id { get; set; }
        public string name { get; set; }
        public long pid { get; set; }
    }
}
