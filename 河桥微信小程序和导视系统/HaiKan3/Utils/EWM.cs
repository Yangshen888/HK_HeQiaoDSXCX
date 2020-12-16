
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using System.Drawing.Drawing2D;
using Image = System.Drawing.Image;
using QRCoder;
using Microsoft.AspNetCore.Hosting;
using System.Security.Cryptography;
using System.IO;
using NPOI.SS.Formula.Functions;

namespace Haikan3.Utils
{
    public class EWM
    {
        /// <summary>
        /// 生成带有logo和文字的二维码
        /// </summary>
        /// <param name="text"></param>
        /// <param name="_hostingEnvironment"></param>
        /// <param name="address"></param>
        /// <returns></returns>
        public static string GetEWM2(string text, IHostingEnvironment _hostingEnvironment, string address)
        {
            
            Random r = new Random();
            string webRootPath = _hostingEnvironment.WebRootPath;
            string contentRootPath = _hostingEnvironment.ContentRootPath;
            string enCodeString = text;
            
            Bitmap logo = new Bitmap(webRootPath+ @"\UploadFiles\logo\ewmlogo.jpg");
            QRCodeGenerator generator = new QRCodeGenerator();
            QRCodeData codeData = generator.CreateQrCode(text, QRCodeGenerator.ECCLevel.M, true);
            QRCode qrcode = new QRCode(codeData);
            Bitmap qrImage = qrcode.GetGraphic(7, Color.Black, Color.White,logo,15,6, true);
            var img = InsertWords(qrImage, address);
            //Bitmap qrImage = qrcode.GetGraphic(15, Color.Black, Color.White, true);
            //string filename = DateTime.Now.ToString("yyyyMMddHHmmssfff") + r.Next(1, 100) + ".jpg";
            string filename = text + ".jpg";
            string filepath = webRootPath + @"\UploadFiles\EWM\" + filename;
            img.Save(filepath, System.Drawing.Imaging.ImageFormat.Jpeg);

            return @"\UploadFiles\EWM\" + filename;
        }

        /// <summary>
        /// 二维码附带文字
        /// </summary>
        /// <param name="qrImg"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public static Bitmap InsertWords(Bitmap qrImg, string content = "")
        {
            if (content.Length > 14)
            {
                content = content.Insert((content.Length / 2) - 1, "\n");
            }

            Bitmap backgroudImg = new Bitmap(qrImg.Width + 50, qrImg.Height + 100);
            //backgroudImg.MakeTransparent(Color.White);
            Graphics g2 = Graphics.FromImage(backgroudImg);
            g2.Clear(Color.White);
            //画二维码到新的面板上
            g2.DrawImage(qrImg, 25, 20);

            if (!string.IsNullOrEmpty(content))
            {
                FontFamily fontFamily = new FontFamily("楷体");
                Font font1 = new Font(fontFamily, 15f, FontStyle.Bold, GraphicsUnit.Pixel);

                //文字长度 
                int strWidth = (int)g2.MeasureString(content, font1).Width;
                //总长度减去文字长度的一半  （居中显示）
                int wordStartX = (qrImg.Width + 50 - strWidth) / 2;
                int wordStartY = qrImg.Height + 30;

                g2.DrawString(content, font1, Brushes.Black, wordStartX, wordStartY);
            }

            g2.Dispose();
            return backgroudImg;
        }

        /// <summary>
        /// 微信解密铭感数据
        /// </summary>
        /// <param name="encryptedDataStr">加密数据</param>
        /// <param name="session_key">秘钥</param>
        /// <param name="iv">向量</param>
        /// <returns></returns>
        public static string AES_decrypt(string encryptedDataStr, string session_key, string iv)
        {
            RijndaelManaged rijalg = new RijndaelManaged();
            //-----------------    
            //设置 cipher 格式 AES-128-CBC    

            rijalg.KeySize = 128;

            rijalg.Padding = PaddingMode.PKCS7;
            rijalg.Mode = CipherMode.CBC;

            rijalg.Key = Convert.FromBase64String(session_key);
            rijalg.IV = Convert.FromBase64String(iv);


            byte[] encryptedData = Convert.FromBase64String(encryptedDataStr);
            //解密    
            ICryptoTransform decryptor = rijalg.CreateDecryptor(rijalg.Key, rijalg.IV);

            string result="";

            using (MemoryStream msDecrypt = new MemoryStream(encryptedData))
            {
                using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                {
                    using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                    {

                        result= srDecrypt.ReadToEnd();
                    }
                }
            }

            return result;
        }
    }


    public static class MyServiceProvider
    {
        public static IServiceProvider ServiceProvider
        {
            get; set;
        }
    }
}

