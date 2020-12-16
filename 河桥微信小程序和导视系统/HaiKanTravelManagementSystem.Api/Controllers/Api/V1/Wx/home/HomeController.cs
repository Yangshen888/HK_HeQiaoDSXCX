using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.RequestPayload.Wx.home;
using HaiKanTravelManagementSystem.Api.ViewModels.Strategy;
using HtmlAgilityPack;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Wx.home
{
    [Route("api/v1/wx/home/[controller]/[action]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public HomeController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }
        #region 后台管理列表
        /// <summary>
        /// 全局搜索
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List2(HomeRequestPayload2 payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Searchl
                            select new
                            {
                                p.Guid,
                                p.Text,
                                p.Url
                            };
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Text.Contains(payload.Kw.Trim()));
                }
                var list = query.ToList();

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list);
                return Ok(response);
                
            }
        }
        /// <summary>
        /// 显示所有信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(HomeRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.ScenicSpot
                            where p.IsDelete==0&&p.State==1
                            select new
                            {
                                p.ScenicSpotUuid,
                                p.Name,
                                p.Address,
                                p.OrderBy,
                                p.Picture,
                                p.SpotContent,
                                p.CreateTime
                            };
                //if (!string.IsNullOrEmpty(payload.Kw))
                //{
                //    query = query.Where(x => x.Name.Contains(payload.Kw.Trim()) || x.Address.Contains(payload.Kw.Trim()));
                //}
                

                query = query.OrderBy(x => x.OrderBy);
                var list = query.Paged(payload.CurrentPage, payload.PageSize).ToList();

                var totalCount = query.Count();
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(list, totalCount);
                return Ok(response);
            }
        }
        /// <summary>
        /// 显示所有酒店民宿信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult HotelList()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Hotel
                            where p.IsDelete == 0 && p.State == 1
                            select new
                            {
                                type = "hotel",
                                p.Id,
                                p.Name,
                                p.Address,
                                p.ShopId,
                                p.Lon,
                                p.Lat,
                                p.Picture,
                                p.Introduction,
                            };
           
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }

        /// <summary>
        /// 显示所有美食信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Foodlist()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Food
                            where p.IsDelete == 0 && p.State == 1 && p.FoodorTechan == 0
                            select new
                            {
                                type = "food",
                                p.Id,
                                Name = p.FoodName,
                                p.Address,
                                p.ShopId,
                                p.Lon,
                                p.Lat,
                                p.Picture,
                                p.Introduction,
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }

        /// <summary>
        /// 显示所有特产信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult FoodorList()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Food
                            where p.IsDelete == 0 && p.State == 1 && p.FoodorTechan == 1
                            select new
                            {
                                type = "techan",
                                p.Id,
                                Name = p.Title + "(" + p.FoodName + ")",
                                p.Address,
                                p.Lon,
                                p.ShopId,
                                p.Lat,
                                p.Picture,
                                p.Introduction,
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
        /// <summary>
        /// 显示所有停车场信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Picklist()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.CarPark
                            where p.IsDelete == 0 && p.State == 1
                            select new
                            {
                                type ="pick",
                                p.CarParkUuid,
                                p.Id,
                                Name = p.Name,
                                p.Address,
                                Lon = p.Lon,
                                Lat = p.Lat,
                                p.Picture,
                                Introduction = "",
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
        
 
        /// <summary>
        /// 显示所有景点信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Scienlist(Guid UserUuid)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.ScenicSpot
                            where p.IsDelete == 0 && p.State == 1
                            select new
                            {
                                userUuid = p.ScenicSpotUuid,
                                type = "scien",
                                p.Id,
                                Name = p.Name,
                                p.Address,
                                p.ShopId,
                                p.Lon,
                                p.Lat,
                                p.Picture,
                                Audio = Audiourl(p.Audio),
                                Introduction = p.SpotContent,
                                dakType = GetDistance(p.ScenicSpotUuid, _dbContext, UserUuid),
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
        public static string Audiourl(string audioname)
        {
            if (!string.IsNullOrEmpty(audioname))
            {
                return "https://hqjsc.hzgx.info/UploadFiles/Scene/Audio/" + audioname;
            }
            else
            {
                return "";
            }
        }

        public static string GetDistance(Guid ScenicSpotUuid, haikanHeQiaoContext _dbContext,Guid UserUuid)
        {   
                string stau = "未打卡";
                int querys = _dbContext.Attractions.Where(x => x.UserUuid == UserUuid && x.SceientUuid == ScenicSpotUuid).ToList().Count();
                if (querys > 0) {
                    stau = "已打卡";
                }
                return stau;
        }
        /// <summary>
        /// 显示所有公厕信息
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Gtoiletlist()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Gtoilet
                            where p.IsDeleted == 0 
                            select new
                            {
                                type = "gtoilet",
                                p.Id,
                                Name = p.GtoiletName,
                                Address = p.GtoiletAddress,
                                p.Lon,
                                p.Lat,
                                p.GtoiletUuid,
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }

        /// <summary>
        /// 显示所有银行
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult banklist()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Bank
                            where p.IsDeleted == 0 
                            select new
                            {
                                p.BankUuid,
                                p.Id,
                                Name = p.BankName,
                                p.BankAddress,
                                Lon = p.Lon,
                                Lat = p.Lat,
                                phone = p.Telephone,
                                imageurl = imagerull(p.Picture),
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
        /// <summary>
        /// 显示所有医院
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult hospitallist()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Hospital
                            where p.IsDeleted == 0
                            select new
                            {
                                p.HospitalUuid,
                                p.Id,
                                Name = p.HospitalName,
                                p.HospitalAddress,
                                Lon = p.Lon,
                                Lat = p.Lat,
                                phone = p.Telephone,
                                imageurl = imagerull(p.Picture),
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }

        public static string imagerull(string imgname)
        {
            return "https://hqjsc.hzgx.info/UploadFiles/Life/" + imgname;
        }
        /// <summary>
        /// 显示所有公厕
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult ggggtoiletlist()
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Gtoilet
                            where p.IsDeleted == 0
                            select new
                            {
                                p.GtoiletUuid,
                                p.Id,
                                Name = p.GtoiletName,
                                p.GtoiletAddress,
                                Lon = p.Lon,
                                Lat = p.Lat,
                                imageurl = imagerull(p.Picture),
                            };

                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
        #endregion

        /// <summary>
        /// 添加打卡信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult addlist(UserViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                if (_dbContext.Attractions.Count(x => x.SceientUuid == model.ScenienUuid && x.UserUuid == model.SystemUserUuid) > 0)
                {
                    response.SetFailed("该景点已打卡,请勿重复操作");
                    return Ok(response);
                }
                var entity = new Attractions();
                entity.SceientUuid = model.ScenienUuid;
                entity.Evaluate = model.Evaluate;
                entity.Picture = model.Picture;
                entity.UserUuid = model.SystemUserUuid;
                entity.AddTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm;ss");
                entity.Praise = 0;
                entity.AttractionsUuid = Guid.NewGuid();
                _dbContext.Attractions.Add(entity);
                _dbContext.SaveChanges();
                response.SetSuccess();
                return Ok(response);
            }
        }

        /// <summary>
        /// 显示所有改景点的评论
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult infolist1(HomeRequestPayload payload)
        {
            using (_dbContext)
            {
                var query = from p in _dbContext.Attractions
                            where p.SceientUuid.ToString() == payload.Kw
                            select new
                            {
                                p.AttractionsUuid,
                                p.SceientUuid,
                                type = "scien",
                                p.Id,
                                Picture = p.Picture == "" ? "" : image1url(p.Picture),
                                p.Evaluate,
                                p.AddTime,
                                p.Praise,
                                UserName = GetUserName(p.UserUuid, _dbContext),
                            };
                query = query.OrderByDescending(p => p.Id);
                var response = ResponseModelFactory.CreateResultInstance;
                response.SetData(query.ToList());
                return Ok(response);
            }
        }
        [HttpPost]
        public IActionResult infolist2(HomeRequestPayload payload)
        {

            var response = ResponseModelFactory.CreateResultInstance;
            var query4 = _dbContext.Attractions.Where(x => x.SceientUuid.ToString() == payload.Kw);
            var list = query4.OrderByDescending(p => p.Id).Select(p => new
            {
                p.AttractionsUuid,
                p.SceientUuid,
                type = "scien",
                p.Id,
                Picture = p.Picture == "" ? "" : image1url(p.Picture),
                p.Evaluate,
                p.AddTime,
                p.Praise,
                UserName = GetUserName(p.UserUuid, _dbContext),
            }).Paged(payload.CurrentPage, payload.PageSize).ToList(); ;
            response.SetData(list);

            return Ok(response);

        }
        /// <summary>
        /// 拼接图片路径
        /// </summary>
        /// <param name="imgname"></param>
        /// <returns></returns>
        public static string image1url(string imgname)
        {
            return "UploadFiles/Traveltips/Strategy/" + imgname;
        }

        public static string GetUserName(Guid? UserUuid, haikanHeQiaoContext _dbContext)
        {
            string stau = "";
            var querys = _dbContext.SystemUser.FirstOrDefault(x => x.SystemUserUuid == UserUuid);
            stau = querys.LoginName;
            return stau;
        }
        /// <summary>
        /// 推荐列表
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Recommend(HomeRequestPayload payload)
        {
            var response = ResponseModelFactory.CreateResultInstance;
            //var query1 = _dbContext.ScenicSpot.Select(x => new Information
            //{
            //    Uuid = x.ScenicSpotUuid,
            //    Title = x.Name,
            //    Type = "img",
            //    Url = x.Picture,
            //    IsRecommend = x.IsRecommend,
            //    IsDel = x.IsDelete,
            //    Time = x.CreateTime,
            //}).Where(x => x.IsRecommend == true && x.IsDel == 0).OrderByDescending(x => x.Time);
            //var query2 = _dbContext.PromotionalVideo.Select
            //    (x => new Information
            //    {
            //        Uuid = x.PromotionalVideoUuid,
            //        Title = x.Title,
            //        Type = "video",
            //        Url= x.Video,
            //        IsRecommend=x.IsRecommend,
            //        IsDel=x.IsDeleted,
            //        Time= x.CreateTime,
            //    }).Where(x => x.IsDel == 0 && x.IsRecommend == true).OrderByDescending(x => x.Time);
            //var query3 = _dbContext.ArticlesManagement.Select(x => new Information
            //{
            //    Uuid = x.ArticleUuid,
            //    Title=x.ArticleTitle,
            //    Type="img",
            //    Url= x.CoverPhoto,
            //    IsRecommend=x.IsRecommend,
            //    IsDel=x.IsDelete,
            //    Time=x.AddTime,
            //}).Where(x => x.IsDel == 0 && x.IsRecommend == true).OrderByDescending(x => x.Time);

            //var query4 = query1.Union(query2.Union(query3));
            var query4 = _dbContext.Cabinet.Where(x => x.IsRecommend == true);
            var list = query4.OrderByDescending(x => x.Time).ToList();
            response.SetData(list);

            return Ok(response);

        }

        /// <summary>
        /// 非推荐列表
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Discovery(HomeRequestPayload payload)
        {

            var response = ResponseModelFactory.CreateResultInstance;
            //var query1 = _dbContext.ScenicSpot.Select(x => new Information
            //{
            //    Uuid = x.ScenicSpotUuid,
            //    Title = x.Name,
            //    Type = "img",
            //    Url = x.Picture,
            //    IsRecommend= x.IsRecommend,
            //    IsDel = x.IsDelete,
            //    Time = x.CreateTime,
            //}).Where(x => x.IsRecommend == false && x.IsDel == 0).OrderByDescending(x => x.Time);
            //var query2 = _dbContext.PromotionalVideo.Select
            //    (x => new Information
            //    {
            //        Uuid = x.PromotionalVideoUuid,
            //        Title = x.Title,
            //        Type = "video",
            //        Url = x.Video,
            //        IsRecommend=x.IsRecommend,
            //        IsDel = x.IsDeleted,
            //        Time = x.CreateTime,
            //    }).Where(x => x.IsDel == 0 && x.IsRecommend == false).OrderByDescending(x => x.Time);
            //var query3 = _dbContext.ArticlesManagement.Select(x => new Information
            //{
            //    Uuid = x.ArticleUuid,
            //    Title = x.ArticleTitle,
            //    Type = "img",
            //    Url = x.CoverPhoto,
            //    IsRecommend=x.IsRecommend,
            //    IsDel = x.IsDelete,
            //    Time = x.AddTime,
            //}).Where(x => x.IsDel == 0 && x.IsRecommend == false).OrderByDescending(x => x.Time);

            //var query4 = query1.Union(query2.Union(query3));
            var query4 = _dbContext.Cabinet.Where(x => x.IsRecommend == false&&x.Type!="video");
            var list = query4.OrderByDescending(x => x.Time).Select(x=>new 
            {
                x.Id,
                x.IsDel,
                x.IsRecommend,
                x.Time,
                x.Title,
                x.Type,
                x.Url,
                x.Uuid,
                Content=x.Type=="aimg"?GetContent(x.Content):x.Content.Trim().Substring(0,(x.Content.Trim().Length>=25?25:x.Content.Trim().Length)),
            }).Paged(payload.CurrentPage, payload.PageSize).ToList(); ;
            response.SetData(list);

            return Ok(response);

        }

        /// <summary>
        /// 获取文章详情
        /// </summary>
        /// <param name="type"></param>
        /// <param name="uuid"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Info(string type,Guid uuid)
        {
            var response = ResponseModelFactory.CreateResultInstance;
            if (type == "aimg")
            {
                var entity = _dbContext.ArticlesManagement.Select(x=>new 
                {
                    x.ArticleUuid,
                    x.IsDelete,
                    Title=x.ArticleTitle,
                    Content=x.ArticleName,
                    Url=x.CoverPhoto,
                }).FirstOrDefault(x => x.ArticleUuid == uuid&&x.IsDelete==0);
                response.SetData(entity);
            }
            if (type == "simg")
            {
                var entity = _dbContext.ScenicSpot.Select(x=>new 
                {
                    x.ScenicSpotUuid,
                    x.IsDelete,
                    Title=x.Name,
                    Content=x.SpotContent,
                    Url=x.Picture,
                }).FirstOrDefault(x => x.ScenicSpotUuid == uuid && x.IsDelete == 0);
                response.SetData(entity);

            }
            //response.SetData(list);

            return Ok(response);
        }


        /// <summary>
        /// 获取正文
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        private static string GetContent(string content)
        {
            StringBuilder builder = new StringBuilder();
            var htmlDoc = new HtmlDocument();
            if (string.IsNullOrEmpty(content))
            {
                return builder.ToString();
            }
            htmlDoc.LoadHtml(content);

            var htmlNodes = htmlDoc.DocumentNode.SelectNodes("//p");
            if (htmlNodes != null)
            {
                foreach (var node in htmlNodes)
                {
                    if (builder.Length > 0)
                    {
                        builder.Append("\n");
                    }
                    builder.Append(node.InnerText);
                }
            }
            var b = builder.ToString();
            var str= b.Substring(0, (b.Length>=25?25:b.Length));
            return str;
        }




    }

    internal class Information
    {
        public Guid Uuid { get; set; }
        public string Title { get; set; }
        public string Type { get; set; }
        public string Url { get; set; }
        public bool IsRecommend { get; set; }
        public int? IsDel { get; set; }
        public DateTime? Time { get; set; }

    }
}
