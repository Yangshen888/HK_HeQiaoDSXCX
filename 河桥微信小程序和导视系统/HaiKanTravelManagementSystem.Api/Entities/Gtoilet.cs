using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Gtoilet
    {
        public Guid GtoiletUuid { get; set; }
        public int Id { get; set; }
        public int? IsDeleted { get; set; }
        public string GtoiletName { get; set; }
        public string GtoiletAddress { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public string GtoiletStaues { get; set; }
        public string KongqiZhil { get; set; }
        public string WaterYujin { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
        public string Picture { get; set; }
    }
}
