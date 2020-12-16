using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class ViewMenu
    {
        public Guid SystemMenuUuid { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public string Alias { get; set; }
        public string Icon { get; set; }
        public Guid? ParentGuid { get; set; }
        public string ParentName { get; set; }
        public int? Level { get; set; }
        public string Description { get; set; }
        public int? Sort { get; set; }
        public int? Status { get; set; }
        public int? IsDeleted { get; set; }
        public int? IsDefaultRouter { get; set; }
        public string CreatedOn { get; set; }
        public Guid? CreatedByUserGuid { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedOn { get; set; }
        public Guid? ModifiedByUserGuid { get; set; }
        public string ModifiedByUserName { get; set; }
        public string Component { get; set; }
        public int? HideInMenu { get; set; }
        public int? NotCache { get; set; }
        public string BeforeCloseFun { get; set; }
        public int? Pt { get; set; }
        public int? Ps { get; set; }
        public int? Pd { get; set; }
        public Guid SystemRoleUuid { get; set; }
    }
}
