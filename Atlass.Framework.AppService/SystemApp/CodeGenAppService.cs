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
            List<code_column> newColumns = new List<code_column>();
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
                    Sqldb.Delete<code_column>().Where(s => s.table_name == table.Name).ExecuteAffrows();
                }
                else
                {
                    exist = new code_table();
                    exist.table_name = table.Name;
                    exist.entity_name = table.Name;
                    exist.db_name = table.Schema;
                    exist.table_type = (int)table.Type;
                    exist.sync_time = DateTime.Now;
                    exist.remark = table.Comment;
                    exist.update_time = exist.sync_time;
                    newTables.Add(exist);
                }


                //列信息
                var columns = table.Columns;
                if (columns.Count > 0)
                {
                    foreach (var col in columns)
                    {
                        code_column colModel = new code_column();
                        colModel.table_name = table.Name;
                        colModel.sort_num = col.Position;
                        colModel.column_name = col.Name;
                        colModel.comment = col.Coment;
                        colModel.can_null = col.IsNullable == true ? 1 : 0;
                        colModel.type_text = col.DbTypeText;
                        colModel.type_text_full = col.DbTypeTextFull;
                        colModel.dbtype = col.DbType;
                        colModel.cstype = col.CsType.Name;
                        colModel.is_identity = col.IsIdentity == true ? 1 : 0;
                        colModel.is_primary = col.IsPrimary == true ? 1 : 0;
                        colModel.sync_time = DateTime.Now;
                        colModel.update_time = colModel.sync_time;
                        colModel.max_length = col.MaxLength;
                        newColumns.Add(colModel);
                    }
                }
            }

            if (newTables.Count > 0)
            {
                Sqldb.Insert(newTables).ExecuteAffrows();
            }
            if (updateTables.Count > 0)
            {
                Sqldb.Update<code_table>().SetSource(updateTables).ExecuteAffrows();
            }
            if (newColumns.Count > 0)
            {
                Sqldb.Insert(newColumns).ExecuteAffrows();
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



        /// <summary>
        /// 获取表的字段信息表格
        /// </summary>
        /// <param name="param"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public DataTableDto GetColumndata(string tableName, string columnName)
        {
            DataTableDto dto = new DataTableDto();
            if (tableName.IsEmpty())
            {
                return dto;
            }
            var query = Sqldb.Select<code_column>()
                .Where(s => s.table_name == tableName)
                .WhereIf(!columnName.IsEmpty(),s=>s.column_name== columnName)
                .OrderBy(s => s.sort_num).ToList();

            dto.rows = query;
            return dto;
        }


        public code_table GetTable(string tableName)
        {
            code_table model = Sqldb.Select<code_table>().Where(s => s.table_name == tableName).First();
            if (model != null)
            {
                model.columns= Sqldb.Select<code_column>()
                .Where(s => s.table_name == tableName)
                .OrderBy(s => s.sort_num).ToList();
            }

            return model;
        }
    }
}
