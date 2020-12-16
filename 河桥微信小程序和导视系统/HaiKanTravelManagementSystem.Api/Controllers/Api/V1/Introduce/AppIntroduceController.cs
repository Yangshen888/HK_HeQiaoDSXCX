using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Introduce
{
    [Route("api/v1/Introduce/[controller]/[action]")]
    [ApiController]
    public class AppIntroduceController : ControllerBase
    {

        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public AppIntroduceController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        /// <summary>
        /// 景点介绍列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult List()
        {
            var query = _dbContext.ScenicSpot.Where(x=>x.IsDelete==0 && x.PlayType == "1" && x.State == 1).ToList();
            var response = ResponseModelFactory.CreateResultInstance;
            response.SetData(query);
            return Ok(response);
        }
        [HttpGet]
        public IActionResult List2()
        {
            var query = _dbContext.ScenicSpot.Where(x => x.IsDelete == 0 && x.PlayType == "2" && x.State == 1).ToList();
            var response = ResponseModelFactory.CreateResultInstance;
            response.SetData(query);
            return Ok(response);
        }
    }
}
