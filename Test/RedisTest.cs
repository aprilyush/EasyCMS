
using NewLife.Caching;
using NewLife.Log;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class RedisTest
    {
        public static void Test()
        {
            var redisHelper =new FullRedis("127.0.0.1:6379","", 1);
            redisHelper.Log = XTrace.Log;
            Console.WriteLine("共有缓存对象{0}个", redisHelper.Count);
            // 简单操作
            redisHelper.Set("name", "于硕",200);
            Console.WriteLine(redisHelper.Get<string>("name"));
            // 列表
            //var list = redisHelper.GetList<DateTime>("list");
            //list.Add(DateTime.Now);
            //list.Add(DateTime.Now.Date);
            //list.RemoveAt(1);
            //Console.WriteLine(list[list.Count - 1].ToFullString());

            // 字典
            //var dic = redisHelper.GetDictionary<DateTime>("dic");
            //dic.Add("dic", DateTime.Now);
            //dic.Add("dic2", DateTime.Now.AddDays(1));
            //Console.WriteLine(dic["dic"].ToFullString());

            // 队列
            //var mq = redisHelper.GetQueue<String>("queue");
            //mq.Add(new[] { "abc", "g", "e", "m" });
            //var arr = mq.Take(3);
            //Console.WriteLine(arr.Join(","));


            // 集合
            var set = redisHelper.GetSet<String>("181110_1234");
            set.Add("xx1");
            set.Add("xx2");
            set.Add("xx3");
            Console.WriteLine(set.Count);
            Console.WriteLine(set.Contains("xx2"));
        }

        public static void Proformance()
        {
            var redisHelper = new FullRedis("127.0.0.1:6379", "", 2);
            redisHelper.Log = XTrace.Log;
            redisHelper.Bench();
        }
    }
}
