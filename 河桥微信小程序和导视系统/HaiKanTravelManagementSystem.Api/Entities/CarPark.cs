using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class CarPark
    {
        public int Id { get; set; }
        public DateTime? CreateTime { get; set; }
        public Guid CarParkUuid { get; set; }
        public string Name { get; set; }
        public string Specification { get; set; }
        public string Address { get; set; }
        public string Price { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public int? IsDelete { get; set; }
        public int? TruckSpace { get; set; }
        public int? SurplusTs { get; set; }
        public decimal? Lon { get; set; }
        public decimal? Lat { get; set; }
        public decimal? OneP { get; set; }
        public decimal? TwoP { get; set; }
        public decimal? ThreeP { get; set; }
        public decimal? FourP { get; set; }
        public decimal? OutFp { get; set; }
        public string ChargesNotes { get; set; }
        public DateTime? AddTime { get; set; }
        public string AddPeople { get; set; }
    }
}
