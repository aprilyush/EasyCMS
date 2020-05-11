using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class RedisTestEx
    {
        public static void Test()
        {
            RedisHelper.Initialization(new CSRedis.CSRedisClient($"127.0.0.1:6379,password=,defaultDatabase=1,poolsize=10,ssl=false,writeBuffer=10240"));

            //Console.WriteLine("共有缓存对象{0}个", RedisHelper.);
            // 简单操作
            //redisHelper.Set("name", "于硕", 200);
            //Console.WriteLine(redisHelper.Get<string>("name"));
            // 列表
            RedisHelper.LPush("list", DateTime.Now.ToFullString());
            //var list = redisHelper.GetList<DateTime>("list");
            //list.Add(DateTime.Now);
            //list.Add(DateTime.Now.Date);
            //list.RemoveAt(1);
            //Console.WriteLine(list[list.Count - 1].ToFullString());

            // 字典
            DateTime dt = RedisHelper.HGet<DateTime>("dic", "dic2");
            Console.WriteLine(dt.ToFullString());
            RedisHelper.HSet("dic", "dic3", DateTime.Now.ToFullString());

            // 队列
            //var mq = redisHelper.GetQueue<String>("queue");
            //mq.Add(new[] { "abc", "g", "e", "m" });
            //var arr = mq.Take(3);
            //Console.WriteLine(arr.Join(","));


            // 集合 默认去重 
            //var set = redisHelper.GetSet<String>("181110_1234");
            //set.Add("xx1");
            //set.Add("xx2");
            //set.Add("xx3");
            //Console.WriteLine(set.Count);
            //Console.WriteLine(set.Contains("xx2"));
        }
    }
}
