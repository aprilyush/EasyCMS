using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public interface IJob
    {
        void Excute();
    }
    public class TestJob: IJob
    {
        public void Excute()
        {
            Console.WriteLine($"TestJob执行时间：{DateTime.Now}");
        }
    }
    public class TestJob2 : IJob
    {
        public void Excute()
        {
            Console.WriteLine($"TestJob2执行时间：{DateTime.Now}");
        }
    }
}
