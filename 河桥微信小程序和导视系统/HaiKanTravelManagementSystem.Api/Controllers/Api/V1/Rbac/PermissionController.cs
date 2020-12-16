using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Linq;
using AutoMapper;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.Entities.Enums;
//using HaiKanTravelManagementSystem.Api.Entities.QueryModels.SystemPermission;
using HaiKanTravelManagementSystem.Api.Extensions;
using HaiKanTravelManagementSystem.Api.Extensions.AuthContext;
using HaiKanTravelManagementSystem.Api.Extensions.CustomException;
using HaiKanTravelManagementSystem.Api.Models.Response;
using HaiKanTravelManagementSystem.Api.RequestPayload.Rbac.Permission;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemPermission;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static HaiKanTravelManagementSystem.Api.Entities.SystemUser;
using HaiKanTravelManagementSystem.Api.Models.QueryModels;
using HaiKanTravelManagementSystem.Api.logs.TolLog;

namespace HaikanEnrollmentRegistration.Api.Controllers.Api.V1.Rbac
{
    /// <summary>
    /// 权限控制器
    /// </summary>
    [Route("api/v1/rbac/[controller]/[action]")]
    [ApiController]
    [CustomAuthorize]
    public class PermissionController : Controller
    {
        private readonly haikanHeQiaoContext _dbContext;
        private readonly IMapper _mapper;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="mapper"></param>
        public PermissionController(haikanHeQiaoContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public IActionResult List(PermissionRequestPayload payload)
        {
            var response = ResponseModelFactory.CreateResultInstance;
            using (_dbContext)
            {
                var query = _dbContext.SystemPermission.AsQueryable();
                if (!string.IsNullOrEmpty(payload.Kw))
                {
                    query = query.Where(x => x.Name.Contains(payload.Kw.Trim()) || x.ActionCode.Contains(payload.Kw.Trim()));
                }
                if (payload.IsDeleted > CommonEnum.IsDeleted.All)
                {
                    query = query.Where(x => (CommonEnum.IsDeleted)x.IsDeleted == payload.IsDeleted);
                }
                if (payload.Status > CommonEnum.Status.All)
                {
                    query = query.Where(x => (CommonEnum.Status)x.Status == payload.Status);
                }
                if (payload.SystemMenuUuid.HasValue)
                {
                    query = query.Where(x => x.SystemMenuUuid == payload.SystemMenuUuid);
                }
                var list = query.Paged(payload.CurrentPage, payload.PageSize).Include(x => x.SystemMenuUu).ToList();
                var totalCount = query.Count();
                var data = list.Select(_mapper.Map<SystemPermission, PermissionJsonModel>);
                /*
                 * .Select(x => new PermissionJsonModel {
                    MenuName = x.Menu.Name,
                    x.
                });
                 */

                response.SetData(data, totalCount);
                ToLog.AddLog("查询", "成功:查询:系统权限管理列表数据", _dbContext);
                return Ok(response);
            }
        }

        /// <summary>
        /// 创建权限
        /// </summary>
        /// <param name="model">权限视图实体</param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult Create(PermissionCreateViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            if (model.Name.Trim().Length <= 0)
            {
                response.SetFailed("请输入权限名称");
                return Ok(response);
            }
            using (_dbContext)
            {
                if (_dbContext.SystemPermission.Count(x => x.ActionCode == model.ActionCode && x.SystemMenuUuid == model.SystemMenuUuid) > 0)
                {
                    response.SetFailed("权限操作码已存在");
                    return Ok(response);
                }
                if (_dbContext.SystemPermission.Count(x => x.Name == model.Name && x.SystemMenuUuid == model.SystemMenuUuid) > 0)
                {
                    response.SetFailed("权限名称已存在");
                    return Ok(response);
                }
                var entity = _mapper.Map<PermissionCreateViewModel, SystemPermission>(model);
                entity.CreatedOn = DateTime.Now.ToString("yyyy-MM-dd");
                entity.SystemPermissionUuid = Guid.NewGuid();
                entity.CreatedByUserGuid = AuthContextService.CurrentUser.Guid;
                entity.CreatedByUserName = AuthContextService.CurrentUser.DisplayName;
                _dbContext.SystemPermission.Add(entity);
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("添加", "成功:添加:系统权限管理列表数据", _dbContext);
                }
                response.SetSuccess();
                return Ok(response);
            }
        }

