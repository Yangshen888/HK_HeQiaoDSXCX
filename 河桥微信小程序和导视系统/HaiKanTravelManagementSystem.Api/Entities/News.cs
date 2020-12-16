using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class News
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid NewsUuid { get; set; }
        public string Title { get; set; }
        public string NewsContent { get; set; }
        public int? IsDelete { get; set; }
        public int? ReleaseState { get; set; }
    }
}
