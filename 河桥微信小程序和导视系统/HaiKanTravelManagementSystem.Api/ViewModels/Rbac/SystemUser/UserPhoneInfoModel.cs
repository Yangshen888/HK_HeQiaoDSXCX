using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemUser
{
    public class UserPhoneInfoModel
    {
        /// <summary>
        /// 
        /// </summary>
        public string phoneNumber { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string purePhoneNumber { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string countryCode { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Watermark watermark { get; set; }
    }

    public class Watermark
    {
        /// <summary>
        /// 
        /// </summary>
        public int timestamp { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string appid { get; set; }
    }

    
}
