
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;

namespace HaiKan3.Utils
{
    public class DingDingHelpers
    {

        //免登必需参数
        private static string appid = "dingoahz7fkurrndybj0my";

        //免登必需参数
        private static string appsecret = "RX448hkJNECAhIlJ1DCwWRz8wv_hTBnYLjEUAMCcfRw8NNVbW7hhyeb_FetN9UJO";

        //其他操作必需参数(例如：通讯录)
        private static string corpid = "dingzmb57bl0xjo3hsmu";

        //其他操作必需参数(例如：通讯录)
        private static string corpsecret = "t6nHlawdDuVhGiU8pDUj_q0VHKFDzOqeq2qvgqdgyLB2TFDCM1nrAEckJYVxkOqh";


        //由corpid和corpsecret获取accessToken
        public static AccessTokenResult GetAccessToken0()
        {
            string url = "https://oapi.dingtalk.com/gettoken?corpid=" + corpid + "&corpsecret=" + corpsecret;

            try
            {
                var response = HttpGet(url);
                var result = JsonConvert.DeserializeObject<AccessTokenResult>(response);
                return result;
            }
            catch (Exception ex)
            {
                //Log.LogMsg("DingDing_GetAccessToken0_Exception", DateTime.Now, ex.Message);
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 获取钉钉开放应用的ACCESS_TOKEN(免登功能使用)
        /// </summary>
        /// <returns></returns>
        public static AccessTokenResult GetAccessToken()
        {
            string url = "https://oapi.dingtalk.com/sns/gettoken?appid=" + appid + "&appsecret=" + appsecret;

            try
            {
                var response = HttpGet(url);
                //Log.LogMsg("DingDing_GetAccessToken", DateTime.Now, response);

                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<AccessTokenResult>(response);
                return result;
            }
            catch (Exception ex)
            {
                //Log.LogMsg("DingDing_GetAccessToken_Exception", DateTime.Now, ex.Message);
                throw new Exception(ex.Message);
            }

        }

        /// <summary>
        /// 获取用户授权的持久授权码(免登功能使用)
        /// </summary>
        /// <param name="accessToken"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public static PersistentCodeResult GetPersistentCode(string accessToken, string code)
        {
            string url = "https://oapi.dingtalk.com/sns/get_persistent_code?access_token=" + accessToken;

            string param = "{ \"tmp_auth_code\": \"" + code + "\"}";

            try
            {
                //Log.LogMsg("进入HttpPost之前", DateTime.Now, "[url:"+url+"]--[param:"+param+"]");
                var response = HttpPost(url, param);
                //var response = PostHttp(url, param, Encoding.GetEncoding("utf-8"));
                //Log.LogMsg("DingDing_GetPersistentCode", DateTime.Now, response);

                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<PersistentCodeResult>(response);
                return result;

            }
            catch (Exception ex)
            {
                //Log.LogMsg("DingDing_GetPersistentCode_Exception", DateTime.Now, ex.Message);
                throw new Exception(ex.Message);
            }

        }

        /// <summary>
        /// 获取用户授权的SNS_TOKEN(免登功能使用)
        /// </summary>
        /// <param name="accessToken"></param>
        /// <param name="openId"></param>
        /// <param name="persistentCode"></param>
        /// <returns></returns>
        public static Sns_tokenResult GetSnsToken(string accessToken, string openId, string persistentCode)
        {

            string url = "https://oapi.dingtalk.com/sns/get_sns_token?access_token=" + accessToken;

            string param = "{\"openid\": \"" + openId + "\",\"persistent_code\": \"" + persistentCode + "\"}";

            try
            {
                var response = HttpPost(url, param);
                //Log.LogMsg("DingDing_GetSnsToken", DateTime.Now, response);

                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<Sns_tokenResult>(response);
                return result;
            }
            catch (Exception ex)
            {
                //Log.LogMsg("DingDing_GetSnsToken_Exception", DateTime.Now, ex.Message);
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// 获取用户授权的个人信息(免登功能使用)
        /// </summary>
        /// <param name="sns_token"></param>
        /// <returns></returns>
        public static UserInfoResult GetUserInfo(string accsess_token, string code)
        {
            string url = "https://oapi.dingtalk.com/user/getuserinfo?access_token=" + accsess_token + "&code=" + code;

            try
            {
                var response = HttpGet(url);
                //Log.LogMsg("DingDing_GetUserInfo", DateTime.Now, response);

                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<UserInfoResult>(response);
                return result;
            }
            catch (Exception ex)
            {
                //Log.LogMsg("DingDing_GetUserInfo_Exception", DateTime.Now, ex.Message);
                throw new Exception(ex.Message);
            }

        }

        /// <summary>
        /// 根据unionid获取userId
        /// </summary>
        /// <param name="accessToken"></param>
        /// <param name="unionid"></param>
        /// <returns></returns>
        public static UserIdResult GetUserIdByUnionId(string unionid)
        {
            var accessToken = GetAccessToken0();

            string url = "https://oapi.dingtalk.com/user/getUseridByUnionid?access_token=" + accessToken.access_token + "&unionid=" + unionid;

            try
            {
                var response = HttpGet(url);
                //Log.LogMsg("DingDing_GetUserId", DateTime.Now, response);

                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<UserIdResult>(response);
                return result;
            }
            catch (Exception ex)
            {
                //Log.LogMsg("DingDing_GetUserId_Exception", DateTime.Now, ex.Message);
                throw new Exception(ex.Message);
            }

        }

        /// <summary>
        /// 获取成员详情
        /// </summary>
        /// <param name="accessToken"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public static UserDetailResult GetUserDetail(string accesstoken, string userid)
        {
            string url = "https://oapi.dingtalk.com/user/get?access_token=" + accesstoken + "&userid=" + userid;

            try
            {
                var response = HttpGet(url);
                //Log.LogMsg("DingDing_GetUserDetail", DateTime.Now, response);

                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<UserDetailResult>(response);
                return result;

            }
            catch (Exception ex)
            {
                //Log.LogMsg("DingDing_GetUserDetail_Exception", DateTime.Now, ex.Message);
                throw new Exception(ex.Message);
            }
        }


        #region 发送请求方法
        /// <summary>
        /// get方式发送请求
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string HttpGet(string url)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "text/html;charset=UTF-8";

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream myResponseStream = response.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));

            string retString = myStreamReader.ReadToEnd();
            myStreamReader.Close();
            myResponseStream.Close();


            return retString;
        }



        public static string HttpPost(string url, string body)
        {
            //ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            Encoding encoding = Encoding.UTF8;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            request.Accept = "text/html, application/xhtml+xml, */*";
            request.ContentType = "application/json";

            byte[] buffer = encoding.GetBytes(body);
            request.ContentLength = buffer.Length;
            request.GetRequestStream().Write(buffer, 0, buffer.Length);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }

        #endregion
    }

