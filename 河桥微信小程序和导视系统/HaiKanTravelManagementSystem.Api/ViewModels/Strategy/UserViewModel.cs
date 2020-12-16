using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Strategy
{
    public class UserViewModel
    {
        public Guid? SystemUserUuid { get; set; }
        public Guid? ScenienUuid { get; set; }
        public string Nickname { get; set; }
        public string UserIdCard { get; set; }
        public string Phone { get; set; }
        public string Sex { get; set; }
        public string Placeofresidence { get; set; }
        public string Age { get; set; }
        public string Neirong { get; set; }

        public string Title { get; set; }
        public string StrategyContent { get; set; }
        public string TipsType { get; set; }
        public string Accessory { get; set; }
        public string Ytype { get; set; }
        public string Evaluate { get; set; }
        public string Picture { get; set; }


    }
}
