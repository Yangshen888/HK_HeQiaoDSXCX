using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Cabinet
    {
        public long? Id { get; set; }
        public Guid Uuid { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Type { get; set; }
        public string Url { get; set; }
        public bool IsRecommend { get; set; }
        public int? IsDel { get; set; }
        public DateTime? Time { get; set; }
    }
}
