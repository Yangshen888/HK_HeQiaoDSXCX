using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.VideoMark
{
    public class VideoMarkViewModel
    {
        public Guid? VideomarkUuid { get; set; }
        public string VideoName { get; set; }
        public string VideoPath { get; set; }
        public string Position { get; set; }
        public int? IsDelete { get; set; }
    }
}
