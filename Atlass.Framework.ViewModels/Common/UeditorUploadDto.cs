using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Common
{
    public class UeditorUploadDto
    {
        public string error { get; set; }
        public string original { get; set; }

        /// <summary>
        /// SUCCESS FAIL
        /// </summary>
        public string state { get; set; } = "SUCCESS";
        public string title { get; set; }
        public string url { get; set; }
    }
}
