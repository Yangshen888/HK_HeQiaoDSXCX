using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Text;

namespace Haikan3.Utils
{
    public static class ExcelTools
    {
        #region NPOI保存数据到excel
        /// <summary>
                /// 导出数据到excel中
                /// </summary>
                /// <param name="dataSet"></param>
                /// <param name="filename"></param>
                /// <returns></returns>
        public static bool TablesToExcel(DataSet dataSet, string filename)
        {
            MemoryStream ms = new MemoryStream();
            using (dataSet)
            {
                IWorkbook workBook;
                //IWorkbook workBook=WorkbookFactory.Create(filename);
                string suffix = filename.Substring(filename.LastIndexOf(".") + 1, filename.Length - filename.LastIndexOf(".") - 1);
                if (suffix == "xls")
                {
                    workBook = new HSSFWorkbook();
                }
                else
                    workBook = new XSSFWorkbook();
                for (int i = 0; i < dataSet.Tables.Count; i++)
                {
                    ISheet sheet = workBook.CreateSheet(dataSet.Tables[i].TableName);
                    CreatSheet(sheet, dataSet.Tables[i]);
                }
                workBook.Write(ms);
                try
                {
                    SaveToFile(ms, filename);
                    ms.Flush();
                    return true;
                }
                catch
                {
                    ms.Flush();
                    throw;
                }
            }
        }
        private static void CreatSheet(ISheet sheet, DataTable table)
        {
            IRow headerRow = sheet.CreateRow(0);
            //表头
            foreach (DataColumn column in table.Columns)
                headerRow.CreateCell(column.Ordinal).SetCellValue(column.Caption);//If Caption not set, returns the ColumnName value
            int rowIndex = 1;
            foreach (DataRow row in table.Rows)
            {
                IRow dataRow = sheet.CreateRow(rowIndex);
                foreach (DataColumn column in table.Columns)
                {
                    dataRow.CreateCell(column.Ordinal).SetCellValue(row[column].ToString());
                }
                rowIndex++;
            }
        }
        private static void SaveToFile(MemoryStream ms, string fileName)
        {
            using (FileStream fs = new FileStream(fileName, FileMode.Create, FileAccess.Write))
            {
                byte[] data = ms.ToArray();         //转为字节数组 
                fs.Write(data, 0, data.Length);     //保存为Excel文件
                fs.Flush();
                data = null;
            }
        }
        #endregion
        #region NPOI将excel中的数据导入到DataTable(有问题)
        /// <summary>
        /// 将excel中的数据导入到DataTable中
        /// </summary>
        /// <param name="sheetName">excel工作薄sheet的名称</param>
        /// <param name="isFirstRowColumn">第一行是否是DataTable的列名</param>
        /// <returns>返回的DataTable</returns>
        //public static DataTable ExcelToDataTable(string fileName, string sheetName, bool isFirstRowColumn = true)
        //{
        //    DataTable data = new DataTable();
        //    try
        //    {
        //        IWorkbook workbook = null;  //新建IWorkbook对象
        //        var fileStream = new FileStream(fileName, FileMode.Open, FileAccess.Read);
        //        string suffix = fileName.Substring(fileName.LastIndexOf(".") + 1, fileName.Length - fileName.LastIndexOf(".") - 1);
        //        if (suffix == "xls")    //if (fileName.IndexOf(".xls") > 0) // 2003版本
        //        {
        //            workbook = new HSSFWorkbook(fileStream);  //xlsx数据读入workbook
        //        }
        //        else
        //        {
        //            workbook = new XSSFWorkbook(fileStream);  //xls数据读入workbook
        //        }
        //        var sheet = (sheetName != null) ? workbook.GetSheet(sheetName) : workbook.GetSheetAt(0);//获取sheet
        //        if (sheet != null)
        //            SheetToDataTable(sheet, isFirstRowColumn, ref data);
        //        else
        //            data = null;
        //        return data;
        //    }
        //    catch (Exception ex)
        //    {
        //        Debug.WriteLine("ExcelToDataTable Exception: " + ex.Message);
        //        return null;
        //    }

