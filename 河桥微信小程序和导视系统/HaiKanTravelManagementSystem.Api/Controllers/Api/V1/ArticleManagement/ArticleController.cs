using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.ArticleManagement;
using HaiKanTravelManagementSystem.Api.ViewModels.ArticlesManagement;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NPOI.SS.Formula.Functions;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.ArticleManagement
{
    [Route("api/v1/ArticleManagement/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class ArticleController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public ArticleController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }
        #region 文章类别
        /// <summary>
        /// 文章类别
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Articletypelist()
        {

            using (_dbContext)
            {
                var response = ResponseModelFactory.CreateResultInstance;

                var query = _dbContext.ArticleType.Where(x => x.IsDeleted == 0).Select(x => new
                {
                    x.Name,
                    x.ArticleTypeUuid
                });
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
        #endregion
        #region 查询
        /// <summary>
        /// 显示所有信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(articlequestpayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.ArticlesManagement
                            join a in _dbContext.ArticleType
                            on p.ArticleTypeUuid equals a.ArticleTypeUuid
                            where p.IsDelete ==0
                            select new
                            {
                                ArticleUuid = p.ArticleUuid,
                                ArticleTitle = p.ArticleTitle,
                                ArticleTypeUuid = p.ArticleTypeUuid,
                                ReleaseTime = p.ReleaseTime,
                                IsDelete = p.IsDelete,
                                IsRelease = p.IsRelease,
                                ArticleName = p.ArticleName,
                                Id = p.Id,
                                Name = a.Name
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.ArticleTitle.Contains(payload.Kw.Trim()));
                }
                if (payload.IsDeleted != "-1")
                {
                    query = query.Where(x => x.IsDelete == Convert.ToInt32(payload.IsDeleted));
                }
                if (!string.IsNullOrEmpty(payload.ArticleTypeUUID))
                {
                    query = query.Where(x => x.ArticleTypeUuid == Guid.Parse(payload.ArticleTypeUUID));
                }

                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:文章管理列表数据", _dbContext);
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
        public IActionResult Create(ArticleViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = new ArticlesManagement();
                if (_dbContext.ArticlesManagement.Count(x => x.ArticleTitle == model.ArticleTitle) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                entity.ArticleTitle = model.ArticleTitle;
                if (model.ArticleTypeUuid.ToString() != "")
                {
                    entity.ArticleTypeUuid = Guid.Parse(model.ArticleTypeUuid);
                }                
                entity.CoverPhoto = model.CoverPhoto;
                entity.ArticleName = model.ArticleName;
                entity.ReleaseTime = model.ReleaseTime;
                entity.IsRelease = Convert.ToInt32(model.IsRelease);
                if (model.CoverPhoto == ""|| model.CoverPhoto==null)
                {
                    response.SetFailed("封面图片未上传");
                    return Ok(response);
                }
                entity.CoverPhoto = model.CoverPhoto;
                entity.IsRecommend = model.IsRecommend;
                entity.ArticleUuid = Guid.NewGuid();
                entity.IsDelete = 0;
                entity.AddTime = DateTime.Now;
                _dbContext.ArticlesManagement.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:文章管理列表数据", _dbContext);
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
                var query = _dbContext.ArticlesManagement.FirstOrDefault(x => x.ArticleUuid == guid);
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
        public IActionResult Edit(ArticleViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.ArticlesManagement.FirstOrDefault(x => x.ArticleUuid.ToString() == model.ArticleUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (_dbContext.ArticlesManagement.Count(x => x.ArticleTitle == model.ArticleTitle && x.ArticleUuid.ToString() != model.ArticleUuid) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                entity.ArticleTitle = model.ArticleTitle;
                if (model.ArticleTypeUuid.ToString() != "")
                {
                    entity.ArticleTypeUuid = Guid.Parse(model.ArticleTypeUuid);
                }
                entity.ArticleName = model.ArticleName;
                if (model.CoverPhoto == "" || model.CoverPhoto == null)
                {
                    response.SetFailed("封面图片未上传");
                    return Ok(response);
                }
                entity.CoverPhoto = model.CoverPhoto;
                entity.IsRecommend = model.IsRecommend;
                entity.IsRelease = Convert.ToInt32(model.IsRelease);
                entity.ReleaseTime = model.ReleaseTime;
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:文章管理列表数据", _dbContext);
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
            if (command == "删除" || command == "delete")
            {
                _dbContext.Database.ExecuteSqlRaw("Update ArticlesManagement set IsDelete = '1' where ID in (" + ids + ")");
                ToLog.AddLog("删除", "成功:删除:文章管理列表数据", _dbContext);
            }
            else if(command == "恢复" || command == "recover")
            {
                _dbContext.Database.ExecuteSqlRaw("Update ArticleManagement set IsDelete='0' where ID in ("+ids+")");
                ToLog.AddLog("恢复", "成功:恢复:文章管理列表数据", _dbContext);
            }
            var response = ResponseModelFactory.CreateResultInstance;
            return response;
        }
        #endregion
        #endregion
    }
}
