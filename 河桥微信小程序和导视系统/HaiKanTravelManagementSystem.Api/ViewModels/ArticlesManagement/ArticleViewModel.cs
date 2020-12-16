using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.ArticlesManagement
{
    public class ArticleViewModel
    {
        public string ArticleUuid { get; set; }
        public string ArticleTitle { get; set; }
        public string ArticleTypeUuid { get; set; }
        public string ArticleName { get; set; }
        public string CoverPhoto { get; set; }
        public string IsRelease { get; set; }
        public string ReleaseTime { get; set; }
        public bool IsRecommend { get; set; }

    }
}
