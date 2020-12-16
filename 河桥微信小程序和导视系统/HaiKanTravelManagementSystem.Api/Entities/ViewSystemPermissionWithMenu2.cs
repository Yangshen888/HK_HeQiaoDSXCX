using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class ViewSystemPermissionWithMenu2
    {
        public Guid PermissionCode { get; set; }
        public string PermissionActionCode { get; set; }
        public string PermissionName { get; set; }
        public int? PermissionType { get; set; }
        public string MenuName { get; set; }
        public Guid MenuGuid { get; set; }
        public string MenuAlias { get; set; }
        public int? IsDefaultRouter { get; set; }
        public int? Pd { get; set; }
        public int? Ps { get; set; }
    }
}
