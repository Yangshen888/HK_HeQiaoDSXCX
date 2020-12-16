using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.AuthContext;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Intelligentguide;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.SpecialPick;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Strategy
{
    [Route("api/v1/Strategy/[controller]/[action]")]
    [ApiController]
    public class TjLuxianController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public TjLuxianController(haikanHeQiaoContext dbContext, IMapper mapper)
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
        public IActionResult List(SpecialpickRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Luxian
                            orderby p.CreateTime descending
                            select new
                            {
                                p.LuxianUuid,
                                p.Name,
                                p.Phone,
                                p.Address,
                                p.Price,
                                PlayType = p.PlayType == "1" ? "古镇游" : "周边游",
                                p.IsDelete,
                                //CreateTime = p.CreateTime.Value.ToString("yyyy-MM-dd"),
                                p.State
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Name.Contains(payload.Kw.Trim()) || x.Address.Contains(payload.Kw.Trim()));
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
                ToLog.AddLog("查询", "成功:查询:推荐路线管理列表数据", _dbContext);
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
        public IActionResult Create(SpecialPickViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                if (_dbContext.Luxian.Count(x => x.Name == model.Name) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                var entity = new Luxian();
                //var entity = _mapper.Map<SpecialPickViewModel, Luxian>(model);
                entity.Name = model.Name;
                entity.Cover = model.Cover;
                entity.Phone = model.Phone;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Price = model.Price;
                entity.Picture = model.Picture;
                entity.Ytype = model.Ytype;
                entity.PlayType = model.PlayType;  
                entity.State = model.State;
                entity.Addpeople = AuthContextService.CurrentUser.LoginName;
                //entity.CreateTime = Convert.ToDateTime(model.CreateTime);
                entity.LuxianUuid = Guid.NewGuid();
                entity.IsDelete = 0;
                _dbContext.Luxian.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:推荐路线管理列表数据", _dbContext);
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
                var entity = _dbContext.Luxian.FirstOrDefault(x => x.LuxianUuid == guid);
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
        public IActionResult Edit(SpecialPickViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.Luxian.FirstOrDefault(x => x.LuxianUuid == model.LuxianUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (_dbContext.Luxian.Count(x => x.Name == model.Name && x.LuxianUuid != model.LuxianUuid) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                entity.Name = model.Name;
                entity.Cover = model.Cover;
                entity.Phone = model.Phone;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Ytype = model.Ytype;
                entity.PlayType = model.PlayType;
                entity.Price = model.Price;
                entity.Picture = model.Picture;
                entity.State = model.State;
                //entity.CreateTime = Convert.ToDateTime(model.CreateTime);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:推荐路线管理列表数据", _dbContext);
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
                var sql = string.Format("UPDATE Luxian SET IsDelete=@IsDel WHERE LuxianUuid IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDel", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:推荐路线管理列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
        #endregion
        #endregion
    }
}
