using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Hotel
{
    public class HotelRoomViewModel
    {
        public Guid? HotelRoomUuid { get; set; }
        public string HotelRoomName { get; set; }
        public string Price { get; set; }
        public string Introduction { get; set; }
        public string Address { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public int? IsDelete { get; set; }
        public Guid? HotelUuid { get; set; }
    }
}
