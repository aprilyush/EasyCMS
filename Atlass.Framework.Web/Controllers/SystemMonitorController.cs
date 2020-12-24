using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Core.Base;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.OS;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Controllers
{
    public class SystemMonitorController : BaseController
    {

        private readonly IMachineInfo _machineInfo;
        public SystemMonitorController()
        {
            if (Runtime.Windows)
            {
                _machineInfo = new WindowsMachineInfo();
            }
            else
            {
                _machineInfo = new LinuxMachineInfo();
            }
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Monitor()
        {
            try
            {

                MemoryMetrics memoryMetrics = _machineInfo.GetMetrics();
                var model = new SystemMonitor();
                model.NetCoreVersion = Environment.Version.ToString();

                //model.ProcessorName = process.ProcessName;
                //model.ProcessStartTime = process.StartTime;
             
                //decimal totalMemory =decimal.Round(WindowsMachineInfo.GetTotalPhysicalMemory() / (1024 * 1024 * 1024),2);
                model.SystemMemory = $"总计：{memoryMetrics.Total}，已使用：{memoryMetrics.Used},空闲：{memoryMetrics.Free}";


                var result = new ResultAdaptDto();
                result.data.Add("model", model);
                result.data.Add("cpu", _machineInfo.GetCPURate());
                result.data.Add("runtime", _machineInfo.GetRunTime());
                return Data(result);
            }
            catch(Exception ex)
            {
                return Error(ex.Message);
            }

        }
    }
}