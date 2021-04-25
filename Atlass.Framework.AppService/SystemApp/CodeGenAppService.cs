using Atlass.Framework.Common;
using Atlass.Framework.Models.Admin;
using Atlass.Framework.ViewModels.Common;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.AppService.SystemApp
{
    public class CodeGenAppService
    {
        private readonly IFreeSql Sqldb;
        public CodeGenAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        /// <summary>
        /// 获取表格
        /// </summary>
        /// <param name="param"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public DataTableDto GetList(DataTableDto param,string tableName)
        {

            var query = Sqldb.Select<code_table>()

                .WhereIf(!string.IsNullOrEmpty(tableName), s => s.table_name == tableName)
                .OrderByDescending(s => s.update_time)
                .Count(out long total)
                .Page(param.page, param.limit).ToList();
            param.total = total;
            param.rows = query;
            return param;
        }


        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="dto"></param>
        public void SyncAll()
        {

            string conn = Sqldb.Ado.ConnectionString;
            string dbName = CommHelper.GetDataBaseName(conn);
            if (dbName.IsEmpty())
            {
                return;
            }
            var tables = Sqldb.DbFirst.GetTablesByDatabase(dbName);
            if (tables.Count == 0)
            {
                return;
            }
            List<code_table> newTables = new List<code_table>();
            List<code_table> updateTables = new List<code_table>();
            foreach (var table in tables)
            {
                var exist = Sqldb.Select<code_table>().Where(s => s.table_name == table.Name).First();
                if (exist!=null)
                {
                    exist.db_name = table.Schema;
                    exist.table_type = (int)table.Type;
                    exist.update_time = DateTime.Now;
                    exist.remark = table.Comment;
                    updateTables.Add(exist);
                    continue;
                }
                exist = new code_table();
                exist.table_name = table.Name;
                exist.entity_name = table.Name;
                exist.db_name= table.Schema;
                exist.table_type = (int)table.Type;
                exist.sync_time = DateTime.Now;
                exist.remark = table.Comment;
                exist.update_time = exist.sync_time;
                newTables.Add(exist);
            }

            if (newTables.Count > 0)
            {
                Sqldb.Insert(newTables).ExecuteAffrows();
            }
            if (updateTables.Count > 0)
            {
                Sqldb.Update<code_table>().SetSource(updateTables).ExecuteAffrows();
            }
        }


        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="ids"></param>
        public void RemoveAll(string ids)
        {
            var idsArray = ids.SplitToArrayInt();
            Sqldb.Delete<code_table>().Where(s => idsArray.Contains(s.id)).ExecuteAffrows();
        }
    }
}
