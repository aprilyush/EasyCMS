using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.Models;


namespace Atlass.Framework.ViewModels
{
   public class SysAreaTreeDto:sys_citys
    {
        public List<SysAreaTreeDto> children { get; set; }
    }
}
