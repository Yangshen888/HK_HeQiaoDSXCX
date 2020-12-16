using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Information
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid InformationUuid { get; set; }
        public string Title { get; set; }
        public Guid? InformationTypeUuid { get; set; }
        public string Introduce { get; set; }
        public string Address { get; set; }
        public DateTime? StartTime { get; set; }
        public string Picture { get; set; }
        public bool? State { get; set; }
        public int? IsDeleted { get; set; }
        public string Photo { get; set; }
    }
}
