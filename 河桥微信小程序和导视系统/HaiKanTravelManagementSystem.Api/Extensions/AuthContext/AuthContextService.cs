using System;
using System.Security.Claims;
using HaiKanTravelManagementSystem.Api.Entities;
using Microsoft.AspNetCore.Http;

namespace HaiKanTravelManagementSystem.Api.Extensions.AuthContext
{
    public static class AuthContextService
    {
        private static IHttpContextAccessor _context;
        private static HttpContext context;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="httpContextAccessor"></param>
        public static void Configure(IHttpContextAccessor httpContextAccessor)
        {
            _context = httpContextAccessor;
        }

        public static void Configure(HttpContext httpContext)
        {
            context = httpContext;
        }
        /// <summary>
        /// 
        /// </summary>
        public static HttpContext Current => _context?.HttpContext??context;
        /// <summary>
        /// 
        /// </summary>
        public static AuthContextUser CurrentUser
        {
            get
            {
                var user = new AuthContextUser
                {
                    //LoginName = Current.User.FindFirstValue(ClaimTypes.NameIdentifier),
                    DisplayName = Current.User.FindFirstValue("displayName"),
                    EmailAddress = Current.User.FindFirstValue("emailAddress"),
                    UserType = Current.User.FindFirstValue("userType").ToString(),
                    Avator = Current.User.FindFirstValue("avator"),
                    Guid = new Guid(Current.User.FindFirstValue("guid")),
                    Roleid= Current.User.FindFirstValue("roleid"),
                    RoleName= Current.User.FindFirstValue("roleName"),
                    LoginName = Current.User.FindFirstValue("loginName"),
                    //ZYZ= Current.User.FindFirstValue("ZYZ"),
                    //YH= Current.User.FindFirstValue("YH"),
                    //DDY= Current.User.FindFirstValue("DDY"),
                    //SJ = Current.User.FindFirstValue("SJ")
                };
                return user;
            }
        }

        /// <summary>
        /// 是否已授权
        /// </summary>
        public static bool IsAuthenticated
        {
            get
            {
                return Current.User.Identity.IsAuthenticated;
            }
        }

        /// <summary>
        /// 是否是超级管理员
        /// </summary>
        public static bool IsSupperAdministator
        {
            get
            {
                return (Current.User.FindFirstValue("userType").ToString()== "1");
            }
        }
    }
}

