using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Atlass.Framework.Common;
using Atlass.Framework.Core;
using Atlass.Framework.Core.Base;
using Atlass.Framework.Core.Web;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.OS;
using Microsoft.AspNetCore.Mvc;

namespace Atlass.Framework.Web.Controllers
{
    public class SystemMonitorController : BaseController
    {

        private readonly IMachineInfo _machineInfo;
       
        public SystemMonitorController(IAtlassRequest atlassRequest, IMachineInfo machineInfo)
        {
            RequestHelper = atlassRequest;
            _machineInfo = machineInfo;
        }
        public IActionResult Index()
        {
            SystemMonitor model = new SystemMonitor();
            model.ProcessorCount = Environment.ProcessorCount;
            model.MachineName = $"【用户】{Environment.UserName}【机器】{Environment.MachineName}";
            model.OSDescription = RuntimeInformation.OSDescription;
            model.OSArchitecture = RuntimeInformation.OSArchitecture.ToString();
            model.NetCoreVersion = RuntimeInformation.FrameworkDescription;
            model.LanIp = NetHelper.GetLanIp();
            model.ContentRootPath = GlobalContext.HostingEnvironment.ContentRootPath;
            model.WebRootPath = GlobalContext.HostingEnvironment.WebRootPath;
            //model.ProcessMemory = ((Double)Process.GetCurrentProcess().WorkingSet64 / 1048576).ToString("N2") + " MB";
            model.ProcessStartTime = Process.GetCurrentProcess().StartTime.ToString("yyyy-MM-dd HH:mm:ss");
            model.WorkGC= $"IsServerGC={GCSettings.IsServerGC},LatencyMode={GCSettings.LatencyMode}";
            model.OsRuntime = _machineInfo.GetOSRunTime();
            ViewData.Model = model;
            string webHost= RequestHelper.Request().Headers["Host"];
            model.LanIp=string.Concat(model.LanIp, $"【站点Host】{webHost}");
            var disk = _machineInfo.GetDiskSize();
            if (disk != null)
            {
                ViewData["Disk"] =$"【数量】{disk.DiskCount}【大小】{disk.RAMUsed}/{disk.RAMTotal}【使用率】{disk.UsedRate}";
            }
            else
            {
                ViewData["Disk"] = "";
            }
            
            Tuple<string, string> cpu= _machineInfo.GetCPU();
            if (cpu != null)
            {
                ViewData["CPU"] = cpu.Item1 + "-" + cpu.Item2;
            }
         
            return View();
        }

        [HttpGet]
        public IActionResult Monitor()
        {
            try
            {

                MemoryMetrics memoryMetrics = _machineInfo.GetMetrics();
                //var model = new SystemMonitor();
                //string RAMTotal = "";
                //if(memoryMetrics.RAMTotal> limit)
                //{

                //}


                string ProcessMemory = ((Double)Process.GetCurrentProcess().WorkingSet64 / 1048576).ToString("N2") + " MB";
                var result = new ResultAdaptDto();
                result.data.Add("model", memoryMetrics);
                result.data.Add("cpuRate", _machineInfo.GetCPURate());
                result.data.Add("runtime", _machineInfo.GetOSRunTime());
                result.data.Add("ProcessMemory", ProcessMemory);
                return Json(result);
            }
            catch(Exception ex)
            {
                return Error(ex.Message);
            }

        }


        public IActionResult GetIp()
        {
            //UnicastIPAddressInformation[] nest = NetworkInterface.GetAllNetworkInterfaces()
            //     .Select(p => p.GetIPProperties()).SelectMany(p => p.UnicastAddresses)
            //     .Where(p => p.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork && !System.Net.IPAddress.IsLoopback(p.Address))
            // .ToArray();

            var result = new ResultAdaptDto();
            result.data.Add("nest", "nest");
            return Json(result);
        }
    }
}