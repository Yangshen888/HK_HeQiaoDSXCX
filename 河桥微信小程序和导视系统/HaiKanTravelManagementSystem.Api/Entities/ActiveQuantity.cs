using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class ActiveQuantity
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid ActiveQuantityUuid { get; set; }
        public string AddTime { get; set; }
        public int? Num { get; set; }
        public int? Type { get; set; }
    }
}
