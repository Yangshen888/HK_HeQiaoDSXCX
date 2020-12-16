using HaiKanTravelManagementSystem.Api.Entities.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.ArticleManagement
{
    public class articlequestpayload:RequestPayload
    {
        /// <summary>
        /// 是否已被删除
        /// </summary>
        public string IsDeleted { get; set; }
        public int IsRelease { get; set; }
        public string ArticleTypeUUID { get; set; }
    }
}
