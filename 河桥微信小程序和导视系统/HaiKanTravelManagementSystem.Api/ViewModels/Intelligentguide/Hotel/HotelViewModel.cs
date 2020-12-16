using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Hotel
{
    public class HotelViewModel
    {
        public Guid? HotelUuid { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Introduction { get; set; }
        public string Address { get; set; }
        public string Price { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public int? IsDelete { get; set; }
        public string Cover { get; set; }
        public string CreateTime { get; set; }
        public string HotelUrl { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public int? ShopId { get; set; }

    }
}
