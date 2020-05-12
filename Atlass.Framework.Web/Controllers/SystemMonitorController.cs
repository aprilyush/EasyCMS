using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Common.OS;
using Atlass.Framework.Core.Base;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.OS;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Controllers
{
    public class SystemMonitorController : BaseController
    {
        public IActionResult Monitor()
        {
            try
            {

                var process = Process.GetCurrentProcess();
                var model = new SystemMonitor();
                model.NetCoreVersion = Environment.Version.ToString();
                model.ProcessorName = process.ProcessName;
                model.ProcessStartTime = process.StartTime;
             
                decimal totalMemory =decimal.Round(WindowsMachineInfo.GetTotalPhysicalMemory() / (1024 * 1024 * 1024),2);
                model.SystemMemory = totalMemory.ToString()+"GB";


                var result = new ResultAdaptDto();
                result.data.Add("model", model);
                return Data(result);
            }
            catch(Exception ex)
            {
                return Error(ex.Message);
            }

        }
    }
}