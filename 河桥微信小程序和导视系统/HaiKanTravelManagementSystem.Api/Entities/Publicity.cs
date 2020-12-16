using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Publicity
    {
        public int Id { get; set; }
        public DateTime CreateTime { get; set; }
        public Guid PublicityUuid { get; set; }
        public string Title { get; set; }
        public Guid? PublicityTypeUuid { get; set; }
        public string Introduce { get; set; }
        public string Cover { get; set; }
        public string Picture { get; set; }
        public string Video { get; set; }
        public int? IsDeleted { get; set; }
        public int? State { get; set; }

        public virtual PublicityType PublicityTypeUu { get; set; }
    }
}
