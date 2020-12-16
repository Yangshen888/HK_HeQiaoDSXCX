using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Mapmark
{
    public class MapmarkViewModel
    {
        public Guid? MapmarkUuid { get; set; }
        public Guid? MarkUuid { get; set; }
        public string Position { get; set; }
        public int? IsDelete { get; set; }
    }
}