        /// <summary>
        /// 编辑权限
        /// </summary>
        /// <param name="code">权限惟一编码</param>
        /// <returns></returns>
        [HttpGet("{guid}")]
        [ProducesResponseType(200)]
        public IActionResult Edit(Guid guid)
        {
            using (_dbContext)
            {
                var entity = _dbContext.SystemPermission.FirstOrDefault(x => x.SystemPermissionUuid == guid);
                var response = ResponseModelFactory.CreateInstance;
                var model = _mapper.Map<SystemPermission, PermissionEditViewModel>(entity);
                var menu = _dbContext.SystemMenu.FirstOrDefault(x => x.SystemMenuUuid == entity.SystemMenuUuid);
                model.MenuName = menu.Name;
                response.SetData(model);
                return Ok(response);
            }
        }

        /// <summary>
        /// 保存编辑后的权限信息
        /// </summary>
        /// <param name="model">权限视图实体</param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(200)]
        public IActionResult Edit(PermissionEditViewModel model)
        {
            var response = ResponseModelFactory.CreateInstance;
            if (ConfigurationManager.AppSettings.IsTrialVersion)
            {
                response.SetIsTrial();
                return Ok(response);
            }
            using (_dbContext)
            {
                if (_dbContext.SystemPermission.Count(x => x.ActionCode == model.ActionCode && x.SystemPermissionUuid != model.SystemPermissionUuid) > 0)
                {
                    response.SetFailed("权限操作码已存在");
                    return Ok(response);
                }
                var entity = _dbContext.SystemPermission.FirstOrDefault(x => x.SystemPermissionUuid == model.SystemPermissionUuid);
                if (entity == null)
                {
                    response.SetFailed("权限不存在");
                    return Ok(response);
                }
                if (_dbContext.SystemPermission.Count(x => x.Name == model.Name && x.SystemMenuUuid == model.SystemMenuUuid) > 1)
                {
                    response.SetFailed("权限名称已存在");
                    return Ok(response);
                }
                entity.Name = model.Name;
                entity.ActionCode = model.ActionCode;
                entity.SystemMenuUuid = model.SystemMenuUuid;
                entity.IsDeleted = model.IsDeleted;
                entity.ModifiedByUserGuid = AuthContextService.CurrentUser.Guid;
                entity.ModifiedByUserName = AuthContextService.CurrentUser.DisplayName;
                entity.ModifiedOn = DateTime.Now.ToString("yyyy-MM-dd");
                entity.Status = model.Status;
                entity.Type = model.Type;
                entity.Description = model.Description;
                int res = _dbContext.SaveChanges();
                if (res > 0)
                {
                    ToLog.AddLog("编辑", "成功:编辑:系统权限管理列表数据", _dbContext);
                }
                response.SetSuccess();
                return Ok(response);
            }
        }

        /// <summary>
        /// 删除权限
        /// </summary>
        /// <param name="ids">权限ID,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet("{ids}")]
        [ProducesResponseType(200)]
        public IActionResult Delete(string ids)
        {
            var response = ResponseModelFactory.CreateInstance;
            if (ConfigurationManager.AppSettings.IsTrialVersion)
            {
                response.SetIsTrial();
                return Ok(response);
            }
            response = UpdateIsDelete(CommonEnum.IsDeleted.Yes, ids);
            return Ok(response);
        }

        /// <summary>
        /// 恢复权限
        /// </summary>
        /// <param name="ids">权限ID,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet("{ids}")]
        [ProducesResponseType(200)]
        public IActionResult Recover(string ids)
        {
            var response = UpdateIsDelete(CommonEnum.IsDeleted.No, ids);
            return Ok(response);
        }

        /// <summary>
        /// 批量操作
        /// </summary>
        /// <param name="command"></param>
        /// <param name="ids">权限ID,多个以逗号分隔</param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(200)]
        public IActionResult Batch(string command, string ids)
        {
            var response = ResponseModelFactory.CreateInstance;
            switch (command)
            {
                case "delete":
                    if (ConfigurationManager.AppSettings.IsTrialVersion)
                    {
                        response.SetIsTrial();
                        return Ok(response);
                    }
                    response = UpdateIsDelete(CommonEnum.IsDeleted.Yes, ids);
                    break;
                case "recover":
                    response = UpdateIsDelete(CommonEnum.IsDeleted.No, ids);
                    break;
                case "forbidden":
                    if (ConfigurationManager.AppSettings.IsTrialVersion)
                    {
                        response.SetIsTrial();
                        return Ok(response);
                    }
                    response = UpdateStatus(CommonEnum.Status.Forbidden, ids);
                    break;
                case "normal":
                    response = UpdateStatus(CommonEnum.Status.Normal, ids);
                    break;
                default:
                    break;
            }
            return Ok(response);
        }

