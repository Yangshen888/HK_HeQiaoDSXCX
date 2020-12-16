using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Attractions
    {
        public int Id { get; set; }
        public Guid AttractionsUuid { get; set; }
        public Guid? UserUuid { get; set; }
        public Guid? SceientUuid { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public string Evaluate { get; set; }
        public string AddTime { get; set; }
        public int? Praise { get; set; }
    }
}
