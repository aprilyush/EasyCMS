using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Altas.Framework.ViewModels
{
    public class RoleMenuDto
    {
        public long id { get; set; }
        public string menu_name { get; set; }
        public string menu_url { get; set; }
        public int menu_sort{ get; set; }
        public long parent_id { get; set; }
        public int menu_type { get; set; }
        public string menu_icon { get; set; }
    }
}
