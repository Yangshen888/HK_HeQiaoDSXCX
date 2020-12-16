using System;
using HaiKanTravelManagementSystem.Api.Entities.Enums;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemPermission
{
    /// <summary>
    /// 权限实体类
    /// </summary>
    public class PermissionJsonModel
    {
        public Guid SystemPermissionUuid { get; set; }
        public Guid? SystemMenuUuid { get; set; }
        /// <summary>
        /// 菜单名称
        /// </summary>
        public string MenuName { get; set; }
        public string Name { get; set; }
        public string ActionCode { get; set; }
        public string Icon { get; set; }
        public string Description { get; set; }
        public int? Status { get; set; }
        public int? IsDeleted { get; set; }
        public int? Type { get; set; }
        public Guid? CreatedByUserGuid { get; set; }
        public string CreatedOn { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedOn { get; set; }
        public Guid? ModifiedByUserGuid { get; set; }
        public string ModifiedByUserName { get; set; }
        public string CaPower { get; set; }
        /// <summary>
        /// 权限类型的显示文本
        /// </summary>
        public string PermissionTypeText { get; set; }
    }
}
