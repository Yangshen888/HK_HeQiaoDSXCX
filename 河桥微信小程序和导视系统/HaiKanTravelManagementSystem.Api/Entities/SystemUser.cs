using System;
using System.Collections.Generic;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class SystemUser
    {
        public Guid SystemUserUuid { get; set; }
        public string LoginName { get; set; }
        public string RealName { get; set; }
        public string UserIdCard { get; set; }
        public string PassWord { get; set; }
        public int? UserType { get; set; }
        public Guid? SchoolUuid { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
        public int? IsDeleted { get; set; }
        public string ManageDepartment { get; set; }
        public int Id { get; set; }
        public string ZaiGang { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Sex { get; set; }
        public string InTime { get; set; }
        public string Types { get; set; }
        public string Address { get; set; }
        public string SystemRoleUuid { get; set; }
        public string Remarks { get; set; }
        public string StaffNum { get; set; }
        public string Wechat { get; set; }
        public string Topic { get; set; }
        public string Content { get; set; }
        public string Train { get; set; }
        public string Main { get; set; }
        public string Job { get; set; }
        public int? HealthCertificate { get; set; }
        public int? IsStaff { get; set; }
        public int? IsCreEdu { get; set; }
        public string Placeofresidence { get; set; }
        public string Age { get; set; }
        public string Picture { get; set; }
        public string Nickname { get; set; }
    }
}
