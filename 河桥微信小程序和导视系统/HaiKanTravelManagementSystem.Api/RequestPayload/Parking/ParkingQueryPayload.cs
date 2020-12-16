using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.RequestPayload.Parking
{
    public class ParkingQueryPayload:RequestPayload
    {
        public double Lon { get; set; }
        public double Lat { get; set; }
        /// <summary>
        /// 0 全部  1距离  2车位
        /// </summary>
        public int Type { get; set; }
        public Guid? UserUuid { get; set; }

    }
}
