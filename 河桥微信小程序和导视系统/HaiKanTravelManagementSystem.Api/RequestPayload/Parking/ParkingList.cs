using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.Parking
{
    public class ParkingList 
    {

        public int Id { get; set; }
        
        public Guid CarParkUuid { get; set; }
        public string Name { get; set; }
        public string Picture { get; set; }
        public int? TruckSpace { get; set; }
        public int? SurplusTs { get; set; }
        public decimal Lon { get; set; }
        public decimal Lat { get; set; }
        public double Distance { get; set; }

        //public int CompareTo(ParkingList obj)
        //{
        //    return Distance.CompareTo(obj.Distance);
        //}
    }
}
