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
    public class StrategyController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public StrategyController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }
        #region 后台管理列表
        /// <summary>
        /// 显示所有信息_攻略
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(WxStrategyRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Strategy
                            where p.Isdelete==0 &&p.ThroughStaues == 0&&p.AuditStaues== 1 && p.PlayType =="1"
                            orderby p.Id descending
                            select new
                            {
                                p.StrategyUuid,
                                p.Title,
                                p.PhotoUrl,
                                Count = p.Count == null ? 0 : p.Count,
                                p.AddPeople,
                                //Count=100,
                                Arturl= "https://cdn.uviewui.com/uview/example/fade.jpg"
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Title.Contains(payload.Kw.Trim()));
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                return Ok(response);
            }
        }
        [HttpPost]
        public IActionResult List2(WxStrategyRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Strategy
                            where p.Isdelete == 0 && p.ThroughStaues == 0 && p.AuditStaues == 1 && p.PlayType == "2" 
                            orderby p.Id descending
                            select new
                            {
                                p.StrategyUuid,
                                p.Title,
                                p.PhotoUrl,
                                Count = p.Count == null ? 0 : p.Count,
                                p.AddPeople,
                                //Count=100,
                                Arturl = "https://cdn.uviewui.com/uview/example/fade.jpg"
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Title.Contains(payload.Kw.Trim()));
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                return Ok(response);
            }
        }
        /// <summary>
        /// 显示所有信息——自驾路线
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult RoadList(WxStrategyRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Luxian
                            where p.IsDelete == 0 && p.State == 1 && p.PlayType == "1"
                            orderby p.Id descending
                            select new
                            {
                                p.LuxianUuid,
                                Title = p.Name,
                                PhotoUrl = p.Picture,
                                Count = p.Count == null ? 0 : p.Count,
                                AddPeople = p.Addpeople,
                                //Count = 100,
                                Arturl = "https://cdn.uviewui.com/uview/example/fade.jpg"
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Title.Contains(payload.Kw.Trim()));
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();
                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                return Ok(response);
            }
        }
        [HttpPost]
        public IActionResult RoadList2(WxStrategyRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Luxian
                            where p.IsDelete == 0 && p.State == 1 && p.PlayType == "2"
                            orderby p.Id descending
                            select new
                            {
                                p.LuxianUuid,
                                Title = p.Name,
                                PhotoUrl = p.Picture,
                                Count = p.Count == null ? 0 : p.Count,
                                AddPeople = p.Addpeople,
                                //Count = 100,
                                Arturl = "https://cdn.uviewui.com/uview/example/fade.jpg"
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Title.Contains(payload.Kw.Trim()));
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();
                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                return Ok(response);
            }
        }
        #endregion
        #region 获取详情
        /// <summary>
        /// 获取详情
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        [HttpGet("{guid}")]
        public IActionResult StrategyDetail(Guid guid)
        {
            using (_dbContext)
            {
                var response = ResponseModelFactory.CreateResultInstance;
                var entity = (from s in _dbContext.Strategy
                             where s.StrategyUuid == guid
                             select new
                             {
                                 s.StrategyUuid,
                                 s.Title,
                                 s.PhotoUrl,
                                 Count = s.Count == null ? 0 : s.Count,
                                 s.StrategyContent
                             }).FirstOrDefault();
                if (entity == null)
                {
                    response.SetFailed("数据获取失败");
                    return Ok(response);
                }

                response.SetData(entity);
                return Ok(response);
            }
        }


        /// <summary>
        /// 获取路线推荐详情
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        [HttpGet("{guid}")]
        public IActionResult getluxuan(Guid guid)
        {
            using (_dbContext)
            {
                var response = ResponseModelFactory.CreateResultInstance;
                var entity = (from s in _dbContext.Luxian
                              where s.LuxianUuid == guid
                              select new
                              {
                                  s.LuxianUuid,
                                  Title = s.Name,
                                  PhotoUrl = s.Picture,
                                  Count = s.Count == null ? 0 : s.Count,
                                  StrategyContent = s.Introduction,
                              }).FirstOrDefault();
                if (entity == null)
                {
                    response.SetFailed("数据获取失败");
                    return Ok(response);
                }

                response.SetData(entity);
                return Ok(response);
            }
        }

        /// <summary>
        /// 获取民俗文化详情
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        [HttpGet("{guid}")]
        public IActionResult getfff(Guid guid)
        {
            using (_dbContext)
            {
                var response = ResponseModelFactory.CreateResultInstance;
                var entity = (from s in _dbContext.ArticlesManagement
                              where s.ArticleUuid == guid
                              select new
                              {
                                  s.ArticleUuid,
                                  Title = s.ArticleTitle,
                                  PhotoUrl = s.CoverPhoto,
                                  Count = s.Count == null ? 0 : s.Count,
                                  StrategyContent = gettext(s.ArticleName),
                              }).FirstOrDefault();
                if (entity == null)
                {
                    response.SetFailed("数据获取失败");
                    return Ok(response);
                }

                response.SetData(entity);
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
        /// 路线推荐浏览量添加
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
                    var entity = _dbContext.Luxian.FirstOrDefault(x => x.LuxianUuid == Guid.Parse(guid));
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
        /// <summary>
        /// 游玩攻略浏览量添加
        /// </summary>
        /// <returns></returns>
        [HttpGet("{guid}")]
        public IActionResult youwan(string guid)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                if (guid != null && guid != "")
                {
                    var entity = _dbContext.Strategy.FirstOrDefault(x => x.StrategyUuid == Guid.Parse(guid));
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
        #endregion
    }
}
