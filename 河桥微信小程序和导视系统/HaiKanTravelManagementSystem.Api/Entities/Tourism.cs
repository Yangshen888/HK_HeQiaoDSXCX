using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Tourism
    {
        public Guid TourismUuid { get; set; }
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public string Name { get; set; }
        public string SpotContent { get; set; }
        public string Address { get; set; }
        public string Picture { get; set; }
        public string Video { get; set; }
        public string Audio { get; set; }
        public int? IsDelete { get; set; }
        public int? OrderBy { get; set; }
        public int? State { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
    }
}
