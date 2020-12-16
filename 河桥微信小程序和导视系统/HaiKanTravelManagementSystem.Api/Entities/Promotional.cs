using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Promotional
    {
        public Guid PromotionalUuid { get; set; }
        public int Id { get; set; }
        public int? Isdeleted { get; set; }
        public string Staues { get; set; }
        public string Title { get; set; }
        public string PromotionalContent { get; set; }
        public string Video { get; set; }
        public string AddPeople { get; set; }
        public string AddTime { get; set; }
    }
}
