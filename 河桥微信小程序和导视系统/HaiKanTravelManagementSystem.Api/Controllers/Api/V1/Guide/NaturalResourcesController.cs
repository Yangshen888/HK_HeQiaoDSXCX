﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.AuthContext;
using HaiKanTravelManagementSystem.Api.Extensions.DataAccess;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Guide;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using HaiKanTravelManagementSystem.Api.ViewModels.Guide;
using HaiKanTravelManagementSystem.Api.logs.TolLog;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Guide
{
    [Route("api/v1/Guide/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class NaturalResourcesController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public NaturalResourcesController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }


        [HttpPost]
        public IActionResult List(NaturalRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = _dbContext.NaturalResources.Where(x=>x.IsDeleted==0).Select(x => new
                {
                    x.NaturalResourcesUuid,
                    x.Title,
                    x.IsDeleted,
                    x.Id,
                    ReleaseTime = x.ReleaseTime.Value.ToString("yyyy-MM-dd"),
                    x.IsRelease,
                });


                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Title.Contains(payload.Kw.Trim()));
                }

                if (payload.IsDeleted > (int)CommonEnum.IsDeleted.All)
                {
                    query = query.Where(x => x.IsDeleted == Convert.ToInt32(((CommonEnum.IsDeleted)payload.IsDeleted)));
                }
                if (payload.State > -1)
                {
                    query = query.Where(x => x.IsRelease.Value == Convert.ToBoolean(payload.State));
                }
                if (payload.FirstSort != null)
                {
                    query = query.OrderBy(payload.FirstSort.Field, payload.FirstSort.Direct == "DESC");
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:自然资源列表数据", _dbContext);
                return Ok(response);
            }
        }

        /// <summary>
        /// 创建
        /// </summary>
        /// <param name="model">视图实体</param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult Create(NaturalViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                if (_dbContext.NaturalResources.Any(x => x.Title == model.Title))
                {
                    response.SetFailed("标题名称已存在");
                    return Ok(response);
                }

                //var entity = _mapper.Map<NaturalViewModel, NaturalResources>(model);
                var entity = new NaturalResources();
                entity.IsRelease = model.IsRelease;
                if (!string.IsNullOrEmpty(model.ReleaseTime.ToString()))
                {
                    entity.ReleaseTime = Convert.ToDateTime(model.ReleaseTime);
                }
                entity.Title = model.Title;
                entity.Content = model.Content;
                entity.Cover = model.Cover;
                entity.NaturalResourcesUuid = Guid.NewGuid();
                entity.IsDeleted = 0;
                entity.AddPeople = AuthContextService.CurrentUser.LoginName;
                entity.AddTime = DateTime.Now;
                entity.Photo = model.Photo;

                _dbContext.NaturalResources.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:自然资源列表数据", _dbContext);
                }
                response.SetSuccess();
                return Ok(response);
            }
        }

        /// <summary>
        /// 加载单条信息
        /// </summary>
        /// <param name="guid">惟一编码</param>
        /// <returns></returns>
        [HttpGet("{guid}")]
        [ProducesResponseType(200)]
        public IActionResult Load(Guid guid)
        {
            using (_dbContext)
            {
                var entity = _dbContext.NaturalResources.FirstOrDefault(x => x.NaturalResourcesUuid == guid);
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
        public IActionResult Edit(NaturalViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.NaturalResources.FirstOrDefault(x => x.NaturalResourcesUuid == model.NaturalResourcesUuid);
                if (entity == null)
                {
                    response.SetFailed("该信息不存在");
                    return Ok(response);
                }
                if (_dbContext.NaturalResources.Any(x => x.Title == model.Title && x.NaturalResourcesUuid != model.NaturalResourcesUuid))
                {
                    response.SetFailed("标题已存在");
                    return Ok(response);
                }
                entity.Title = model.Title;
                entity.Content = model.Content;
                entity.Cover = model.Cover;
                entity.IsRelease = model.IsRelease;
                entity.ReleaseTime = model.ReleaseTime;
                entity.Photo = model.Photo;

                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:自然资源列表数据", _dbContext);
                }
                return Ok(response);
            }
        }

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
                var sql = string.Format("UPDATE NaturalResources SET IsDeleted=@IsDel WHERE NaturalResourcesUUID IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDel", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:自然资源列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
    }
}