    public class AccessTokenResult
    {
        public string access_token { get; set; }
        public int errcode { get; set; }

        public string errmsg { get; set; }
    }


    public class PersistentCodeResult
    {
        public int errcode { get; set; }

        public string errmsg { get; set; }

        public string openid { get; set; }

        public string persistent_code { get; set; }

        public string unionid { get; set; }
    }

    public class Sns_tokenResult
    {
        public int errcode { get; set; }

        public string errmsg { get; set; }

        public int expires_in { get; set; }

        public string sns_token { get; set; }
    }

    public class UserInfoResult
    {
        public int errcode { get; set; }

        public string errmsg { get; set; }

        public string userid { get; set; }
        public string is_sys { get; set; }
        public string sys_level { get; set; }

    }

    public class UserInfo
    {
        public string maskedMobile { get; set; }

        public string nick { get; set; }


        public string openid { get; set; }

        public string unionid { get; set; }
    }

    public class UserIdResult
    {
        public int errcode { get; set; }

        public string errmsg { get; set; }

        public int contactType { get; set; }

        public string userid { get; set; }
    }

    public class UserDetailResult
    {
        public int errcode { get; set; }
        public string unionid { get; set; }
        public string orderInDepts { get; set; }
        public string openId { get; set; }
        public string mobile { get; set; }
        public string errmsg { get; set; }
        public bool active { get; set; }
        public string avatar { get; set; }
        public bool isAdmin { get; set; }
        public string userid { get; set; }
        public bool isHide { get; set; }
        public string isLeaderInDepts { get; set; }
        public bool isBoss { get; set; }
        public bool isSenior { get; set; }
        public string name { get; set; }
        public string stateCode { get; set; }
        public int[] department { get; set; }
        public string email { get; set; }

    }
}
