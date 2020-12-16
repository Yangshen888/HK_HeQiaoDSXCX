using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Mapmark
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid MapmarkUuid { get; set; }
        public Guid? MarkUuid { get; set; }
        public string Position { get; set; }
        public int? IsDelete { get; set; }
        public string Introduce { get; set; }

        public virtual Mark MarkUu { get; set; }
    }
}
