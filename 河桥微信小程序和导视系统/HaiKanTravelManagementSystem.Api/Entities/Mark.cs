using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Mark
    {
        public Mark()
        {
            Mapmark = new HashSet<Mapmark>();
        }

        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid MarkUuid { get; set; }
        public string MarkName { get; set; }
        public string MarkPicture { get; set; }
        public int? IsDelete { get; set; }

        public virtual ICollection<Mapmark> Mapmark { get; set; }
    }
}
