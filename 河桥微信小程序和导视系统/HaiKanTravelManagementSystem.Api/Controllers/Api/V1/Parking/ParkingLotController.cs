using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Models.ParkingLot;
using HaiKanTravelManagementSystem.Api.RequestPayload.Parking;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Parking
{
    [Route("api/v1/Parking/[controller]/[action]")]
    [ApiController]
    public class ParkingLotController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public ParkingLotController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        /// <summary>
        /// 小程序停车场列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public IActionResult ParkingList(ParkingQueryPayload payload)
        {
            using (_dbContext)
            {
                var response = ResponseModelFactory.CreateInstance;
                var query = _dbContext.CarPark.Where(x => x.IsDelete == 0 && x.State == 1);
                var querydc = _dbContext.Sharing.Where(x => x.IsDelete == 0 && x.State == 1);
                var querybus = _dbContext.Bus.Where(x => x.IsDelete == 0 && x.State == 1);
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    if (payload.Type == 2) {
                        querydc = querydc.Where(x => x.Name.Contains(payload.Kw));
                    }
                    if (payload.Type == 1)
                    {
                        query = query.Where(x => x.Name.Contains(payload.Kw));
                    }
                    else { 
                        querybus = querybus.Where(x => x.BegainSite.Contains(payload.Kw));
                    }
                }
                //List<ParkingLot> parkingLots = new List<ParkingLot>();
                var query2 = query.Select(x =>new ParkingLot
                {
                    Lon = x.Lon.Value,
                    Lat = x.Lat.Value,
                    Id=x.Id,
                    CarParkUuid=x.CarParkUuid,
                    Name=x.Name,
                    Picture=x.Picture,
                    TruckSpace=x.TruckSpace,
                    SurplusTs=x.SurplusTs,
                    Distance = (int)(GetDistance2(payload.Lat, payload.Lon, (double)x.Lat.Value, (double)x.Lon.Value)/1000)
                });
                var query3 = querydc.Select(x => new Sharing
                {
                    Id = x.Id,
                    SharingUuid = x.SharingUuid,
                    Name = x.Name,
                    Address = x.Address,
                    Picture = x.Picture,
                    Lon = x.Lon,
                    Lat = x.Lat,
                });
                var query4 = querybus.Select(x => new Bus
                {
                    Id = x.Id,
                    BusUuid = x.BusUuid,
                    Introduction = x.Introduction,
                    Picture = x.Picture,
                    BegainSite = x.BegainSite,
                    EndSite = x.EndSite,
                });
                if (payload.Type==1)
                {
                    var list = query2.ToList().AsQueryable().OrderBy(x => x.Distance).Paged(payload.CurrentPage, payload.PageSize).ToList();
                    response.SetData(list);
                }
                else if (payload.Type == 2)
                {
                    var list = query3.Paged(payload.CurrentPage, payload.PageSize).ToList();
                    response.SetData(list);
                    //var list = query2.ToList().AsQueryable().OrderByDescending(x => x.SurplusTs).Paged(payload.CurrentPage, payload.PageSize).ToList();
                    //response.SetData(list);
                }
                else
                {
                    var list = query4.Paged(payload.CurrentPage, payload.PageSize).ToList();
                    response.SetData(list);
                }
                return Ok(response);
            }
        }

        private const double EARTH_RADIUS = 6378137;

        public static double GetDistance2(double lat1, double lng1, double lat2, double lng2)
        {
            double radLat1 = Rad(lat1);
            double radLng1 = Rad(lng1);
            double radLat2 = Rad(lat2);
            double radLng2 = Rad(lng2);
            double a = radLat1 - radLat2;
            double b = radLng1 - radLng2;
            double result = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) + Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2))) * EARTH_RADIUS;
            return result;
        }

        /// <summary>
        /// 经纬度转化成弧度
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        private static double Rad(double d)
        {
            return (double)d * Math.PI / 180d;
        }

        /// <summary>
        /// 小程序停车场详情
        /// </summary>
        /// <param name="uuid"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult ParkingInfo(Guid uuid)
        {
            var response = ResponseModelFactory.CreateInstance;

            //if (string.IsNullOrEmpty(uuid))
            //{
            //    response.SetFailed("uuid错误");
            //    return Ok(response);
            //}
            using (_dbContext)
            {
                var entity = _dbContext.CarPark.FirstOrDefault(x => x.CarParkUuid == uuid);
                response.SetData(entity);
                return Ok(response);
            }
        }
        /// <summary>
        /// 小程序公交线路详情
        /// </summary>
        /// <param name="uuid"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Businfo(Guid uuid)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = _dbContext.Bus.FirstOrDefault(x => x.BusUuid == uuid);
                response.SetData(entity);
                return Ok(response);
            }
        }


        private static double GetDistance(double lat1, double lng1, double lat2, double lng2)
        {
            try
            {
                var b = Math.PI / 180;
                var c = Math.Sin((lat2 - lat1) * b / 2);
                var d = Math.Sin((lng2 - lng1) * b / 2);
                var a = c * c + d * d * Math.Cos(lat1 * b) * Math.Cos(lat2 * b);
                return 12756274 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));
            }
            catch (Exception)
            {

                return 0;
            }
        }

    }
}
