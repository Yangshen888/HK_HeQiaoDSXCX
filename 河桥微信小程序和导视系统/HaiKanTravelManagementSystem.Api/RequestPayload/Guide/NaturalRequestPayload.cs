using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.Guide
{
    public class NaturalRequestPayload: RequestPayload
    {
        public int IsDeleted { get; set; }
        public int State { get; set; }
    }
}
