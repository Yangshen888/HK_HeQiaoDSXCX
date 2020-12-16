using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Videomark
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid VideomarkUuid { get; set; }
        public string VideoName { get; set; }
        public string VideoPath { get; set; }
        public string Position { get; set; }
        public int? IsDelete { get; set; }
    }
}
