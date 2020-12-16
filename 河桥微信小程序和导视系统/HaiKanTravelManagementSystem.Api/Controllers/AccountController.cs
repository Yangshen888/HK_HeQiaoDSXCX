using System;
using System.Collections.Generic;
using System.Linq;

using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.AuthContext;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemMenu;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HaiKanTravelManagementSystem.Api.Models.QueryModels;

namespace HaiKanTravelManagementSystem.Api.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    [Authorize]
    public class AccountController : ControllerBase
    {
        private readonly haikanHeQiaoContext _dbContext;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        public AccountController(haikanHeQiaoContext dbContext)
        {
            _dbContext = dbContext;
        }

        
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Profile()
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var guid = AuthContextService.CurrentUser.Guid;
                var user = _dbContext.SystemUser.FirstOrDefaultAsync(x => x.SystemUserUuid == guid).Result;


                var menus = _dbContext.SystemMenu.Where(x => x.IsDeleted == 0 && x.Status == 1).ToList();
                //var dempartment = _dbContext.Department.FirstOrDefault(x => x.DepartmentUuid == user.DepartmentUuid);
                List<SystemPermissionWithMenu> permissions = new List<SystemPermissionWithMenu>();
                //查询当前登录用户拥有的权限集合(非超级管理员)
//                var sqlPermission = @"SELECT P.SystemPermissionUUID AS PermissionCode,P.ActionCode AS PermissionActionCode,P.Name AS PermissionName,P.Type AS PermissionType,M.Name AS MenuName,M.SystemMenuUUID AS MenuGuid,M.Alias AS MenuAlias,M.IsDefaultRouter FROM SystemRolePermissionMapping AS RPM 
//LEFT JOIN SystemPermission AS P ON P.SystemPermissionUUID = RPM.SystemPermissionUUID
//INNER JOIN SystemMenu AS M ON M.SystemMenuUUID = P.SystemMenuUUID
//WHERE P.IsDeleted=0 AND P.Status=1 AND EXISTS (SELECT 1 FROM SystemUserRoleMapping AS URM WHERE URM.SystemUserUUID={0} AND URM.SystemRoleUUID=RPM.SystemRoleUUID)";
                
                if (AuthContextService.CurrentUser.UserType == "0")
                {
                    //如果是超级管理员
//                    sqlPermission = @"SELECT P.SystemPermissionUUID AS PermissionCode,P.ActionCode AS PermissionActionCode,P.Name AS PermissionName,P.Type AS PermissionType,M.Name AS MenuName,M.SystemMenuUUID AS MenuGuid,M.Alias AS MenuAlias,M.IsDefaultRouter FROM SystemPermission AS P 
//INNER JOIN SystemMenu AS M ON M.SystemMenuUUID = P.SystemMenuUUID
//WHERE P.IsDeleted=0 AND P.Status=1";
                    permissions = _dbContext.ViewSystemPermissionWithMenu2.Where(x => x.Pd == 0 && x.Ps == 1).Select(x => new SystemPermissionWithMenu
                    {
                        PermissionCode = x.PermissionCode,
                        PermissionActionCode = x.PermissionActionCode,
                        PermissionName = x.PermissionName,
                        PermissionType = (Entities.Enums.CommonEnum.PermissionType)x.PermissionType,
                        MenuName = x.MenuName,
                        MenuGuid = x.MenuGuid,
                        MenuAlias = x.MenuAlias,
                        IsDefaultRouter = (Entities.Enums.CommonEnum.YesOrNo)x.IsDefaultRouter,
                    }).ToList();
                }
                else
                {
                    permissions = _dbContext.ViewSystemPermissionWithMenu.Where(x => x.Pd == 0 && x.Ps == 1 && _dbContext.SystemUserRoleMapping.Any(y => y.SystemUserUuid == user.SystemUserUuid && y.SystemRoleUuid == x.SystemRoleUuid)).Select(x => new SystemPermissionWithMenu
                    {
                        PermissionCode = x.PermissionCode.Value,
                        PermissionActionCode = x.PermissionActionCode,
                        PermissionName = x.PermissionName,
                        PermissionType = (Entities.Enums.CommonEnum.PermissionType)x.PermissionType,
                        MenuName = x.MenuName,
                        MenuGuid = x.MenuGuid,
                        MenuAlias = x.MenuAlias,
                        IsDefaultRouter = (Entities.Enums.CommonEnum.YesOrNo)x.IsDefaultRouter,
                    }).ToList();
                }
                //var permissions = _dbContext.SystemPermissionWithMenu.FromSql(sqlPermission, user.SystemUserUuid.ToString()).ToList();

                var pagePermissions = permissions.GroupBy(x => x.MenuAlias).ToDictionary(g => g.Key, g => g.Select(x => x.PermissionActionCode).Distinct());
                response.SetData(new
                {
                    access = new string[] { },
                    //avator = user.Avatar,
                    user_guid = user.SystemUserUuid,
                    user_name = user.RealName,
                    user_type = user.UserType,
                    permissions = pagePermissions,
                    roleName = GetroleName(user.SystemRoleUuid)
                    //roleName = _dbContext.SystemRole.FirstOrDefault(x => x.SystemRoleUuid.ToString() == user.SystemRoleUuid).RoleName
                    //user_departmentName= dempartment.DepartmentName,
                    //user_departmentGuid=dempartment.DepartmentUuid,
                });
            }
            return Ok(response);
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
        private List<string> FindParentMenuAlias(List<SystemMenu> menus, Guid? parentGuid)
        {
            var pages = new List<string>();
            var parent = menus.FirstOrDefault(x => x.SystemMenuUuid == parentGuid);
            if (parent != null)
            {
                if (!pages.Contains(parent.Alias))
                {
                    pages.Add(parent.Alias);
                }
                else
                {
                    return pages;
                }
                if (parent.ParentGuid != Guid.Empty)
                {
                    pages.AddRange(FindParentMenuAlias(menus, parent.ParentGuid));
                }
            }

            return pages.Distinct().ToList();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Menu()
        {
            List<SystemMenu> menus = new List<SystemMenu>();
//            var strSql = @"SELECT M.* FROM SystemRolePermissionMapping AS RPM 
//LEFT JOIN SystemPermission AS P ON P.SystemPermissionUUID = RPM.SystemPermissionUUID
//INNER JOIN SystemMenu AS M ON M.SystemMenuUUID = P.SystemMenuUUID
//WHERE P.IsDeleted=0 AND P.Status=1 AND P.Type=0 AND M.IsDeleted=0 AND M.Status=1 AND EXISTS (SELECT 1 FROM SystemUserRoleMapping AS URM WHERE URM.SystemUserUUID={0} AND URM.SystemRoleUUID=RPM.SystemRoleUUID)";
            
            if (AuthContextService.CurrentUser.UserType == "0")
            {
                //如果是超级管理员
                //strSql = @"SELECT * FROM SystemMenu WHERE IsDeleted=0 AND Status=1";
                menus = _dbContext.SystemMenu.Where(x=>x.IsDeleted==0&&x.Status==1).ToList();
            }
            else
            {
                menus = _dbContext.ViewMenu.Where(x => x.Pd == 0 && x.Ps == 1 && x.Pt == 0 && _dbContext.SystemUserRoleMapping.Any(y => y.SystemUserUuid == AuthContextService.CurrentUser.Guid && y.SystemRoleUuid == x.SystemRoleUuid)).Select(x=>new SystemMenu
                {
                    SystemMenuUuid= x.SystemMenuUuid,
                    Name=x.Name,
                    Url=x.Url,
                    Alias=x.Alias,
                    Icon=x.Icon,
                    ParentGuid=x.ParentGuid,
                    Level=x.Level,
                    Description=x.Description,
                    Sort=x.Sort,
                    Status=x.Status,
                    IsDeleted=x.IsDeleted,
                    CreatedOn= x.CreatedOn,
                    CreatedByUserGuid=x.CreatedByUserGuid,
                    CreatedByUserName=x.CreatedByUserName,
                    ModifiedOn = x.ModifiedOn,
                    ModifiedByUserName = x.ModifiedByUserName,
                    ModifiedByUserGuid = x.ModifiedByUserGuid,
                    Component = x.Component,
                    HideInMenu = x.HideInMenu,
                    NotCache = x.NotCache,
                    BeforeCloseFun = x.BeforeCloseFun,
                }).ToList(); ; 
            }
            //var menus = _dbContext.SystemMenu.FromSql(strSql, AuthContextService.CurrentUser.Guid).ToList();
            var rootMenus = _dbContext.SystemMenu.Where(x => x.IsDeleted == 0 && x.Status == 1 && x.ParentGuid == Guid.Empty).ToList();
            //foreach (var root in rootMenus)
            //{
            //    if (menus.Exists(x => x.SystemMenuUuid == root.SystemMenuUuid))
            //    {
            //        continue;
            //    }
            //    menus.Add(root);
            //}
            menus = menus.OrderBy(x => x.Sort).ThenBy(x => x.CreatedOn).ToList();
            var menu = MenuItemHelper.LoadMenuTree(menus, "0");
            return Ok(menu);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public static class MenuItemHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="menus"></param>
        /// <param name="selectedGuid"></param>
        /// <returns></returns>
        public static List<MenuItem> BuildTree(this List<MenuItem> menus, string selectedGuid = null)
        {
            var lookup = menus.ToLookup(x => x.ParentId);

            List<MenuItem> Build(string pid)
            {
                return lookup[pid]
                    .Select(x => new MenuItem()
                    {
                        Guid = x.Guid,
                        ParentId = x.ParentId,
                        Children = Build(x.Guid),
                        Component = x.Component ?? "Main",
                        Name = x.Name,
                        Path = x.Path,
                        Meta = new MenuMeta
                        {
                            BeforeCloseFun = x.Meta.BeforeCloseFun,
                            HideInMenu = x.Meta.HideInMenu,
                            Icon = x.Meta.Icon,
                            NotCache = x.Meta.NotCache,
                            Title = x.Meta.Title,
                            Permission = x.Meta.Permission
                        }
                    }).ToList();
            }


            var result = Build(selectedGuid);
            string s1 = "";
            for (int i = result.Count - 1; i  >= 0; i --)
            {
                
                if (s1.Contains(result[i].Guid))
                    result.RemoveAt(i);
                s1+= result[i].Guid;
            }
            foreach (var item in result)
            {
                if (item.Children.Count != 0)
                {
                    //查询是否有重复
                    string s = "";
                    List<MenuItem> temp = item.Children;
                    for (int i = item.Children.Count - 1; i >= 0; i--)
                    {
                        if (s.Contains(item.Children[i].Guid))
                        {
                            temp.Remove(item.Children[i]);
                        }
                        s += item.Children[i].Guid;
                    }
                    //foreach (var ii in item.Children)
                    //{

                    //}
                    //item.Children = temp;
                }
            }

            return result;
        }

        public static List<MenuItem> LoadMenuTree(List<SystemMenu> menus, string selectedGuid = null)
        {
            var temp = menus.Select(x => new MenuItem
            {
                Guid = x.SystemMenuUuid.ToString(),
                ParentId = x.ParentGuid != null && ((Guid)x.ParentGuid) == Guid.Empty ? "0" : x.ParentGuid?.ToString(),
                Name = x.Alias,
                Path = $"/{x.Url}",
                Component = x.Component,
                Meta = new MenuMeta
                {
                    BeforeCloseFun = x.BeforeCloseFun ?? "",
                    HideInMenu = x.HideInMenu == 1,
                    Icon = x.Icon,
                    NotCache = x.NotCache == 1,
                    Title = x.Name
                }
            }).ToList();
            var tree = temp.BuildTree(selectedGuid);
            return tree;
        }
    }
}