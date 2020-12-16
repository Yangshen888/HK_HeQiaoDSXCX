using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Bus
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid BusUuid { get; set; }
        public string Name { get; set; }
        public string PassSite { get; set; }
        public string Introduction { get; set; }
        public string Address { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public int? IsDelete { get; set; }
        public string BegainTime { get; set; }
        public string EndTime { get; set; }
        public string BegainSite { get; set; }
        public string EndSite { get; set; }
        public string Type { get; set; }
    }
}