        /// <summary>
        /// 角色-权限菜单树
        /// </summary>
        /// <param name="code">角色编码</param>
        /// <returns></returns>
        [HttpGet("/api/v1/rbac/permission/permission_tree/{code}")]
        public IActionResult PermissionTree(string code)
        {
            var response = ResponseModelFactory.CreateInstance;
            using (_dbContext)
            {
                var role = _dbContext.SystemRole.FirstOrDefault(x => x.SystemRoleUuid.ToString() == code);
                if (role == null)
                {
                    response.SetFailed("角色不存在");
                    return Ok(response);
                }
                var menu = _dbContext.SystemMenu.Where(x => (CommonEnum.IsDeleted)x.IsDeleted == CommonEnum.IsDeleted.No && (CommonEnum.Status)x.Status == CommonEnum.Status.Normal).OrderBy(x => x.CreatedOn).ThenBy(x => x.Sort)
                    .Select(x => new PermissionMenuTree
                    {
                        Guid = x.SystemMenuUuid,
                        ParentGuid = x.ParentGuid,
                        Title = x.Name
                    }).ToList();
                //DncPermissionWithAssignProperty
                var permissionList = new List<SystemPermissionWithAssignProperty>();
                var sql = @"SELECT cast(P.SystemPermissionUUID as varchar(36)) AS Code,P.SystemMenuUUID AS MenuGuid,P.Name,P.ActionCode,ISNULL(cast(S.SystemRoleUUID as varchar(36)),'') AS RoleCode,(CASE WHEN S.SystemPermissionUUID IS NOT NULL THEN 1 ELSE 0 END) AS IsAssigned FROM SystemPermission AS P 
LEFT JOIN (SELECT * FROM SystemRolePermissionMapping AS RPM WHERE RPM.SystemRoleUUID={0}) AS S 
ON S.SystemPermissionUUID= P.SystemPermissionUUID
WHERE P.IsDeleted=0 AND P.Status=1";

                if (role.RoleName == "超级管理员")
                {
//                    sql = @"SELECT cast(P.SystemPermissionUUID as varchar(36)) AS Code,P.SystemMenuUUID AS MenuGuid,P.Name,P.ActionCode,'SUPERADM' AS RoleCode,(CASE WHEN P.SystemPermissionUUID IS NOT NULL THEN 1 ELSE 0 END) AS IsAssigned FROM SystemPermission AS P 
//WHERE P.IsDeleted=0 AND P.Status=1";
                    permissionList = _dbContext.SystemPermission.Where(x => x.IsDeleted == 0 && x.Status == 1).Select(x => new SystemPermissionWithAssignProperty
                    {
                        Code = x.SystemPermissionUuid.ToString(),
                        Name=x.Name,
                        MenuGuid=x.SystemMenuUuid,
                        ActionCode=x.ActionCode,
                        RoleCode= "SUPERADM",
                        IsAssigned=x.SystemPermissionUuid==null?0:1,
                    }).ToList();
                }
                else
                {
                    var query = _dbContext.SystemRolePermissionMapping.Where(x=>x.SystemRoleUuid==Guid.Parse(code));
                    var query2 = from sp in _dbContext.SystemPermission
                                 join sm in query
                                 on sp.SystemPermissionUuid equals sm.SystemPermissionUuid into result
                                 from item in result.DefaultIfEmpty()
                                 where sp.IsDeleted == 0 && sp.Status == 1
                                 select new SystemPermissionWithAssignProperty
                                 {
                                     Code = sp.SystemPermissionUuid.ToString(),
                                     Name = sp.Name,
                                     MenuGuid = sp.SystemMenuUuid,
                                     ActionCode = sp.ActionCode,
                                     RoleCode = item.SystemRoleUuid == null ? "" : item.SystemRoleUuid.ToString(),
                                     IsAssigned = item.SystemPermissionUuid == null ? 0 : 1,
                                 };
                    permissionList = query2.ToList();
                }
                //var permissionList = _dbContext.SystemPermissionWithAssignProperty.FromSql(sql, code.ToString()).ToList();
                var tree = menu.FillRecursive(permissionList, Guid.Empty);//, role.IsSuperAdministrator);
                response.SetData(new { tree, selectedPermissions = permissionList.Where(x => x.IsAssigned == 1).Select(x => x.Code) });
            }

            return Ok(response);
        }

