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
    public class PickController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public PickController(haikanHeQiaoContext dbContext, IMapper mapper)
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
                var query = _dbContext.SpecialPick.Where(x => x.IsDelete == 0 && x.State == 1 && x.PlayType == "1").OrderBy(x => Guid.NewGuid()).Take(4).Select(x => new
                {
                    x.Name,
                    x.Phone,
                    x.Introduction,
                    x.Address,
                    x.Price,
                    x.Picture,
                    x.Lon,
                    x.Lat,
                    //name=x.Name,
                    //key=x.SpecialPickUuid,
                    icon = image1url(x.Picture),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }
        }
        ///<summary>
        ///app特色采摘信息
        /// </summary>
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowList2()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                var query = _dbContext.SpecialPick.Where(x => x.IsDelete == 0 && x.State == 1 && x.PlayType == "2").OrderBy(x => Guid.NewGuid()).Take(4).Select(x => new
                {
                    x.Name,
                    x.Phone,
                    x.Introduction,
                    x.Address,
                    x.Price,
                    x.Picture,
                    x.Lon,
                    x.Lat,
                    //name=x.Name,
                    //key=x.SpecialPickUuid,
                    icon = image1url(x.Picture),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }

        }

        [HttpPost]
        [Microsoft.AspNetCore.Authorization.AllowAnonymous]
        public IActionResult ShowList3()
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                var query = _dbContext.SpecialPick.Where(x => x.IsDelete == 0 && x.State == 1).Select(x => new
                {
                    x.Name,
                    x.Phone,
                    x.Introduction,
                    x.Address,
                    x.Price,
                    x.Picture,
                    x.Lon,
                    x.Lat,
                    //name=x.Name,
                    //key=x.SpecialPickUuid,
                    icon = image1url(x.Picture),
                });
                var list = query.ToList();
                response.SetData(list);
                return Ok(response);
            }

        }

        public static string image1url(string imgname)
        {
            return "UploadFiles/SpecialPick/" + imgname.Split(',')[0];
        }
    }
}
