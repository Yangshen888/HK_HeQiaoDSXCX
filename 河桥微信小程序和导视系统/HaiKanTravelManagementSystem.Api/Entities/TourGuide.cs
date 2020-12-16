using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class TourGuide
    {
        public int Id { get; set; }
        public Guid TourGuideUuid { get; set; }
        public string TourGuideName { get; set; }
        public string Phone { get; set; }
        public string ReleaseTime { get; set; }
        public int? ReleaseState { get; set; }
        public int? IsDeleted { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
        public string Picture { get; set; }
        public string Content { get; set; }
        public string Fmpicture { get; set; }
    }
}