        #region 私有方法

        /// <summary>
        /// 删除权限
        /// </summary>
        /// <param name="isDeleted"></param>
        /// <param name="ids">权限ID字符串,多个以逗号隔开</param>
        /// <returns></returns>
        private ResponseModel UpdateIsDelete(CommonEnum.IsDeleted isDeleted, string ids)
        {
            using (_dbContext)
            {
                var parameters = ids.Split(",").Select((id, index) => new SqlParameter(string.Format("@p{0}", index), id)).ToList();
                var parameterNames = string.Join(", ", parameters.Select(p => p.ParameterName));
                var sql = string.Format("UPDATE SystemPermission SET IsDeleted=@IsDeleted WHERE SystemPermissionUUID IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@IsDeleted", (int)isDeleted));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("删除", "成功:删除:系统权限管理列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }

        /// <summary>
        /// 删除权限
        /// </summary>
        /// <param name="status">权限状态</param>
        /// <param name="ids">权限ID字符串,多个以逗号隔开</param>
        /// <returns></returns>
        private ResponseModel UpdateStatus(CommonEnum.Status status, string ids)
        {
            using (_dbContext)
            {
                var parameters = ids.Split(",").Select((id, index) => new SqlParameter(string.Format("@p{0}", index), id)).ToList();
                var parameterNames = string.Join(", ", parameters.Select(p => p.ParameterName));
                var sql = string.Format("UPDATE SystemPermission SET Status=@Status WHERE SystemPermissionUUID IN ({0})", parameterNames);
                parameters.Add(new SqlParameter("@Status", (int)status));
                _dbContext.Database.ExecuteSqlRaw(sql, parameters);
                ToLog.AddLog("禁用", "成功:禁用:系统权限管理列表数据", _dbContext);
                var response = ResponseModelFactory.CreateInstance;
                return response;
            }
        }
        #endregion
    }


    /// <summary>
    /// 
    /// </summary>
    public static class PermissionTreeHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="menus">菜单集合</param>
        /// <param name="permissions">权限集合</param>
        /// <param name="parentGuid">父级菜单GUID</param>
        /// <param name="isSuperAdministrator">是否为超级管理员角色</param>
        /// <returns></returns>
        public static List<PermissionMenuTree> FillRecursive(this List<PermissionMenuTree> menus, List<SystemPermissionWithAssignProperty> permissions, Guid? parentGuid, bool isSuperAdministrator = false)
        {
            List<PermissionMenuTree> recursiveObjects = new List<PermissionMenuTree>();
            foreach (var item in menus.Where(x => x.ParentGuid == parentGuid))
            {
                var children = new PermissionMenuTree
                {
                    AllAssigned = isSuperAdministrator ? true : (permissions.Where(x => x.MenuGuid == item.Guid).Count(x => x.IsAssigned == 0) == 0),
                    Expand = true,
                    Guid = item.Guid,
                    ParentGuid = item.ParentGuid,
                    Permissions = permissions.Where(x => x.MenuGuid == item.Guid).Select(x => new PermissionElement
                    {
                        Name = x.Name,
                        Code = x.Code,
                        IsAssignedToRole = IsAssigned(x.IsAssigned, isSuperAdministrator)
                    }).ToList(),

                    Title = item.Title,
                    Children = FillRecursive(menus, permissions, item.Guid)
                };
                recursiveObjects.Add(children);
            }
            return recursiveObjects;
        }

        private static bool IsAssigned(int isAssigned, bool isSuperAdministrator)
        {
            if (isSuperAdministrator)
            {
                return true;
            }
            return isAssigned == 1;
        }

        //public static List<PermissionMenuTree> FillRecursive(this List<PermissionMenuTree> menus, List<DncPermissionWithAssignProperty> permissions, Guid? parentGuid)
        //{
        //    List<PermissionMenuTree> recursiveObjects = new List<PermissionMenuTree>();

        //    return recursiveObjects;
        //}
    }
}