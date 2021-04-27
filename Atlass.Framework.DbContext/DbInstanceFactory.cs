using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.YmlConfigs;
using FreeSql;
using System;

namespace Atlass.Framework.DbContext
{
    public class DbInstanceFactory
    {
        private static IFreeSql _freeSql;
        private static readonly object locker = new object();
        public static DbConfigsDto dbConfig = new DbConfigsDto();
        static DbInstanceFactory()
        {

        }

        public static IFreeSql GetInstance(DataType DataType,string MasterConnetion)
        {
            var freeBuilder = new FreeSqlBuilder()
                         .UseConnectionString(DataType, MasterConnetion)
                          .UseLazyLoading(true)
                           .UseMonitorCommand(
                           executing =>
                           {
                               //执行中打印日志

                               //LoggerHelper.Sql(executing.CommandText);
                               // log.LogInformation(executing.CommandText);
                           });
            //if (freeSql.SlaveConnections?.Count > 0)//判断是否存在从库
            //{
            //    freeBuilder.UseSlave(freeSql.SlaveConnections.Select(x => x.ConnectionString).ToArray());
            //}
            ////我这里禁用了导航属性联级插入的功能
            //freesql.SetDbContextOptions(opt => opt.EnableAddOrUpdateNavigateList = false);
            return freeBuilder.Build();
        }

        public  static IFreeSql GetInstance()
        {
            if (_freeSql == null)
            {
                lock (locker)
                {
                    if (_freeSql == null)
                    {
                        _freeSql =new FreeSqlBuilder()
                        .UseConnectionString(dbConfig.DataType, dbConfig.MasterConnection)
                         .UseLazyLoading(true).Build();
                    }
                }
            }
            return _freeSql;
        }
    }
}
