using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Guide
{
    public class NaturalViewModel
    {
        public Guid? NaturalResourcesUuid { get; set; }
        public string Title { get; set; }
        public bool? IsRelease { get; set; }
        public DateTime? ReleaseTime { get; set; }
        public string Cover { get; set; }
        public string Content { get; set; }
        public DateTime? AddTime { get; set; }
        public string AddPeople { get; set; }
        public int? IsDeleted { get; set; }
        public string Photo { get; set; }

    }
}