        //}
        /// <summary>
        /// 将Excel中的工作薄转换为DataTable
        /// </summary>
        /// <param name="sheet">Excel中的工作薄</param>
        /// <param name="isFirstRowColumn">第一行是否是DataTable的列名</param>
        /// <param name="data">表</param>
        //private static void SheetToDataTable(ISheet sheet, bool isFirstRowColumn, ref DataTable data)
        //{
        //    int rowCount = sheet.LastRowNum;    //最后一列的标号
        //    IRow firstRow = sheet.GetRow(sheet.FirstRowNum);
        //    int cellCount = firstRow.LastCellNum; //一行最后一个cell的编号 即总的列数
        //    int startRow = 0;
        //    if (isFirstRowColumn)
        //    {
        //        for (int i = firstRow.FirstCellNum; i < cellCount; ++i)
        //        {
        //            if (firstRow.GetCell(i) == null) continue;
        //            //DataColumn column = new DataColumn(firstRow.GetCell(i).StringCellValue);
        //            DataColumn column = new DataColumn(firstRow.GetCell(i).ToString());
        //            data.Columns.Add(column);
        //        }
        //        startRow = sheet.FirstRowNum + 1;
        //    }
        //    else
        //    {
        //        startRow = sheet.FirstRowNum;
        //    }
        //    for (int i = startRow; i <= rowCount; ++i)
        //    {
        //        IRow row = sheet.GetRow(i);
        //        if (row == null) continue;      //没有数据的行为null　　　　　　　
        //        DataRow dataRow = data.NewRow();
        //        for (int j = row.FirstCellNum; j < cellCount; ++j)              
        //        {
        //            if (row.GetCell(j) != null) //没有数据的单元格也为null
        //                dataRow[j - row.FirstCellNum] = row.GetCell(j).ToString();//一般情况下row.FirstCellNum为0，但有时excel中的数据并不在A列，所以需减去，否则将导致溢出，出现异常。
        //        }
        //        data.Rows.Add(dataRow);
        //    }
        //}
        #endregion
        #region NPOI将excel中的数据导入到DataTable
        /// <summary>
        /// 将excel中的数据导入到DataTable中
        /// </summary>
        /// <param name="fileName">excel的路径</param>
        /// <param name="sheetName">excel工作薄sheet的名称</param>
        /// <param name="isFirstRowColumn">第一行是否是DataTable的列名</param>
        /// <returns>返回的DataTable</returns>
        public static DataTable ExcelToDataTable(string fileName, string sheetName, bool isFirstRowColumn)
        {
            IWorkbook workbook = null;
            FileStream fs = null;
            ISheet sheet = null;
            DataTable data = new DataTable();
            int startRow = 0;
            try
            {
                fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);
                if (fileName.IndexOf(".xlsx") > 0) // 2007版本
                    workbook = new XSSFWorkbook(fs);
                else if (fileName.IndexOf(".xls") > 0) // 2003版本
                    workbook = new HSSFWorkbook(fs);

                if (sheetName != null)
                {
                    sheet = workbook.GetSheet(sheetName);
                    if (sheet == null) //如果没有找到指定的sheetName对应的sheet，则尝试获取第一个sheet
                    {
                        sheet = workbook.GetSheetAt(0);
                    }
                }
                else
                {
                    sheet = workbook.GetSheetAt(0);
                }
                if (sheet != null)
                {
                    IRow firstRow = sheet.GetRow(0);
                    int cellCount = firstRow.LastCellNum; //一行最后一个cell的编号 即总的列数

                    if (isFirstRowColumn)
                    {
                        for (int i = firstRow.FirstCellNum; i < cellCount; ++i)
                        {
                            ICell cell = firstRow.GetCell(i);
                            if (cell != null)
                            {
                                string cellValue = cell.StringCellValue;
                                if (cellValue != null)
                                {
                                    DataColumn column = new DataColumn(cellValue);
                                    data.Columns.Add(column);
                                }
                            }
                        }
                        startRow = sheet.FirstRowNum + 1;
                    }
                    else
                    {
                        startRow = sheet.FirstRowNum;
                    }

                    //最后一列的标号
                    int rowCount = sheet.LastRowNum;
                    for (int i = startRow; i <= rowCount; ++i)
                    {
                        IRow row = sheet.GetRow(i);
                        if (row == null) continue; //没有数据的行默认是null　　　　　　　

                        DataRow dataRow = data.NewRow();
                        for (int j = row.FirstCellNum; j < cellCount; ++j)
                        {
                            if (row.GetCell(j) != null) //同理，没有数据的单元格都默认是null
                                dataRow[j] = row.GetCell(j).ToString();
                        }
                        data.Rows.Add(dataRow);
                    }
                }

                return data;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return null;
            }
        }
        #endregion



