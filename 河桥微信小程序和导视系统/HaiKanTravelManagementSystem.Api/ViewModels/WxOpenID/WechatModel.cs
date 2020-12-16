using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.WxOpenID
{
    public class WechatModel
    {
        public string Appid { get; set; }
        public string Secret { get; set; }
        public string Js_code { get; set; }
    }
}
