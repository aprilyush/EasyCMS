using System;
using System.Collections.Generic;
using System.Text;
using SqlSugar;

namespace Altas.Framework.Core.AltasDbContext
{
    public class MySqlDbContext:IAltasDbContext, IDisposable
    {
        public SqlSugarClient _db;
        ///private static string ConnectionString = String.Empty;
        public SqlSugarClient DbInstance()
        {
            if (_db == null && SugarDbConn.DbConnectStr != null)
            {
                _db = new SqlSugarClient(new ConnectionConfig()
                {
                    ConnectionString = SugarDbConn.DbConnectStr,
                    DbType = DbType.MySql,
                    IsAutoCloseConnection = false,
                    InitKeyType = InitKeyType.Attribute,
                });//获SqlSugarClient对象

            }
            return _db;
        }

        public void Dispose()
        {
            if (_db != null)
            {
                _db.Dispose();
                // LogNHelper.Exception("释放了资源");
            }
        }
    }
}
