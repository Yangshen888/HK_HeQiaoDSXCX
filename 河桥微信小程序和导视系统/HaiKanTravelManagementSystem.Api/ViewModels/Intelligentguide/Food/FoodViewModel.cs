using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Food
{
    public class FoodViewModel
    {
        public int Id { get; set; }
        public string CreateTime { get; set; }
        public Guid FoodUuid { get; set; }
        public string FoodName { get; set; }
        public string Title { get; set; }
        public string Introduction { get; set; }
        public string Address { get; set; }
        public string Price { get; set; }
        public string Picture { get; set; }
        public int? State { get; set; }
        public int? IsDelete { get; set; }
        public int? FoodorTechan { get; set; }
        public string Cover { get; set; }
        public string Ytype { get; set; }
        public string Lon { get; set; }
        public string Lat { get; set; }
        public string PlayType { get; set; }
        public int? ShopId { get; set; }


    }
}
