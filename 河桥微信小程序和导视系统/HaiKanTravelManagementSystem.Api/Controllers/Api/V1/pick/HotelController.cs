using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.pick
{
    [Route("api/v1/pick/[controller]/[action]")]
    [ApiController]
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
        ///<summary>
        ///app特色采摘信息
        /// </summary>
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowList()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                var query = _dbContext.Hotel.Where(x => x.IsDelete == 0 && x.State == 1).OrderBy(x => Guid.NewGuid()).Take(4).Select(x => new
                {
                    x.Name,
                    x.Phone,
                    x.Introduction,
                    x.Address,
                    x.Price,
                    x.Lon,
                    x.ShopId,
                    x.Lat,
                    x.Picture,
                    //name=x.Name,
                    //key=x.SpecialPickUuid,
                    icon= image1url(x.Picture),
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
                var query = from x in _dbContext.Hotel
                            where x.IsDelete == 0 && x.State == 1
                            select new
                            {
                                x.Name,
                                x.Phone,
                                x.Introduction,
                                x.ShopId,
                                x.Address,
                                x.Price,
                                x.Lon,
                                x.Lat,
                                x.Picture,
                                //name=x.Name,
                                //key=x.SpecialPickUuid,
                                icon = image1url(x.Picture),
                            };
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }
        }
        public static string image1url(string imgname)
        {
            return "UploadFiles/Hotel/" + imgname.Split(',')[0];
        }
    }
}
