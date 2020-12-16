using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.RequestPayload.Strategy;
using HaiKanTravelManagementSystem.Api.ViewModels.Strategy;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NPOI.SS.Formula.Functions;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Strategy
{
    [Route("api/v1/Strategy/[controller]/[action]")]
    [ApiController]
    public class StrategyController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public StrategyController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        [HttpPost]
        public IActionResult List(StrategyRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Strategy
                            join s in _dbContext.SystemUser
                            on p.SystemUserUuid equals s.SystemUserUuid
                            where p.Isdelete == 0
                            select new
                            {
                                p.StrategyUuid,
                                s.LoginName,
                                p.Id,
                                p.SystemUserUuid,
                                p.Title,
                                p.StrategyContent,
                                p.PhotoUrl,
                                p.AuditStaues,
                                p.ThroughStaues,
                                p.TipsType,
                                glleixing = p.TipsType == 1 ? "游玩攻略" : p.TipsType == 2 ? "路线推荐" :  "",
                                //ThroughStaues = p.ThroughStaues == 0 ? "通过" : p.ThroughStaues == 1 ? "不通过" : p.ThroughStaues == 2 ? "暂未审核" : "",
                                p.AddTime,
                                p.AddPeople,
                                p.Isdelete
                            };
                if (!string.IsNullOrEmpty(payload.Kw1))
                {
                    query = query.Where(x => x.Title.ToString().Contains(payload.Kw1));
                }
                if (!string.IsNullOrEmpty(payload.Kw2))
                {
                    query = query.Where(x => x.ThroughStaues.ToString() == payload.Kw2);
                }
                if (!string.IsNullOrEmpty(payload.Kw3))
                {
                    query = query.Where(x => x.AddTime.Substring(0, 10) == payload.Kw3);
                }
                if (payload.AuditStaues > -1)
                {
                    query = query.Where(x => x.AuditStaues == payload.AuditStaues);
                }
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.TipsType.ToString() == payload.Kw);
                }
                query = query.OrderByDescending(x => x.Id);
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();
                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:攻略发布管理列表数据", _dbContext);
                return Ok(response);
            }
        }
        /// <summary>
        /// 查看详情
        /// </summary>
        /// <param name="guid">惟一编码</param>
        /// <returns></returns>
        [HttpGet("{guid}")]
        [ProducesResponseType(200)]
        public IActionResult Edit(Guid guid)
        {
            using (_dbContext)
            {
                var query = _dbContext.Strategy.FirstOrDefault(x => x.StrategyUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(query);
                return Ok(response);
            }
        }
        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult editggboy(StrategyViewModels model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.Strategy.FirstOrDefault(x => x.StrategyUuid == model.StrategyUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (model.ThroughStaues !="" && model.ThroughStaues != null)
                {
                    if (model.ThroughStaues == "通过")
                    {
                        entity.ThroughStaues = 0;
                    }
                    if (model.ThroughStaues == "不通过")
                    {
                        entity.ThroughStaues = 1;
                    }
                    entity.AuditStaues = 1;
                    int res = _dbContext.SaveChanges();
                    if (res > 0)
                    {
                        ToLog.AddLog("审核", "成功:审核:攻略发布管理列表数据", _dbContext);
                    }
                }
                else
                {
                    response.SetFailed("已审核,请勿重复操作");
                    return Ok(response);
                }
                response = ResponseModelFactory.CreateInstance;
                return Ok(response);
            }
        }

        /// <summary>
        /// 获取视频
        /// </summary>
        /// <param name="guid">惟一编码</param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult listvideo()
        {
            using (_dbContext)
            {
                var query = _dbContext.Promotional.FirstOrDefault(x => x.Isdeleted == 0);
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(query);
                return Ok(response);
            }
        }
        
        /// <summary>
        /// 保存视频路径
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult createvideo(StrategyViewModels model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.Promotional.First(x => x.Isdeleted == 0);
                if (entity != null)
                {
                    entity.Video = model.Video;
                    _dbContext.SaveChanges();
                }
                else
                {
                    var dd = new HaiKanTravelManagementSystem.Api.Entities.Promotional();
                    dd.PromotionalUuid = Guid.NewGuid();
                    dd.Video = model.Video;
                    dd.Isdeleted = 0;
                    _dbContext.Promotional.Add(entity);
                    _dbContext.SaveChanges();
                }
                // var entity = new HaiKanTravelManagementSystem.Api.Entities.Promotional();
                
                response.SetSuccess("保存成功");
                response = ResponseModelFactory.CreateInstance;
                return Ok(response);
            }
        }
    }
}
