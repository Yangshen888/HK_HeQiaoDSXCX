using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class HotelRoom
    {
        public int Id { get; set; }
        public Guid HotelRoomUuid { get; set; }
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
