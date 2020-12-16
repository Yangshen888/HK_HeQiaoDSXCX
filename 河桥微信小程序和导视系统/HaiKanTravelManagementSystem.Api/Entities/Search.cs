using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Search
    {
        public Guid Guid { get; set; }
        public string Text { get; set; }
        public string Url { get; set; }
    }
}
