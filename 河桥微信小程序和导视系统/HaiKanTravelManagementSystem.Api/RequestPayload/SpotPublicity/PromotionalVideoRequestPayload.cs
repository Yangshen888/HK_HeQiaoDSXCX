﻿using HaiKanTravelManagementSystem.Api.Entities.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.SpotPublicity
{
    public class PromotionalVideoRequestPayload : RequestPayload
    {
        /// <summary>
        /// 是否已被删除
        /// </summary>
        public CommonEnum.IsDeleted IsDeleted { get; set; }

        ///  /// <summary>
        /// 状态
        /// </summary>
        public int State { get; set; }
    }
}
