using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels
{
    public class CitySelDto
    {
        public CitySelDto()
        {
            Children=new List<CitySelDto>();
        }
        public long Id { get; set; }
        public string Name { get; set; }
        public long ParentId { get; set; }
        public List<CitySelDto> Children { get; set; }
    }
}
