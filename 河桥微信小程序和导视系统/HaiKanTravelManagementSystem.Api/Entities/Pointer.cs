using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Pointer
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
