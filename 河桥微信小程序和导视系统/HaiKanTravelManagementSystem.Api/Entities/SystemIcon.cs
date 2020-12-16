using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class SystemIcon
    {
        public Guid SystemIconUuid { get; set; }
        public string Code { get; set; }
        public string Size { get; set; }
        public string Color { get; set; }
        public string Custom { get; set; }
        public string Description { get; set; }
        public int Status { get; set; }
        public int IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedByUserGuid { get; set; }
        public string CreatedByUserName { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public Guid? ModifiedByUserGuid { get; set; }
        public string ModifiedByUserName { get; set; }
        public int Id { get; set; }
    }
}
