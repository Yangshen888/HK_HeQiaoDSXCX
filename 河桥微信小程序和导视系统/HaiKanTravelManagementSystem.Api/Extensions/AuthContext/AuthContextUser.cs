using HaiKanTravelManagementSystem.Api.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HaiKanTravelManagementSystem.Api.Extensions.AuthContext
{
    /// <summary>
    /// 登录用户上下文
    /// </summary>
    public class AuthContextUser
    {
        /// <summary>
        /// 用户GUID
        /// </summary>
        public Guid Guid { get; set; }
        /// <summary>
        /// 显示名
        /// </summary>
        public string DisplayName { get; set; }
        /// <summary>
        /// 登录名
        /// </summary>
        public string LoginName { get; set; }
        /// <summary>
        /// 电子邮箱
        /// </summary>
        public string EmailAddress { get; set; }
        /// <summary>
        /// 用户类型
        /// </summary>
        public string UserType { get; set; }
        /// <summary>
        /// 头像地址
        /// </summary>
        public string Avator { get; set; }
        /// <summary>
        /// 角色id
        /// </summary>
        public string Roleid { get; set; }
        /// <summary>
        /// 角色名
        /// </summary>
        public string RoleName { get; set; }
        ///// <summary>
        ///// 督导员
        ///// </summary>
        //public string DDY { get; set; }
        /// <summary>
        /// 用户
        /// </summary>
        //public string YH { get; set; }
        ///// <summary>
        ///// 志愿者
        ///// </summary>
        //public string ZYZ { get; set; }
        ///// <summary>
        ///// 商家
        ///// </summary>
        //public string SJ { get; set; }
    }
}
