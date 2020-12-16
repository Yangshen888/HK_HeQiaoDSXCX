using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Scene;
using HaiKanTravelManagementSystem.Api.ViewModels;
using HaiKanTravelManagementSystem.Api.ViewModels.Scene;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using NPOI.SS.Formula.Functions;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Scene
{
    [Route("api/v1/scene/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class ScenicSpotController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public ScenicSpotController(haikanHeQiaoContext dbContext, IMapper mapper)
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
        public IActionResult List(ScenicSpotRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.ScenicSpot
                            select new
                            {
                                p.ScenicSpotUuid,
                                p.Name,
                                p.Address,
                                p.OrderBy,
                                ShopId = p.ShopId == null ? -1 : p.ShopId,
                                PlayType = p.PlayType == "1" ? "古镇游" : "周边游",
                                p.IsDelete,
                                p.State
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Name.Contains(payload.Kw.Trim())|| x.Address.Contains(payload.Kw.Trim()));
                }
                if (payload.State > -1)
                {
                    query = query.Where(x => x.State == payload.State);
                }
                if (payload.IsDeleted > CommonEnum.IsDeleted.All)
                {
                    query = query.Where(x => x.IsDelete == Convert.ToInt32(((CommonEnum.IsDeleted)payload.IsDeleted)));
                }
               
                query = query.OrderBy(x => x.OrderBy);
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:景点介绍管理列表数据", _dbContext);
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
        public IActionResult Create(ScenicSpotViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
           
            using (_dbContext)
            {
                if (_dbContext.ScenicSpot.Count(x => x.Name == model.Name) > 0)
                {
                    response.SetFailed("景点名称已存在");
                    return Ok(response);
                }
                var entity = _mapper.Map<ScenicSpotViewModel, ScenicSpot>(model);
                entity.ScenicSpotUuid = Guid.NewGuid();
                entity.IsDelete = 0;
                _dbContext.ScenicSpot.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:景点介绍管理列表数据", _dbContext);
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
                var entity = _dbContext.ScenicSpot.FirstOrDefault(x => x.ScenicSpotUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(_mapper.Map<ScenicSpot, ScenicSpotViewModel>(entity));
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
        public IActionResult Edit(ScenicSpotViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.ScenicSpot.FirstOrDefault(x => x.ScenicSpotUuid == model.ScenicSpotUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (_dbContext.ScenicSpot.Count(x => x.Name == model.Name&&x.ScenicSpotUuid!=model.ScenicSpotUuid) > 0)
                {
                    response.SetFailed("景点名称已存在");
                    return Ok(response);
                }
                entity.Name = model.Name;
                entity.SpotContent = model.SpotContent;
                entity.Address = model.Address;
                entity.Picture = model.Picture;
                entity.Video = model.Video;
                entity.Audio = model.Audio;
                entity.ShopId = model.ShopId;
                entity.Lon = model.Lon;
                entity.Lat = model.Lat;
                entity.TourismUuid = model.TourismUuid;
                entity.Type = model.Type;
                entity.Ytype = model.Ytype;
                entity.PlayType = model.PlayType;
                entity.OrderBy = model.OrderBy;
                entity.IsRecommend = model.IsRecommend;
                entity.State = model.State;
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:景点介绍管理列表数据", _dbContext);
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
                var sql = string.Format("UPDATE ScenicSpot SET IsDelete=@IsDel WHERE ScenicSpotUUID IN ({0})", parameterNames);
                var sql2 = string.Format("DELETE FROM Attractions  WHERE SceientUuid IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDel", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                _dbContext.Database.ExecuteSqlRaw(sql2, parameters);
                ToLog.AddLog("删除", "成功:删除:景点介绍管理列表数据(景点已不存在,已删除景点相关的用户打卡记录也已删除)", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
        #endregion
        #endregion

        /// <summary>
        /// 获取景区下拉框
        /// </summary>
        /// <param name="guid">惟一编码</param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult jingqu()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Tourism
                            where p.IsDelete == 0
                            select new
                            {
                                Value = p.TourismUuid,
                                Label = p.Name,
                            };
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
    }
}
