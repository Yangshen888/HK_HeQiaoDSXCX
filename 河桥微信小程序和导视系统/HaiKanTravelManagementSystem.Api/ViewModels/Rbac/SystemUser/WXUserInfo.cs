using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemUser
{
    public class WXUserInfo
    {
        public string EncryptedData { get; set; }
        public string NickName { get; set; }
        public string Iv { get; set; }
        public string Session_key { get; set; }
        public string Openid { get; set; }
        public string Phone { get; set; }
        public int Sex { get; set; }
    }
}
