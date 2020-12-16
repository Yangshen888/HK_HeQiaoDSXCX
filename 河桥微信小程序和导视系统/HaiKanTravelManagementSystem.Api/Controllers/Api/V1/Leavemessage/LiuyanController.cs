using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Leavemessage;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Leavemessage
{
    [Route("api/v1/Leavemessage/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class LiuyanController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public LiuyanController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        /// <summary>
        /// 显示所有留言信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(LiuyanRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from le in _dbContext.Leavemessage
                            orderby le.Id descending
                            select new
                            {
                                id=le.Id,
                                uid = le.LeavemessageUuid,
                                isdel=le.Isdelete,
                                useruid = le.UserUuid,
                                nickname = _dbContext.SystemUser.FirstOrDefault(x => x.SystemUserUuid == le.UserUuid).Nickname,//用户昵称
                                picture = _dbContext.SystemUser.FirstOrDefault(x => x.SystemUserUuid == le.UserUuid).Picture,//用户头像
                                content = le.Content,
                                createtime = le.Createtime,
                            };

                if (payload.IsDeleted != "-1")
                {
                    query = query.Where(x => x.isdel == payload.IsDeleted);
                }

                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.nickname.Contains(payload.Kw.Trim()) || x.content.Contains(payload.Kw.Trim()));
                }

                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:留言建议管理列表数据", _dbContext);
                return Ok(response);
            }
        }

        /// <summary>
        /// 批量操作
        /// </summary>
        /// <param name="command">操作类型(删除,恢复)</param>
        /// <param name="ids">用户id,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult Batch(string command, string ids)
        {
            var response = ResponseModelFactory.CreateInstance;
            if (ConfigurationManager.AppSettings.IsTrialVersion)
            {
                response.SetIsTrial();
                return Ok(response);
            }
            response = detupdate(command,ids);
            return Ok(response);
        }

        /// <summary>
        /// 删除(更新为删除状态)
        /// </summary>
        /// <param name = "command" > 操作类型(删除,恢复)</param>
        /// <param name = "ids" > ID字符串, 多个以逗号隔开</param>
        /// <returns></returns>
        private ResponseModel detupdate(string command, string ids)
        {
            using (_dbContext)
            {
                if (command == "删除")
                {
                    _dbContext.Database.ExecuteSqlRaw("update Leavemessage set Isdelete='1' where ID in(" + ids + ")");//删除状态为删除
                    ToLog.AddLog("删除", "成功:删除:留言建议管理列表数据", _dbContext);
                }

                if (command == "恢复")
                {
                    _dbContext.Database.ExecuteSqlRaw("update Leavemessage set Isdelete='0' where ID in(" + ids + ")");//恢复为正常状态
                    ToLog.AddLog("恢复", "成功:恢复:留言建议管理列表数据", _dbContext);
                }

                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }




    }
}
