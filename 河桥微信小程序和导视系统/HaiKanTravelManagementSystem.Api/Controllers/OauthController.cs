using System;
using System.Linq;
using System.Security.Claims;
using HaiKanTravelManagementSystem.Api.Auth;
using HaiKanTravelManagementSystem.Api.Configurations;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.User;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemUser;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Haikan3.Utils;
using NPOI.SS.Formula.Functions;
using HaiKanTravelManagementSystem.Api.logs.TolLog;

namespace HaiKanTravelManagementSystem.Api.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class OauthController : ControllerBase
    {
        private readonly AppAuthenticationSettings _appSettings;
        private readonly haikanHeQiaoContext _dbContext;
        private readonly MdDesEncrypt MdDesEncrypt;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="appSettings"></param>
        public OauthController(IOptions<AppAuthenticationSettings> appSettings, haikanHeQiaoContext dbContext, IOptions<MdDesEncrypt> mdDesEncrypt)
        {
            _appSettings = appSettings.Value;
            _dbContext = dbContext;
            MdDesEncrypt = mdDesEncrypt.Value;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Auth(UserData userdata)
        {
            var response = ResponseModelFactory.CreateInstance;
            SystemUser user;
            using (_dbContext)
            {

                user = _dbContext.SystemUser.FirstOrDefault(x => x.LoginName == userdata.username);
                if (user == null || user.IsDeleted == 1)
                {
                    response.SetFailed("用户不存在");
                    return Ok(response);
                }
                string s = DesEncrypt.Encrypt(userdata.password.Trim(), MdDesEncrypt.SecretKey);
                if (user.PassWord != DesEncrypt.Encrypt(userdata.password.Trim(), MdDesEncrypt.SecretKey))
                {
                    response.SetFailed("密码不正确");
                    return Ok(response);
                }
                //if (user.IsLocked == CommonEnum.IsLocked.Locked)
                //{
                //    response.SetFailed("账号已被锁定");
                //    return Ok(response);
                //}
                //if (user.Status == UserStatus.Forbidden)
                //{
                //    response.SetFailed("账号已被禁用");
                //    return Ok(response);
                //}

                //获取权限名
                string[] roleid = user.SystemRoleUuid.TrimEnd(',').Split(",");
                string rolename = "";
                for (int i = 0; i < roleid.Length; i++)
                {
                    if (!string.IsNullOrEmpty(roleid[i]))
                        rolename += _dbContext.SystemRole.FirstOrDefault(x => x.SystemRoleUuid == Guid.Parse(roleid[i])).RoleName + ",";
                }
                //string zyz = "";
                string yh = "";
                //string ddy = "";
                //string sj = "";
                //志愿者roleid
                //var temp1 = _dbContext.SystemRole.Where(x => x.RoleName.Contains("志愿者")).Select(x => new { x.SystemRoleUuid }).ToList();
                //if (temp1.Count > 0)
                //    zyz = temp1[0].SystemRoleUuid.ToString();

                //普通用户roleid
                //var temp2 = _dbContext.SystemRole.Where(x => x.RoleName.Contains("用户")).Select(x => new { x.SystemRoleUuid }).ToList();
                //if (temp2.Count > 0)
                //    yh = temp2[0].SystemRoleUuid.ToString();

                //督导员roleid
                //var temp3 = _dbContext.SystemRole.Where(x => x.RoleName.Contains("督导员")).Select(x => new { x.SystemRoleUuid }).ToList();
                //if (temp3.Count > 0)
                //    ddy = temp3[0].SystemRoleUuid.ToString();

                ////商户
                //var temp4 = _dbContext.SystemRole.Where(x => x.RoleName.Contains("商")).Select(x => new { x.SystemRoleUuid }).ToList();
                //if (temp4.Count > 0)
                //    sj = temp4[0].SystemRoleUuid.ToString();
                string superAdmin = "";

                //超管roleid
                var temp5 = _dbContext.SystemRole.Where(x => x.RoleName.Contains("超级")).Select(x => new { x.SystemRoleUuid }).ToList();
                if (temp5.Count > 0)
                    superAdmin = temp5[0].SystemRoleUuid.ToString();
                int usertype = 0;
                if (!user.SystemRoleUuid.Contains(superAdmin))
                {
                    usertype = 2;
                }
                var claimsIdentity = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, userdata.username),
                    new Claim("guid",user.SystemUserUuid.ToString()),
                    new Claim("avatar",""),
                    new Claim("displayName",user.RealName),
                    new Claim("loginName",user.LoginName),
                    new Claim("emailAddress",""),
                    new Claim("userType",user.UserType.Value.ToString()),
                    new Claim("roleid",user.SystemRoleUuid.TrimEnd(',')),
                    new Claim("roleName",rolename.TrimEnd(',')),

                });
                var token = JwtBearerAuthenticationExtension.GetJwtAccessToken(_appSettings, claimsIdentity);
                response.SetData(token);
                return Ok(response);
            }
        }

        /// <summary>
        /// 微信授权登录
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult WXAuth(WXUserInfo info)
        {
            var response = ResponseModelFactory.CreateInstance;
            SystemUser user = new SystemUser();
            using (_dbContext)
            {
                var entity = _dbContext.SystemUser.FirstOrDefault(x => x.Wechat == info.Openid);
                string nowdate = DateTime.Now.ToString("yyyy-MM-dd");
                if (entity == null)
                {
                    user.SystemUserUuid = Guid.NewGuid();
                    user.LoginName = info.NickName;
                    user.Nickname = info.NickName;
                    user.RealName = "";
                    user.Wechat = info.Openid;
                    //授权登录的普通用户
                    user.UserType = 5;
                    user.AddTime = DateTime.Now.ToString("yyyy-MM-dd");
                    if (info.Sex == 0)
                    {
                        user.Sex = "未知";
                    }
                    if (info.Sex == 1)
                    {
                        user.Sex = "男";
                    }
                    if (info.Sex == 2)
                    {
                        user.Sex = "女";
                    }
                    //user.Phone = info.Phone;
                    user.IsDeleted = 0;
                    user.SystemRoleUuid = _dbContext.SystemRole.FirstOrDefault(x => x.RoleName == "微信用户").SystemRoleUuid.ToString();
                    _dbContext.SystemUser.Add(user);

                    

                    //判断当天用户增加次数
                    var ac = _dbContext.ActiveQuantity.FirstOrDefault(x => x.Type == 1 && x.AddTime== nowdate);
                    if (ac == null)
                    {
                        ac = new ActiveQuantity();
                        ac.ActiveQuantityUuid = Guid.NewGuid();
                        ac.AddTime = DateTime.Now.ToString("yyyy-MM-dd");
                        ac.Num = 1;
                        ac.Type = 1;
                        _dbContext.ActiveQuantity.Add(ac);
                    }
                    else
                    {
                        ac.Num = ac.Num + 1;
                    }
                }
                else
                {
                    entity.LoginName = info.NickName;
                    entity.IsDeleted = 0;

                    //判断当天用户登录次数
                    var ac = _dbContext.ActiveQuantity.FirstOrDefault(x => x.Type == 2 && x.AddTime == nowdate);
                    if(ac==null)
                    {
                        ac = new ActiveQuantity();
                        ac.ActiveQuantityUuid = Guid.NewGuid();
                        ac.AddTime = DateTime.Now.ToString("yyyy-MM-dd");
                        ac.Num = 1;
                        ac.Type = 2;
                        _dbContext.ActiveQuantity.Add(ac);
                    }
                    else
                    {
                        ac.Num = ac.Num + 1;
                    }
                }

                _dbContext.SaveChanges();

                response.SetSuccess("授权成功");
                return Ok(response);
            }
        }

        /// <summary>
        /// 微信端--openid登录
        /// </summary>
        /// <param name="openid"></param>
        /// <returns></returns>
        [HttpGet]
        public IActionResult WXOpenAuth(string openid)
        {
            var response = ResponseModelFactory.CreateInstance;
            SystemUser user;
            using (_dbContext)
            {
                user = _dbContext.SystemUser.FirstOrDefault(x => x.Wechat == openid);
                if (user == null)
                {
                    response.SetFailed("需要微信授权登录！");
                    return Ok(response);
                }
                else
                {
                    //获取权限名
                    string roleid = user.SystemRoleUuid.Trim();
                    string rolename = "";

                    if (!string.IsNullOrEmpty(roleid))
                    {
                        rolename = _dbContext.SystemRole.FirstOrDefault(x => x.SystemRoleUuid == Guid.Parse(roleid)).RoleName;
                    }


                    var claimsIdentity = new ClaimsIdentity(new Claim[]
                    {
                    new Claim(ClaimTypes.Name, user.LoginName),
                    new Claim("guid",user.SystemUserUuid.ToString()),
                    new Claim("avatar",""),
                    new Claim("displayName",user.RealName),
                    new Claim("loginName",user.LoginName),
                    new Claim("emailAddress",""),
                    //new Claim("guid",user.SystemUserUuid.ToString()),
                    new Claim("userType",((int)user.UserType).ToString()),
                    new Claim("roleid",(user.SystemRoleUuid.TrimEnd(','))),
                    new Claim("roleName",(rolename.TrimEnd(','))),
                    //new Claim("schoolguid",user.SchoolUuid!=null?user.SchoolUuid.ToString():""),
                    });
                    var token = JwtBearerAuthenticationExtension.GetJwtAccessToken(_appSettings, claimsIdentity);

                    response.SetData(new
                    {
                        access = new string[] { },
                        user_guid = user.SystemUserUuid,
                        user_name = user.LoginName,
                        user_type = user.UserType,
                        permissions = "null",
                        roleName = GetroleName(user.SystemRoleUuid),
                        address = user.Address,
                        tokens = token,
                        phone = user.Phone,
                        schoolguid = user.SchoolUuid,
                        openid,
                        idCard = user.UserIdCard,
                    });
                }
                return Ok(response);
            }
        }
        private string GetroleName(string ids)
        {
            string s = "";
            string[] temp = ids.TrimEnd(',').Split(',');
            using (haikanHeQiaoContext cc = new haikanHeQiaoContext())
            {
                for (int i = 0; i < temp.Length; i++)
                {
                    if (!string.IsNullOrEmpty(temp[i]))
                    {
                        var qu = cc.SystemRole.Where(x => x.SystemRoleUuid == Guid.Parse(temp[i])).Select(x => new { x.RoleName }).ToList();
                        if (!string.IsNullOrEmpty(qu[0].RoleName))
                            s += qu[0].RoleName + ",";
                    }
                }
                return s.TrimEnd(',');
            }

        }
    }
}