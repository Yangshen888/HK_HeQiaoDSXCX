using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Life
{
    public class GtoiletViewModel
    {
        public Guid? GtoiletUuid { get; set; }
        public Guid? BankUuid { get; set; }
        public Guid? HospitalUuid { get; set; }
        public string GtoiletName { get; set; }
        public string GtoiletAddress { get; set; }
        public string BankName { get; set; }
        public string BankAddress { get; set; }
        public string HospitalName { get; set; }
        public string HospitalAddress { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public string GtoiletStaues { get; set; }
        public string KongqiZhil { get; set; }
        public string WaterYujin { get; set; }
        public string Picture { get; set; }
        public string Telephone { get; set; }
        public string Remark { get; set; }
        public string RemarkOne { get; set; }
        public string RemarkTwo { get; set; }
        public string Staues { get; set; }
    }
}
