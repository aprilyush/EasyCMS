using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.OS
{
    public class SystemMonitor
    {
        public string NetCoreVersion { get; set; }
        public string ProcessorName { get; set; }
        public string SystemMemory { get; set; }
        public string SystemCore { get; set; }
        public DateTime ProcessStartTime { get; set; }
        public string SystemName { get; set; }

    }
}
