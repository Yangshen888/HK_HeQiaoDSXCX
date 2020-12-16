using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class ArticleType
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Guid? ArticleTypeUuid { get; set; }
        public int? IsDeleted { get; set; }
        public DateTime? CreateTime { get; set; }
    }
}
