using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Walk
{
    public class BusViewModel
    {
        public int Id { get; set; }
        public string CreateTime { get; set; }
        public Guid BusUuid { get; set; }
        public Guid SharingUuid { get; set; }
        public string Name { get; set; }
        public string PassSite { get; set; }
        public string Introduction { get; set; }
        public string Address { get; set; }
        public string Price { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public int? IsDelete { get; set; }
        public string BegainTime { get; set; }
        public string EndTime { get; set; }
        public string BegainSite { get; set; }
        public string EndSite { get; set; }
        public string type { get; set; }
        public string Title { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public string Cover { get; set; }

    }
}
