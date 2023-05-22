using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Snowflake.Core;
using Yitter.IdGenerator;

namespace Atlass.Framework.Common
{
    public class IdHelper
    {
        /// <summary>
        /// snowflake
        /// </summary>
        private static IdWorker worker =null;
        private static readonly object locker = new object();

        //有序guid
        private static SequentialGuidGenerator _generator = null;
        //new snowflake Yitter.IdGenerator
        private static IIdGenerator _IdGenInstance = null;
        private IdHelper()
        {
        }

        static IdHelper()
        {
            if (worker == null)
            {
                worker=new IdWorker(1,1);
            }


            //有序guid
            // _generator.DatabaseType = SequentialGuidGenerator.SequentialGuidDatabaseType.SqlServer;
            //_generator = SequentialGuidGenerator.Instance;

            //新雪花算法,位数更短
            _IdGenInstance = new DefaultIdGenerator(new IdGeneratorOptions() { WorkerId = 1 });

        }

        #region Snowflake

        /// <summary>
        /// 定义公有方法提供一个全局访问点,同时你也可以定义公有属性来提供全局访问点
        /// </summary>
        /// <returns></returns>
        private static IdWorker GetInstance()
        {
            // 当第一个线程运行到这里时，此时会对locker对象 "加锁"，
            // 当第二个线程运行该方法时，首先检测到locker对象为"加锁"状态，该线程就会挂起等待第一个线程解锁
            // lock语句运行完之后（即线程运行完之后）会对该对象"解锁"
            // 双重锁定只需要一句判断就可以了
            if (worker == null)
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (worker == null)
                    {
                        worker = new IdWorker(1, 1);
                    }
                }
            }
            return worker;
        }

        /// <summary>
        /// 原始雪花算法
        /// </summary>
        /// <returns></returns>
        public static long NewId()
        {
            // return GetInstance().NextId();
            return worker.NextId();
        }

        /// <summary>
        /// 新雪花算法
        /// </summary>
        /// <returns></returns>
        public static long NextId()
        {
            return _IdGenInstance.NewLong();
        }
        #endregion
        #region Mongodb ObjectId
        /// <summary>
        /// 24位MongoDb的objectId算法
        /// </summary>
        /// <returns></returns>
        public static string ObjectId()
        {
            return MongoObjectId.GenerateNewStringId();
        }
        /// <summary>
        ///  24位MongoDb的objectId算法 0
        /// </summary>
        /// <returns></returns>
        public static string GenOId()
        {
            return "0";
        }

        /// <summary>
        /// 28位微信的空openId
        /// </summary>
        /// <returns></returns>
        public static string GenOopenId()
        {
            return "0000000000000000000000000000";
        }
        #endregion
        #region 有序GUid
        /// <summary>
        /// 有序guid
        /// </summary>
        /// <returns></returns>
        public static Guid GenGuidId()
        {
            return _generator.Create();
        }
        #endregion
    }
}
