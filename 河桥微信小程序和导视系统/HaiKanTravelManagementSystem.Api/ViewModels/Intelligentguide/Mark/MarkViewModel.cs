using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Mark
{
    public class MarkViewModel
    {
        public Guid? MarkUuid { get; set; }
        public string MarkName { get; set; }
        public string MarkPicture { get; set; }
        public int? IsDelete { get; set; }
    }
}
