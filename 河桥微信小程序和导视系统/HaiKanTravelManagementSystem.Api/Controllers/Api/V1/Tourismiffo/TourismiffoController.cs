﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Tourism
{
    [Route("api/v1/Tourismiffo/[controller]/[action]")]
    [ApiController]
    public class TourismiffoController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public TourismiffoController(haikanHeQiaoContext dbContext, IMapper mapper)
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
                var query = from p in _dbContext.Tourism
                            select new
                            {
                                p.TourismUuid,
                                p.Name,
                                p.Address,
                                p.OrderBy,
                                p.IsDelete,
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

                query = query.OrderBy(x => x.OrderBy);
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:景区管理列表数据", _dbContext);
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
                if (_dbContext.Tourism.Count(x => x.Name == model.Name) > 0)
                {
                    response.SetFailed("景区名称已存在");
                    return Ok(response);
                }

                //var entity = _mapper.Map<ScenicSpotViewModel, HaiKanTravelManagementSystem.Api.Entities.Tourism>(model);
                var entity = new HaiKanTravelManagementSystem.Api.Entities.Tourism();
                entity.Name = model.Name;
                entity.SpotContent = model.SpotContent;
                entity.Address = model.Address;
                entity.Picture = model.Picture;
                entity.Video = model.Video;
                entity.Audio = model.Audio;
                entity.OrderBy = model.OrderBy;
                entity.State = model.State;
                entity.TourismUuid = Guid.NewGuid();
                entity.IsDelete = 0;
                _dbContext.Tourism.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:景区管理列表数据", _dbContext);
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
                var entity = _dbContext.Tourism.FirstOrDefault(x => x.TourismUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                //response.SetData(_mapper.Map<HaiKanTravelManagementSystem.Api.Entities.Tourism, ScenicSpotViewModel>(entity));
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
        public IActionResult Edit(ScenicSpotViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.Tourism.FirstOrDefault(x => x.TourismUuid == model.TourismUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (_dbContext.Tourism.Count(x => x.Name == model.Name && x.TourismUuid != model.TourismUuid) > 0)
                {
                    response.SetFailed("景区名称已存在");
                    return Ok(response);
                }
                entity.Name = model.Name;
                entity.SpotContent = model.SpotContent;
                entity.Address = model.Address;
                entity.Picture = model.Picture;
                entity.Video = model.Video;
                entity.Audio = model.Audio;
                entity.OrderBy = model.OrderBy;
                entity.State = model.State;
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:景区管理列表数据", _dbContext);
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
                var sql = string.Format("UPDATE Tourism SET IsDelete=@IsDel WHERE TourismUuid IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDel", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:景区管理列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
        #endregion
        #endregion
    }
}
