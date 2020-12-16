using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class PromotionalVideo
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid PromotionalVideoUuid { get; set; }
        public string Title { get; set; }
        public string Cover { get; set; }
        public string Video { get; set; }
        public DateTime? ReleaseTime { get; set; }
        public int? ReleaseState { get; set; }
        public DateTime? AddTime { get; set; }
        public string AddPeople { get; set; }
        public int? IsDeleted { get; set; }
        public bool IsRecommend { get; set; }
    }
}
