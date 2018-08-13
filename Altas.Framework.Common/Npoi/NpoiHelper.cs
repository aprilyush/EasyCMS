using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace Altas.Framework.Common
{
    public class NpoiHelper
    {
        /// <summary>
        /// 获取保单excel的数据
        /// </summary>
        /// <param name="filepath"></param>
        /// <returns></returns>
        public static DataTable GetExcelDt(string filepath, int startRow)
        {
            DataTable dataTable = null;
            FileStream fs = null;
            IWorkbook workbook = null;
            ISheet sheet = null;
            IRow row = null;
            ICell cell = null;
            try
            {
                fs = File.OpenRead(filepath);
                // 2007版本
                if (filepath.IndexOf(".xlsx") > 0)
                {
                    workbook = new XSSFWorkbook(fs);

                }
                else if (filepath.IndexOf(".xls") > 0)
                {// 2003版本
                    workbook = new HSSFWorkbook(fs);
                }

                if (workbook != null)
                {
                    sheet = workbook.GetSheetAt(0);//读取第一个sheet，当然也可以循环读取每个sheet
                    dataTable = new DataTable();

                    if (sheet != null)
                    {
                        int rowCount = sheet.LastRowNum; //总行数

                        if (rowCount > 0)
                        {
                            int titleIndex = startRow - 1;
                            IRow firstRow = sheet.GetRow(titleIndex); //第一行
                            int cellCount = firstRow.LastCellNum; //列数
                            int firstCellNum = firstRow.FirstCellNum;

                            for (int i = 1; i <= cellCount; i++)
                            {
                                dataTable.Columns.Add(new DataColumn("column" + i));
                            }
                            int contentIndex = titleIndex + 1;
                            //int newRowCount = rowCount - startRowIndex;
                            for (int i = contentIndex; i <= rowCount; i++)
                            {
                                row = sheet.GetRow(i);
                                if (row == null) continue;

                                var dataRow = dataTable.NewRow();

                                for (int j = firstCellNum; j < cellCount; j++)
                                {
                                    cell = row.GetCell(j);
                                    if (cell == null)
                                    {
                                        dataRow[j] = string.Empty;
                                    }
                                    else
                                    {

                                        dataRow[j] = cell.ToString();
                                    }
                                }
                                dataTable.Rows.Add(dataRow);
                            }
                        }
                    }
                }


                fs.Close();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                if (fs != null)
                {
                    fs.Dispose();
                }
            }



            return dataTable;
        }
    }
}