        #region NPOI将excel中的数据导入到DataTable(已在文件流中)
        /// <summary>
        /// NPOI将excel中的数据导入到DataTable(已在文件流中)
        /// </summary>
        /// <param name="stream">文件流</param>
        /// <param name="sheetName">工作表名</param>
        /// <param name="isFirstRowColumn">第一行是否是DataTable的列名</param>
        /// <param name="exceltype">.xlsx为0   .xls为1</param>
        /// <returns></returns>
        public static DataTable ExcelToDataTable(FileStream stream, bool isFirstRowColumn = true, string sheetName = "Sheet1", int exceltype = 0)
        {
            IWorkbook workbook = null;
            ISheet sheet = null;
            DataTable data = new DataTable();
            int startRow = 0;
            try
            {
                //fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);
                if (exceltype == 0) // 2007版本
                    workbook = new XSSFWorkbook(stream);
                else if (exceltype == 1) // 2003版本
                    workbook = new HSSFWorkbook(stream);

                if (sheetName != null)
                {
                    sheet = workbook.GetSheet(sheetName);
                    if (sheet == null) //如果没有找到指定的sheetName对应的sheet，则尝试获取第一个sheet
                    {
                        sheet = workbook.GetSheetAt(0);
                    }
                }
                else
                {
                    sheet = workbook.GetSheetAt(0);
                }
                if (sheet != null)
                {
                    IRow firstRow = sheet.GetRow(0);
                    int cellCount = firstRow.LastCellNum; //一行最后一个cell的编号 即总的列数

                    if (isFirstRowColumn)
                    {
                        for (int i = firstRow.FirstCellNum; i < cellCount; ++i)
                        {
                            ICell cell = firstRow.GetCell(i);
                            if (cell != null)
                            {
                                string cellValue = cell.StringCellValue;
                                if (cellValue != null)
                                {
                                    DataColumn column = new DataColumn(cellValue);
                                    data.Columns.Add(column);
                                }
                            }
                        }
                        startRow = sheet.FirstRowNum + 1;
                    }
                    else
                    {
                        startRow = sheet.FirstRowNum;
                    }

                    //最后一列的标号
                    int rowCount = sheet.LastRowNum;
                    for (int i = startRow; i <= rowCount; ++i)
                    {
                        IRow row = sheet.GetRow(i);
                        if (row == null) continue; //没有数据的行默认是null　　　　　　　

                        DataRow dataRow = data.NewRow();
                        for (int j = row.FirstCellNum; j < cellCount; ++j)
                        {
                            if (row.GetCell(j) != null) //同理，没有数据的单元格都默认是null
                                dataRow[j] = row.GetCell(j).ToString();
                        }
                        data.Rows.Add(dataRow);
                    }
                }

                return data;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return null;
            }
        }
        #endregion

       
    }
}
