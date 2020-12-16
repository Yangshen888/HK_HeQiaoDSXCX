using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using NPOI.SS.Formula.Functions;

namespace Haikan3.Utils
{
    public class ToHttp<T>
    {
        /// <summary>
        /// 发起httpget请求
        /// </summary>
        /// <param name="url"></param>
        /// <param name="contentType"></param>
        /// <returns></returns>
        public static async Task<T> ToGet(string url, string contentType = "application/json;charset=UTF-8")
        {
            HttpClient client = new HttpClient();

            var response = await client.GetAsync(url);
            string result = "";
            if (response.IsSuccessStatusCode)
            {
                Stream stream = response.Content.ReadAsStreamAsync().Result;
                StreamReader reader = new StreamReader(stream, Encoding.GetEncoding("utf-8"));
                result = reader.ReadToEnd();
                reader.Close();
                stream.Close();
                var data = JsonConvert.DeserializeObject<T>(result);
                return data;
            }
            else
            {
                return default;
            }



        }

        /// <summary>
        /// 发起httppost请求
        /// </summary>
        /// <param name="url"></param>
        /// <param name="postData"></param>
        /// <param name="contentType"></param>
        /// <returns></returns>
        public static async Task<T> ToPost(string url, string postData, string contentType = "application/json;charset=UTF-8")
        {
            HttpClient client = new HttpClient();

            var bdata = Encoding.UTF8.GetBytes(postData);
            Stream dataStream = new MemoryStream(bdata);
            HttpContent content = new StreamContent(dataStream);

            content.Headers.Add("Content-Type", contentType);

            var response = await client.PostAsync(url, content);
            content.Dispose();
            dataStream.Close();
            string result = "";
            if (response.IsSuccessStatusCode)
            {
                Stream stream = response.Content.ReadAsStreamAsync().Result;
                StreamReader reader = new StreamReader(stream, Encoding.GetEncoding("utf-8"));
                result = reader.ReadToEnd();

                var data = JsonConvert.DeserializeObject<T>(result);


                reader.Close();
                stream.Close();

                return data;
            }
            else
            {
                return default;
            }
        }
    }
}
