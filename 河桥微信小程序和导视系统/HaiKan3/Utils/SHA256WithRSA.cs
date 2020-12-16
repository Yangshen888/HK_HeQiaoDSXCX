using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using NPOI.OpenXmlFormats;

namespace Haikan3.Utils
{
    public class SHA256WithRSA
    {
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="dataStr">配置json</param>
        ///// <param name="keyFile">证书路径</param>
        ///// <param name="password">证书密码</param>
        ///// <returns></returns>
        //public static string Sha256Sign(string dataStr, string keyFile, string password)
        //{
        //    using (RSACryptoServiceProvider sha256 = new RSACryptoServiceProvider())
        //    {
        //        var privateKey = GetPrivateKey(keyFile, password);  //获取私钥
        //        byte[] dataInBytes = Encoding.Default.GetBytes(dataStr);
        //        sha256.FromXmlString(privateKey);
        //        byte[] inArray = sha256.SignData(dataInBytes, CryptoConfig.MapNameToOID("SHA256"));
        //        string sign = Convert.ToBase64String(inArray);
        //        return sign;
        //    }
        //}




        /// <summary>
        /// 签名
        /// </summary>
        /// <param name="str">需签名的数据</param>
        /// <param name="privateKey">私钥</param>
        /// <param name="encoding">编码格式 默认utf-8</param>
        /// <returns></returns>
        public static string Signature(string str, string privateKey, string encoding = "UTF-8")
        {
            byte[] bt = Encoding.GetEncoding(encoding).GetBytes(str);
            RSA_PEM pem = RSA_PEM.FromPEM(privateKey);
            using (RSACryptoServiceProvider provider = pem.GetRSA())
            {
                byte[] inArray = provider.SignData(bt, CryptoConfig.MapNameToOID("SHA256"));
                string sign = Convert.ToBase64String(inArray);
                return sign;
            }


        }

        /// <summary>
        /// 验签
        /// </summary>
        /// <param name="data">签名前的数据</param>
        /// <param name="publickey">公钥</param>
        /// <param name="sign">签名</param>
        /// <param name="encoding"></param>
        /// <returns></returns>
        public static bool rsaCheck(string data,string publickey, string sign, string encoding = "UTF-8")
        {
            byte[] bt = Encoding.GetEncoding(encoding).GetBytes(data);
            byte[] bt2 = Convert.FromBase64String(sign);
            RSA_PEM pem = RSA_PEM.FromPEM(publickey);
            using (RSACryptoServiceProvider provider = pem.GetRSA())
            {
                return provider.VerifyData(bt, CryptoConfig.MapNameToOID("SHA256"),bt2);
                
            }
        }

        /// <summary>
        /// 把参数按照ASCII码递增排序，如果遇到相同字符则按照第二个字符的键值ASCII码递增排序,将排序后的参数与其对应值，组合成“参数=参数值”的格式，并且把这些参数用&字符连接起来
        /// </summary>
        /// <param name="dic"></param>
        /// <returns></returns>
        public static string getSignContent(Dictionary<string,string> dic)
        {
            string[] sign_param = dic["sign_param"].Split(',');
            List<string> keys = new List<string>();
            keys.AddRange(sign_param);
            keys.Sort();
            StringBuilder builder = new StringBuilder();
            for(int i=0;i<keys.Count;i++)
            {
                string value = dic[keys[i]];
                if (!string.IsNullOrEmpty(keys[i]) && !string.IsNullOrEmpty(value))
                {
                    builder.Append(i==0?"":"&").Append(keys[i]).Append("=").Append(value);
                }
            }


            return builder.ToString();
        }




    }
}
