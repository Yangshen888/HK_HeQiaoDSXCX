using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class PublicityPicture
    {
        public Guid PublicityPictureUuid { get; set; }
        public string Title { get; set; }
        public DateTime? ReleaseTime { get; set; }
        public bool? IsRelease { get; set; }
        public string Cover { get; set; }
        public string Content { get; set; }
        public DateTime? AddTime { get; set; }
        public string AddPeople { get; set; }
        public int Id { get; set; }
        public int? IsDeleted { get; set; }
        public string Photo { get; set; }
    }
}
