using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Consult
    {
        public int Id { get; set; }
        public Guid ConsultUuid { get; set; }
        public string PhoneName { get; set; }
        public string Phone { get; set; }
        public string ReleaseTime { get; set; }
        public int? ReleaseState { get; set; }
        public int? IsDeleted { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
    }
}
