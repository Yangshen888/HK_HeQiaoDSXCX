using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.SpotPublicity
{
    public class PublicityViewModel
    {
        public Guid? PublicityUuid { get; set; }
        public string Title { get; set; }
        public Guid? PublicityTypeUuid { get; set; }
        public string Introduce { get; set; }
        public string Cover { get; set; }
        public string Picture { get; set; }
        public string Video { get; set; }
        public int? IsDeleted { get; set; }
        public int? State { get; set; }
    }
}
