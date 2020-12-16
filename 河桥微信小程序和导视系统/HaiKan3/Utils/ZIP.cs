using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Haikan3.Utils
{
    public class ZIP
    {
        /// <summary>
        /// 压缩ZIP文件
        /// 支持多文件和多目录，或是多文件和多目录一起压缩
        /// </summary>
        /// <param name="list">待压缩的文件或目录集合</param>
        /// <param name="strZipName">压缩后的文件名</param>
        /// <param name="IsDirStruct">是否按目录结构压缩</param>
        /// <returns>成功：true/失败：false</returns>
        public static bool CompressMulti(List<string> list, string strZipName, bool IsDirStruct)
        {
            try
            {
                using (ZipFile zip = new ZipFile(Encoding.Default))//设置编码，解决压缩文件时中文乱码
                {
                    foreach (string path in list)
                    {
                        string fileName = Path.GetFileName(path);//取目录名称
                        //如果是目录
                        if (Directory.Exists(path))
                        {
                            if (IsDirStruct)//按目录结构压缩
                            {
                                zip.AddDirectory(path, fileName);
                            }
                            else//目录下的文件都压缩到Zip的根目录
                            {
                                zip.AddDirectory(path);
                            }
                        }
                        if (File.Exists(path))//如果是文件
                        {
                            zip.AddFile(path,"");
                        }
                    }
                    //zip.Name = strZipName + ".zip";
                    zip.Save(strZipName + ".zip");//压缩
                    return true;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool ZipFolder(
                    String sourceFilePath,
                    String targetFileFullPath,
                    Boolean isUsePassword,
                    Int32 maxOutputSegmentSiez,
                    out String errMessage)
        {
            try
            {
                using (ZipFile zip = new ZipFile(Encoding.Default))
                {
                    errMessage = String.Empty;
                    zip.Comment = "压缩文件时间" + System.DateTime.Now.ToString("G");
                    zip.Name = Guid.NewGuid().ToString().ToUpper() + ".zip";
                    if (isUsePassword)
                        zip.Password = "123";
                    zip.MaxOutputSegmentSize = maxOutputSegmentSiez * 1000;
                    zip.BufferSize = 1024;
                    zip.CaseSensitiveRetrieval = true;
                    zip.CompressionLevel = Ionic.Zlib.CompressionLevel.BestCompression;
                    zip.AddDirectory(sourceFilePath);
                    zip.Save(targetFileFullPath);
                    return true;
                }
            }
            catch (Exception ex) { errMessage = ex.Message; return false; }
        }


    }
}
