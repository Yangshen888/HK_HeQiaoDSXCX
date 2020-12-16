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


namespace HaiKan3.Utils
{
    public static class ExcelTools2<T> where T:class
    {
        /// <summary>
        /// 将excel数据转为集合类型
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="stream"></param>
        /// <param name="isFirstRowColumn"></param>
        /// <param name="sheetName"></param>
        /// <param name="exceltype"></param>
        /// <returns></returns>
        public static List<T> ExcelToLit(FileStream stream, bool isFirstRowColumn = true, string sheetName = "Sheet1", int exceltype = 0)
        {
            stream.Position = 0;
            IWorkbook workbook = null;
            ISheet sheet = null;
            int startRow = 0;
            List<T> list = new List<T>();
            Type t = typeof(T);
            Assembly ass = Assembly.GetAssembly(t);//获取泛型的程序集
            PropertyInfo[] pc = t.GetProperties();//获取到泛型所有属性的集合
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
                        //for (int i = firstRow.FirstCellNum; i < cellCount; ++i)
                        //{
                        //    ICell cell = firstRow.GetCell(i);
                        //    if (cell != null)
                        //    {
                        //        string cellValue = cell.StringCellValue;
                        //        if (cellValue != null)
                        //        {
                        //            DataColumn column = new DataColumn(cellValue);
                        //            data.Columns.Add(column);
                        //        }
                        //    }
                        //}
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
                        Object objT = ass.CreateInstance(t.FullName);//泛型实例化
                        IRow row = sheet.GetRow(i);
                        if (row == null) continue; //没有数据的行默认是null　　　　　　　

                        //DataRow dataRow = data.NewRow();
                        for (int j = row.FirstCellNum; j < cellCount; ++j)
                        {
                            //同理，没有数据的单元格都默认是null
                            if (row.GetCell(j) != null)
                            {
                                if (pc[j].PropertyType == typeof(double?))
                                {
                                    if(double.TryParse(row.GetCell(j).NumericCellValue.ToString().Trim(),out double id))
                                    {
                                        pc[j].SetValue((T)objT, id);
                                    }
                                    else
                                    {
                                        pc[j].SetValue((T)objT, (double)0);
                                    }
                                }
                                else
                                {
                                    pc[j].SetValue((T)objT, row.GetCell(j).ToString().Trim());
                                }
                            }
                        }
                        list.Add((T)objT);
                    }
                }

                return list;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return null;
            }
        }
    }
}
