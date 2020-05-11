using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestJob.Jobs
{

    public interface IJob
    {
        void Excute();
    }
    public class TestJob:IJob
    {
        public void Excute()
        {
            Console.WriteLine($"TestJob执行时间：{DateTime.Now}");
        }
    }
}
