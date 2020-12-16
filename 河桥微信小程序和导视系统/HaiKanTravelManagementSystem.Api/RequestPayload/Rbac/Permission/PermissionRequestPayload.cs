using System;
using HaiKanTravelManagementSystem.Api.Entities.Enums;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.Rbac.Permission
{
    /// <summary>
    /// 
    /// </summary>
    public class PermissionRequestPayload : RequestPayload
    {
        /// <summary>
        /// 是否已被删除
        /// </summary>
        public CommonEnum.IsDeleted IsDeleted { get; set; }
        /// <summary>
        /// 状态
        /// </summary>
        public CommonEnum.Status Status { get; set; }
        /// <summary>
        /// 关联菜单GUID
        /// </summary>
        public Guid? SystemMenuUuid { get; set; }
    }
}
