using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altas.Framework.Models;


namespace Altas.Framework.ViewModels
{
   public class SysAreaTreeDto:sys_citys
    {
        public List<SysAreaTreeDto> children { get; set; }
    }
}
