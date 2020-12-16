using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.Models.ParkingLot
{
    public class ParkingLot
    {
        public decimal? Lon { get; set; }
        public decimal? Lat { get; set; }
        public int Id { get; set; }
        public Guid CarParkUuid { get; set; }
        public string Name { get; set; }
        public string Picture { get; set; }
        public int? TruckSpace { get; set; }
        public int? SurplusTs { get; set; }
        public int Distance { get; set; }
    }
}
