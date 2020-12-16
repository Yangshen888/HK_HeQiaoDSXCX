using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class SystemLog
    {
        public Guid SystemLogUuid { get; set; }
        public string UserId { get; set; }
        public int? UserIdtype { get; set; }
        public string UserName { get; set; }
        public DateTime? OperationTime { get; set; }
        public string OperationContent { get; set; }
        public string Ipaddress { get; set; }
        public string Type { get; set; }
        public int IsDelete { get; set; }
        public DateTime AddTime { get; set; }
        public string AddPeople { get; set; }
        public int Id { get; set; }
    }
}
