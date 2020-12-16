using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class FoodCopy1
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid FoodUuid { get; set; }
        public string FoodName { get; set; }
        public string Title { get; set; }
        public string Introduction { get; set; }
        public string Address { get; set; }
        public string Price { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public int? IsDelete { get; set; }
    }
}
