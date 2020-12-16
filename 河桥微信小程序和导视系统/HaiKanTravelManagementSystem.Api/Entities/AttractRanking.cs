using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class AttractRanking
    {
        public int Id { get; set; }
        public Guid AttractRankingUuid { get; set; }
        public Guid? UserUuid { get; set; }
        public Guid? SceientUuid { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public string Evaluate { get; set; }
    }
}
