using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.Department;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemMenu;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemPermission;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemRole;
using HaiKanTravelManagementSystem.Api.ViewModels.Rbac.SystemUser;
using HaiKanTravelManagementSystem.Api.Entities;
using HaiKanTravelManagementSystem.Api.ViewModels.Scene;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Mark;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.VideoMark;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Mapmark;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Food;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.SpecialPick;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.CarPark;
using HaiKanTravelManagementSystem.Api.ViewModels.SpotPublicity;
using HaiKanTravelManagementSystem.Api.ViewModels.Intelligentguide.Hotel;
//using HaiKanTravelManagementSystem.Api.ViewModels.Person;
//using HaiKanTravelManagementSystem.Api.ViewModels.Base;
//using HaiKanTravelManagementSystem.Api.ViewModels.Score;

namespace HaiKanTravelManagementSystem.Api.Configurations
{
    public class MappingProfile: Profile
    {
        public MappingProfile()
        {
            #region SystemUser
            CreateMap<SystemUser, UserJsonModel>();
            CreateMap<UserCreateViewModel, SystemUser>();
            CreateMap<UserEditViewModel, SystemUser>();
            CreateMap<SystemUser, UserEditViewModel>();
            #endregion
            #region SystemRole
            CreateMap<SystemRole, RoleJsonModel>();
            CreateMap<RoleCreateViewModel, SystemRole>();
            CreateMap<SystemRole, RoleCreateViewModel>();
            #endregion

            #region SystemMenu
            CreateMap<SystemMenu, MenuJsonModel>();
            CreateMap<MenuCreateViewModel, SystemMenu>();
            CreateMap<MenuEditViewModel, SystemMenu>();
            CreateMap<SystemMenu, MenuEditViewModel>();
            #endregion

            #region SystemPermission
            CreateMap<SystemPermission, PermissionJsonModel>()
                .ForMember(d => d.MenuName, s => s.MapFrom(x => x.SystemMenuUu.Name))
                .ForMember(d => d.PermissionTypeText, s => s.MapFrom(x => x.Type.ToString()));
            CreateMap<PermissionCreateViewModel, SystemPermission>();
            CreateMap<PermissionEditViewModel, SystemPermission>();
            CreateMap<SystemPermission, PermissionEditViewModel>();
            #endregion

            #region ScenicSpot
            CreateMap<ScenicSpotViewModel, ScenicSpot>();
            CreateMap<ScenicSpot, ScenicSpotViewModel>();
            #endregion

            #region Mark
            CreateMap<MarkViewModel, Mark>();
            CreateMap<Mark, MarkViewModel>();
            #endregion
            #region Mapmark
            CreateMap<MapmarkViewModel, Mapmark>();
            CreateMap<Mapmark, MapmarkViewModel>();
            #endregion
           
            #region Videomark
            CreateMap<VideoMarkViewModel, Videomark>();
            CreateMap<Videomark, VideoMarkViewModel>();
            #endregion
            #region Food
            CreateMap<FoodViewModel, Food>();
            CreateMap<Food, FoodViewModel>();
            #endregion
            #region SpecialPick
            CreateMap<SpecialPickViewModel, SpecialPick>();
            CreateMap<SpecialPick, SpecialPickViewModel>();
            #endregion
            #region SpecialPick
            CreateMap<CarParkViewModel, CarPark>();
            CreateMap<CarPark, CarParkViewModel>();
            #endregion
            #region PublicityType
            CreateMap<PublicityType, PublicityTypeViewModel>();
            CreateMap<PublicityTypeViewModel, PublicityType>();
            #endregion
            #region Publicity
            CreateMap<PublicityViewModel, Publicity>();
            CreateMap<Publicity, PublicityViewModel>();
            #endregion
            #region PromotionalVideo
            CreateMap<PromotionalVideoViewModel, PromotionalVideo>();
            CreateMap<PromotionalVideo, PromotionalVideoViewModel>();
            #endregion
            #region Hotel
            CreateMap<HotelViewModel, Hotel>();
            CreateMap<Hotel, HotelViewModel>();
            #endregion
            

        }
    }
}
