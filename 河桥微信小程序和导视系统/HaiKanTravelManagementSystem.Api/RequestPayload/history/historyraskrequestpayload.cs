using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.history
{
    public class historyraskrequestpayload:RequestPayload
    {
        public string date { get; set; }
        public string wegtype { get; set; }
    }
}
