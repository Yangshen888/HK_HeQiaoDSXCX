using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Hospital
    {
        public Guid HospitalUuid { get; set; }
        public int Id { get; set; }
        public int? IsDeleted { get; set; }
        public string HospitalName { get; set; }
        public string HospitalAddress { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public string Staues { get; set; }
        public string Telephone { get; set; }
        public string Remark { get; set; }
        public string RemarkOne { get; set; }
        public string RemarkTwo { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
        public string Picture { get; set; }
    }
}
