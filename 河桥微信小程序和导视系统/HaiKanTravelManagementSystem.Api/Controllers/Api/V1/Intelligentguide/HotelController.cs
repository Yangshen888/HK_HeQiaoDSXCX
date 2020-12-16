using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.AuthContext;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.logs.TolLog;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Intelligentguide;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Hotel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Intelligentguide
{
    [Route("api/v1/intelligentguide/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class HotelController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public HotelController(haikanHeQiaoContext dbContext, IMapper mapper)
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
        public IActionResult List(HotelRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Hotel
                            orderby p.CreateTime descending
                            select new
                            {
                                p.HotelUuid,
                                p.Name,
                                p.Phone,
                                p.Address,
                                p.Price,
                                ShopId = p.ShopId == null ? -1 : p.ShopId,
                                p.IsDelete,
                                CreateTime = p.CreateTime.Value.ToString("yyyy-MM-dd"),
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
                ToLog.AddLog("查询", "成功:查询:酒店民宿列表数据", _dbContext);
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
        public IActionResult Create(HotelViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                if (_dbContext.Hotel.Count(x => x.Name == model.Name) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                var entity = new Hotel();
                entity.Name = model.Name;
                entity.Cover = model.Cover;
                entity.Phone = model.Phone;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Price = model.Price;
                entity.ShopId = model.ShopId;
                entity.Picture = model.Picture;
                entity.State = model.State;
                entity.Lon = model.Lon;
                entity.Lat = model.Lat;
                entity.CreateTime = Convert.ToDateTime(model.CreateTime);
                entity.HotelUrl = model.HotelUrl;
                //var entity = _mapper.Map<HotelViewModel, Hotel>(model);
                entity.HotelUuid = Guid.NewGuid();
                entity.IsDelete = 0;
                entity.AddTime = DateTime.Now;
                entity.AddPeople = AuthContextService.CurrentUser.DisplayName;
                _dbContext.Hotel.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:酒店民宿列表数据", _dbContext);
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
                var entity = _dbContext.Hotel.FirstOrDefault(x => x.HotelUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                response.SetData(_mapper.Map<Hotel, HotelViewModel>(entity));
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
        public IActionResult Edit(HotelViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;

            using (_dbContext)
            {
                var entity = _dbContext.Hotel.FirstOrDefault(x => x.HotelUuid == model.HotelUuid);
                if (entity == null)
                {
                    response.SetFailed("不存在");
                    return Ok(response);
                }
                if (_dbContext.Hotel.Count(x => x.Name == model.Name && x.HotelUuid != model.HotelUuid) > 0)
                {
                    response.SetFailed("名称已存在");
                    return Ok(response);
                }
                entity.Name = model.Name;
                entity.Cover = model.Cover;
                entity.Phone = model.Phone;
                entity.ShopId = model.ShopId;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Price = model.Price;
                entity.Picture = model.Picture;
                entity.State = model.State;
                entity.Lon = model.Lon;
                entity.Lat = model.Lat;
                entity.CreateTime = Convert.ToDateTime(model.CreateTime);
                entity.HotelUrl = model.HotelUrl;
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:酒店民宿列表数据", _dbContext);
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
                var sql = string.Format("UPDATE Hotel SET IsDelete=@IsDel WHERE HotelUUID IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDel", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:酒店民宿列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
        #endregion
        #endregion


        #region 房型信息操作
        /// <summary>
        /// 当前酒店房型信息列表
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult DecompInfo(HotelRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = _dbContext.HotelRoom.Where(x => x.HotelUuid.ToString() == payload.Kw && x.IsDelete == 0);
                query = query.OrderByDescending(x => x.Id);
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();
                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                ToLog.AddLog("查询", "成功:查询:酒店房型信息列表数据", _dbContext);
                return Ok(response);
            }

        }

        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult InfoCreate(HotelRoomViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {

                if (_dbContext.HotelRoom.Count(x => x.HotelRoomName == model.HotelRoomName && x.HotelUuid == model.HotelUuid) > 0)
                {
                    response.SetFailed("该房型已存在");
                    return Ok(response);
                }
                var entity = new HotelRoom();
                entity.HotelRoomUuid = Guid.NewGuid();
                entity.HotelUuid = model.HotelUuid;
                entity.HotelRoomName = model.HotelRoomName;
                entity.Price = model.Price;
                entity.Introduction = model.Introduction;
                entity.Address = model.Address;
                entity.Picture = model.Picture;
                entity.IsDelete = 0;
                _dbContext.HotelRoom.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:酒店房型信息列表数据", _dbContext);
                }
                response.SetSuccess("房型添加成功");
                return Ok(response);
            }

        }
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult InfoEdit(HotelRoomViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {

                var tdinfo = _dbContext.HotelRoom.FirstOrDefault(x => x.HotelRoomUuid == model.HotelRoomUuid);
                tdinfo.HotelUuid = model.HotelUuid;
                tdinfo.HotelRoomName = model.HotelRoomName;
                tdinfo.Price = model.Price;
                tdinfo.Introduction = model.Introduction;
                tdinfo.Address = model.Address;
                tdinfo.Picture = model.Picture;
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:酒店房型信息列表数据", _dbContext);
                }
                response.SetSuccess("编辑成功");
                return Ok(response);
            }
        }


        /// <summary>
        /// 获取当前条信息
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult InfoLoad(Guid guid)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = _dbContext.HotelRoom.FirstOrDefault(x => x.HotelRoomUuid == guid);
                response.SetData(entity);
                return Ok(response);
            }
        }


        /// <summary>
        /// 删除单个角色
        /// </summary>
        /// <param name="ids">ID,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet("{ids}")]
        [ProducesResponseType(200)]
        public IActionResult InfoDelete(string ids)
        {
            var response = ResponseModelFactory.CreateInstance;
            //if (ConfigurationManager.AppSettings.IsTrialVersion)
            //{
            //    response.SetIsTrial();
            //    return Ok(response);
            //}
            response = UpdateIsDelete2(CommonEnum.IsDeleted.Yes, ids);
            return Ok(response);
        }

        /// <summary>
        /// 删除角色
        /// </summary>
        /// <param name="isDeleted"></param>
        /// <param name="ids">角色ID字符串,多个以逗号隔开</param>
        /// <returns></returns>
        private ResponseModel UpdateIsDelete2(CommonEnum.IsDeleted isDeleted, string ids)
        {
            using (_dbContext)
            {
                var parameters = ids.Split(",").Select((id, index) => new SqlParameter(string.Format("@p{0}", index), id)).ToList();
                var parameterNames = string.Join(", ", parameters.Select(p => p.ParameterName));
                var sql = string.Format("UPDATE HotelRoom SET IsDelete=@isDeleted WHERE HotelRoomUuid IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@isDeleted", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:酒店房型信息列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }

        /// <summary>
        /// 删除多条批量操作
        /// </summary>
        /// <param name="command"></param>
        /// <param name="ids">角色ID,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]

        public IActionResult InfoBatch(string command, string ids)
        {
            var response = ResponseModelFactory.CreateInstance;
            switch (command)
            {
                case "delete":
                    if (ConfigurationManager.AppSettings.IsTrialVersion)
                    {
                        response.SetIsTrial();
                        return Ok(response);
                    }
                    response = UpdateIsDelete2(CommonEnum.IsDeleted.Yes, ids);
                    break;
                case "recover":
                    response = UpdateIsDelete2(CommonEnum.IsDeleted.No, ids);
                    break;
                default:
                    break;
            }
            return Ok(response);
        }



        #endregion

    }
}
