using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Guide
{
    public class PointerViewModel
    {
        public Guid PointerUuid { get; set; }
        public int Id { get; set; }
        public int? IsDelete { get; set; }
        public string PointerNum { get; set; }
        public string PointerName { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public string Address { get; set; }

    }
}
