using NewLife.Caching;
using NewLife.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestJob;
using TestJob.Jobs;

namespace Test
{
    class Program
    {
        static void Main(string[] args)
        {
            try {
                XTrace.UseConsole();
                // FullRedis.Register();

                //RedisTest.Test();
                //RedisTest.Proformance();
                RedisTestEx.Test();
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
          
            Console.ReadKey();
        }


        static void JobTest()
        {
            IJob job1 = ReflectionHelper.Instance<IJob>("TestJob.Jobs", "TestJob");

            job1.Excute();
        }
    }
}
