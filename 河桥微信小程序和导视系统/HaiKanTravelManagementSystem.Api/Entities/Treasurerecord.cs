﻿using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class Treasurerecord
    {
        public Guid TreasurerecordUuid { get; set; }
        public int Id { get; set; }
        public Guid? UserUuid { get; set; }
        public string Content { get; set; }
        public string Createtime { get; set; }
    }
}
