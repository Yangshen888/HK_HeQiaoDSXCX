using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Intelligentguide;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Food;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Intelligentguide
{
    [Route("api/v1/intelligentguide/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class FoodController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public FoodController(haikanHeQiaoContext dbContext, IMapper mapper)
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
                var query = from p in _dbContext.Food
                            orderby p.CreateTime descending
                            select new 
                            {
                                p.FoodUuid,
                                p.FoodName,
                                p.Title,
                                p.Address,
                                ShopId = p.ShopId == null ? -1 : p.ShopId,
                                CreateTime = p.CreateTime.Value.ToString("yyyy-MM-dd"),
                                PlayType = p.PlayType == "1" ? "古镇游" : "周边游",
                                FoodorTechan = p.FoodorTechan == 0 ? "美食" : "特产",
                                p.Price,
                                p.IsDelete,
                                p.State
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.FoodName.Contains(payload.Kw.Trim()) || x.Address.Contains(payload.Kw.Trim()));
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
                ToLog.AddLog("查询", "成功:查询:美食特产列表数据", _dbContext);
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
        public IActionResult Create(FoodViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                if (_dbContext.Food.Count(x => x.FoodName == model.FoodName) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                //var entity = _mapper.Map<FoodViewModel, Food>(model);
                var entity = new Food();
                entity.Cover = model.Cover;
                entity.FoodName = model.FoodName;
                entity.Title = model.Title;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Price = model.Price;
                entity.ShopId = model.ShopId;
                entity.Picture = model.Picture;
                entity.PlayType = model.PlayType;
                entity.State = model.State;
                entity.FoodorTechan = model.FoodorTechan;
                entity.Lon = model.Lon;
                entity.Lat = model.Lat;
                entity.Ytype = model.Ytype;
                entity.CreateTime = Convert.ToDateTime(model.CreateTime);
                entity.FoodUuid = Guid.NewGuid();
                entity.IsDelete = 0;
                _dbContext.Food.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:美食特产列表数据", _dbContext);
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
                var entity = _dbContext.Food.FirstOrDefault(x => x.FoodUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(_mapper.Map<Food, FoodViewModel>(entity));
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
        public IActionResult Edit(FoodViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.Food.FirstOrDefault(x => x.FoodUuid == model.FoodUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (_dbContext.Food.Count(x => x.FoodName == model.FoodName && x.FoodUuid != model.FoodUuid) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                entity.Cover = model.Cover;
                entity.FoodName = model.FoodName;
                entity.Title = model.Title;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Price = model.Price;
                entity.ShopId = model.ShopId;
                entity.PlayType = model.PlayType;
                entity.Picture = model.Picture;
                entity.State = model.State;
                entity.FoodorTechan = model.FoodorTechan;
                entity.Lon = model.Lon;
                entity.Lat = model.Lat;
                entity.Ytype = model.Ytype;
                entity.CreateTime = Convert.ToDateTime(model.CreateTime);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:美食特产列表数据", _dbContext);
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
                var sql = string.Format("UPDATE Food SET IsDelete=@IsDel WHERE FoodUUID IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDel", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:美食特产列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
        #endregion
        #endregion


        /// <summary>
        /// 小程序美食列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowList()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                //var query = _dbContext.Food.Where(x=>x.IsDelete==0&&x.State==1&&x.FoodorTechan==0 && x.Ytype == "0").OrderBy(x => Guid.NewGuid()).Take(4).Select(x=>new 
                //{
                //    x.FoodUuid,
                //    x.CreateTime,
                //    x.FoodName,
                //    x.Title,
                //    x.Picture,
                //    x.Price,
                //    x.Address,
                //    x.Lon,
                //    x.Lat,
                //    x.Introduction,
                //    name=x.FoodName,
                //    key=x.FoodUuid,
                //    icon= image1url(x.Picture),
                //});
                var query = _dbContext.Food.Where(x => x.IsDelete == 0 && x.State == 1 && x.FoodorTechan == 0 && x.Ytype == "0").OrderBy(x => Guid.NewGuid()).Select(x => new
                {
                    x.FoodUuid,
                    x.CreateTime,
                    x.FoodName,
                    x.Title,
                    x.Picture,
                    x.Price,
                    x.Address,
                    x.ShopId,
                    x.Lon,
                    x.Lat,
                    x.Introduction,
                    name = x.FoodName,
                    key = x.FoodUuid,
                    //icon = image1url(x.Picture),
                    icon = image1url(x.Cover),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }
        }
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowList2()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                //var query = _dbContext.Food.Where(x => x.IsDelete == 0 && x.State == 1 && x.FoodorTechan == 0 && x.Ytype == "1").OrderBy(x => Guid.NewGuid()).Take(4).Select(x => new
                //{
                //    x.FoodUuid,
                //    x.CreateTime,
                //    x.FoodName,
                //    x.Title,
                //    x.Picture,
                //    x.Price,
                //    x.Address,
                //    x.Lon,
                //    x.Lat,
                //    x.Introduction,
                //    name = x.FoodName,
                //    key = x.FoodUuid,
                //    icon = image1url(x.Picture),
                //});
                var query = _dbContext.Food.Where(x => x.IsDelete == 0 && x.State == 1 && x.FoodorTechan == 0 && x.Ytype == "1").OrderBy(x => Guid.NewGuid()).Select(x => new
                {
                    x.FoodUuid,
                    x.CreateTime,
                    x.FoodName,
                    x.Title,
                    x.ShopId,
                    x.Picture,
                    x.Price,
                    x.Address,
                    x.Lon,
                    x.Lat,
                    x.Introduction,
                    name = x.FoodName,
                    key = x.FoodUuid,
                    //icon = image1url(x.Picture),
                    icon = image1url(x.Cover),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }
        }

        /// <summary>
        /// 小程序特产列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowtcList()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                var query = _dbContext.Food.Where(x => x.IsDelete == 0 && x.State == 1 && x.FoodorTechan == 1 && x.PlayType == "1").OrderBy(x => Guid.NewGuid()).Take(4).Select(x => new
                {
                    x.FoodUuid,
                    x.CreateTime,
                    x.FoodName,
                    x.Title,
                    x.Picture,
                    x.ShopId,
                    x.Price,
                    x.Address,
                    x.Lon,
                    x.Lat,
                    x.Introduction,
                    name = x.FoodName,
                    key = x.FoodUuid,
                    icon = image1url(x.Picture),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }
        }
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowtcList2()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                var query = _dbContext.Food.Where(x => x.IsDelete == 0 && x.State == 1 && x.FoodorTechan == 1 && x.PlayType == "2").OrderBy(x => Guid.NewGuid()).Take(4).Select(x => new
                {
                    x.FoodUuid,
                    x.CreateTime,
                    x.FoodName,
                    x.Title,
                    x.ShopId,
                    x.Picture,
                    x.Price,
                    x.Address,
                    x.Lon,
                    x.Lat,
                    x.Introduction,
                    name = x.FoodName,
                    key = x.FoodUuid,
                    icon = image1url(x.Picture),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }
        }

        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowtcList3()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                var query = _dbContext.Food.Where(x => x.IsDelete == 0 && x.State == 1 && x.FoodorTechan == 1).Select(x => new
                {
                    x.FoodUuid,
                    x.CreateTime,
                    x.FoodName,
                    x.ShopId,
                    x.Title,
                    x.Picture,
                    x.Price,
                    x.Address,
                    x.Lon,
                    x.Lat,
                    x.Introduction,
                    name = x.FoodName,
                    key = x.FoodUuid,
                    icon = image1url(x.Picture),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }
        }

        /// <summary>
        /// 拼接图片路径
        /// </summary>
        /// <param name="imgname"></param>
        /// <returns></returns>
        public static string image1url(string imgname) {
            return "UploadFiles/Food/"+imgname.Split(',')[0];
        }


    }
}
