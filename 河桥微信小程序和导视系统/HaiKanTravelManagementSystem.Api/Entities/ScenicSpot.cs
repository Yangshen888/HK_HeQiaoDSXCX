using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class ScenicSpot
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid ScenicSpotUuid { get; set; }
        public string Name { get; set; }
        public string SpotContent { get; set; }
        public string Address { get; set; }
        public string Picture { get; set; }
        public string Video { get; set; }
        public string Audio { get; set; }
        public int? IsDelete { get; set; }
        public int? OrderBy { get; set; }
        public int? State { get; set; }
        public Guid? TourismUuid { get; set; }
        public string Type { get; set; }
        public bool IsRecommend { get; set; }
        public string Ytype { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public string PlayType { get; set; }
        public int? ShopId { get; set; }
    }
}
