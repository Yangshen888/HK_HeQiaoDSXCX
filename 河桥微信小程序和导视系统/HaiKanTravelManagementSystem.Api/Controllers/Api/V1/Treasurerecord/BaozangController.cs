using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.RequestPayload.Treasurerecord;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using HaiKanTravelManagementSystem.Api.Extensions;
using SQLitePCL;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Treasurerecord
{
    [Route("api/v1/Treasurerecord/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class BaozangController : ControllerBase
    {

        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public BaozangController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        /// <summary>
        /// 显示所有宝藏信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(TreasurerecordRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from t in _dbContext.Treasurerecord
                            orderby t.Id descending
                            select new
                            {
                               uid= t.TreasurerecordUuid,
                               useruid= t.UserUuid,
                               nickname=_dbContext.SystemUser.FirstOrDefault(x=>x.SystemUserUuid==t.UserUuid).Nickname,//用户昵称
                               picture= _dbContext.SystemUser.FirstOrDefault(x => x.SystemUserUuid == t.UserUuid).Picture,//用户头像
                               content = t.Content,
                               createtime= t.Createtime,
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.nickname.Contains(payload.Kw.Trim()) || x.content.Contains(payload.Kw.Trim()));
                }

                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                return Ok(response);
            }
        }


    }
}
