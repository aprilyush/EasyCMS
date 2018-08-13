using System;
using System.Collections.Generic;
using System.Text;

namespace Altas.Framework.ViewModels.Common
{
public class ZtreeDto
    {
        public string id { get; set; }
        public string pId { get; set; }
        public string name { get; set; }
        public string text { get; set; }
        public string value { get; set; }
        public bool checkstate { get; set; }
        public bool showcheck { get; set; }
        public bool complete { get; set; }
        public bool isexpand { get; set; }
        public bool hasChildren { get; set; }
        public string img { get; set; }
        public string title { get; set; }
        public int treeLevel { get; set; }
    }
}
