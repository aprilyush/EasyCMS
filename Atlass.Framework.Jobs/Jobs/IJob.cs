using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Jobs
{
    public interface IJob
    {
        public void Excute(string wxAppId, string taskId);
    }
}
