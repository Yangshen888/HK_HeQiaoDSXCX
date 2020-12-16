using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class SystemRolePermissionMapping
    {
        public Guid SystemRoleUuid { get; set; }
        public Guid SystemPermissionUuid { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
        public int Id { get; set; }
    }
}
