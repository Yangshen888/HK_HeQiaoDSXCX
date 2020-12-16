using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.ViewModels.Rbac.Department
{
    public class DepartmentJsonViewModel
    {
        public Guid DepartmentUuid { get; set; }
        public string DepartmentName { get; set; }
        public string AddTime { get; set; }
        public string AddPeople { get; set; }
        public int IsDeleted { get; set; }
        public int Id { get; set; }
    }
}
