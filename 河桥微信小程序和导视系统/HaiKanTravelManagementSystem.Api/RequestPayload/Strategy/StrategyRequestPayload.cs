using HaiKanTravelManagementSystem.Api.Entities.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.Strategy
{
    public class StrategyRequestPayload : RequestPayload
    {
        /// <summary>
        /// 是否已被删除
        /// </summary>
        public CommonEnum.IsDeleted IsDeleted { get; set; }

        ///  /// <summary>
        /// 状态
        /// </summary>
        public int AuditStaues { get; set; }
        public string Kw { get; set; }
        public string Kw1 { get; set; }
        public string Kw2 { get; set; }

        public string Kw3 { get; set; }
    }
}
