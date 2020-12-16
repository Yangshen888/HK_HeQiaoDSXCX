using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HaiKan3.Utils;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.AuthContext;
using HaiKanTravelManagementSystem.Api.RequestPayload.Parking;
using HaiKanTravelManagementSystem.Api.ViewModels;
using HaiKanTravelManagementSystem.Api.ViewModels.Strategy;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace HaiKanTravelManagementSystem.Api.Controllers.Api.V1.Gereninfo
{
    [Route("api/v1/Gereninfo/[controller]/[action]")]
    [ApiController]
    public class GereninfoController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        private IWebHostEnvironment _hostingEnvironment;
        private readonly ILogger _logger;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public GereninfoController(haikanHeQiaoContext dbContext, IMapper mapper, IWebHostEnvironment hostingEnvironment, ILogger<GereninfoController> logger)
        {
            _dbContext = dbContext;
            _mapper = mapper;
            _hostingEnvironment = hostingEnvironment;
            _logger = logger;
        }
        /// <summary>
        /// 个人信息
        /// </summary>
        /// <param name="systemUserUuid"></param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult conList(Guid systemUserUuid)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = from x in _dbContext.SystemUser
                             where x.SystemUserUuid == systemUserUuid
                             select new
                             {
                                 x.SystemUserUuid,
                                 x.Id,
                                 Nickname = x.Nickname == null ? "暂无" : x.Nickname != "" ? x.Nickname : "暂无",
                                 LoginName = x.LoginName == null ? "暂无" : x.LoginName != "" ? x.LoginName : "暂无",
                                 UserIdCard = x.UserIdCard == null ? "暂无" : x.UserIdCard != "" ? x.UserIdCard : "暂无",
                                 Email = x.Email == null ? "暂无" : x.Email != "" ? x.Email : "暂无",
                                 Phone = x.Phone == null ? "暂无" : x.Phone != "" ? x.Phone : "暂无",
                                 Placeofresidence = x.Placeofresidence == null ? "暂无" : x.Placeofresidence != "" ? x.Placeofresidence : "暂无",
                                 Wechat = x.Wechat == null ? "暂无" : x.Wechat != "" ? x.Wechat : "暂无",
                                 Sex = x.Sex == null ? "暂无" : x.Sex != "" ? x.Sex : "暂无",
                                 Age = x.Age == null ? "暂无" : x.Age != "" ? x.Age : "暂无",
                             };
                var query = entity.ToList();
                response.SetData(query);
                return Ok(response);
            }
        }

        /// <summary>
        /// 修改个人信息页面加载
        /// </summary>
        /// <param name="systemUserUuid"></param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult GetList(Guid systemUserUuid)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = from x in _dbContext.SystemUser
                             where x.SystemUserUuid == systemUserUuid
                             select new
                             {
                                 x.SystemUserUuid,
                                 x.Id,
                                 Nickname = x.Nickname == null ? "" : x.Nickname != null ? x.Nickname : "",
                                 UserIdCard = x.UserIdCard == null ? "" : x.UserIdCard != null ? x.UserIdCard : "",
                                 Email = x.Email == null ? "" : x.Email != null ? x.Email : "",
                                 Phone = x.Phone == null ? "" : x.Phone != null ? x.Phone : "",
                                 Placeofresidence = x.Placeofresidence == null ? "" : x.Placeofresidence != null ? x.Placeofresidence : "",
                                 Wechat = x.Wechat == null ? "" : x.Wechat != null ? x.Wechat : "",
                                 Sex = x.Sex == null ? "" : x.Sex != null ? x.Sex : "",
                                 Age = x.Age == null ? "" : x.Age != null ? x.Age : "",
                             };
                var query = entity.ToList();
                response.SetData(query);
                return Ok(response);
            }
        }

        /// <summary>
        /// 修改个人信息保存
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
                //var entity = new HaiKanTravelManagementSystem.Api.Entities.SystemUser();
                var entity = _dbContext.SystemUser.FirstOrDefault(x => x.SystemUserUuid == model.SystemUserUuid);
                entity.Nickname = model.Nickname;
                entity.UserIdCard = model.UserIdCard;
                entity.Sex = model.Sex;
                entity.Phone = model.Phone;
                entity.Age = model.Age;
                entity.Placeofresidence = model.Placeofresidence;
                //_dbContext.SystemUser.Add(entity);
                _dbContext.SaveChanges();
                response.SetSuccess();
                return Ok(response);
            }
        }

        /// <summary>
        /// 留言建议
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult addliuyan(UserViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = new HaiKanTravelManagementSystem.Api.Entities.Leavemessage();
                entity.LeavemessageUuid = Guid.NewGuid();
                entity.Content = model.Neirong;
                entity.UserUuid = model.SystemUserUuid;
                entity.Createtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                entity.Isdelete = "0";
                _dbContext.Leavemessage.Add(entity);
                _dbContext.SaveChanges();
                response.SetSuccess();
                return Ok(response);
            }
        }


        /// <summary>
        /// 攻略列表
        /// </summary>
        /// <param name="systemUserUuid"></param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult GetLiNew(Guid systemUserUuid)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = from x in _dbContext.Strategy
                             where x.SystemUserUuid == systemUserUuid &&  x.Isdelete == 0 //x.ThroughStaues == 0 &&
                             select new
                             {
                                 x.SystemUserUuid,
                                 x.Id,
                                 x.StrategyUuid,
                                 Title = x.Title == null ? "" : x.Title != null ? x.Title : "",
                                 StrategyContent = x.StrategyContent == null ? "" : x.StrategyContent != null ? x.StrategyContent : "",
                                 PhotoUrl = x.PhotoUrl == null ? "" : x.PhotoUrl != null ? x.PhotoUrl : "",
                                 x.AddTime,
                                 x.AuditStaues,
                                 x.ThroughStaues,
                             };
                entity = entity.OrderByDescending(x => x.Id);
                var query = entity.ToList();
                response.SetData(query);
                return Ok(response);
            }
        }
        /// <summary>
        /// 所有人可看攻略列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult GetLiNewAll()
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = from x in _dbContext.Strategy
                             where x.ThroughStaues == 0 && x.Isdelete == 0
                             orderby x.AddTime descending
                             select new
                             {
                                 x.SystemUserUuid,
                                 x.Id,
                                 x.StrategyUuid,
                                 Title = x.Title == null ? "" : x.Title != null ? x.Title : "",
                                 StrategyContent = x.StrategyContent == null ? "" : x.StrategyContent != null ? x.StrategyContent : "",
                                 PhotoUrl = x.PhotoUrl == null ? "" : x.PhotoUrl != null ? x.PhotoUrl : "",
                                 x.AddTime,
                             };
                entity = entity.OrderByDescending(x => x.Id);
                var query = entity.ToList();
                response.SetData(query);
                return Ok(response);
            }
        }

        /// <summary>
        /// 攻略发布
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult addgonglue(UserViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var entity = new HaiKanTravelManagementSystem.Api.Entities.Strategy();
                entity.StrategyUuid = Guid.NewGuid();
                entity.Title = model.Title;
                if (model.TipsType != null && model.TipsType != "")
                {
                    if (model.TipsType == "游玩攻略")
                    {
                        entity.TipsType = 1;
                    }
                    if (model.TipsType == "路线推荐")
                    {
                        entity.TipsType = 2;
                    }
                }
                if (model.Accessory != null && model.Accessory != "")
                {
                    entity.PhotoUrl = model.Accessory;
                }
                if (model.Ytype != null && model.Ytype != "")
                {
                    if (model.Ytype == "古镇游")
                    {
                        entity.PlayType = "1";
                    }
                    if (model.Ytype == "周边游")
                    {
                        entity.PlayType = "2";
                    }
                }
                entity.AuditStaues = 0;
                entity.ThroughStaues = 2;
                entity.SystemUserUuid = model.SystemUserUuid;
                entity.StrategyContent = model.StrategyContent;
                entity.AddTime = DateTime.Now.ToString("yyyy-MM-dd");
                //entity.AddPeople = AuthContextService.CurrentUser.LoginName;
                //entity.AddPeople = "admin";
                entity.Isdelete = 0;
                _dbContext.Strategy.Add(entity);
                _dbContext.SaveChanges();
                response.SetSuccess();
                return Ok(response);
            }
        }


        /// <summary>
        /// 图片上传
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async System.Threading.Tasks.Task<IActionResult> UpLoadAsync([FromForm] Guid uuid)
        {
            var response = ResponseModelFactory.CreateInstance;
            //var check = System.IO.File.Exists(filename);

            var files = Request.Form.Files;
            if (files == null || files.Count() <= 0)
            {
                response.SetFailed("请上图片文件");
                return Ok(response);
            }
            //var paths = new List<string>();
            //var dataPaths = new List<string>();
            var allowType = new string[] { "image/jpeg", "image/png", "image/jpg" };
            var message = "";
            try
            {
                if (files.Any(c => allowType.Contains(c.ContentType)))
                {

                    //foreach (var file in files)
                    //{
                    _logger.LogInformation(message: "文件大小" + files[0].Length.ToString());
                    if (files[0].Length > 1024 * 1024 * 5)
                    {
                        message += files[0].FileName + "大小超过5M";
                        response.SetFailed(message);
                        return Ok(response);
                    }
                    int index = files[0].FileName.LastIndexOf('.');
                    string prefix = DateTime.Now.ToString("yyyyMMdd_HHmmssfff") + "_" + Guid.NewGuid().ToString();
                    string fname = prefix + files[0].FileName.Substring(index);
                    string strpath = Path.Combine("UploadFiles/Traveltips/Strategy", fname);
                    string path = Path.Combine(_hostingEnvironment.WebRootPath, strpath);
                    //System.IO.File.Create(path);
                    var stream = new FileStream(path, FileMode.OpenOrCreate, FileAccess.ReadWrite);
                    await files[0].CopyToAsync(stream);



                    stream.Close();
                    bool toCompression = false;
                    string fname2 = "";
                    string strpath2 = "";

                    if (files[0].Length > (1024 * 1024 * 1))
                    {
                        fname2 = prefix + "_cp" + files[0].FileName.Substring(index);
                        strpath2 = Path.Combine("UploadFiles/Traveltips/Strategy", fname2);
                        var dFile = Path.Combine(_hostingEnvironment.WebRootPath, strpath2);
                        var num = 1024 * 1024 * 1.0 / files[0].Length;
                        int flag = (int)(num * 100);
                        if (flag < 50)
                        {
                            flag = (int)(flag * 1.7);
                        }
                        toCompression = PhotoCompression.CompressImage(path, dFile, flag, 1024);
                        if (toCompression)
                        {
                            if (System.IO.File.Exists(path))
                            {
                                FileInfo info = new FileInfo(path);
                                if (info.Attributes != FileAttributes.ReadOnly)
                                {
                                    System.IO.File.Delete(path);

                                }

                            }
                        }
                    }
                    else if (files[0].Length > (1024 * 1024 * 0.5) && files[0].Length <= (1024 * 1024 * 1))
                    {
                        fname2 = prefix + "_cp" + files[0].FileName.Substring(index);
                        strpath2 = Path.Combine("UploadFiles/Traveltips/Strategy", fname2);
                        var dFile = Path.Combine(_hostingEnvironment.WebRootPath, strpath2);

                        int flag = 90;

                        toCompression = PhotoCompression.CompressImage(path, dFile, flag, 500);
                        if (toCompression)
                        {
                            if (System.IO.File.Exists(path))
                            {
                                FileInfo info = new FileInfo(path);
                                if (info.Attributes != FileAttributes.ReadOnly)
                                {
                                    System.IO.File.Delete(path);

                                }

                            }
                        }
                    }
                    if (toCompression)
                    {
                        response.SetData(new { strpath = strpath2, fname = fname2 });

                    }
                    else
                    {
                        response.SetData(new { strpath, fname });
                    }

                }
                else
                {
                    response.SetFailed("格式错误" + files
                        [0].ContentType);
                }
                if (message.Length > 0)
                {
                    response.SetFailed(message);
                }
                //response.SetData(new { paths, dataPaths });
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.SetFailed(ex.Message);
                return Ok(response);
            }


        }
        /// <summary>
        /// 删除图片
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult DeleteFile(LSPicture lsp)
        {
            var response = ResponseModelFactory.CreateInstance;

            var path = Path.Combine(_hostingEnvironment.WebRootPath + "/UploadFiles/Traveltips/Strategy", lsp.Path);
            if (string.IsNullOrEmpty(path))
            {
                response.SetFailed("无路径");
                return Ok(response);
            }

            try
            {


                if (System.IO.File.Exists(path))
                {
                    FileInfo info = new FileInfo(path);
                    if (info.Attributes != FileAttributes.ReadOnly)
                    {
                        System.IO.File.Delete(path);
                        response.SetSuccess("删除成功");
                    }
                    else
                    {
                        response.SetFailed("只读文件");

                    }
                }
                else
                {

                    response.SetFailed("文件不存在");
                }


                return Ok(response);
            }
            catch (Exception ex)
            {
                response.SetFailed(ex.Message);
                return Ok(response);
            }
        }
        public class LSPicture
        {
            public string Path { get; set; }
        }

        /// <summary>
        /// 打卡页面详情
        /// </summary>
        /// <param name="payload"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult ParkingList(ParkingQueryPayload payload)
        {
            using (_dbContext)
            {
                var response = ResponseModelFactory.CreateInstance;
                var list = _dbContext.Attractions.Where(x => x.UserUuid == payload.UserUuid).Select(x => x.SceientUuid).ToList();
                var alllist = _dbContext.ScenicSpot.Where(x => x.IsDelete == 0 && x.State == 1).Select(x => x.ScenicSpotUuid).ToList();
                for (int i = 0; i < list.Count; i++)
                {
                    alllist.Remove(list[i].Value);
                }
                int ranking = alllist.Count();
                var paiming = 0;
                if (ranking == 0)
                {
                    if (_dbContext.AttractRanking.Count(x => x.UserUuid == payload.UserUuid) <= 0)
                    {
                        var entity = new AttractRanking();
                        entity.AttractRankingUuid = Guid.NewGuid();
                        entity.UserUuid = payload.UserUuid;
                        _dbContext.AttractRanking.Add(entity);
                        _dbContext.SaveChanges();
                        //int num  = _dbContext.SaveChanges();
                        //if (num >0) {
                        //    var querys = _dbContext.AttractRanking.FirstOrDefault(x => x.UserUuid == payload.UserUuid);
                        //    paiming = querys.Id;
                        //}
                    }
                    var querys = _dbContext.AttractRanking.FirstOrDefault(x => x.UserUuid == payload.UserUuid);
                    paiming = querys.Id;
                }
                if (payload.Type == 0)
                {
                    var query = _dbContext.ScenicSpot.Where(x => x.IsDelete == 0 && x.State == 1 && list.Contains(x.ScenicSpotUuid)).Select(x => new {x.Name,x.Address, Picture = GetDistance(x.Picture), ranking, paiming });
                    response.SetData(query.ToList());
                }
                else if (payload.Type == 1)
                {
                    var query = _dbContext.ScenicSpot.Where(x => x.IsDelete == 0 && x.State == 1 && alllist.Contains(x.ScenicSpotUuid)).Select(x => new { x.Name, x.Address, Picture = GetDistance(x.Picture) });
                    response.SetData(query.ToList());
                }
                return Ok(response);
            }
        }
        public static string GetDistance(string Picture)
        {
            string Picture1 = Picture.Split(",")[0];
            return Picture1;
        }
    }
}
