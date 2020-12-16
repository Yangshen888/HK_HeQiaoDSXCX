using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.Data.SqlClient;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.ArticleManagement;
using HaiKanTravelManagementSystem.Api.ViewModels.ArticlesManagement;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.ArticleManagement
{
    [Route("api/v1/ArticleManagement/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class ArticleTypeController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public ArticleTypeController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }
        #region 查询
        /// <summary>
        /// 显示所有信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(ArticleTypeRequestPayload payload)
        {
             using (_dbContext)
            {
                var query = from p in _dbContext.ArticleType
                            where p.IsDeleted == 0
                            select new
                            {
                                p.Id,
                                p.Name,
                                p.ArticleTypeUuid,
                                p.IsDeleted,
                                p.CreateTime,
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Name.Contains(payload.Kw.Trim()));
                }
                if (payload.IsDeleted != -1)
                {
                    query = query.Where(x => x.IsDeleted == payload.IsDeleted);
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:文章类型列表数据", _dbContext);
                return Ok(response);
            }
        }
        #endregion
        #region 添加
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model">视图实体</param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult Create(ArticleTypeViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = new ArticleType();
                entity.Name = model.Name;
                entity.ArticleTypeUuid = Guid.NewGuid();
                entity.IsDeleted = 0;
                entity.CreateTime = DateTime.Now;
                _dbContext.ArticleType.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:文章类型列表数据", _dbContext);
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
                var query = _dbContext.ArticleType.FirstOrDefault(x => x.ArticleTypeUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(query);
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
        public IActionResult Edit(ArticleTypeViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.ArticleType.FirstOrDefault(x => x.ArticleTypeUuid.ToString() == model.ArticleTypeUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (_dbContext.ArticleType.Count(x => x.Name == model.Name) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                entity.Name = model.Name;
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:文章类型列表数据", _dbContext);
                }
                response = ResponseModelFactory.CreateInstance;
                return Ok(response);
            }
        }
        #endregion
        #region 删除
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

            response = detupdate(command, ids);
            return Ok(response);
        }
        #region 私有方法

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="command"></param>
        /// <param name="ids">ID字符串,多个以逗号隔开</param>
        /// <returns></returns>
        private ResponseModel detupdate(string command, string ids)
        {
            if (command == "删除" || command =="delete")
            {
                _dbContext.Database.ExecuteSqlRaw("update ArticleType set IsDeleted = '1' where ID in(" + ids + ")");
                ToLog.AddLog("删除", "成功:删除:文章类型列表数据", _dbContext);
            }
            else if (command == "恢复" || command == "recover")
            {
                _dbContext.Database.ExecuteSqlRaw("update ArticleType set IsDeleted='0' where ID in(" + ids + ")");
                ToLog.AddLog("恢复", "成功:恢复:文章类型列表数据", _dbContext);
            }
            var response = ResponseModelFactory.CreateResultInstance;
            return response;
        }
        #endregion
        #endregion
    }
}
