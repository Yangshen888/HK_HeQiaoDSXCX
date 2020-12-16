using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class InformationType
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid InformationTypeUuid { get; set; }
        public string Name { get; set; }
        public int? IsDeleted { get; set; }
    }
}
