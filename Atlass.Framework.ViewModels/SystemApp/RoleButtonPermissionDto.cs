using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels
{
    public class RoleButtonPermissionDto
    {
        public string menuId { get; set; }
        public List<string> buttons { get; set; } = new List<string>();


        public void add(string roleTag)
        {
            buttons.Add(roleTag);
        }
    }
}
