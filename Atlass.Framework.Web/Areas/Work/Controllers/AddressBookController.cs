using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Core.Base;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Areas.Work.Controllers
{
    public class AddressBookController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
