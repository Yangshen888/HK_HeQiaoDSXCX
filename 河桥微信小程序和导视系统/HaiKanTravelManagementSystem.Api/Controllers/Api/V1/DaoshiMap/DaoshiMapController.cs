using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.DaoshiMap
{
    [Route("api/v1/DaoshiMap/[controller]/[action]")]
    [ApiController]
    public class DaoshiMapController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        private IWebHostEnvironment _hostingEnvironment;

        /// <summary>
        /// 
        /// </summary>
        /// <param name = "dbContext" ></ param >
        /// < param name="mapper"></param>
        public DaoshiMapController(haikanHeQiaoContext dbContext, IMapper mapper, IWebHostEnvironment hostingEnvironment)
        {
            _dbContext = dbContext;
            _mapper = mapper;
            _hostingEnvironment = hostingEnvironment;
        }

        /// <summary>
        /// 首页右侧景点滑动数据 && 地图请求景点信息
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult indexrightpicture()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.ScenicSpot
                            where c.IsDelete == 0 && c.State == 1
                            select new
                            {
                                c.Id,
                                c.ScenicSpotUuid,
                                c.Lon,
                                c.Lat,
                                Audio = c.Audio,
                                Content = c.SpotContent,
                                Name = c.Name == null ? "" : c.Name != null ? c.Name : "",                  //景点名字
                                Address = c.Address == null ? "" : c.Address != null ? c.Address : "",      //景点地址
                                Picture = image1url(c.Picture),
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }
        public static string image1url(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname)){
                return "https://hqjsc.hzgx.info/UploadFiles/Scene/Picture/" + imgname.Split(',')[0];
            }
            else {
                return "";
            }
        }


        /// <summary>
        /// 地图请求停车场数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult getcarparklist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.CarPark
                            where c.IsDelete == 0 && c.State == 1
                            select new
                            {
                                c.Id,
                                c.CarParkUuid,
                                Name = c.Name == null ? "" : c.Name != null ? c.Name : "",                  //停车场名字
                                Address = c.Address == null ? "" : c.Address != null ? c.Address : "",      //停车场地址
                                Price = c.Price == null ? "" : c.Price != null ? c.Price : "",              //价格
                                TruckSpace = c.TruckSpace,                                                  //总车位
                                SurplusTs = c.SurplusTs,                                                    //剩余车位
                                Picture = image1urlcar(c.Picture),                                             //图片
                                Lon = c.Lon,                                                                //经度
                                Lat = c.Lat,                                                                //纬度
                                Audio = "",
                                Content = "",
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }
        public static string image1urlcar(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/CarPark/" + imgname.Split(',')[0];
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 地图请求共享单车数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult getsharinglist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.Sharing
                            where c.IsDelete == 0 && c.State == 1
                            select new
                            {
                                c.Id,
                                c.SharingUuid,
                                Name = c.Name == null ? "" : c.Name != null ? c.Name : "",
                                Address = c.Address == null ? "" : c.Address != null ? c.Address : "",
                                Title = c.Title == null ? "" : c.Title != null ? c.Title : "",
                                Introduction = c.Introduction == null ? "" : c.Introduction != null ? c.Introduction : "",
                                Picture = image1urlSharing(c.Picture),
                                Lon = c.Lon,
                                Lat = c.Lat,
                                Audio = "",
                                Content = "",
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }
        public static string image1urlSharing(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/Xing/" + imgname.Split(',')[0];
            }
            else
            {
                return "";
            }
        }


        /// <summary>
        /// 地图请求医院数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult gethospitallist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.Hospital
                            where c.IsDeleted == 0
                            select new
                            {
                                c.Id,
                                c.HospitalUuid,
                                Name = c.HospitalName == null ? "" : c.HospitalName != null ? c.HospitalName : "",
                                Address = c.HospitalAddress == null ? "" : c.HospitalAddress != null ? c.HospitalAddress : "",
                                Telephone = c.Telephone == null ? "" : c.Telephone != null ? c.Telephone : "",
                                Picture = image1urlHospital(c.Picture),
                                Lon = c.Lon,
                                Lat = c.Lat,
                                Audio = "",
                                Content = "",
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }

        /// <summary>
        /// 地图请求公共厕所数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult getgtoiletlist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.Gtoilet
                            where c.IsDeleted == 0
                            select new
                            {
                                c.Id,
                                c.GtoiletUuid,
                                Name = c.GtoiletName == null ? "" : c.GtoiletName != null ? c.GtoiletName : "",
                                Address = c.GtoiletAddress == null ? "" : c.GtoiletAddress != null ? c.GtoiletAddress : "",
                                KongqiZhil = c.KongqiZhil == null ? "" : c.KongqiZhil != null ? c.KongqiZhil : "",
                                WaterYujin = c.WaterYujin == null ? "" : c.WaterYujin != null ? c.KongqiZhil : "",
                                GtoiletStaues = c.GtoiletStaues == null ? "" : c.GtoiletStaues != null ? c.GtoiletStaues : "",
                                Picture = image1urlHospital(c.Picture),
                                Lon = c.Lon,
                                Lat = c.Lat,
                                Audio = "",
                                Content = "",
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }

        /// <summary>
        /// 地图请求银行数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult getbanklist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.Bank
                            where c.IsDeleted == 0
                            select new
                            {
                                c.Id,
                                c.BankUuid,
                                Name = c.BankName == null ? "" : c.BankName != null ? c.BankName : "",
                                Address = c.BankAddress == null ? "" : c.BankAddress != null ? c.BankAddress : "",
                                Telephone = c.Telephone == null ? "" : c.Telephone != null ? c.Telephone : "",
                                Picture = image1urlHospital(c.Picture),
                                Lon = c.Lon,
                                Lat = c.Lat,
                                Audio = "",
                                Content = "",
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }
        public static string image1urlHospital(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/Life/" + imgname.Split(',')[0];
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 地图请求特产商店数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult getfoodtclist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.Food
                            where c.IsDelete == 0 && c.State == 1 && c.FoodorTechan == 1
                            select new
                            {
                                c.Id,
                                c.FoodUuid,
                                Name = c.FoodName == null ? "" : c.FoodName != null ? c.FoodName : "",
                                Address = c.Address == null ? "" : c.Address != null ? c.Address : "",
                                Title = c.Title == null ? "" : c.Title != null ? c.Title : "",
                                Introduction = c.Introduction == null ? "" : c.Introduction != null ? c.Introduction : "",
                                Picture = image1urlFood(c.Picture),                                                        
                                Lon = c.Lon,                                                                
                                Lat = c.Lat,
                                Audio = "",
                                Content = c.Introduction,
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }
        public static string image1urlFood(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/Food/" + imgname.Split(',')[0];
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 地图请求民宿数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult gethotellist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.Hotel
                            where c.IsDelete == 0 && c.State == 1
                            select new
                            {
                                c.Id,
                                c.HotelUuid,
                                Name = c.Name == null ? "" : c.Name != null ? c.Name : "",
                                Address = c.Address == null ? "" : c.Address != null ? c.Address : "",
                                Phone = c.Phone == null ? "" : c.Phone != null ? c.Phone : "",
                                Introduction = c.Introduction == null ? "" : c.Introduction != null ? c.Introduction : "",
                                HotelUrl = c.HotelUrl == null ? "" : c.HotelUrl != null ? c.HotelUrl : "",
                                Picture = image1urlHotel(c.Picture),
                                Lon = c.Lon,
                                Lat = c.Lat,
                                Audio = "",
                                Content = c.Introduction,
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }
        public static string image1urlHotel(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/Hotel/" + imgname.Split(',')[0];
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 地图请求特色采摘数据 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult getspecialpicklist()
        {
            using (_dbContext)
            {
                var query = from c in _dbContext.SpecialPick
                            where c.IsDelete == 0 && c.State == 1
                            select new
                            {
                                c.Id,
                                c.SpecialPickUuid,
                                Name = c.Name == null ? "" : c.Name != null ? c.Name : "",
                                Address = c.Address == null ? "" : c.Address != null ? c.Address : "",
                                Phone = c.Phone == null ? "" : c.Phone != null ? c.Phone : "",
                                Introduction = c.Introduction == null ? "" : c.Introduction != null ? c.Introduction : "",
                                Picture = image1urlSpecialPick(c.Picture),
                                Lon = c.Lon,
                                Lat = c.Lat,
                                Audio = "",
                                Content = c.Introduction,
                            };
                var reslist = query.ToList();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(reslist);
                return Ok(response);
            }
        }
        public static string image1urlSpecialPick(string imgname)
        {
            if (!string.IsNullOrEmpty(imgname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/SpecialPick/" + imgname.Split(',')[0];
            }
            else
            {
                return "";
            }
        }


        /// <summary>
        /// 通过机器编号 获取经纬度
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult getPointert(string indexNumId)
        {
            using (_dbContext)
            {
                var query = _dbContext.Pointer.FirstOrDefault(x => x.PointerNum == indexNumId && x.IsDelete == 0);
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query);
                return Ok(response);
            }
        }


    }
}
