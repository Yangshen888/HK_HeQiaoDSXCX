using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Strategy
    {
        public Guid StrategyUuid { get; set; }
        public int Id { get; set; }
        public int? Isdelete { get; set; }
        public string Staues { get; set; }
        public Guid? SystemUserUuid { get; set; }
        public string Title { get; set; }
        public string StrategyContent { get; set; }
        public string PhotoUrl { get; set; }
        public string AddPeople { get; set; }
        public string AddTime { get; set; }
        public int? AuditStaues { get; set; }
        public int? ThroughStaues { get; set; }
        public int? TipsType { get; set; }
        public int? Count { get; set; }
        public string Ytype { get; set; }
        public string PlayType { get; set; }
    }
}
