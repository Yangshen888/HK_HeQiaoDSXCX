using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class PublicityType
    {
        public PublicityType()
        {
            Publicity = new HashSet<Publicity>();
        }

        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid PublicityTypeUuid { get; set; }
        public string Name { get; set; }
        public int? IsDeleted { get; set; }

        public virtual ICollection<Publicity> Publicity { get; set; }
    }
}
