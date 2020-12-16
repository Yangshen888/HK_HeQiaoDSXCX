using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class ArticleManagement
    {
        public int Id { get; set; }
        public string ArticleTitle { get; set; }
        public Guid? ArticleTypeUuid { get; set; }
        public DateTime? ReleaseTime { get; set; }
        public int? IsDelete { get; set; }
        public int? IsRelease { get; set; }
        public Guid? ArticleUuid { get; set; }
        public string CoverPhoto { get; set; }
        public string ArticleName { get; set; }
        public string AddPeople { get; set; }
        public DateTime? AddTime { get; set; }
    }
}
