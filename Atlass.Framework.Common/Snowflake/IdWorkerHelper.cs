using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Atlass.Framework.Common.IdHelper;
using Snowflake.Core;

namespace Atlass.Framework.Common
{
    public class IdWorkerHelper
    {
        /// <summary>
        /// snowflake
        /// </summary>
        private static IdWorker worker =null;
        private static readonly object locker = new object();

        //有序guid
        private static SequentialGuidGenerator _generator = null;
        private IdWorkerHelper()
        {
        }

        static IdWorkerHelper()
        {
            if (worker == null)
            {
                worker=new IdWorker(1,1);
            }


            //有序guid
           // _generator.DatabaseType = SequentialGuidGenerator.SequentialGuidDatabaseType.SqlServer;
            //_generator = SequentialGuidGenerator.Instance;
            
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
        
        public static long NewId()
        {
            // return GetInstance().NextId();
            return worker.NextId();
        }
        #endregion
        #region Mongodb ObjectId

        public static string GenObjectId()
        {
            return ObjectId.GenerateNewStringId();
        }

        public static string GenOId()
        {
            return "000000000000000000000000";
        }

        /// <summary>
        /// 24位mongodb的objectid算法
        /// </summary>
        /// <returns></returns>
        public static string GenOopenId()
        {
            return "0000000000000000000000000000";
        }
        #endregion
        #region 有序GUid

        public static Guid GenGuidId()
        {
            return _generator.Create();
        }
        #endregion
    }
}
