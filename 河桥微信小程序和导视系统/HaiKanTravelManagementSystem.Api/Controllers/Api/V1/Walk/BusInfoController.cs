using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Intelligentguide;
using HaiKanTravelManagementSystem.Api.ViewModels.Walk;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Walk
{
    [Route("api/v1/Walk/[controller]/[action]")]
    [ApiController]
    public class BusInfoController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public BusInfoController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }
        #region 后台管理列表
        /// <summary>
        /// 显示所有信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(FoodRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Bus
                            orderby p.CreateTime descending
                            select new
                            {
                                p.BusUuid,
                                p.Name,
                                p.PassSite,
                                p.BegainSite,
                                p.EndSite,
                                CreateTime = p.CreateTime.Value.ToString("yyyy-MM-dd"),
                                p.IsDelete,
                                p.State
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.BegainSite.Contains(payload.Kw.Trim()));
                }
                if (payload.State > -1)
                {
                    query = query.Where(x => x.State == payload.State);
                }
                if (payload.IsDeleted > CommonEnum.IsDeleted.All)
                {
                    query = query.Where(x => x.IsDelete == Convert.ToInt32(((CommonEnum.IsDeleted)payload.IsDeleted)));
                }

                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:公交路线管理列表数据", _dbContext);
                return Ok(response);
            }
        }
        #endregion
        #region 创建
        /// <summary>
        /// 创建
        /// </summary>
        /// <param name="model">视图实体</param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult Create(BusViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                //var entity = _mapper.Map<FoodViewModel, Bus>(model);
                var entity = new Bus();
                entity.Name = model.Name;
                entity.PassSite = model.PassSite;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Picture = model.Picture;
                entity.State = model.State;
                entity.BegainTime = model.BegainTime;
                entity.EndTime = model.EndTime;
                entity.BegainSite = model.BegainSite;
                entity.EndSite = model.EndSite;
                entity.CreateTime = DateTime.Now;
                entity.BusUuid = Guid.NewGuid();
                entity.IsDelete = 0;
                _dbContext.Bus.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:公交路线管理列表数据", _dbContext);
                }
                response.SetSuccess();
                return Ok(response);
            }
        }
        #endregion
        #region 编辑
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="guid">惟一编码</param>
        /// <returns></returns>
        [HttpGet("{guid}")]
        [ProducesResponseType(200)]
        public IActionResult Edit(Guid guid)
        {
            using (_dbContext)
            {
                var entity = _dbContext.Bus.FirstOrDefault(x => x.BusUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(entity);
                return Ok(response);
            }
        }
        /// <summary>
        /// 保存编辑后的信息
        /// </summary>
        /// <param name="model">视图实体</param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult Edit(BusViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.Bus.FirstOrDefault(x => x.BusUuid == model.BusUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                entity.Name = model.Name;
                entity.PassSite = model.PassSite;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Picture = model.Picture;
                entity.State = model.State;
                entity.BegainTime = model.BegainTime;
                entity.EndTime = model.EndTime;
                entity.BegainSite = model.BegainSite;
                entity.EndSite = model.EndSite;
                entity.CreateTime = Convert.ToDateTime(model.CreateTime);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:公交路线管理列表数据", _dbContext);
                }
                response = ResponseModelFactory.CreateInstance;
                return Ok(response);
            }
        }
        #endregion

        #region 删除
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids">ID,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet("{ids}")]
        [ProducesResponseType(200)]
        public IActionResult Delete(string ids)
        {
            var response = ResponseModelFactory.CreateInstance;
            response = UpdateIsDelete(CommonEnum.IsDeleted.Yes, ids);
            return Ok(response);
        }
        /// <summary>
        /// 批量操作
        /// </summary>
        /// <param name="command"></param>
        /// <param name="ids">ID,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult Batch(string command, string ids)
        {
            var response = ResponseModelFactory.CreateInstance;
            switch (command)
            {
                case "delete":
                    response = UpdateIsDelete(CommonEnum.IsDeleted.Yes, ids);
                    break;
                case "recover":
                    response = UpdateIsDelete(CommonEnum.IsDeleted.No, ids);
                    break;

                default:
                    break;
            }
            return Ok(response);
        }
        #region 私有方法

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="isDeleted"></param>
        /// <param name="ids">ID字符串,多个以逗号隔开</param>
        /// <returns></returns>
        private ResponseModel UpdateIsDelete(CommonEnum.IsDeleted isDeleted, string ids)
        {
            using (_dbContext)
            {
                var parameters = ids.Split(",").Select((id, index) => new SqlParameter(string.Format("@p{0}", index), id)).ToList();
                var parameterNames = string.Join(", ", parameters.Select(p => p.ParameterName));
                var sql = string.Format("UPDATE Bus SET IsDelete=@IsDel WHERE BusUuid IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDel", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:公交路线管理列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
        #endregion
        #endregion

    }
}
