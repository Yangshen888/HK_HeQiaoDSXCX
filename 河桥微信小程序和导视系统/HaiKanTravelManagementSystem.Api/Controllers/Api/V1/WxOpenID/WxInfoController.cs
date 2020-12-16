using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.ViewModels.WxOpenID;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.WxOpenID
{
    [Route("api/v1/wxopenid/[controller]/[action]")]
    [ApiController]
    public class WxInfoController : ControllerBase
    {
        /// <summary>
        /// 获取openid
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult GetWechat(WechatModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            var code = "0";
            //model.Appid = "wx0bf342f51437ca67";
            //model.Secret = "b58718e16c0d2736f3959587ccd4f24f";
            //先根据用户请求的uri构造请求地址
            string serviceUrl = "https://api.weixin.qq.com/sns/jscode2session?appid=" + model.Appid + "&secret=" + model.Secret +
                            "&js_code=" + model.Js_code;
            //创建Web访问对象
            HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(serviceUrl);
            //把用户传过来的数据转成“UTF-8”的字节流
            //byte[] buf = System.Text.Encoding.GetEncoding("UTF-8").GetBytes(data);

            myRequest.Method = "POST";
            //myRequest.ContentLength = buf.Length;
            myRequest.ContentType = "application/x-www-form-urlencoded";
            //myRequest.MaximumAutomaticRedirections = 1;
            //myRequest.AllowAutoRedirect = true;
            //发送请求
            Stream stream = myRequest.GetRequestStream();
            //stream.Write(buf, 0, buf.Length);
            stream.Close();

            //获取接口返回值
            //通过Web访问对象获取响应内容
            HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
            //通过响应内容流创建StreamReader对象，因为StreamReader更高级更快
            StreamReader reader = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
            //string returnXml = HttpUtility.UrlDecode(reader.ReadToEnd());//如果有编码问题就用这个方法
            string returnJson = reader.ReadToEnd();//利用StreamReader就可以从响应内容从头读到尾
            code = myResponse.StatusCode.ToString();
            reader.Close();
            myResponse.Close();
            var data = JsonConvert.DeserializeObject<OpenIDModel>(returnJson);
            if (code == "OK" && !string.IsNullOrEmpty(data.Openid))
            {
                response.SetSuccess();
                response.SetData(data);
                return Ok(response);
            }
            else
            {
                response.SetFailed();
                response.SetData(null);
                return Ok(response);
            }

        }
    }
}
