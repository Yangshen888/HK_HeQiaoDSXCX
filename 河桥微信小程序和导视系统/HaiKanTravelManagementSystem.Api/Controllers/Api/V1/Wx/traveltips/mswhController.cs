using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.RequestPayload.Wx.traveltips;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Wx.traveltips
{
    [Route("api/v1/wx/traveltips/[controller]/[action]")]
    [ApiController]
    public class mswhController : ControllerBase
    {

        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        public mswhController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
    }


        /// <summary>
        /// 显示所有信息——民俗文化
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult minsuList(WxStrategyRequestPayload payload)
        {
            using (_dbContext)
            {
                //查询民俗文化所属uuid
                var nameuuid = _dbContext.ArticleType.FirstOrDefault(x => x.Name == "民俗文化").ArticleTypeUuid;

                var query = from a in _dbContext.ArticlesManagement
                            where a.IsDelete == 0 && a.IsRelease == 1 && a.ArticleTypeUuid == nameuuid
                            orderby a.Id descending
                            select new
                            {
                                a.ArticleUuid,
                                a.ArticleTitle,//文章标题
                                a.CoverPhoto,//封面图片
                                a.AddPeople,
                                articleName = gettext(a.ArticleName),
                                Count = a.Count==null?0:a.Count,
                                Arturl = a.CoverPhoto,
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.ArticleTitle.Contains(payload.Kw.Trim()));
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                return Ok(response);
            }
        }

        /// <summary>
        /// 去p
        /// </summary>
        /// <param name="text">文本</param>
        /// <returns></returns>
        public static string gettext(string text)
        {
            string txt = "";
            if (text != "" && text != null)
            {
                txt = text.Replace("<p>", "").Replace("</p>", "");
            }
            return txt;

        }


        /// <summary>
        /// 民俗文化-浏览量修改
        /// </summary>
        /// <returns></returns>
        [HttpGet("{guid}")]
        public IActionResult liulan(string guid)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                if (guid != null && guid != "")
                {
                    var entity = _dbContext.ArticlesManagement.FirstOrDefault(x => x.ArticleUuid == Guid.Parse(guid));
                    if (entity.Count == null)
                    {
                        entity.Count = 0;
                    }
                        entity.Count += 1;



                    _dbContext.SaveChanges();
                }


                response = ResponseModelFactory.CreateInstance;
                return Ok(response);
            }
        }





    }
}
