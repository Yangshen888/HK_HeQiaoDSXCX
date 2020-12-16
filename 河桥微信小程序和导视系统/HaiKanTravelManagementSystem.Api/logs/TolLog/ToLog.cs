using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions.AuthContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.logs.TolLog
{
    public class ToLog
    {
        public static string AddLog(string Typem, string Content, haikanHeQiaoContext _dbContext)
        {
            string messange = "";
            var entity = new HaiKanTravelManagementSystem.Api.Entities.SystemLog();
            entity.SystemLogUuid = Guid.NewGuid();
            entity.UserId = AuthContextService.CurrentUser.Guid.ToString();
            entity.UserName = AuthContextService.CurrentUser.LoginName;
            entity.Type = Typem;
            entity.OperationContent = Content;
            entity.OperationTime = DateTime.Now;
            entity.AddTime = DateTime.Now;
            entity.AddPeople = "系统日志";
            entity.IsDelete = 0;
            _dbContext.SystemLog.Add(entity);
            _dbContext.SaveChanges();
            return messange;
        }
    }
}
