using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace HaikanTeachingProcess
{
    public class YunSendMsg
    {
        /// <summary>
        /// 云mas短信http接入方法
        /// </summary>
        /// <param name="Phone"></param>
        /// <param name="SmsContent"></param>
        /// <returns></returns>
        public static string SendMsg(string Phone, string SmsContent)
        {
            try
            {
                JObject obj = new JObject();
            var ecName = "桐庐县城市管理局";//企业名称
            var apId = "snpcon";//注意：账号 此处不是MAS云网站的用户名，这个要在管理里面新建用户密码，如图下1，
            var secretKey = "supcon#@!";//密码
            var mobiles = Phone;//电话
            var content = SmsContent;//内容
            var sign1 = "4ANOoH1I2";//编码 
            var addSerial = "123";//可以随便写，三位数
            obj.Add("ecName", new JValue(ecName));
            obj.Add("apId", new JValue(apId));
            obj.Add("secretKey", new JValue(secretKey));
            obj.Add("mobiles", new JValue(mobiles));
            obj.Add("content", new JValue(content));
            obj.Add("sign", new JValue(sign1));
            obj.Add("addSerial", new JValue(addSerial));
            string mac = ecName + apId + secretKey + mobiles + content + sign1 + addSerial;
            var mac1 = GenerateMD5(mac);//要进行32位MD5加密
            var length = mac1.Length;
            obj.Add("mAC", new JValue(mac1));
            string paras = obj.ToString();
            var jiami = Base64Code(paras);//传参数前要进行64位加密
            System.Net.WebClient pWebClient = new System.Net.WebClient();
            pWebClient.Headers.Add("Content-Type", "application/json;charset=UTF-8"); //charset=UTF-8
            pWebClient.Headers.Add(HttpRequestHeader.Accept, "*/*");
            pWebClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)");
            byte[] returnBytes = pWebClient.UploadData("http://112.35.1.155:1992/sms/norsubmit", "POST", System.Text.Encoding.UTF8.GetBytes(jiami));
            string result = System.Text.Encoding.UTF8.GetString(returnBytes);
            return result;
            }
            catch (Exception)
            {

                throw;
            }
            //var aa = Base64Decode(result1);
        }

        /// <summary>
        /// md5加密
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string GenerateMD5(string str)
        {
            //就是比string往后一直加要好的优化容器
            StringBuilder sb = new StringBuilder();
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                //将输入字符串转换为字节数组并计算哈希。
                byte[] data = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

                //X为     十六进制 X都是大写 x都为小写
                //2为 每次都是两位数
                //假设有两个数10和26，正常情况十六进制显示0xA、0x1A，这样看起来不整齐，为了好看，可以指定"X2"，这样显示出来就是：0x0A、0x1A。 
                //遍历哈希数据的每个字节
                //并将每个字符串格式化为十六进制字符串。
                int length = data.Length;
                for (int i = 0; i < length; i++)
                    sb.Append(data[i].ToString("X2"));

            }
            return sb.ToString().ToLower();
        }
        /// <summary>
        /// Base64加密 
        /// </summary>
        /// <param name="Message"></param>
        /// <returns></returns>
        public static string Base64Code(string Message)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(Message);//这里要注意不是Default 因为Default默认GB2312
            return Convert.ToBase64String(bytes);
        }
    }
}