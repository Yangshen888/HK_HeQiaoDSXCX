using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Complaints
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid ComplaintsUuid { get; set; }
        public string Comcontent { get; set; }
        public string Picture { get; set; }
        public Guid? AddPeople { get; set; }
        public int? State { get; set; }
        public string ReplyContent { get; set; }
        public DateTime? ReplyTime { get; set; }
        public string ReplyPeople { get; set; }
    }
}
