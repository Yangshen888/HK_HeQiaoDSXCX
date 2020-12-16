using System;
using HaiKanTravelManagementSystem.Api.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace HaiKanTravelManagementSystem.Api.Entities
{
    public partial class haikanHeQiaoContext : DbContext
    {
        public haikanHeQiaoContext()
        {
        }

        public haikanHeQiaoContext(DbContextOptions<haikanHeQiaoContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ActiveQuantity> ActiveQuantity { get; set; }
        public virtual DbSet<ArticleType> ArticleType { get; set; }
        public virtual DbSet<ArticlesManagement> ArticlesManagement { get; set; }
        public virtual DbSet<AttractRanking> AttractRanking { get; set; }
        public virtual DbSet<Attractions> Attractions { get; set; }
        public virtual DbSet<Bank> Bank { get; set; }
        public virtual DbSet<Bus> Bus { get; set; }
        public virtual DbSet<Cabinet> Cabinet { get; set; }
        public virtual DbSet<CarPark> CarPark { get; set; }
        public virtual DbSet<Complaints> Complaints { get; set; }
        public virtual DbSet<Consult> Consult { get; set; }
        public virtual DbSet<CulturalIntroduc> CulturalIntroduc { get; set; }
        public virtual DbSet<Food> Food { get; set; }
        public virtual DbSet<Gtoilet> Gtoilet { get; set; }
        public virtual DbSet<Hospital> Hospital { get; set; }
        public virtual DbSet<Hotel> Hotel { get; set; }
        public virtual DbSet<HotelRoom> HotelRoom { get; set; }
        public virtual DbSet<Information> Information { get; set; }
        public virtual DbSet<InformationType> InformationType { get; set; }
        public virtual DbSet<Leavemessage> Leavemessage { get; set; }
        public virtual DbSet<Luxian> Luxian { get; set; }
        public virtual DbSet<Mapmark> Mapmark { get; set; }
        public virtual DbSet<Mark> Mark { get; set; }
        public virtual DbSet<NaturalResources> NaturalResources { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<Pointer> Pointer { get; set; }
        public virtual DbSet<Promotional> Promotional { get; set; }
        public virtual DbSet<PromotionalVideo> PromotionalVideo { get; set; }
        public virtual DbSet<Publicity> Publicity { get; set; }
        public virtual DbSet<PublicityPicture> PublicityPicture { get; set; }
        public virtual DbSet<PublicityType> PublicityType { get; set; }
        public virtual DbSet<ScenicSpot> ScenicSpot { get; set; }
        public virtual DbSet<Searchl> Searchl { get; set; }
        public virtual DbSet<Sharing> Sharing { get; set; }
        public virtual DbSet<SpecialPick> SpecialPick { get; set; }
        public virtual DbSet<Strategy> Strategy { get; set; }
        public virtual DbSet<SystemIcon> SystemIcon { get; set; }
        public virtual DbSet<SystemLog> SystemLog { get; set; }
        public virtual DbSet<SystemMenu> SystemMenu { get; set; }
        public virtual DbSet<SystemPermission> SystemPermission { get; set; }
        public virtual DbSet<SystemRole> SystemRole { get; set; }
        public virtual DbSet<SystemRolePermissionMapping> SystemRolePermissionMapping { get; set; }
        public virtual DbSet<SystemUser> SystemUser { get; set; }
        public virtual DbSet<SystemUserRoleMapping> SystemUserRoleMapping { get; set; }
        public virtual DbSet<TourGuide> TourGuide { get; set; }
        public virtual DbSet<Tourism> Tourism { get; set; }
        public virtual DbSet<Treasurerecord> Treasurerecord { get; set; }
        public virtual DbSet<Videomark> Videomark { get; set; }
        public virtual DbSet<ViewMenu> ViewMenu { get; set; }
        public virtual DbSet<ViewSystemPermissionWithMenu> ViewSystemPermissionWithMenu { get; set; }
        public virtual DbSet<ViewSystemPermissionWithMenu2> ViewSystemPermissionWithMenu2 { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                //optionsBuilder.UseSqlServer("Data Source=192.168.0.214;Initial Catalog=heqiaodaoshi;Persist Security Info=True;User ID=heqiaodaoshi;Password=haikan051030");
                //optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=heqiaodaoshi;Persist Security Info=True;User ID=hq;Password=Haikan051030");
                var conncectstr = ConfigurationManager.ConnectionStrings.DefaultConnection;
                optionsBuilder.UseSqlServer(conncectstr);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ActiveQuantity>(entity =>
            {
                entity.HasKey(e => e.ActiveQuantityUuid)
                    .HasName("PK__ActiveQu__EA8C91A73056A008")
                    .IsClustered(false);

                entity.HasComment("活跃数据");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_ActiveQuantity")
                    .IsClustered();

                entity.Property(e => e.ActiveQuantityUuid)
                    .HasColumnName("ActiveQuantityUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddTime)
                    .HasMaxLength(50)
                    .HasComment("时间 年-月-日");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Num).HasComment("人数");

                entity.Property(e => e.Type).HasComment("类型 1.新增用户 2.登录用户");
            });

            modelBuilder.Entity<ArticleType>(entity =>
            {
                entity.HasComment("文章类型表");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.ArticleTypeUuid)
                    .HasColumnName("ArticleTypeUUID")
                    .HasComment("文章分类UUID");

                entity.Property(e => e.CreateTime).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("类型名称");
            });

            modelBuilder.Entity<ArticlesManagement>(entity =>
            {
                entity.HasKey(e => e.ArticleUuid)
                    .HasName("PK__Articles__3214EC27B5A5775A")
                    .IsClustered(false);

                entity.HasComment("文章管理表");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_ArticlesManagement")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.ArticleUuid)
                    .HasColumnName("ArticleUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasColumnType("datetime")
                    .HasComment("添加时间");

                entity.Property(e => e.ArticleName)
                    .IsUnicode(false)
                    .HasComment("文章内容");

                entity.Property(e => e.ArticleTitle)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("文章标题");

                entity.Property(e => e.ArticleTypeUuid)
                    .HasColumnName("ArticleTypeUUID")
                    .HasComment("文章分类UUID");

                entity.Property(e => e.Count).HasComment("浏览次数");

                entity.Property(e => e.CoverPhoto)
                    .IsUnicode(false)
                    .HasComment("封面图片");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsRecommend).HasComment("是否推荐  0否  1是");

                entity.Property(e => e.IsRelease).HasComment("是否发布0-未发布,1-发布");

                entity.Property(e => e.ReleaseTime)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("发布时间");
            });

            modelBuilder.Entity<AttractRanking>(entity =>
            {
                entity.HasKey(e => e.AttractRankingUuid)
                    .HasName("PK__AttractR__1BE958AA093F4ACC");

                entity.HasComment("打卡排名表");

                entity.Property(e => e.AttractRankingUuid).ValueGeneratedNever();

                entity.Property(e => e.Evaluate).HasComment("评价");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.SceientUuid).HasComment("景点Uuid");

                entity.Property(e => e.State).HasComment("状态");

                entity.Property(e => e.UserUuid).HasComment("用户Uuid");
            });

            modelBuilder.Entity<Attractions>(entity =>
            {
                entity.HasKey(e => e.AttractionsUuid)
                    .HasName("PK__Attracti__C1A2C22B51D5B2E4");

                entity.HasComment("打卡记录表");

                entity.Property(e => e.AttractionsUuid).ValueGeneratedNever();

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("评价时间");

                entity.Property(e => e.Evaluate).HasComment("评价");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.Praise).HasComment("点赞量");

                entity.Property(e => e.SceientUuid).HasComment("景点Uuid");

                entity.Property(e => e.State).HasComment("状态");

                entity.Property(e => e.UserUuid).HasComment("用户Uuid");
            });

            modelBuilder.Entity<Bank>(entity =>
            {
                entity.HasKey(e => e.BankUuid)
                    .HasName("PK__Bank__B721ECE65FC98891");

                entity.HasComment("银行信息表");

                entity.Property(e => e.BankUuid).ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("注册时间");

                entity.Property(e => e.BankAddress).HasComment("位置");

                entity.Property(e => e.BankName).HasComment("名称");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.Staues)
                    .HasMaxLength(255)
                    .HasComment("使用情况");

                entity.Property(e => e.Telephone)
                    .HasMaxLength(255)
                    .HasComment("联系电话");
            });

            modelBuilder.Entity<Bus>(entity =>
            {
                entity.HasKey(e => e.BusUuid)
                    .HasName("PK__Bus__38B050402D3B9B39");

                entity.HasComment("公交路线");

                entity.Property(e => e.BusUuid).ValueGeneratedNever();

                entity.Property(e => e.Address).HasComment("所处位置");

                entity.Property(e => e.BegainSite).HasComment("起始站");

                entity.Property(e => e.BegainTime).HasComment("起始时间");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("发布时间");

                entity.Property(e => e.EndSite).HasComment("终点站");

                entity.Property(e => e.EndTime).HasComment("末班时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduction).HasComment("线路介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Name).HasComment("公交线路名称");

                entity.Property(e => e.PassSite).HasComment("站点名称");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Type)
                    .HasColumnName("type")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Cabinet>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("Cabinet");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(5)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<CarPark>(entity =>
            {
                entity.HasKey(e => e.CarParkUuid)
                    .HasName("PK__CarPark__515660106A869B26")
                    .IsClustered(false);

                entity.HasComment("停车场");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_CarPark")
                    .IsClustered();

                entity.Property(e => e.CarParkUuid)
                    .HasColumnName("CarParkUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasColumnType("datetime")
                    .HasComment("添加时间");

                entity.Property(e => e.Address).HasComment("地址");

                entity.Property(e => e.ChargesNotes)
                    .HasMaxLength(500)
                    .HasComment("收费说明");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("发布时间");

                entity.Property(e => e.FourP)
                    .HasColumnType("decimal(5, 2)")
                    .HasDefaultValueSql("((0))")
                    .HasComment("4小时收费");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Lat)
                    .HasColumnType("decimal(11, 8)")
                    .HasDefaultValueSql("((0))")
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasColumnType("decimal(11, 8)")
                    .HasDefaultValueSql("((0))")
                    .HasComment("经度");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasComment("停车场名称");

                entity.Property(e => e.OneP)
                    .HasColumnType("decimal(5, 2)")
                    .HasDefaultValueSql("((0))")
                    .HasComment("1小时收费");

                entity.Property(e => e.OutFp)
                    .HasColumnName("OutFP")
                    .HasColumnType("decimal(5, 2)")
                    .HasDefaultValueSql("((0))")
                    .HasComment("超4小时收费");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.Price).HasComment("价格");

                entity.Property(e => e.Specification).HasComment("规格");

                entity.Property(e => e.State).HasComment("状态0.保存中 1.已发布");

                entity.Property(e => e.SurplusTs)
                    .HasColumnName("SurplusTS")
                    .HasDefaultValueSql("((0))")
                    .HasComment("剩余车位");

                entity.Property(e => e.ThreeP)
                    .HasColumnType("decimal(5, 2)")
                    .HasDefaultValueSql("((0))")
                    .HasComment("3小时收费");

                entity.Property(e => e.TruckSpace)
                    .HasDefaultValueSql("((0))")
                    .HasComment("总车位");

                entity.Property(e => e.TwoP)
                    .HasColumnType("decimal(5, 2)")
                    .HasDefaultValueSql("((0))")
                    .HasComment("2小时收费");
            });

            modelBuilder.Entity<Complaints>(entity =>
            {
                entity.HasKey(e => e.ComplaintsUuid)
                    .HasName("PK__Complain__9ACA9CD32444148A")
                    .IsClustered(false);

                entity.HasComment("投诉管理");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_Complaints")
                    .IsClustered();

                entity.Property(e => e.ComplaintsUuid)
                    .HasColumnName("ComplaintsUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople).HasComment("添加人");

                entity.Property(e => e.Comcontent)
                    .HasMaxLength(50)
                    .HasComment("内容");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.ReplyContent)
                    .HasMaxLength(50)
                    .HasComment("回复内容");

                entity.Property(e => e.ReplyPeople)
                    .HasMaxLength(50)
                    .HasComment("回复人");

                entity.Property(e => e.ReplyTime)
                    .HasColumnType("datetime")
                    .HasComment("回复时间");

                entity.Property(e => e.State).HasComment("0.未回复 1.已回复");
            });

            modelBuilder.Entity<Consult>(entity =>
            {
                entity.HasKey(e => e.ConsultUuid)
                    .HasName("PK__Consult__E9E22B709B0FD069")
                    .IsClustered(false);

                entity.HasComment("游客服务咨询");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_Consult")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.ConsultUuid)
                    .HasColumnName("ConsultUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople).HasMaxLength(255);

                entity.Property(e => e.AddTime).HasMaxLength(255);

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDeleted).HasDefaultValueSql("((0))");

                entity.Property(e => e.Phone)
                    .HasMaxLength(100)
                    .HasComment("电话号码");

                entity.Property(e => e.PhoneName)
                    .HasMaxLength(100)
                    .HasComment("电话名称");

                entity.Property(e => e.ReleaseState).HasComment("发布状态");

                entity.Property(e => e.ReleaseTime)
                    .HasMaxLength(255)
                    .HasComment("发布时间");
            });

            modelBuilder.Entity<CulturalIntroduc>(entity =>
            {
                entity.HasKey(e => e.CulturalIntroducUuid)
                    .HasName("PK__Cultural__5FAEDC3D34EFC8E4")
                    .IsClustered(false);

                entity.HasComment("人文介绍");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_CulturalIntroduc")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.CulturalIntroducUuid)
                    .HasColumnName("CulturalIntroducUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasColumnType("datetime")
                    .HasComment("添加时间");

                entity.Property(e => e.Content).HasComment("内容");

                entity.Property(e => e.Cover).HasComment("封面图片");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDeleted)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否删除");

                entity.Property(e => e.IsRelease)
                    .HasDefaultValueSql("((0))")
                    .HasComment("发布状态  0未发布  1已发布");

                entity.Property(e => e.Photo).HasComment("3张图片");

                entity.Property(e => e.ReleaseTime)
                    .HasColumnType("datetime")
                    .HasComment("发布时间");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .HasComment("标题");
            });

            modelBuilder.Entity<Food>(entity =>
            {
                entity.HasKey(e => e.FoodUuid)
                    .HasName("PK__Food__D03930DBC472C86F")
                    .IsClustered(false);

                entity.HasComment("美食特产");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_Food")
                    .IsClustered();

                entity.Property(e => e.FoodUuid)
                    .HasColumnName("FoodUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Address).HasComment("地址");

                entity.Property(e => e.Cover)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("封面");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("发布时间");

                entity.Property(e => e.FoodName)
                    .HasMaxLength(255)
                    .HasComment("名称");

                entity.Property(e => e.FoodorTechan).HasComment("0.美食 1.特产");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduction).HasComment("介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.PlayType).HasMaxLength(255);

                entity.Property(e => e.Price)
                    .HasMaxLength(20)
                    .HasComment("价格");

                entity.Property(e => e.ShopId).HasComment("商城所对应ID");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Title).HasComment("简介");

                entity.Property(e => e.Ytype)
                    .HasColumnName("ytype")
                    .HasMaxLength(255)
                    .HasComment("游玩类型 1.古镇游   2.周边游");
            });

            modelBuilder.Entity<Gtoilet>(entity =>
            {
                entity.HasKey(e => e.GtoiletUuid)
                    .HasName("PK__Gtoilet__C81D756B80F23569");

                entity.HasComment("3A公厕信息表");

                entity.Property(e => e.GtoiletUuid).ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("注册时间");

                entity.Property(e => e.GtoiletAddress)
                    .HasMaxLength(255)
                    .HasComment("位置");

                entity.Property(e => e.GtoiletName)
                    .HasMaxLength(255)
                    .HasComment("名称");

                entity.Property(e => e.GtoiletStaues)
                    .HasMaxLength(255)
                    .HasComment("使用情况");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.KongqiZhil)
                    .HasMaxLength(255)
                    .HasComment("空气质量");

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.WaterYujin)
                    .HasMaxLength(255)
                    .HasComment("水量预警");
            });

            modelBuilder.Entity<Hospital>(entity =>
            {
                entity.HasKey(e => e.HospitalUuid)
                    .HasName("PK__Hospital__1446BB33336F28A5");

                entity.HasComment("医院信息表");

                entity.Property(e => e.HospitalUuid).ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("注册时间");

                entity.Property(e => e.HospitalAddress).HasComment("位置");

                entity.Property(e => e.HospitalName).HasComment("名称");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.Staues)
                    .HasMaxLength(255)
                    .HasComment("使用情况");

                entity.Property(e => e.Telephone)
                    .HasMaxLength(255)
                    .HasComment("联系电话");
            });

            modelBuilder.Entity<Hotel>(entity =>
            {
                entity.HasKey(e => e.HotelUuid)
                    .HasName("PK__Hotel__761534FD249D1BC0");

                entity.HasComment("酒店民宿表");

                entity.Property(e => e.HotelUuid)
                    .HasColumnName("HotelUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Address).HasComment("地址");

                entity.Property(e => e.Cover)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("封面");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("发布时间");

                entity.Property(e => e.HotelUrl).HasComment("酒店链接");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduction).HasComment("介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("名称");

                entity.Property(e => e.Phone)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("电话");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.Price).HasComment("价格");

                entity.Property(e => e.ShopId).HasComment("商城所对应ID");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");
            });

            modelBuilder.Entity<HotelRoom>(entity =>
            {
                entity.HasKey(e => e.HotelRoomUuid)
                    .HasName("PK__HotelRoo__F5371ACAF7AEF021")
                    .IsClustered(false);

                entity.HasComment("酒店房型信息表");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_HotelRoom")
                    .IsClustered();

                entity.Property(e => e.HotelRoomUuid).ValueGeneratedNever();

                entity.Property(e => e.Address).HasComment("位置");

                entity.Property(e => e.HotelRoomName).HasComment("房型名称");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduction).HasComment("房型介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.Price).HasComment("价格");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");
            });

            modelBuilder.Entity<Information>(entity =>
            {
                entity.HasKey(e => e.InformationUuid)
                    .HasName("PK__Informat__0AE607DC7D2DAAFE");

                entity.HasComment("景区资讯");

                entity.Property(e => e.InformationUuid)
                    .HasColumnName("InformationUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Address)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("地址");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.InformationTypeUuid)
                    .HasColumnName("InformationTypeUUID")
                    .HasComment("资讯类型");

                entity.Property(e => e.Introduce)
                    .IsUnicode(false)
                    .HasComment("介绍");

                entity.Property(e => e.Photo)
                    .IsUnicode(false)
                    .HasComment("封面图片(一张)");

                entity.Property(e => e.Picture)
                    .IsUnicode(false)
                    .HasComment("图片(三张)");

                entity.Property(e => e.StartTime).HasColumnType("datetime");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("标题");
            });

            modelBuilder.Entity<InformationType>(entity =>
            {
                entity.HasKey(e => e.InformationTypeUuid)
                    .HasName("PK__Informat__DA68CD74ABDBA564");

                entity.HasComment("资讯类型");

                entity.Property(e => e.InformationTypeUuid)
                    .HasColumnName("InformationTypeUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Leavemessage>(entity =>
            {
                entity.HasKey(e => e.LeavemessageUuid)
                    .HasName("PK__Leavemes__F0C1A4928159ECAA");

                entity.HasComment("留言建议");

                entity.Property(e => e.LeavemessageUuid)
                    .HasColumnName("LeavemessageUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .HasComment("留言内容");

                entity.Property(e => e.Createtime)
                    .HasMaxLength(255)
                    .HasComment("留言时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Isdelete)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("是否删除(0:未删除,1:删除)");

                entity.Property(e => e.UserUuid)
                    .HasColumnName("UserUUID")
                    .HasComment("用户id");
            });

            modelBuilder.Entity<Luxian>(entity =>
            {
                entity.HasKey(e => e.LuxianUuid)
                    .HasName("PK__Luxian__CBDCA2C1FE5611FD");

                entity.HasComment("推荐路线表");

                entity.Property(e => e.LuxianUuid)
                    .HasColumnName("LuxianUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("添加时间");

                entity.Property(e => e.Addpeople)
                    .HasMaxLength(255)
                    .HasComment("添加人");

                entity.Property(e => e.Address).HasComment("地址");

                entity.Property(e => e.Count).HasComment("浏览次数");

                entity.Property(e => e.Cover)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("封面");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("发布时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduction).HasComment("介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasComment("名称");

                entity.Property(e => e.Phone).HasComment("电话");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.PlayType).HasMaxLength(255);

                entity.Property(e => e.Price).HasComment("价格");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Ytype)
                    .HasColumnName("ytype")
                    .HasMaxLength(255)
                    .HasComment("游玩类型 1.古镇游   2.周边游");
            });

            modelBuilder.Entity<Mapmark>(entity =>
            {
                entity.HasKey(e => e.MapmarkUuid)
                    .HasName("PK__Mapmark__E3C33BC2996109D5")
                    .IsClustered(false);

                entity.HasComment("地图标识");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_Mapmark")
                    .IsClustered();

                entity.Property(e => e.MapmarkUuid)
                    .HasColumnName("MapmarkUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduce)
                    .HasMaxLength(255)
                    .HasComment("介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.MarkUuid)
                    .HasColumnName("MarkUUID")
                    .HasComment("标识uuid");

                entity.Property(e => e.Position)
                    .HasMaxLength(50)
                    .HasComment("经纬度");

                entity.HasOne(d => d.MarkUu)
                    .WithMany(p => p.Mapmark)
                    .HasForeignKey(d => d.MarkUuid)
                    .HasConstraintName("FK__Mapmark__MarkUUI__0AF29B96");
            });

            modelBuilder.Entity<Mark>(entity =>
            {
                entity.HasKey(e => e.MarkUuid)
                    .HasName("PK__Mark__8201776D3CC73577")
                    .IsClustered(false);

                entity.HasComment("标识管理");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_Mark")
                    .IsClustered();

                entity.Property(e => e.MarkUuid)
                    .HasColumnName("MarkUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.MarkName)
                    .HasMaxLength(50)
                    .HasComment("标识名称");

                entity.Property(e => e.MarkPicture)
                    .HasMaxLength(100)
                    .HasComment("标识图片");
            });

            modelBuilder.Entity<NaturalResources>(entity =>
            {
                entity.HasKey(e => e.NaturalResourcesUuid)
                    .HasName("PK__NaturalR__88904D0860741C18")
                    .IsClustered(false);

                entity.HasComment("自然资源");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_NaturalResources")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.NaturalResourcesUuid)
                    .HasColumnName("NaturalResourcesUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasColumnType("datetime")
                    .HasComment("添加时间");

                entity.Property(e => e.Content).HasComment("内容");

                entity.Property(e => e.Cover).HasComment("封面");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDeleted)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否删除");

                entity.Property(e => e.IsRelease)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否发布");

                entity.Property(e => e.Photo).HasComment("3张图片");

                entity.Property(e => e.ReleaseTime)
                    .HasColumnType("datetime")
                    .HasComment("发布时间");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .HasComment("标题");
            });

            modelBuilder.Entity<News>(entity =>
            {
                entity.HasKey(e => e.NewsUuid)
                    .HasName("PK__News__95B8416C583889E1")
                    .IsClustered(false);

                entity.HasComment("消息发布");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_News")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.NewsUuid)
                    .HasColumnName("NewsUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.NewsContent).HasComment("内容");

                entity.Property(e => e.ReleaseState).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Title)
                    .HasMaxLength(50)
                    .HasComment("标题");
            });

            modelBuilder.Entity<Pointer>(entity =>
            {
                entity.HasKey(e => e.PointerUuid)
                    .HasName("PK__Pointer__ABA5D8F0F40F5406");

                entity.HasComment("导视设备信息管理");

                entity.Property(e => e.PointerUuid).ValueGeneratedNever();

                entity.Property(e => e.Address).HasComment("所出地址");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.PointerName).HasComment("设备名称");

                entity.Property(e => e.PointerNum).HasComment("设备编号");
            });

            modelBuilder.Entity<Promotional>(entity =>
            {
                entity.HasKey(e => e.PromotionalUuid)
                    .HasName("PK__Promotio__D6D4BCBC61FF6ADB");

                entity.HasComment("宣传视频表");

                entity.Property(e => e.PromotionalUuid).ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("添加时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.PromotionalContent).HasComment("视频内容");

                entity.Property(e => e.Staues).HasMaxLength(255);

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .HasComment("视频标题");

                entity.Property(e => e.Video).HasComment("视频路径");
            });

            modelBuilder.Entity<PromotionalVideo>(entity =>
            {
                entity.HasKey(e => e.PromotionalVideoUuid)
                    .HasName("PK__Promotio__C91CC775C17EEBC7");

                entity.HasComment("宣传视频");

                entity.Property(e => e.PromotionalVideoUuid)
                    .HasColumnName("PromotionalVideoUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Cover)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("封面图片");

                entity.Property(e => e.CreateTime).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsRecommend).HasComment("是否推荐  0否  1是");

                entity.Property(e => e.ReleaseState).HasComment("0.未发布 1.已发布");

                entity.Property(e => e.ReleaseTime)
                    .HasColumnType("date")
                    .HasComment("发布时间");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("标题");

                entity.Property(e => e.Video)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("视频");
            });

            modelBuilder.Entity<Publicity>(entity =>
            {
                entity.HasKey(e => e.PublicityUuid)
                    .HasName("PK__Publicit__6D89C5C30D4E7BEF");

                entity.HasComment("宣传详情");

                entity.Property(e => e.PublicityUuid)
                    .HasColumnName("PublicityUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Cover)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("封面图片");

                entity.Property(e => e.CreateTime).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduce)
                    .IsUnicode(false)
                    .HasComment("内容");

                entity.Property(e => e.Picture)
                    .IsUnicode(false)
                    .HasComment("内容图片");

                entity.Property(e => e.PublicityTypeUuid)
                    .HasColumnName("PublicityTypeUUID")
                    .HasComment("类型");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("标题");

                entity.Property(e => e.Video)
                    .IsUnicode(false)
                    .HasComment("视频");

                entity.HasOne(d => d.PublicityTypeUu)
                    .WithMany(p => p.Publicity)
                    .HasForeignKey(d => d.PublicityTypeUuid)
                    .HasConstraintName("FK__Publicity__Publi__0BE6BFCF");
            });

            modelBuilder.Entity<PublicityPicture>(entity =>
            {
                entity.HasKey(e => e.PublicityPictureUuid)
                    .HasName("PK__Publicit__7C53D74B3BC469C0")
                    .IsClustered(false);

                entity.HasComment("宣传图片");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_PublicityPicture")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.PublicityPictureUuid)
                    .HasColumnName("PublicityPictureUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasColumnType("datetime")
                    .HasComment("添加时间");

                entity.Property(e => e.Content).HasComment("内容");

                entity.Property(e => e.Cover).HasComment("封面图片");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDeleted)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否删除 0未删  1已删");

                entity.Property(e => e.IsRelease)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否发布");

                entity.Property(e => e.Photo).HasComment("3张图片");

                entity.Property(e => e.ReleaseTime)
                    .HasColumnType("datetime")
                    .HasComment("发布时间");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .HasComment("标题");
            });

            modelBuilder.Entity<PublicityType>(entity =>
            {
                entity.HasKey(e => e.PublicityTypeUuid)
                    .HasName("PK__Publicit__3132BECF7C91DA36");

                entity.HasComment("宣传类别");

                entity.Property(e => e.PublicityTypeUuid)
                    .HasColumnName("PublicityTypeUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("类型名称");
            });

            modelBuilder.Entity<ScenicSpot>(entity =>
            {
                entity.HasKey(e => e.ScenicSpotUuid)
                    .HasName("PK__ScenicSp__86314512B31CAAA4")
                    .IsClustered(false);

                entity.HasComment("景点介绍");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_ScenicSpot")
                    .IsClustered();

                entity.Property(e => e.ScenicSpotUuid)
                    .HasColumnName("ScenicSpotUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Address).HasComment("地址");

                entity.Property(e => e.Audio).HasComment("音频");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.IsRecommend).HasComment("是否推荐   0否  1是");

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasComment("名称");

                entity.Property(e => e.OrderBy).HasComment("排序");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.PlayType).HasMaxLength(255);

                entity.Property(e => e.ShopId).HasComment("商城所对应ID");

                entity.Property(e => e.SpotContent).HasComment("介绍");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.TourismUuid).HasComment("所属景区");

                entity.Property(e => e.Type)
                    .HasMaxLength(255)
                    .HasComment("类型");

                entity.Property(e => e.Video).HasComment("视频");

                entity.Property(e => e.Ytype)
                    .HasColumnName("ytype")
                    .HasMaxLength(255)
                    .HasComment("游玩类型 1.古镇游   2.周边游");
            });

            modelBuilder.Entity<Searchl>(entity =>
            {
                entity.HasKey(e => e.Guid)
                    .HasName("PK__search__497F6CB4B8FCE125");

                entity.ToTable("searchl");

                entity.HasComment("全局搜索表");

                entity.Property(e => e.Guid)
                    .HasColumnName("guid")
                    .ValueGeneratedNever();

                entity.Property(e => e.Text)
                    .HasColumnName("text")
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("关键词");

                entity.Property(e => e.Url)
                    .HasColumnName("url")
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("跳转地址");
            });

            modelBuilder.Entity<Sharing>(entity =>
            {
                entity.HasKey(e => e.SharingUuid)
                    .HasName("PK__Sharing__FF18238810FB386F");

                entity.HasComment("共享单车站点");

                entity.Property(e => e.SharingUuid).ValueGeneratedNever();

                entity.Property(e => e.Address).HasComment("所处位置");

                entity.Property(e => e.Cover)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("封面");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("发布时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduction).HasComment("介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasComment("共享单车点位");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Title).HasComment("简介");

                entity.Property(e => e.Type)
                    .HasColumnName("type")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<SpecialPick>(entity =>
            {
                entity.HasKey(e => e.SpecialPickUuid)
                    .HasName("PK__SpecialP__356D48E6AF8F25E3")
                    .IsClustered(false);

                entity.HasComment("特色采摘");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SpecialPick")
                    .IsClustered();

                entity.Property(e => e.SpecialPickUuid)
                    .HasColumnName("SpecialPickUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Address).HasComment("地址");

                entity.Property(e => e.Cover)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("封面");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())")
                    .HasComment("发布时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Introduction).HasComment("介绍");

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Lat)
                    .HasMaxLength(255)
                    .HasComment("纬度");

                entity.Property(e => e.Lon)
                    .HasMaxLength(255)
                    .HasComment("经度");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasComment("名称");

                entity.Property(e => e.Phone).HasComment("电话");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.PlayType).HasMaxLength(255);

                entity.Property(e => e.Price).HasComment("价格");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Ytype)
                    .HasColumnName("ytype")
                    .HasMaxLength(255)
                    .HasComment("游玩类型 1.古镇游   2.周边游");
            });

            modelBuilder.Entity<Strategy>(entity =>
            {
                entity.HasKey(e => e.StrategyUuid)
                    .HasName("PK__Strategy__B3C3A5A2A035CB8C");

                entity.HasComment("攻略发布表");

                entity.Property(e => e.StrategyUuid).ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("添加时间");

                entity.Property(e => e.AuditStaues).HasComment("审核状态 0,未审核  1.已审核");

                entity.Property(e => e.Count).HasComment("浏览次数");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.PhotoUrl).HasComment("图片路径");

                entity.Property(e => e.PlayType).HasMaxLength(255);

                entity.Property(e => e.Staues).HasMaxLength(255);

                entity.Property(e => e.StrategyContent).HasComment("攻略内容");

                entity.Property(e => e.SystemUserUuid)
                    .HasColumnName("SystemUserUUID")
                    .HasComment("用户UUID");

                entity.Property(e => e.ThroughStaues).HasComment("通过状态 0,通过  1.不通过 2.暂未审核");

                entity.Property(e => e.TipsType).HasComment("1.攻略 2.自驾路线");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .HasComment("攻略标题");

                entity.Property(e => e.Ytype)
                    .HasColumnName("ytype")
                    .HasMaxLength(255)
                    .HasComment("游玩类型 1.古镇游   2.周边游");
            });

            modelBuilder.Entity<SystemIcon>(entity =>
            {
                entity.HasKey(e => e.SystemIconUuid)
                    .HasName("PK__SystemIc__540CED9CA9C5EF3A")
                    .IsClustered(false);

                entity.HasComment("图标");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemIcon")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemIconUuid)
                    .HasColumnName("SystemIconUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Color).HasMaxLength(50);

                entity.Property(e => e.Custom).HasMaxLength(60);

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Size).HasMaxLength(20);
            });

            modelBuilder.Entity<SystemLog>(entity =>
            {
                entity.HasKey(e => e.SystemLogUuid)
                    .HasName("PK__SystemLo__EC98D064570938F6")
                    .IsClustered(false);

                entity.HasComment("系统日志表");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemLog")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemLogUuid)
                    .HasColumnName("SystemLogUUID")
                    .HasDefaultValueSql("(newid())");

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasColumnType("datetime")
                    .HasComment("添加时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Ipaddress)
                    .HasColumnName("IPAddress")
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("IP地址");

                entity.Property(e => e.IsDelete).HasComment("标记删除1，未删除2，已删除");

                entity.Property(e => e.OperationContent)
                    .IsRequired()
                    .HasColumnType("text")
                    .HasComment("操作内容");

                entity.Property(e => e.OperationTime)
                    .HasColumnType("datetime")
                    .HasComment("操作时间");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("操作类型(增删改查)");

                entity.Property(e => e.UserId)
                    .HasColumnName("UserID")
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("操作用户ID");

                entity.Property(e => e.UserIdtype)
                    .HasColumnName("UserIDType")
                    .HasComment("用户名和类型");

                entity.Property(e => e.UserName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("操作用户用户名");
            });

            modelBuilder.Entity<SystemMenu>(entity =>
            {
                entity.HasKey(e => e.SystemMenuUuid)
                    .HasName("PK__SystemMe__859EB749BD38D1AA")
                    .IsClustered(false);

                entity.HasComment("菜单表");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemMenu")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemMenuUuid)
                    .HasColumnName("SystemMenuUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Alias).HasMaxLength(255);

                entity.Property(e => e.BeforeCloseFun).HasMaxLength(255);

                entity.Property(e => e.Component).HasMaxLength(255);

                entity.Property(e => e.CreatedByUserName).HasMaxLength(255);

                entity.Property(e => e.CreatedOn).HasMaxLength(255);

                entity.Property(e => e.Description).HasMaxLength(255);

                entity.Property(e => e.Icon).HasMaxLength(255);

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.ModifiedByUserName).HasMaxLength(255);

                entity.Property(e => e.ModifiedOn).HasMaxLength(255);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.ParentName).HasMaxLength(255);

                entity.Property(e => e.Url).HasMaxLength(255);
            });

            modelBuilder.Entity<SystemPermission>(entity =>
            {
                entity.HasKey(e => e.SystemPermissionUuid)
                    .HasName("PK__SystemPe__44671AD2FBD363BB")
                    .IsClustered(false);

                entity.HasComment("权限表");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemPermission")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemPermissionUuid)
                    .HasColumnName("SystemPermissionUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.ActionCode).HasMaxLength(255);

                entity.Property(e => e.CaPower).HasMaxLength(255);

                entity.Property(e => e.CreatedByUserName).HasMaxLength(255);

                entity.Property(e => e.CreatedOn).HasMaxLength(255);

                entity.Property(e => e.Description).HasMaxLength(255);

                entity.Property(e => e.Icon).HasMaxLength(255);

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.ModifiedByUserName).HasMaxLength(255);

                entity.Property(e => e.ModifiedOn).HasMaxLength(255);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.SystemMenuUuid).HasColumnName("SystemMenuUUID");

                entity.HasOne(d => d.SystemMenuUu)
                    .WithMany(p => p.SystemPermission)
                    .HasForeignKey(d => d.SystemMenuUuid)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__SystemPer__Syste__0CDAE408");
            });

            modelBuilder.Entity<SystemRole>(entity =>
            {
                entity.HasKey(e => e.SystemRoleUuid)
                    .HasName("PK__SystemRo__68ACD1AFF45C10EA")
                    .IsClustered(false);

                entity.HasComment("角色表");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemRole")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemRoleUuid)
                    .HasColumnName("SystemRoleUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople).HasMaxLength(255);

                entity.Property(e => e.AddTime).HasMaxLength(255);

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsCreEdu)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否由管理者创建");

                entity.Property(e => e.IsFixation)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否内置  0否,1是");

                entity.Property(e => e.RoleName).HasMaxLength(255);

                entity.Property(e => e.SchoolUuid).HasColumnName("SchoolUUID");
            });

            modelBuilder.Entity<SystemRolePermissionMapping>(entity =>
            {
                entity.HasKey(e => new { e.SystemRoleUuid, e.SystemPermissionUuid })
                    .HasName("PK__SystemRo__4CEAA00283521FC9")
                    .IsClustered(false);

                entity.HasComment("角色权限关系");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemRolePermissionMapping")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemRoleUuid).HasColumnName("SystemRoleUUID");

                entity.Property(e => e.SystemPermissionUuid).HasColumnName("SystemPermissionUUID");

                entity.Property(e => e.AddPeople).HasMaxLength(255);

                entity.Property(e => e.AddTime).HasMaxLength(255);

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<SystemUser>(entity =>
            {
                entity.HasKey(e => e.SystemUserUuid)
                    .HasName("PK__SystemUs__0BD86B9580F5647F")
                    .IsClustered(false);

                entity.HasComment("系统用户");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemUser")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemUserUuid)
                    .HasColumnName("SystemUserUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople)
                    .HasMaxLength(255)
                    .HasComment("添加人");

                entity.Property(e => e.AddTime)
                    .HasMaxLength(255)
                    .HasComment("注册时间");

                entity.Property(e => e.Address)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("地址");

                entity.Property(e => e.Age)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("年龄");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("邮箱");

                entity.Property(e => e.HealthCertificate).HasComment("是否有健康证    0无   1有");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.InTime)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasComment("入职时间");

                entity.Property(e => e.IsCreEdu)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否由管理级别创建  0否   1是");

                entity.Property(e => e.IsDeleted).HasComment("0正常 1删除");

                entity.Property(e => e.IsStaff)
                    .HasDefaultValueSql("((0))")
                    .HasComment("是否为食堂工作人员 0否   1是");

                entity.Property(e => e.Job)
                    .HasMaxLength(255)
                    .HasComment("职务");

                entity.Property(e => e.LoginName)
                    .HasMaxLength(255)
                    .HasComment("登录名");

                entity.Property(e => e.Main)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ManageDepartment).HasColumnType("text");

                entity.Property(e => e.Nickname)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("用户昵称");

                entity.Property(e => e.PassWord)
                    .HasMaxLength(255)
                    .HasComment("密码");

                entity.Property(e => e.Phone)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("电话");

                entity.Property(e => e.Picture)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("头像");

                entity.Property(e => e.Placeofresidence)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("居住地");

                entity.Property(e => e.RealName)
                    .HasMaxLength(255)
                    .HasComment("真实姓名");

                entity.Property(e => e.Remarks)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("备注");

                entity.Property(e => e.SchoolUuid)
                    .HasColumnName("SchoolUUID")
                    .HasComment("学校UUID");

                entity.Property(e => e.Sex)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("性别");

                entity.Property(e => e.StaffNum)
                    .HasMaxLength(255)
                    .HasComment("职工号");

                entity.Property(e => e.SystemRoleUuid)
                    .HasColumnName("SystemRoleUUid")
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("角色id,用逗号分隔");

                entity.Property(e => e.Topic)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("会议主题");

                entity.Property(e => e.Train)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Types)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("部门");

                entity.Property(e => e.UserIdCard)
                    .HasMaxLength(255)
                    .HasComment("身份证");

                entity.Property(e => e.UserType).HasComment("1 超管 2其他");

                entity.Property(e => e.Wechat)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("微信");

                entity.Property(e => e.ZaiGang)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasComment("状态");
            });

            modelBuilder.Entity<SystemUserRoleMapping>(entity =>
            {
                entity.HasKey(e => new { e.SystemUserUuid, e.SystemRoleUuid })
                    .HasName("PK__SystemUs__FD52A68F37AD580B")
                    .IsClustered(false);

                entity.HasComment("用户角色关系");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_SystemUserRoleMapping")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.SystemUserUuid).HasColumnName("SystemUserUUID");

                entity.Property(e => e.SystemRoleUuid).HasColumnName("SystemRoleUUID");

                entity.Property(e => e.AddPeople).HasMaxLength(255);

                entity.Property(e => e.AddTime)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<TourGuide>(entity =>
            {
                entity.HasKey(e => e.TourGuideUuid)
                    .HasName("PK__TourGuid__AF258A567A7E2EEC")
                    .IsClustered(false);

                entity.HasComment("游客服务导游");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_TourGuide")
                    .IsUnique()
                    .IsClustered();

                entity.Property(e => e.TourGuideUuid)
                    .HasColumnName("TourGuideUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.AddPeople).HasMaxLength(255);

                entity.Property(e => e.AddTime).HasMaxLength(255);

                entity.Property(e => e.Content).HasComment("内容");

                entity.Property(e => e.Fmpicture)
                    .HasColumnName("FMPicture")
                    .HasComment("封面图片");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDeleted).HasDefaultValueSql("((0))");

                entity.Property(e => e.Phone)
                    .HasMaxLength(100)
                    .HasComment("电话");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.ReleaseState).HasComment("发布状态");

                entity.Property(e => e.ReleaseTime)
                    .HasMaxLength(255)
                    .HasComment("发布时间");

                entity.Property(e => e.TourGuideName)
                    .HasMaxLength(255)
                    .HasComment("导游名称");
            });

            modelBuilder.Entity<Tourism>(entity =>
            {
                entity.HasKey(e => e.TourismUuid)
                    .HasName("PK__Tourism__E0C2EBC601C39806");

                entity.HasComment("景区介绍");

                entity.Property(e => e.TourismUuid).ValueGeneratedNever();

                entity.Property(e => e.AddPeople).HasMaxLength(255);

                entity.Property(e => e.AddTime).HasMaxLength(50);

                entity.Property(e => e.Address).HasComment("地址");

                entity.Property(e => e.Audio).HasComment("音频");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasComment("名称");

                entity.Property(e => e.OrderBy).HasComment("排序");

                entity.Property(e => e.Picture).HasComment("图片");

                entity.Property(e => e.SpotContent).HasComment("介绍");

                entity.Property(e => e.State).HasComment("0.保存中 1.已发布");

                entity.Property(e => e.Video).HasComment("视频");
            });

            modelBuilder.Entity<Treasurerecord>(entity =>
            {
                entity.HasKey(e => e.TreasurerecordUuid)
                    .HasName("PK__Treasure__71FB5240A2B59BC9");

                entity.HasComment("宝藏记录表");

                entity.Property(e => e.TreasurerecordUuid)
                    .HasColumnName("TreasurerecordUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .HasComment("宝藏内容");

                entity.Property(e => e.Createtime)
                    .HasMaxLength(255)
                    .HasComment("获取时间");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.UserUuid)
                    .HasColumnName("UserUUID")
                    .HasComment("用户id");
            });

            modelBuilder.Entity<Videomark>(entity =>
            {
                entity.HasKey(e => e.VideomarkUuid)
                    .HasName("PK__Videomar__22513F5BFF630013")
                    .IsClustered(false);

                entity.HasComment("语音导览");

                entity.HasIndex(e => e.Id)
                    .HasName("IX_Videomark")
                    .IsClustered();

                entity.Property(e => e.VideomarkUuid)
                    .HasColumnName("VideomarkUUID")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Id)
                    .HasColumnName("ID")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsDelete).HasComment("0.未删 1.已删");

                entity.Property(e => e.Position)
                    .HasMaxLength(50)
                    .HasComment("经纬度");

                entity.Property(e => e.VideoName)
                    .HasMaxLength(50)
                    .HasComment("名称");

                entity.Property(e => e.VideoPath)
                    .HasMaxLength(100)
                    .HasComment("路径");
            });

            modelBuilder.Entity<ViewMenu>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("View_Menu");

                entity.Property(e => e.Alias).HasMaxLength(255);

                entity.Property(e => e.BeforeCloseFun).HasMaxLength(255);

                entity.Property(e => e.Component).HasMaxLength(255);

                entity.Property(e => e.CreatedByUserName).HasMaxLength(255);

                entity.Property(e => e.CreatedOn).HasMaxLength(255);

                entity.Property(e => e.Description).HasMaxLength(255);

                entity.Property(e => e.Icon).HasMaxLength(255);

                entity.Property(e => e.ModifiedByUserName).HasMaxLength(255);

                entity.Property(e => e.ModifiedOn).HasMaxLength(255);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.ParentName).HasMaxLength(255);

                entity.Property(e => e.Pd).HasColumnName("pd");

                entity.Property(e => e.Ps).HasColumnName("ps");

                entity.Property(e => e.Pt).HasColumnName("pt");

                entity.Property(e => e.SystemMenuUuid).HasColumnName("SystemMenuUUID");

                entity.Property(e => e.SystemRoleUuid).HasColumnName("SystemRoleUUID");

                entity.Property(e => e.Url).HasMaxLength(255);
            });

            modelBuilder.Entity<ViewSystemPermissionWithMenu>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("View_SystemPermissionWithMenu");

                entity.Property(e => e.MenuAlias).HasMaxLength(255);

                entity.Property(e => e.MenuName).HasMaxLength(255);

                entity.Property(e => e.Pd).HasColumnName("pd");

                entity.Property(e => e.PermissionActionCode).HasMaxLength(255);

                entity.Property(e => e.PermissionName).HasMaxLength(255);

                entity.Property(e => e.Ps).HasColumnName("ps");

                entity.Property(e => e.SystemRoleUuid).HasColumnName("SystemRoleUUID");
            });

            modelBuilder.Entity<ViewSystemPermissionWithMenu2>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("View_SystemPermissionWithMenu2");

                entity.Property(e => e.MenuAlias).HasMaxLength(255);

                entity.Property(e => e.MenuName).HasMaxLength(255);

                entity.Property(e => e.Pd).HasColumnName("pd");

                entity.Property(e => e.PermissionActionCode).HasMaxLength(255);

                entity.Property(e => e.PermissionName).HasMaxLength(255);

                entity.Property(e => e.Ps).HasColumnName("ps");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
