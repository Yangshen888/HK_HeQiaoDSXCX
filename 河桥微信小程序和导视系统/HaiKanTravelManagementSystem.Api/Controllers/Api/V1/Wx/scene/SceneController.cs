using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Wx.scene
{
    [Route("api/v1/wx/scene/[controller]/[action]")]
    [ApiController]
    public class SceneController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public SceneController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }
        ///<summary>
        ///获取景点详情
        /// </summary>
        [HttpGet("{guid}")]
        public IActionResult GetSceneSpot(Guid guid)
        {
            using (_dbContext)
            {
                var response = ResponseModelFactory.CreateResultInstance;
                var scene = (from s in _dbContext.ScenicSpot
                            where s.ScenicSpotUuid == guid
                            select new
                            {
                                s.Name ,
                                s.SpotContent,
                                s.Address,
                                s.Picture,
                                s.Video,
                                s.Audio,
                            }).FirstOrDefault();
                if (scene==null)
                {
                    response.SetFailed("景点数据获取失败");
                    return Ok(response);
                }

                response.SetData(scene);
                return Ok(response);
            }
                
        }
    }
}
