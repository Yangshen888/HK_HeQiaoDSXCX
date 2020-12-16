/*
 Navicat Premium Data Transfer

 Source Server         : heqiaodaoshi
 Source Server Type    : SQL Server
 Source Server Version : 14002027
 Source Host           : 192.168.0.214:1433
 Source Catalog        : heqiaodaoshi
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14002027
 File Encoding         : 65001

 Date: 16/12/2020 14:18:21
*/


-- ----------------------------
-- Table structure for ActiveQuantity
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ActiveQuantity]') AND type IN ('U'))
	DROP TABLE [dbo].[ActiveQuantity]
GO

CREATE TABLE [dbo].[ActiveQuantity] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [ActiveQuantityUUID] uniqueidentifier  NOT NULL,
  [AddTime] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Num] int  NULL,
  [Type] int  NULL
)
GO

ALTER TABLE [dbo].[ActiveQuantity] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'时间 年-月-日',
'SCHEMA', N'dbo',
'TABLE', N'ActiveQuantity',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'人数',
'SCHEMA', N'dbo',
'TABLE', N'ActiveQuantity',
'COLUMN', N'Num'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型 1.新增用户 2.登录用户',
'SCHEMA', N'dbo',
'TABLE', N'ActiveQuantity',
'COLUMN', N'Type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'活跃数据',
'SCHEMA', N'dbo',
'TABLE', N'ActiveQuantity'
GO


-- ----------------------------
-- Records of ActiveQuantity
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ActiveQuantity] ON
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'1', N'2020-07-28 17:34:18.870', N'D5ABCE29-A80C-4EB3-A662-C227A7C06FE9', N'2020-07-28', N'1', N'1')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'2', N'2020-07-28 17:36:12.673', N'877898F1-FFF7-44BA-9111-376F12665FE9', N'2020-07-28', N'7', N'2')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'3', N'2020-07-29 09:02:26.010', N'106CBED1-E387-4833-8DC6-E312D723C7A1', N'2020-07-29', N'111', N'2')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'4', N'2020-09-26 18:25:37.363', N'C141B5C1-8929-494C-93A1-FD88F2CD0276', N'2020-09-26', N'2', N'1')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'5', N'2020-09-27 14:23:41.360', N'DE54A948-3103-4CE0-B779-5C41483BDF19', N'2020-09-27', N'1', N'1')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'6', N'2020-09-27 14:23:53.457', N'9E9076DF-6BDA-4303-A29D-6C2110DEEA57', N'2020-09-27', N'3', N'2')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'7', N'2020-09-29 11:00:52.290', N'94A09D3E-DE4C-4E8D-945D-AB14523DDAE1', N'2020-09-29', N'1', N'1')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'8', N'2020-10-16 17:34:08.643', N'2A7E4F0C-4D4D-4F2B-B1ED-31FE83373B03', N'2020-10-16', N'2', N'2')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'9', N'2020-10-16 17:36:43.813', N'35599B9D-FB7C-4951-91A1-6E00FC2F3DF1', N'2020-10-16', N'1', N'1')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'10', N'2020-12-10 10:02:16.043', N'592BB16A-0CD9-4683-9D23-85024C433261', N'2020-12-10', N'1', N'1')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'11', N'2020-12-11 16:01:03.317', N'C626B4D0-AF04-4CFC-AE3B-6F3DB0E306F7', N'2020-12-11', N'1', N'1')
GO

INSERT INTO [dbo].[ActiveQuantity] ([ID], [CreateTime], [ActiveQuantityUUID], [AddTime], [Num], [Type]) VALUES (N'12', N'2020-12-11 18:02:34.243', N'F87D60FA-5C55-4753-874A-C3C749236691', N'2020-12-11', N'2', N'2')
GO

SET IDENTITY_INSERT [dbo].[ActiveQuantity] OFF
GO


-- ----------------------------
-- Table structure for ArticlesManagement
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ArticlesManagement]') AND type IN ('U'))
	DROP TABLE [dbo].[ArticlesManagement]
GO

CREATE TABLE [dbo].[ArticlesManagement] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [ArticleTitle] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ArticleTypeUUID] uniqueidentifier  NULL,
  [ReleaseTime] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int  NULL,
  [IsRelease] int  NULL,
  [ArticleUUID] uniqueidentifier  NOT NULL,
  [CoverPhoto] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ArticleName] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime  NULL,
  [Count] int  NULL,
  [IsRecommend] bit DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[ArticlesManagement] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'文章标题',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'ArticleTitle'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文章分类UUID',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'ArticleTypeUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'ReleaseTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否发布0-未发布,1-发布',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'IsRelease'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面图片',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'CoverPhoto'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文章内容',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'ArticleName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'浏览次数',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'Count'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否推荐  0否  1是',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement',
'COLUMN', N'IsRecommend'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文章管理表',
'SCHEMA', N'dbo',
'TABLE', N'ArticlesManagement'
GO


-- ----------------------------
-- Records of ArticlesManagement
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ArticlesManagement] ON
GO

INSERT INTO [dbo].[ArticlesManagement] ([ID], [ArticleTitle], [ArticleTypeUUID], [ReleaseTime], [IsDelete], [IsRelease], [ArticleUUID], [CoverPhoto], [ArticleName], [AddPeople], [AddTime], [Count], [IsRecommend]) VALUES (N'14', N'吴山庙会', N'4498BECD-49D2-44AA-A6C8-7F02BFCC951A', N'2020-08-27 01:01:01', N'0', N'1', N'03325426-DFA6-46D9-9906-37D8E9DFD902', N'20200926_153126153_302a99cf-394b-4116-bef6-b1bb30b5818e.png,20200926_162638525_141326f9-f5ed-475a-983c-ac45fcad9f72.png', N'<p>吴山庙会是杭州规模最大、历史最久的庙会之一。为纪念春秋战国时吴国大夫伍子胥,建造第一座伍公庙以来,两千多年间寺庙庵观,日益增多,几乎遍及吴山境内的紫阳、云居、七宝、峨嵋等十多个大小山头和山麓,</p>', NULL, N'2020-08-27 16:38:20.133', N'5', N'1')
GO

INSERT INTO [dbo].[ArticlesManagement] ([ID], [ArticleTitle], [ArticleTypeUUID], [ReleaseTime], [IsDelete], [IsRelease], [ArticleUUID], [CoverPhoto], [ArticleName], [AddPeople], [AddTime], [Count], [IsRecommend]) VALUES (N'15', N'越剧', N'4498BECD-49D2-44AA-A6C8-7F02BFCC951A', N'2020-08-27 00:00:00', N'0', N'1', N'924B7A86-81BD-4CAA-9E31-0B3888BDD04B', N'20200926_153134925_0fd5a791-8b43-40ff-a943-6b8a11163911.png', N'<p>越剧是杭州的主要地方戏曲，七十年前流行在嵊县一带，现已成为全国的重要剧种之一。越剧擅长抒情，曲调优美，表演细腻。</p>', NULL, N'2020-08-27 16:39:34.490', N'20', N'0')
GO

INSERT INTO [dbo].[ArticlesManagement] ([ID], [ArticleTitle], [ArticleTypeUUID], [ReleaseTime], [IsDelete], [IsRelease], [ArticleUUID], [CoverPhoto], [ArticleName], [AddPeople], [AddTime], [Count], [IsRecommend]) VALUES (N'16', N'团结友爱一家人', N'3A5135D9-ABC6-42FE-AD51-369D3DA2508B', N'2020-09-08 00:00:00', N'0', N'1', N'7A959033-4C2B-4C59-BBA8-A104134F4E86', N'20200902_105454763_07df4d84-e15f-4a4f-9058-f53f1dc517c6.png', N'<p>增加各村之间感情</p>', NULL, N'2020-09-02 10:54:58.303', NULL, N'0')
GO

INSERT INTO [dbo].[ArticlesManagement] ([ID], [ArticleTitle], [ArticleTypeUUID], [ReleaseTime], [IsDelete], [IsRelease], [ArticleUUID], [CoverPhoto], [ArticleName], [AddPeople], [AddTime], [Count], [IsRecommend]) VALUES (N'17', N'xxxxx', N'3A5135D9-ABC6-42FE-AD51-369D3DA2508B', N'2020-09-26 00:00:00', N'0', N'1', N'1D32133F-C223-4121-A638-14376BD9C78D', N'20200926_095627759_bbde64af-b7d2-40b3-8838-f3565a705a2f.png,20200926_095633709_aa84794d-bf70-4591-8606-40f72f4396f9.png', N'<p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>', NULL, N'2020-09-26 09:56:51.777', NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[ArticlesManagement] OFF
GO


-- ----------------------------
-- Table structure for ArticleType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ArticleType]') AND type IN ('U'))
	DROP TABLE [dbo].[ArticleType]
GO

CREATE TABLE [dbo].[ArticleType] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ArticleTypeUUID] uniqueidentifier  NULL,
  [IsDeleted] int  NULL,
  [CreateTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[ArticleType] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型名称',
'SCHEMA', N'dbo',
'TABLE', N'ArticleType',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文章分类UUID',
'SCHEMA', N'dbo',
'TABLE', N'ArticleType',
'COLUMN', N'ArticleTypeUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文章类型表',
'SCHEMA', N'dbo',
'TABLE', N'ArticleType'
GO


-- ----------------------------
-- Records of ArticleType
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ArticleType] ON
GO

INSERT INTO [dbo].[ArticleType] ([ID], [Name], [ArticleTypeUUID], [IsDeleted], [CreateTime]) VALUES (N'9', N'活动', N'3A5135D9-ABC6-42FE-AD51-369D3DA2508B', N'0', N'2020-08-27 16:35:27.167')
GO

INSERT INTO [dbo].[ArticleType] ([ID], [Name], [ArticleTypeUUID], [IsDeleted], [CreateTime]) VALUES (N'10', N'民俗文化', N'4498BECD-49D2-44AA-A6C8-7F02BFCC951A', N'0', N'2020-08-27 16:36:16.997')
GO

INSERT INTO [dbo].[ArticleType] ([ID], [Name], [ArticleTypeUUID], [IsDeleted], [CreateTime]) VALUES (N'11', N'福利', N'C853A936-BC77-473F-B326-79CB3573EE86', N'1', N'2020-09-02 08:56:52.427')
GO

INSERT INTO [dbo].[ArticleType] ([ID], [Name], [ArticleTypeUUID], [IsDeleted], [CreateTime]) VALUES (N'12', N'测试', N'E5C708CE-8CCC-48F3-AEB7-6E14B76BF4FE', N'1', N'2020-09-02 11:13:34.303')
GO

SET IDENTITY_INSERT [dbo].[ArticleType] OFF
GO


-- ----------------------------
-- Table structure for Attractions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Attractions]') AND type IN ('U'))
	DROP TABLE [dbo].[Attractions]
GO

CREATE TABLE [dbo].[Attractions] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [AttractionsUuid] uniqueidentifier  NOT NULL,
  [UserUuid] uniqueidentifier  NULL,
  [SceientUuid] uniqueidentifier  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [Evaluate] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Praise] int  NULL
)
GO

ALTER TABLE [dbo].[Attractions] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户Uuid',
'SCHEMA', N'dbo',
'TABLE', N'Attractions',
'COLUMN', N'UserUuid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'景点Uuid',
'SCHEMA', N'dbo',
'TABLE', N'Attractions',
'COLUMN', N'SceientUuid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Attractions',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'Attractions',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'评价',
'SCHEMA', N'dbo',
'TABLE', N'Attractions',
'COLUMN', N'Evaluate'
GO

EXEC sp_addextendedproperty
'MS_Description', N'评价时间',
'SCHEMA', N'dbo',
'TABLE', N'Attractions',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'点赞量',
'SCHEMA', N'dbo',
'TABLE', N'Attractions',
'COLUMN', N'Praise'
GO

EXEC sp_addextendedproperty
'MS_Description', N'打卡记录表',
'SCHEMA', N'dbo',
'TABLE', N'Attractions'
GO


-- ----------------------------
-- Records of Attractions
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Attractions] ON
GO

INSERT INTO [dbo].[Attractions] ([ID], [AttractionsUuid], [UserUuid], [SceientUuid], [Picture], [State], [Evaluate], [AddTime], [Praise]) VALUES (N'1', N'46ABF695-1261-4DBA-A25C-9494B9F41B29', N'5C38E21E-5BCE-4B6D-ACFD-48B3A9C2BA08', N'641F4127-F3CB-44CB-8324-2E5B71366ACD', NULL, NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Attractions] OFF
GO


-- ----------------------------
-- Table structure for AttractRanking
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AttractRanking]') AND type IN ('U'))
	DROP TABLE [dbo].[AttractRanking]
GO

CREATE TABLE [dbo].[AttractRanking] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [AttractRankingUuid] uniqueidentifier  NOT NULL,
  [UserUuid] uniqueidentifier  NULL,
  [SceientUuid] uniqueidentifier  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [Evaluate] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[AttractRanking] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户Uuid',
'SCHEMA', N'dbo',
'TABLE', N'AttractRanking',
'COLUMN', N'UserUuid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'景点Uuid',
'SCHEMA', N'dbo',
'TABLE', N'AttractRanking',
'COLUMN', N'SceientUuid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'AttractRanking',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'AttractRanking',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'评价',
'SCHEMA', N'dbo',
'TABLE', N'AttractRanking',
'COLUMN', N'Evaluate'
GO

EXEC sp_addextendedproperty
'MS_Description', N'打卡排名表',
'SCHEMA', N'dbo',
'TABLE', N'AttractRanking'
GO


-- ----------------------------
-- Table structure for Bank
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Bank]') AND type IN ('U'))
	DROP TABLE [dbo].[Bank]
GO

CREATE TABLE [dbo].[Bank] (
  [BankUuid] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsDeleted] int  NULL,
  [BankName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [BankAddress] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Staues] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Telephone] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RemarkOne] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RemarkTwo] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Bank] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'BankName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'位置',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'BankAddress'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'使用情况',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'Staues'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'Telephone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'注册时间',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'Bank',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'银行信息表',
'SCHEMA', N'dbo',
'TABLE', N'Bank'
GO


-- ----------------------------
-- Records of Bank
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Bank] ON
GO

INSERT INTO [dbo].[Bank] ([BankUuid], [ID], [IsDeleted], [BankName], [BankAddress], [Lon], [Lat], [Staues], [Telephone], [Remark], [RemarkOne], [RemarkTwo], [Picture], [AddTime], [AddPeople]) VALUES (N'401840FA-7E62-4FFF-A1F8-99CAB52ED1CE', N'1', N'0', N'af', N'af', N'111.11', N'11.1', NULL, N'af', NULL, NULL, NULL, N'20201020_164239865_93192263-2416-41d4-b12e-bfc9ab185c2d.png', N'2020-10-20 16:42:41', N'admin')
GO

SET IDENTITY_INSERT [dbo].[Bank] OFF
GO


-- ----------------------------
-- Table structure for Bus
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Bus]') AND type IN ('U'))
	DROP TABLE [dbo].[Bus]
GO

CREATE TABLE [dbo].[Bus] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [BusUuid] uniqueidentifier  NOT NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [PassSite] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [BegainTime] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [EndTime] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [BegainSite] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [EndSite] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [type] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Bus] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公交线路名称',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'站点名称',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'PassSite'
GO

EXEC sp_addextendedproperty
'MS_Description', N'线路介绍',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'Introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所处位置',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'起始时间',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'BegainTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'末班时间',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'EndTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'起始站',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'BegainSite'
GO

EXEC sp_addextendedproperty
'MS_Description', N'终点站',
'SCHEMA', N'dbo',
'TABLE', N'Bus',
'COLUMN', N'EndSite'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公交路线',
'SCHEMA', N'dbo',
'TABLE', N'Bus'
GO


-- ----------------------------
-- Table structure for CarPark
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[CarPark]') AND type IN ('U'))
	DROP TABLE [dbo].[CarPark]
GO

CREATE TABLE [dbo].[CarPark] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [CarParkUUID] uniqueidentifier  NOT NULL,
  [Name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Specification] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [TruckSpace] int DEFAULT ((0)) NULL,
  [SurplusTS] int DEFAULT ((0)) NULL,
  [Lon] decimal(11,8) DEFAULT ((0)) NULL,
  [Lat] decimal(11,8) DEFAULT ((0)) NULL,
  [OneP] decimal(5,2) DEFAULT ((0)) NULL,
  [TwoP] decimal(5,2) DEFAULT ((0)) NULL,
  [ThreeP] decimal(5,2) DEFAULT ((0)) NULL,
  [FourP] decimal(5,2) DEFAULT ((0)) NULL,
  [OutFP] decimal(5,2) DEFAULT ((0)) NULL,
  [ChargesNotes] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime  NULL,
  [AddPeople] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[CarPark] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'停车场名称',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'规格',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'Specification'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'价格',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'Price'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'总车位',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'TruckSpace'
GO

EXEC sp_addextendedproperty
'MS_Description', N'剩余车位',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'SurplusTS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1小时收费',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'OneP'
GO

EXEC sp_addextendedproperty
'MS_Description', N'2小时收费',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'TwoP'
GO

EXEC sp_addextendedproperty
'MS_Description', N'3小时收费',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'ThreeP'
GO

EXEC sp_addextendedproperty
'MS_Description', N'4小时收费',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'FourP'
GO

EXEC sp_addextendedproperty
'MS_Description', N'超4小时收费',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'OutFP'
GO

EXEC sp_addextendedproperty
'MS_Description', N'收费说明',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'ChargesNotes'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'CarPark',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'停车场',
'SCHEMA', N'dbo',
'TABLE', N'CarPark'
GO


-- ----------------------------
-- Records of CarPark
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CarPark] ON
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'1', N'2020-09-24 00:00:00.000', N'AE8B7349-5928-447F-85FC-D676FA325236', N'镇政府', N'100', N'河桥镇政府', N'0', N'', N'1', N'0', N'0', N'0', N'119.24731400', N'30.10763800', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'2', N'2020-09-24 00:00:00.000', N'037F7DA9-118A-4C80-8E03-27AB1BEF727B', N'新街小停车场', N'100', N'新街小停车场', N'0', N'', N'1', N'0', N'0', N'0', N'119.24275200', N'30.10574400', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'3', N'2020-09-24 00:00:00.000', N'84A3AB56-BF6A-4FF2-95DB-654189A74CB0', N'卫生院', N'100', N'河桥镇卫生院', N'0', N'', N'1', N'0', N'0', N'0', N'119.24231700', N'30.10470000', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'4', N'2020-09-24 00:00:00.000', N'7F3A1F03-8345-4FA3-BD0F-595117C8782F', N'新街大停车场', N'100', N'新街大停车场', N'0', N'', N'1', N'0', N'0', N'0', N'119.24135700', N'30.10257500', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'5', N'2020-09-24 00:00:00.000', N'6D7E3325-9B04-4D3E-AEB3-03137E88195E', N'景区停车场1', N'100', N'景区停车场1', N'0', N'', N'1', N'0', N'0', N'0', N'119.24103500', N'30.10206400', N'.00', N'.00', N'.00', N'.00', N'.00', N'5元/每小时', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'6', N'2020-09-24 00:00:00.000', N'DAA0CB25-36C5-4B98-AFBA-8FC98E8137E9', N'景区停车场2', N'100', N'景区停车场2', N'0', N'', N'1', N'0', N'0', N'0', N'30.10163200', N'119.24133000', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'7', N'2020-09-24 00:00:00.000', N'33AE195B-FAAB-48AF-8E46-73346CD628E0', N'老街入口', N'100', N'老街入口', N'0', N'', N'1', N'0', N'0', N'0', N'30.10426400', N'119.24097600', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'8', N'2020-09-24 00:00:00.000', N'FA9EF984-1B0C-44E4-9591-64BA4FFE0E20', N'老街出口', N'100', N'老街出口', N'0', N'', N'1', N'0', N'0', N'0', N'30.09997100', N'119.23370200', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'9', N'2020-09-24 00:00:00.000', N'6D079671-AC0C-4ED2-A5FD-C738C04ACF26', N'农贸市场', N'100', N'农贸市场', N'0', N'', N'1', N'0', N'0', N'0', N'35.10224500', N'119.23461900', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'10', N'2020-09-24 00:00:00.000', N'3BCDFCD3-0196-4D3A-8802-C56CC1EB36AA', N'影剧院', N'100', N'影剧院', N'0', N'', N'1', N'0', N'20', N'10', N'30.10090800', N'119.23556300', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

INSERT INTO [dbo].[CarPark] ([ID], [CreateTime], [CarParkUUID], [Name], [Specification], [Address], [Price], [Picture], [State], [IsDelete], [TruckSpace], [SurplusTS], [Lon], [Lat], [OneP], [TwoP], [ThreeP], [FourP], [OutFP], [ChargesNotes], [AddTime], [AddPeople]) VALUES (N'11', N'2020-09-24 00:00:00.000', N'FD205101-FFE0-4D24-BF3D-F3147545A31F', N'成校', N'100', N'成校', N'0', N'', N'1', N'0', N'0', N'0', N'30.10152600', N'119.23358400', N'.00', N'.00', N'.00', N'.00', N'.00', N'免费', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[CarPark] OFF
GO


-- ----------------------------
-- Table structure for Complaints
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Complaints]') AND type IN ('U'))
	DROP TABLE [dbo].[Complaints]
GO

CREATE TABLE [dbo].[Complaints] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [ComplaintsUUID] uniqueidentifier  NOT NULL,
  [Comcontent] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] uniqueidentifier  NULL,
  [State] int  NULL,
  [ReplyContent] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReplyTime] datetime  NULL,
  [ReplyPeople] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Complaints] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'Complaints',
'COLUMN', N'Comcontent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Complaints',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'Complaints',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未回复 1.已回复',
'SCHEMA', N'dbo',
'TABLE', N'Complaints',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回复内容',
'SCHEMA', N'dbo',
'TABLE', N'Complaints',
'COLUMN', N'ReplyContent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回复时间',
'SCHEMA', N'dbo',
'TABLE', N'Complaints',
'COLUMN', N'ReplyTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回复人',
'SCHEMA', N'dbo',
'TABLE', N'Complaints',
'COLUMN', N'ReplyPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投诉管理',
'SCHEMA', N'dbo',
'TABLE', N'Complaints'
GO


-- ----------------------------
-- Table structure for Consult
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Consult]') AND type IN ('U'))
	DROP TABLE [dbo].[Consult]
GO

CREATE TABLE [dbo].[Consult] (
  [ID] int  IDENTITY NOT NULL,
  [ConsultUUID] uniqueidentifier  NOT NULL,
  [PhoneName] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReleaseTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReleaseState] int  NULL,
  [IsDeleted] int DEFAULT ((0)) NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Consult] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话名称',
'SCHEMA', N'dbo',
'TABLE', N'Consult',
'COLUMN', N'PhoneName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话号码',
'SCHEMA', N'dbo',
'TABLE', N'Consult',
'COLUMN', N'Phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'Consult',
'COLUMN', N'ReleaseTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布状态',
'SCHEMA', N'dbo',
'TABLE', N'Consult',
'COLUMN', N'ReleaseState'
GO

EXEC sp_addextendedproperty
'MS_Description', N'游客服务咨询',
'SCHEMA', N'dbo',
'TABLE', N'Consult'
GO


-- ----------------------------
-- Records of Consult
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Consult] ON
GO

INSERT INTO [dbo].[Consult] ([ID], [ConsultUUID], [PhoneName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople]) VALUES (N'1', N'BC3D036C-1E6B-4919-8EC5-E4165DFCD79A', N'接警处', N'15477414741', N'2020-08-26 14:52', N'1', N'0', N'2020-08-20 15:31:49', N'超级管理员')
GO

INSERT INTO [dbo].[Consult] ([ID], [ConsultUUID], [PhoneName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople]) VALUES (N'2', N'D8AECA75-CE89-4D87-97E4-33399C7F1441', N'医疗救援', N'14725836900', N'2020-08-26 14:52', N'1', N'0', N'2020-08-26 14:51:47', N'超级管理员')
GO

INSERT INTO [dbo].[Consult] ([ID], [ConsultUUID], [PhoneName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople]) VALUES (N'3', N'F889C5C2-7F09-4612-958F-F715B57341D7', N'旅游投诉', N'14725836900', N'2020-08-26 14:52', N'1', N'0', N'2020-08-26 14:53:32', N'超级管理员')
GO

INSERT INTO [dbo].[Consult] ([ID], [ConsultUUID], [PhoneName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople]) VALUES (N'6', N'76508E86-A148-484D-AAB1-9DBEE0C866B5', N'工商投诉', N'14725836900', N'2020-08-26 14:52', N'1', N'0', N'2020-08-26 14:53:32', N'超级管理员')
GO

INSERT INTO [dbo].[Consult] ([ID], [ConsultUUID], [PhoneName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople]) VALUES (N'11', N'55910BC6-A20B-4497-981E-0E4359E601E4', N'广播站', N'14725836900', N'2020-08-27 12:01', N'1', N'0', N'2020-08-26 14:53:32', N'超级管理员')
GO

INSERT INTO [dbo].[Consult] ([ID], [ConsultUUID], [PhoneName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople]) VALUES (N'12', N'EC249320-CC0E-47EA-A7A0-A7267F7EA3A1', N'报警电话', N'14725836900', N'2020-08-27 12:02', N'0', N'0', N'2020-08-27 10:58:50', N'超级管理员')
GO

SET IDENTITY_INSERT [dbo].[Consult] OFF
GO


-- ----------------------------
-- Table structure for CulturalIntroduc
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[CulturalIntroduc]') AND type IN ('U'))
	DROP TABLE [dbo].[CulturalIntroduc]
GO

CREATE TABLE [dbo].[CulturalIntroduc] (
  [CulturalIntroducUUID] uniqueidentifier  NOT NULL,
  [Title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReleaseTime] datetime  NULL,
  [IsRelease] bit DEFAULT ((0)) NULL,
  [Cover] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime  NULL,
  [AddPeople] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsDeleted] int DEFAULT ((0)) NULL,
  [Photo] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[CulturalIntroduc] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'ReleaseTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布状态  0未发布  1已发布',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'IsRelease'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面图片',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'Content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否删除',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'IsDeleted'
GO

EXEC sp_addextendedproperty
'MS_Description', N'3张图片',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc',
'COLUMN', N'Photo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'人文介绍',
'SCHEMA', N'dbo',
'TABLE', N'CulturalIntroduc'
GO


-- ----------------------------
-- Records of CulturalIntroduc
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CulturalIntroduc] ON
GO

INSERT INTO [dbo].[CulturalIntroduc] ([CulturalIntroducUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'F21698E2-4E01-458D-BA6A-961F794F8E57', N'标题7', N'2020-08-20 00:00:00.000', N'1', N'26.png', N'<p>改变呼叫就回家吧不好就好好几把吧城管局很尴尬更好的一股股股份很高很高发的好地方给对方好几个你价格比较墨迹看不够快交换机 就好快回家和公共花费更多的股份大锅就好</p>', NULL, NULL, N'1', N'0', N'20200826_180808679_86c03c15-1336-43cc-88b4-c55998bee1c0.jpg,20200826_180813466_4a142dc1-657f-471b-a7bf-13d885ed246f.jpg,20200826_180819019_c83fd510-6f88-4e17-8572-738daceb06b2.jpg')
GO

INSERT INTO [dbo].[CulturalIntroduc] ([CulturalIntroducUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'3E867DCF-14CE-4E5D-9D83-4C9A6D857A92', N'标题6', N'2020-08-21 00:00:00.000', N'1', N'26.png', N'<p>改变了健康吗，可能科技好几把没看见比较慢本机号码基本面没看见没看见呼叫就回家吧不好就好好几把吧城管局很尴尬更好的一股股股份很高很高发的好地方给对方好几个号国际化发短信或更换基金会GVhi刚刚法规和公共花费更多的股份大锅就好</p>', NULL, NULL, N'2', N'0', N'20200826_180750850_543a440d-1aa9-43c4-a37b-784fd2659ad5.jpg,20200826_180755623_d14bd55d-6814-4b00-8c65-f922ff9e8781.jpg,20200826_180800558_f3dfa057-509a-40db-8b60-766ca810feb5.jpg')
GO

INSERT INTO [dbo].[CulturalIntroduc] ([CulturalIntroducUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'924AD121-A8BB-4409-BD10-0427A7128447', N'标题5', N'2020-08-21 00:00:00.000', N'1', N'26.png', N'<p>改变绘笔江南吉姆尼看价格好快乐就好不过看见和国家进口呼叫就回家吧不好就好好几把吧城管局很尴尬更好的一股股股份很高很高发的好地方给对方好几个号国际化发短信或更换基金会GVhi刚刚法规和公共花费更多的股份大锅就好</p>', NULL, NULL, N'3', N'0', N'20200826_180731863_cb92ea13-c67a-4ee2-b1d5-d747740c0cad.jpg,20200826_180736624_760e14da-5571-4b4a-b46c-ac68a98c0d9c.jpg,20200826_180741789_bfdce557-d0aa-4336-ab4e-af2985e8ce25.jpg')
GO

INSERT INTO [dbo].[CulturalIntroduc] ([CulturalIntroducUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'DEEAAB63-C438-4BE5-9252-EA10CB776A47', N'标题4', N'2020-08-21 00:00:00.000', N'1', N'26.png', N'<p>改变呼计划本命年，莱卡棉看好你家里你卡了吗，。女健康，美能不能林就不会见不见面 叫就回家吧不好就好好几把吧城管局很尴尬更好的一股股股份很高很高发的好地方给对方好几个号国际化发短信或更换基金会GVhi刚刚法规和公共花费更多的股份大锅就好</p>', NULL, NULL, N'6', N'0', N'20200826_180709284_8745560d-c5c1-4a4f-b83f-5f5a4665adec.jpg,20200826_180714179_f46b292d-5615-46ca-a013-9896a1947392.jpg,20200826_180720401_a7f7ee47-a776-4f4c-99b4-e093d3f6f7ec.jpg')
GO

INSERT INTO [dbo].[CulturalIntroduc] ([CulturalIntroducUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'7B097738-B59A-44CD-91E9-849FAE83CE16', N'标题1', N'2020-08-26 00:00:00.000', N'1', N'20200826_180904685_9a1ba970-4eab-465d-86fb-77a33125ca95.png', N'<p>内容1</p>', N'2020-08-26 18:09:22.857', NULL, N'1004', N'0', N'20200826_180911453_64248b5e-d665-42c1-b9b8-fd6d589b55a0.jpg,20200826_180916444_c058449f-1deb-4bf3-a004-d183eba9ccb4.jpg,20200826_180921364_722e2e22-a9fe-4a7c-b269-5cf83cf25af5.jpg')
GO

INSERT INTO [dbo].[CulturalIntroduc] ([CulturalIntroducUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'2D6B04B2-D7D5-4C7E-B9D9-A0275C59538A', N'标题2', N'2020-08-26 00:00:00.000', N'1', N'20200826_181920147_b03cad69-037b-42c2-a273-f6d3b48f1ba9.jpg', N'<p>内容2</p>', N'2020-08-26 18:19:40.723', NULL, N'1005', N'0', N'20200826_181929946_285f473a-6933-4caa-b4fc-ec6515ecf55c.jpg,20200826_181934557_640e3606-ccb4-4a9e-bc1d-de9a010e67e5.jpg,20200826_181939131_845c9649-093c-491a-a31d-8b3d9bf91f67.jpg')
GO

INSERT INTO [dbo].[CulturalIntroduc] ([CulturalIntroducUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'5A97AC19-A9F1-41C8-9AC0-444753B7112C', N'标题3', N'2020-12-15 17:02:33.540', N'1', N'20200826_182011399_8c31a6bb-8dd6-4d39-a0ef-d87dc37c89ea.jpg', N'<p>内容3</p>', N'2020-08-26 18:20:28.090', NULL, N'1006', N'0', N'20200826_182021653_082ef257-81d0-401c-993a-d71b62da7093.jpg,20200826_182027021_bf35b6ad-7afa-487c-afbb-3673250f2748.jpg,20200827_115653711_88b65452-2bf8-4753-aa77-0f0cabfc97aa.jpg')
GO

SET IDENTITY_INSERT [dbo].[CulturalIntroduc] OFF
GO


-- ----------------------------
-- Table structure for Food
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Food]') AND type IN ('U'))
	DROP TABLE [dbo].[Food]
GO

CREATE TABLE [dbo].[Food] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [FoodUUID] uniqueidentifier  NOT NULL,
  [FoodName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Title] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [FoodorTechan] int  NULL,
  [Cover] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ytype] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PlayType] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ShopId] int  NULL
)
GO

ALTER TABLE [dbo].[Food] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'FoodName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简介',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'价格',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Price'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.美食 1.特产',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'FoodorTechan'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'游玩类型 1.古镇游   2.周边游',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'ytype'
GO

EXEC sp_addextendedproperty
'MS_Description', N'商城所对应ID',
'SCHEMA', N'dbo',
'TABLE', N'Food',
'COLUMN', N'ShopId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'美食特产',
'SCHEMA', N'dbo',
'TABLE', N'Food'
GO


-- ----------------------------
-- Records of Food
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Food] ON
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'1', N'2020-09-24 00:00:00.000', N'37F713C2-59AB-4C84-A6E7-FC2A0FD8F444', N'刀切面', N'庭院面馆', N'刀切面是河桥地区农家传统面食，从古至今，代代相传。刀切面全凭手工制作，先用淡盐水和面，或打入鸡蛋增加韧劲和滑感，接着在面板上反复搓揉，使其成光滑有弹性的面团，然后擀成一张大薄面皮，折叠切割制成面条，麦香四溢。刀切面在煮制后，配上腊肉、笋干、蛋丝、香干、木耳、黄花菜、香菇、雪菜、红绿椒丝等“浇头菜”，撒上葱花、拌入蒜泥……香气四溢、味鲜香浑、厚而不腻。', N'河桥新街59号', N'20元/碗', N'20201214_150308453_3db67a19-0819-4118-8fa6-b1ae7407ac6e.mp4,20201214_150316885_1e19b881-3941-4285-9a05-85e6e9c29f0b.png,20201214_153938858_257e5ae3-8011-469a-9398-af1f373d4b88.png', N'1', N'0', N'0', N'20201211_101815250_2a123759-d133-4107-a33d-7618259b5772.mp4', N'111.11', N'11.11', N'1', N'2', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'2', N'2020-09-24 00:00:00.000', N'ED5A6B67-0FF2-41AE-87D1-BF438A786BEB', N'玉米饼', N'行宫燕楼民宿', N'玉米饼属于一道精品主食，主要原料是玉米、糯米，口味是甜，工艺是煎。玉米中含有的维生素E，具有促进细胞分裂、延缓衰老、降低血清胆固醇、防止皮肤病变的功效。糯米含有蛋白质、脂肪、糖类、钙、磷、铁、维生素B1、维生索B2、烟酸及淀粉等，具有补中益气，健脾养胃，止虚汗等功效。', N'河桥镇曙光村77号', N'未知', N'20200924_160047805_98e9db22-4049-4e28-ae8f-597e163df3f0.png,20200924_160051860_62ee4fff-80c4-44a3-af08-c961ea5b402a.png,20200924_160057166_d7f4b595-0e5b-4d0c-a9c2-87be587cefdf.png', N'1', N'0', N'0', N'20200924_160039332_935bc6cc-f7dc-482e-a445-f669b5f6fc5f.png', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'3', N'2020-09-24 00:00:00.000', N'C6BA527C-4E47-457D-9939-197EFB10A105', N'老街油饼', N'河桥老街油饼店', N'油饼的制作方法和油条一样，只不过是做得形状不一样。先把面抻成圆饼状，要在上边弄几个洞，再涂上食用油，就可以放入锅中炸了。油饼外酥里嫩，油而不腻，有些人当作早餐食用，配上豆汁更加美味。', N'河桥村上街130号', N'5元/个', N'20200924_160157625_94aee4cb-b0bd-400c-80af-a90721e662a2.png,20200924_160203588_905cc35e-8adf-4de5-89e4-1dd99df0f80d.png,20200924_160209120_efab4b03-875a-4a60-a3f4-b47e9acb907a.png', N'1', N'0', N'0', N'20200924_160151060_543d322c-388d-46fa-8b44-29cd112b26fa.png', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'4', N'2020-09-24 00:00:00.000', N'BB4C5768-0A0A-435E-9C6F-9E7CCD4B97F0', N'河桥塌粿', N'河桥老街塌粿店', N'河桥塌馃作为一道当地特色面点，是很多河桥人心目中“完美早餐”的主角儿。一日之计在于晨，一张刚出锅的河桥塌馃足以给一天的劳作开一个好头。刚刚从大煎锅中盛出的河桥塌馃通体金黄，还冒着袅袅浓香，河桥塌馃以富含膳食纤维的苋菜作为味引子，把土猪肉、土鸡蛋的生鲜味儿串起来，外面包裹一层不厚不薄的面皮制作而成，各种食材精确配比。', N'河桥老街', N'8元/个', N'20200924_160256646_4b34ba44-d651-47d3-9b19-61db9904674f.png,20200924_160301881_e5b629b3-353b-4f93-a7fa-ca3fe1e99fdd.png,20200924_160306710_c15d38e1-549a-4490-a6bf-f1d3c18fc87d.png', N'1', N'0', N'0', N'20200924_160250612_8f607895-778c-4499-b90c-230553f85b21.png', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'5', N'2020-09-24 00:00:00.000', N'5AB12FA8-CE5F-4193-9B0E-4FA30EF672C3', N'河桥酥饼', N'燕楼美食店', N'酥饼，系有特制的脂烙酥而得名。脂烙酥用上好的猪油，拌以适量蒸好的面粉，化油时加适量花椒、桂皮，油化后剔出已炸酥的花椒、桂皮，再和面成馅。火烧皮用香油和面，包制好入炉，用文火烘烤而成。其特点是皮酥，瓤有异香而不腻。', N'河桥村上街54号', N'3元/个', N'20200924_160414880_24402d29-a267-4b99-a8ac-dc081144531f.png,20200924_160421362_0ee90287-6af5-46f0-a816-f0802034e8e8.png,20200924_160427888_058eeb0c-54df-4ab1-91e9-b2d983ab5ff5.png', N'1', N'0', N'0', N'20200924_160407990_30cfcbd8-1061-4bac-b079-926eb52d42a4.png', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'6', N'2020-09-24 00:00:00.000', N'A252714C-898F-42FF-BAD0-F090C8E1A9FF', N'柳溪江小鱼干', N'初忆小院', N'选取柳溪江中的小鱼，将小鱼洗净后用盐腌制10分钟后，入油锅炸，再复炸至口感松脆。柳溪江小鱼干口感酥脆，味道鲜香，是初忆小院的招牌菜之一。', N'河桥镇泥骆村', N'60元/盘', N'20200924_160546679_135dd730-2d80-4a80-8d20-adf27225e497.png,20200924_160552994_ec6b23ad-a8bc-4b1b-9f43-f80f71af491b.png,20200924_160558603_0266af7a-4b0e-4197-b190-b3cf8b4bcfe0.png', N'1', N'0', N'1', N'20200924_160540718_bf454813-16f1-4867-834e-78164bf92c23.png', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'7', N'2020-09-24 00:00:00.000', N'3344CCEE-0070-4E34-BD4F-387CE51954FC', N'锦鲤问龙', N'团员人家民宿', N'材料选用的是柳溪江鲤鱼。先杀好洗净，把水沥干。然后开始起火，锅里加入菜籽油，放几片生姜。待油锅热后，把准备的鲤鱼慢慢放进锅里。两边煎至金黄后放黄酒、豆瓣酱，再放酱油、大蒜子等调料。一般鱼肉鲜嫩，入味即可尝试一下味道，加上葱姜蒜红椒。觉的色香味可以就可以上盘上桌了。', N'泥骆村152号', N'78元', N'20200924_160650756_3b84cbc9-1245-4000-b8fa-8497612d3593.jpg,20200924_160702744_d7c60246-b358-4205-8d1f-ec3fd4e25ccb.jpg,20200924_160708561_04a40fea-b177-4b6a-bc43-3fa827a42e5d.jpg', N'1', N'0', N'0', N'20200924_160656992_e5bee4e5-9795-4bae-bf3a-68dcf7d67078.jpg', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'8', N'2020-09-24 00:00:00.000', N'9A096737-A00B-4CE3-ABE2-69CC69187036', N'特色鱼宴', N'竺云家苑', N'全鱼宴又名百鱼宴，因选用鱼类水产品为主要原料，运用多种刀工和烹调方法制作成500多道宴席菜肴而得名，集河鲜、湖鲜之大全，精心烹饪而成。成席之后，五彩斑斓、香气扑鼻，令人垂涎欲滴。其原材料讲究新鲜，刀工精细多变。多用本汁原汤，保持鱼之原味;注重色好形美，重视营养搭配。既有清淡嫩滑之南味，又有鲜香咸辣之北味;既适宜老幼，也让年轻人爱不释口。', N'泥骆村162号', N'季节价格', N'20200924_160858921_f85a7f44-8070-4f0d-a5ef-a4f8702ee5f6.jpg,20200924_160905241_6d19c4ff-4e78-4470-81ea-964a55c786f0.jpg,20200924_160916257_e0d1dc48-d19c-4c5c-a9d3-1ce9d6cd6c7d.jpg', N'1', N'0', N'0', N'20200924_160923582_e6d1a6a0-7b2e-46dc-a8f6-37474f336ec8.jpg', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'9', N'2020-09-24 00:00:00.000', N'D8ADD9D4-8041-43C7-8295-288168CE61CD', N'麻糍', N'唐昌雅逸', N'先把糯米用水浸透，再放进大蒸锅中蒸熟，然后把蒸好的糯米倒在一个用石头做成的石臼里，因为需要用一根很大的木槌不停地捶打糯米，把糯米舂得细腻成团，做出来的麻糍才好吃。这道活特别费劲，一般都是力气大的男人来完成，反复地把糯米捶打成黏黏的团后，再把糯米团拿出来放在案板上揉，直到光滑不粘手。
这样做的麻糍保留了传统的口味，甜而不腻、糯而不黏，吃过以后还会有一个很香甜的回忆。
', N'柳溪街入镇口', N'季节价格', N'20200924_161019471_58fa9f4f-cec8-4ad7-a3dc-9264cf123604.png,20200924_161029300_05ff0824-31e8-42f6-ace9-45e673742029.png,20200924_161033972_ab731666-146a-4c79-a21e-870ad1a59a7f.png', N'1', N'0', N'0', N'20200924_161013080_221bf1c6-2e9b-435a-be50-01342dac146a.png', N'111.11', N'11.11', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[Food] ([ID], [CreateTime], [FoodUUID], [FoodName], [Title], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [FoodorTechan], [Cover], [Lon], [Lat], [ytype], [PlayType], [ShopId]) VALUES (N'10', N'2020-09-24 00:00:00.000', N'82C1686C-3943-48CE-A8C6-89CA627FC517', N'河桥馄饨', N'佳莲美食', N'河桥馄饨，精制调味肉馅和汤料组成。外观汤清澈，馄饨皮薄馅大，晶莹剔透，口感滑爽，入口清香，回味悠长，是一种特别既有地方特色，又适合全国口味的食品。', N'河桥村中街12号', N'8元/碗', N'20200924_161148587_df684c99-9ec7-4269-9c98-4be36c95a879.png,20200924_161153577_1dfb94c0-0534-4d91-9c6a-ba9fab3b68bf.png,20200924_161158579_46711087-477c-4ab5-9dae-9a48aba2a1d6.png', N'1', N'0', N'1', N'20200924_161203828_fb6f48e5-1754-458e-a41b-a71d9372b184.png', N'111.11', N'11.11', N'1', N'1', NULL)
GO

SET IDENTITY_INSERT [dbo].[Food] OFF
GO


-- ----------------------------
-- Table structure for Gtoilet
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Gtoilet]') AND type IN ('U'))
	DROP TABLE [dbo].[Gtoilet]
GO

CREATE TABLE [dbo].[Gtoilet] (
  [GtoiletUuid] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsDeleted] int  NULL,
  [GtoiletName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [GtoiletAddress] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [GtoiletStaues] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [KongqiZhil] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [WaterYujin] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Gtoilet] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'GtoiletName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'位置',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'GtoiletAddress'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'使用情况',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'GtoiletStaues'
GO

EXEC sp_addextendedproperty
'MS_Description', N'空气质量',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'KongqiZhil'
GO

EXEC sp_addextendedproperty
'MS_Description', N'水量预警',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'WaterYujin'
GO

EXEC sp_addextendedproperty
'MS_Description', N'注册时间',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'3A公厕信息表',
'SCHEMA', N'dbo',
'TABLE', N'Gtoilet'
GO


-- ----------------------------
-- Records of Gtoilet
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Gtoilet] ON
GO

INSERT INTO [dbo].[Gtoilet] ([GtoiletUuid], [ID], [IsDeleted], [GtoiletName], [GtoiletAddress], [Lon], [Lat], [GtoiletStaues], [KongqiZhil], [WaterYujin], [AddTime], [AddPeople], [Picture]) VALUES (N'AF2B97E6-2F80-450C-9F43-1AEEE487EE69', N'1', N'0', N'西门老年活动中心后', N'老年活动中心', N'119.247314', N'30.107638', N'正在使用', N'优良', N'正常', N'2020-09-14', N'超级管理员', N'20201020_155828363_fac5d31e-25e6-42fb-b57e-d103083a6e96.jpg')
GO

INSERT INTO [dbo].[Gtoilet] ([GtoiletUuid], [ID], [IsDeleted], [GtoiletName], [GtoiletAddress], [Lon], [Lat], [GtoiletStaues], [KongqiZhil], [WaterYujin], [AddTime], [AddPeople], [Picture]) VALUES (N'6B55C114-D288-43B2-8F92-1DAD1D0FC2DF', N'3', N'0', N'云浪桥头3A公厕', N'云浪桥头', N'119.248898', N'30.111619', N'正在使用', N'优良', N'正常', N'2020-09-14', N'超级管理员', NULL)
GO

INSERT INTO [dbo].[Gtoilet] ([GtoiletUuid], [ID], [IsDeleted], [GtoiletName], [GtoiletAddress], [Lon], [Lat], [GtoiletStaues], [KongqiZhil], [WaterYujin], [AddTime], [AddPeople], [Picture]) VALUES (N'FB07DC14-6A48-449F-93E1-8733BE386A4B', N'2', N'0', N'东门大停车场边', N'东门大停车场', N'119.247048', N'30.107238', N'正在使用', N'优良', N'正常', N'2020-09-14', N'超级管理员', NULL)
GO

INSERT INTO [dbo].[Gtoilet] ([GtoiletUuid], [ID], [IsDeleted], [GtoiletName], [GtoiletAddress], [Lon], [Lat], [GtoiletStaues], [KongqiZhil], [WaterYujin], [AddTime], [AddPeople], [Picture]) VALUES (N'AA67CBE0-D643-49EE-AD78-8ABF473CA9C4', N'7', N'1', N'asfa', N'as', N'111.11', N'11.1', N'w', N'as', N'a', N'2020-10-20 16:02:11', N'admin', N'')
GO

INSERT INTO [dbo].[Gtoilet] ([GtoiletUuid], [ID], [IsDeleted], [GtoiletName], [GtoiletAddress], [Lon], [Lat], [GtoiletStaues], [KongqiZhil], [WaterYujin], [AddTime], [AddPeople], [Picture]) VALUES (N'7C18807E-5AFF-433B-AC89-D0E4CB0B1E4F', N'6', N'0', N'柳溪旅游厕所', N'河桥镇柳溪', N'119.247317', N'30.107641', N'正在使用', N'优良', N'正常', N'2020-09-17', N'超级管理员', NULL)
GO

INSERT INTO [dbo].[Gtoilet] ([GtoiletUuid], [ID], [IsDeleted], [GtoiletName], [GtoiletAddress], [Lon], [Lat], [GtoiletStaues], [KongqiZhil], [WaterYujin], [AddTime], [AddPeople], [Picture]) VALUES (N'EF27A21F-538B-4DF4-B278-E01241B46F76', N'4', N'0', N'老街西门旅游厕所', N'河桥镇河桥村老街西门', N'119.247315', N'30.107639', N'正在使用', N'优良', N'正常', N'2020-09-17', N'超级管理员', NULL)
GO

INSERT INTO [dbo].[Gtoilet] ([GtoiletUuid], [ID], [IsDeleted], [GtoiletName], [GtoiletAddress], [Lon], [Lat], [GtoiletStaues], [KongqiZhil], [WaterYujin], [AddTime], [AddPeople], [Picture]) VALUES (N'B3391DB0-BE2B-4831-8076-E926A58D32AB', N'5', N'0', N'老街东门旅游厕所', N'河桥镇河桥村老街东门', N'119.247316', N'30.107640', N'正在使用', N'优良', N'正常', N'2020-09-17', N'超级管理员', NULL)
GO

SET IDENTITY_INSERT [dbo].[Gtoilet] OFF
GO


-- ----------------------------
-- Table structure for Hospital
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Hospital]') AND type IN ('U'))
	DROP TABLE [dbo].[Hospital]
GO

CREATE TABLE [dbo].[Hospital] (
  [HospitalUuid] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsDeleted] int  NULL,
  [HospitalName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [HospitalAddress] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Staues] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Telephone] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RemarkOne] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [RemarkTwo] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Hospital] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'HospitalName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'位置',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'HospitalAddress'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'使用情况',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'Staues'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'Telephone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'注册时间',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'Hospital',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'医院信息表',
'SCHEMA', N'dbo',
'TABLE', N'Hospital'
GO


-- ----------------------------
-- Records of Hospital
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Hospital] ON
GO

INSERT INTO [dbo].[Hospital] ([HospitalUuid], [ID], [IsDeleted], [HospitalName], [HospitalAddress], [Lon], [Lat], [Staues], [Telephone], [Remark], [RemarkOne], [RemarkTwo], [AddTime], [AddPeople], [Picture]) VALUES (N'E9603159-FA2B-4028-AEDE-0741D4FBFC89', N'1', N'0', N'asd', N'as', N'12', N'1', NULL, N'22', NULL, NULL, NULL, N'2020-10-20 16:56:06', N'admin', N'20201020_165605227_f91ad31a-6594-45a1-8984-61464041d32a.jpg')
GO

SET IDENTITY_INSERT [dbo].[Hospital] OFF
GO


-- ----------------------------
-- Table structure for Hotel
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Hotel]') AND type IN ('U'))
	DROP TABLE [dbo].[Hotel]
GO

CREATE TABLE [dbo].[Hotel] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [HotelUUID] uniqueidentifier  NOT NULL,
  [Name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [AddTime] datetime2(7)  NULL,
  [AddPeople] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Cover] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [HotelUrl] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ShopId] int  NULL
)
GO

ALTER TABLE [dbo].[Hotel] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'价格',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Price'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'酒店链接',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'HotelUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'商城所对应ID',
'SCHEMA', N'dbo',
'TABLE', N'Hotel',
'COLUMN', N'ShopId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'酒店民宿表',
'SCHEMA', N'dbo',
'TABLE', N'Hotel'
GO


-- ----------------------------
-- Records of Hotel
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Hotel] ON
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'3', N'2020-08-26 00:00:00.000', N'1FD38E0A-34CA-401F-9E4E-06A188226C22', N' 百顺百度风尚酒店(钱王大街店)  ', N'15236545547', N'百度酒店，是百度地图旗下的一个酒店频道，是百度出行一体化团队的移动端酒店预订平台。
到店无房，首晚赔付承诺
订单确认后（消费者以收到最终确认短信为准），百度保证消费者按照订单价格入住，如产生以下情况，承诺相应赔付：
• 消费者到店前，酒店(供应商)告知无法安排入住或要求加价入住的；百度将退还全部预订费用，并赔付消费者另行预订入住附近同等酒店房间的差价(不超过订单首晚房费的30%)
• 如消费者到店无房且协调无果，百度赔付消费者另行预订入住附近同等酒店房间的差价， 最高不超过订单首晚房费的金额。
在线交易，支付安全赔付承诺
百度保证消费者在线交易订单（担保订单在线担保、预付订单在线支付）资金安全：
• 若消费者在百度完成在线支付后，酒店（供应商）后续确认无房；百度将立即操作全额退款（由于各支付平台及银行差异，到账时间预计在7-21天左右）。', N'浙江省杭州市临安区钱王街1585', N'200', N'20200827_174048423_55a5e6b2-7b66-4f59-89bc-c14d34240153.jpg,20200827_174054075_54f651f2-bc9c-4f3d-ad03-f878fdfd939d.jpg,20200827_174230110_90688035-ff84-4451-aa8b-0e3c630c0363.jpg', N'1', N'1', NULL, NULL, N'd626c7c399b2c68ff698ac03a15d28e0_4a50bf250e931d5f5dad03fb4c3ac893.jpg', NULL, N'109.441818', N'24.329697', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'22', N'2020-09-24 00:00:00.000', N'89072125-2190-42D1-A80A-06A476A60EED', N'临安江畔（故里民宿）', N'18858173226', N'1', N'河桥镇泥骆村岭27号', N'200-500', N'20200924_084629698_273e03ce-ec36-4b54-8dee-98da412450ee.jpg,20200924_084634875_5334446a-8d24-47ae-a6be-e907a6eebea3.jpg,20200924_084640118_902a95a3-9864-48f7-8c53-21066a3dbb5c.jpg', N'1', N'0', N'2020-09-24 08:46:43.2292598', N'超级管理员', N'20200924_084556500_9fa7f211-cc17-4dce-95b5-6da26af31eb9.jpg', N'', N'119.247314', N'30.107638', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'23', N'2020-09-24 00:00:00.000', N'CD68EA11-F4EB-4647-8E71-07C36AC65D0B', N'君阁瓦居', N'13588832375', N'1', N'泥骆村方家20号', N'300-600', N'20200924_085021047_f0f314f3-407b-4beb-b0c5-ee67fb1c535e.jpg,20200924_085025533_4c09a0de-60b5-4739-8ec2-350774f12c9f.jpg,20200924_085030810_ac689207-3e92-4fc4-96f7-0be1c4958e5b.jpg', N'1', N'0', N'2020-09-24 08:50:32.1399705', N'超级管理员', N'20200924_084951900_e5a6565c-a26f-47f3-89e0-c15ea5ca0655.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'43', N'2020-09-24 00:00:00.000', N'C5A0F86C-858A-47ED-A277-08DEBA57D728', N'杭州临安五都源民宿', N'15867182068', N'1', N'临安区河桥镇蒲村村下蒲村69号', N'1', N'20200924_091902848_d23290e0-99bb-4af9-a171-d0cd31a5f885.jpg,20200924_091907503_d51a490a-b14f-4996-b8e1-209abab3cd65.jpg,20200924_091912572_b62e18a1-a859-438b-a3f7-a623630c400a.jpg', N'1', N'0', N'2020-09-24 09:19:13.8507085', N'超级管理员', N'20200924_091831687_ded291e4-9888-4bb8-ab29-49020c2bc316.jpg', N'', N'119.241336', N'30.107638', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'52', N'2020-09-24 00:00:00.000', N'331DB2C2-1E7E-43AE-8A53-185523C2BD6B', N'云月山间', N'18067981986', N'1', N'河桥镇河桥村曹家', N'600-800', N'20200925_095515841_99e833a8-3906-402c-ab5b-3c79fac52310.jpeg,20200925_095521134_754ec85f-ca44-46f7-b4c4-8ec1cac4ff8e.jpeg,20200925_095526750_f231580e-5134-4440-b50e-6343f9ba13fb.jpeg', N'1', N'0', N'2020-09-24 09:33:17.7444223', N'超级管理员', N'20200925_095507830_5e77ec77-4304-462c-886e-b35145d62d4a.jpeg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'42', N'2020-09-24 00:00:00.000', N'72112E4B-A07E-45C9-8D0F-209B47820C59', N'杭州临安渔稼湾民宿', N'13396523823', N'1', N'临安区河桥镇中鑫村首益石壁坞3号', N'1', N'20200924_091759840_a3893a0d-ffeb-4b32-b6d5-3daadbfd0de2.jpg,20200924_091804770_ab0e5093-95b8-4f53-a798-3aea8be33f34.jpg,20200924_091809776_a913fe13-bb40-4b9a-8868-b1531b68c5ba.jpg', N'1', N'0', N'2020-09-24 09:18:10.4310994', N'超级管理员', N'20200924_091737831_6c023ecc-7999-4a5c-b81f-5b9547049953.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'40', N'2020-09-24 00:00:00.000', N'E720FA2F-3A86-4264-B8A6-332546A520C6', N'谷雨晴楼', N'15869038398', N'谷雨晴楼民宿位于河桥镇九江坞17号，老板，周晓军（15869038398），是位幽默风趣的老村长，自嘲没文化，但民宿的角角落落都是他一人设计搞定的。民宿目前共有13个房间,投资600万左右。民宿内配有会议室、棋牌室，户外还设有蹦床、林间吊椅等多种亲子游乐设施。环境可谓是小桥流水桃源家，幽深小径竹林中。走出房间是高山流水下的天然泳池，也是小朋友们最爱的“水上乐园”，屋后是竹林和树林，还有各种果树，供客人免费采摘。为保证客人绝佳的舒适度，饭菜都是老板娘亲自下厨的，色香味俱全的农家菜让每一位客人都赞不绝口，还有烤红薯、竹筒饭等野味满足大家舌尖上的欲望。民宿为客人准备了丰富的伴手礼，绿色蔬果、土鸡及土鸡蛋、特色笋干等多种农副产品，让每一位入住的客人感受到家的温度。众多公司选择谷雨晴楼民宿搞团建活动，聊天，k歌、烤全羊、篝火晚会嗨翻全场。欢迎大家前来谷雨晴楼民宿寻找最本真的情怀。', N'河桥镇河桥村九江坞', N'500-800', N'20200925_095128931_89a8a38f-7896-4e76-aa29-1e4c459e9e6e.jpg,20200925_095133931_96f0bc9f-9d23-4a64-bbae-cb7a08244861.jpg,20200925_095139530_5b52dd9c-fb3f-47e5-9d99-af33c2eb3cb0.jpg', N'1', N'0', N'2020-09-24 09:15:11.9062836', N'超级管理员', N'20200925_095120197_77b63f49-7f07-44c6-b96b-9e953fbba053.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'38', N'2020-09-24 00:00:00.000', N'FDD105E4-6506-46C8-B185-394FAA14E36F', N'杭州临安溪巷亭民宿', N'13588452675', N'自设特色农家菜馆
仿古的徽式建筑外观以及木质装饰的房间
打造创意民宿的休闲体验活动，内带电梯、会议室、ktv、棋牌室等生活娱乐硬件设施
距离各景点近（半小时左右到达）：河桥古镇，浙西三峡，柳溪江漂流，风之谷户外乐园，湍口众安氡温泉，大明山风景名胜区，浙西凉源峡漂流，瑞景石花洞，浙西大龙湾，龙井峡漂流，三渡悬崖漂流，浙西大峡谷等
发展思路：
让游客体验悠然自得的农家田园生活，发展古镇特色文化旅游
可参与应季特色农业活动：五月份摘野草莓、桑葚等；夏季可下河摸鱼虾河蟹等
可承接团队建设等团体项目，具备会议室等公共事务承接能力', N'河桥镇河桥村柳溪街218号', N'150-300', N'20200925_100536560_74e0afaa-2f5b-4ed0-922c-6a8718e3dd29.png,20200925_100540362_56441720-70bc-4c6c-ad08-b71fceda3b02.png,20200925_100547789_f2d35a6d-13b4-4cb5-8df7-a729b612f080.png', N'1', N'0', N'2020-09-24 09:13:09.9945034', N'超级管理员', N'20200925_100523071_c3ecfc68-40c4-4252-9a3a-2aad006a1ee1.png', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'28', N'2020-09-24 00:00:00.000', N'C00E8A06-F281-4F7A-8B4B-3B00B45BF84B', N'云浪里民宿', N'13067866503', N'云浪里民宿位于杭州临安区河桥镇云浪村，处于浙西临安黄金旅游线上，周边有柳溪江皮筏艇漂流、河桥古镇、浙西山峡快艇码头、湍口温泉、大龙湾漂流、浙西大峡谷、徽杭古道、浙西天池、大明山滑雪场等知名景点，本民宿拥有泳池、大庭院、儿童游乐设施、停车场及多块休息区域，客房宽敞明亮、干净、卫生、温馨。为游客提供细致、舒适的服务，让您在山乡中感受到家的温暖。', N'河桥镇云浪村上周家2号', N'1', N'20200924_161704262_05d0318c-053a-4cb6-b888-0e9b1de17dca.jpg,20200924_161712295_f90d67d6-d68a-4a6e-a7a1-866c6fdf9da5.jpg,20200924_161719078_6931507d-4b57-419c-b9eb-8aff4ec0f251.jpg', N'1', N'0', N'2020-09-24 08:57:58.4690201', N'超级管理员', N'20200924_161653526_04879781-7da3-4840-a6e1-4b838ec408f7.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'39', N'2020-09-24 00:00:00.000', N'9C79C8FD-20E1-43A0-A3B7-3C233FB5D82D', N'常青树', N'13777819851', N'1', N'河桥镇柳溪街', N'300-600', N'20200924_091404891_aded85df-5edb-46ae-86c0-5bab0ee9b959.jpg,20200924_091409502_42402a59-3913-45c8-b334-c11a31239142.jpg,20200924_091414149_497c672c-0fa0-46bc-8159-c6ab20f1a0c1.jpg', N'1', N'0', N'2020-09-24 09:14:15.9849698', N'超级管理员', N'20200924_091329918_e77cdc15-7e72-4393-8e35-e2835d3ad969.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'21', N'2020-09-24 00:00:00.000', N'C3243DE6-7495-4DAF-A7FA-3E60D6C45D69', N'临安市凤林燕屋农家乐（团圆人家）', N'18867511882', N'1', N'临安区河桥镇泥骆村下村一组8号', N'1', N'20200924_084422620_976514b4-5f9f-4a35-9123-f96068b13adb.jpg,20200924_084427753_22fdd310-a98f-47dc-9f4c-5a086f214d4e.jpg,20200924_084433651_32e7a7d9-8e0b-428b-bed8-a8a8c2b08173.jpg', N'1', N'0', N'2020-09-24 08:44:35.7179289', N'超级管理员', N'20200924_084350078_58504261-34f8-4cb3-a4fd-580ed2760665.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'1', N'2020-08-13 00:00:00.000', N'4DF98DD7-5631-4606-8081-40DC3724A52B', N'马可·波罗假日酒店(平海路店', N'15236545547', N'便捷', N'浙江省杭州市上城区平海路38号(近浣纱路,距龙翔桥站约395', N'120', N'20200827_174730329_28b23e3a-0b0d-4407-8869-2fe77386378b.jpg,20200827_174737077_fe083dfa-b366-4d33-a953-1c8093fd001a.jpg,20200827_174749152_1af6251c-5db3-43eb-bb6d-77b5716b653f.jpg', N'0', N'1', NULL, NULL, N'蒙版组31.png', NULL, N'109.441818', N'24.329697', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'33', N'2020-09-24 00:00:00.000', N'BFEC14D6-5D2C-41A2-8FAA-4276B2F4805D', N'杭州临安山峡码头农家乐', N'13868029299', N'1', N'临安市河桥镇柳溪街39号', N'150-398', N'20200924_090418429_266c9cbb-30ad-48ce-b6a3-326a4c793c64.jpg,20200924_090423764_a77f39d2-f6cc-42db-9d6d-88d6c6458707.jpg,20200924_090428827_62c36334-ad82-4e50-bceb-6f42e3f86531.jpg', N'1', N'0', N'2020-09-24 09:04:30.1746797', N'超级管理员', N'20200924_090347127_9497a97f-31ee-4acc-afc4-b4633db70bd0.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'11', N'2020-09-15 00:00:00.000', N'FCD230DB-64F1-4F54-B53C-45CF144C9E8D', N'临安聚秀民宿（玖道）', N'18258436688', N'1', N'浙江省杭州市临安区河桥镇聚秀村朱源塘33号', N'1', N'20200915_141904917_ac1b74e0-60cf-4323-8de1-294d60aee2a9.jpg,20200915_141913076_a61f22d4-30ba-4555-955b-7744b466cb22.jpg,20200915_141919447_fd3af60c-08d4-4a81-9f26-4b4d6276149a.jpg', N'1', N'0', N'2020-09-15 14:19:20.9190614', N'超级管理员', N'20200915_141754275_884cdeb8-720d-40b8-a243-431035d503bd.png', NULL, N'119.1', N'19.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'50', N'2020-09-24 00:00:00.000', N'F402C522-6641-480B-B407-4F3469CB028F', N'南乡', N'13750869188', N'1', N'金燕村沃里12号', N'1', N'20200924_093027577_95cef521-a906-4978-8c62-23c327f92fd4.jpg,20200924_093031944_172f0b1d-9ac5-41ba-a973-0231a7bc93e4.jpg,20200924_093037348_ef102fef-e651-439e-a51a-1e04eca6c3ca.jpg', N'1', N'0', N'2020-09-24 09:30:46.6901862', N'超级管理员', N'20200924_093045251_a839d340-1426-4b63-bef4-ac8d8f8eccbd.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'27', N'2020-09-24 00:00:00.000', N'9DB93145-962B-465B-95B7-506428F09055', N'云水心居民宿（圣地）', N'13003631883', N'1', N'河桥镇云浪村大塘坞', N'280-580', N'20200924_085612441_2ba9e40d-d98f-4b75-b313-25c052258192.jpg,20200924_085619869_b33d918e-7f0d-4df8-8597-cb1ddf5ab304.jpg,20200924_085625028_ce8a34fc-c47d-47ea-afa8-df7d79a5ecf1.jpg', N'1', N'0', N'2020-09-24 08:56:26.3885629', N'超级管理员', N'20200924_085545776_c7935b79-2805-4658-9832-92df866adc1c.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'20', N'2020-09-24 00:00:00.000', N'4A74623F-84D6-41E6-9B92-5CB203E08075', N'临安市竺云农家乐', N'13064729167', N'1', N'临安区河桥镇泥骆村下村一组23号', N'1', N'20200924_084245055_fdfc7b50-8e6b-4601-b79e-83ee7066eb97.jpg,20200924_084252613_308a1a66-7287-4fa3-9af9-595a46bf26a7.jpg,20200924_084258126_1a90a74f-3aa1-4f5b-a25b-d6664eba5997.jpg', N'1', N'0', N'2020-09-24 08:43:09.3277695', N'超级管理员', N'20200924_084307483_d79f7e1f-6cea-4d0b-8baa-186055889af2.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'4', N'2020-08-26 00:00:00.000', N'70C8E66D-C03E-4E97-9288-5DD38D0DE5AC', N'天上人间', N'15236545547', N'临海天上人间酒店位于杜桥牌门路，近杜北路；周围生活配套齐全，交通便利。临海天上人间酒店环境典雅大气，客房舒适整洁，是一家集客房、演艺、餐饮、休闲等为一体的特色酒店。客房内均配有24小时热水、独立淋浴间、洗漱用品、空调等。酒店以“品质感动生活”的服务理念，为宾客提供温馨、热情、周到的人性化服务，是旅游、商务、休闲的不错之选。', N'杜桥牌门路2号', N'300', N'20200827_173618150_73ac2545-0c5e-4521-b9ec-e0060ba89e92.jpg,20200827_173624530_d8e44f59-d167-4f4b-986c-fc78724ff7ec.jpg,20200827_173630944_eee908f7-3aab-4285-98d7-d789b4465ec1.jpg', N'1', N'1', NULL, NULL, N'9bc05ce81ff9243fe40add3c2291fb78_nw_0004r8Su.png', NULL, N'109.441818', N'24.329697', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'8', N'2020-09-15 00:00:00.000', N'67F08D2B-83E9-4D63-92CE-705B8772D533', N'初忆小院', N'15757189001', N'初忆小院在改造前曾是一所小学的校舍，是女主人父母最初认识的地方，也是她自己创业的开始，所以有“初忆”的名字，意味着希望保留这份最初的美好记忆。
虽然初忆的名称颇具浪漫主义的抒情意味，而她倡导的生活，却完全印刻着90后时尚女主人的个性与新潮味。当70后、80后逐渐成熟、老去，开始喝起了茶，还带起了保温杯泡起了枸杞，当他们的生活开始追求平淡安宁，想要学习茶道和花艺，这位94年出生的女孩，却还想拥有快意歌舞的人生。
所以，她的民宿也是这样一种生活理念的再现。这里没有茶道，没有禅意，有的是音乐和啤酒、K歌和蹦迪，有优质的音响，肆意歌舞的时空。生活是你的，你想怎么玩就怎么玩，这是一种减压方式，更是一种生活态度。

     同样，整幢建筑的设计也相应地简约、大胆，让人耳目一新，符合90后天马行空的思维方式。开放式的花园厕所和房间格局，大面积的留白和挑高空间，各种自创的建筑样式和装修设计，无不体现着年轻主人的个性。小院的三楼还有一间家庭影院式豪华套房，可以联网搜索任何内容，包括在线游戏。最特别的要数这幢只有三层楼高的建筑里却按了一部电梯，再次印证了年轻人的生活逻辑：一切设计只为让我舒适。', N'浙江省杭州市临安区河桥镇泥骆村骆村岭1号', N'1', N'20200925_102037879_8a5140c6-7ce6-4e37-85bf-c0e12dd2f5d7.jpg,20200925_102046597_3a19cfec-1895-4a68-94e5-0f606ac65b63.jpg,20200925_102055938_450cc1d7-7505-4cae-ab12-d7c690521555.jpg', N'1', N'0', N'2020-09-15 13:47:50.3368869', N'超级管理员', N'20200925_101856795_2c7a5b7b-43f4-4838-9da1-2ea8a97032cc.jpg', NULL, N'119.1', N'1.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'35', N'2020-09-24 00:00:00.000', N'B111DA45-4DC8-4F18-9415-75564811A97B', N'临安云瑶民宿（水云阁民宿）', N'13750868690', N'临安水云阁民宿位于美丽的浙西柳溪江边，是一家温馨的民宿。交通方便，处于浙西临安黄金旅游线上。为来柳溪江景区、河桥古镇、湍口众安氡温泉、大明山滑雪浙西小三峡、浙西大峡谷漂流的游客提供细致、舒适的服务，让旅客扫除旅行的疲惫，有种回到家的舒适和温馨。
感受唐昌的文化，
观赏历史的老街，
品味江南的生活，
下榻水云阁民宿，
温馨如家的环境，
热情贴心的服务，
心灵休息的静地！', N'临安区河桥镇河桥村曙光', N'1', N'20200924_161914485_cdc76ff9-18e3-486b-8423-54caab90f4ee.jpg,20200924_161919824_abb9e8ae-16cb-4dc2-95e3-6af853038d0f.jpg,20200924_161924949_c6d3af12-56a8-49aa-8225-c6dd178c9c61.jpg', N'1', N'0', N'2020-09-24 09:08:05.8399539', N'超级管理员', N'20200924_161906435_388d0046-8a1d-4564-8dd3-e974a15e0f48.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'45', N'2020-09-24 00:00:00.000', N'72BA70C1-D8D9-4F70-95E9-819F74788593', N'杭州临安归园民宿', N'13073685217', N'“归园”民宿坐落于世上罕见的地下花园——瑞晶石花洞风景区内，房前屋后青山对峙，翠竹摇曳，溪泉叮咚。
民宿为四层小楼，田园式风格，共有 12 个标准间、1个三人间、共27个床位，装修简约大方，电视、网络、热水漱洗、棋牌娱乐等设施一应俱全。热情的服务，可口的菜肴，让你能享受家的舒适和惬意。
野味山珍，松涛鸟鸣，在归园，能让你真正感受山村的纯净清幽。来吧，归园恭迎您，她是您疲惫身躯的栖息地，她是您浮躁心灵的隐居园。', N'河桥镇蒲村村凉溪组18号', N'1', N'20200925_094050716_fd19736e-91e7-469e-b9dc-eacc37535f7f.jpg,20200925_094056020_20a06c1f-38d0-40d5-a9bd-dc5b953369ab.jpg,20200925_094101664_ae0b83ac-6b22-442a-8f55-bf3c3f2cb390.jpg', N'1', N'0', N'2020-09-24 09:21:30.0020251', N'超级管理员', N'20200925_094040326_07fc08bd-5e70-401e-8c9e-fa8de6ce7fee.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'26', N'2020-09-24 00:00:00.000', N'566492F8-53C0-42D2-9D81-82218B1BF86B', N'临安上舍民宿', N'15224078886', N'（上舍民宿）兼具江南民居的精致祥和与私家庭院的宁静安逸。坐落于风景秀丽的临安市河桥镇云浪村，与柳溪江为伴，个体与村庄的息息共生，小院儿处处显露出主人用心，融入自己的生活理念，植入多种文化元素，朴素、舒适，院子，鱼池，质朴却不失精致的餐食，营造出舒适放松的休闲氛围。拥有9间30-50平米各式客房。享受安逸的时光，近可游览河桥古镇，风之谷，湍口温泉，大明山滑雪等景区可供游览。
上舍希望你的每一次入住', N'临安区云浪村方家36号', N'1', N'20200924_162043835_a4bab413-f741-4012-8abc-2fd7ad17431a.jpg,20200924_162056740_dc030a08-61ab-4939-997c-3748890a4dee.JPG,20200924_162104734_97460943-9ba3-4bfe-9aa1-409befc82947.JPG', N'1', N'0', N'2020-09-24 08:54:53.6102824', N'超级管理员', N'20200924_162035573_8dbc2d9e-e2c1-4860-af2b-126de8d13fd2.JPG', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'32', N'2020-09-24 00:00:00.000', N'06A9FD50-15C5-4177-BBCD-8A9F69660BDE', N'杭州临安秀途农家乐（柳溪江假日）', N'13093771878', N'1', N'临安市河桥镇柳溪街158号', N'120-220', N'20200925_094218104_d57879c8-0bab-4e24-bec6-7385b48613f3.JPG,20200925_094225864_138c75e9-7b70-4ed0-9f7a-4657355cfcb0.JPG,20200925_094231917_ff36b971-4c02-4830-943d-e3d6cd1c67cf.JPG', N'1', N'0', N'2020-09-24 09:03:18.1534092', N'超级管理员', N'20200925_094207143_557260c9-b043-4b90-86a1-1a4e08bf9cbe.JPG', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'9', N'2020-09-15 00:00:00.000', N'03111896-EB27-408C-A9F2-8CD683A2270D', N'临安觅野民宿', N'15158881989', N'1', N'浙江省杭州市临安区河桥镇九江坞16号', N'500-1000', N'20200915_135133771_53073118-f147-4f36-8585-daff3782b91d.jpg,20200915_135143177_df79b5a4-7b97-4384-a675-3c0930a568ee.jpg,20200915_135149500_54ece30e-24ce-4c58-b325-1b22550cf1d3.jpg', N'1', N'0', N'2020-09-15 13:51:50.7183241', N'超级管理员', N'20200915_135123198_62114a5b-269e-4c9e-a1c5-5c31f43a8a32.png', NULL, N'119.1', N'1.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'14', N'2020-09-15 00:00:00.000', N'0F81CA4E-B097-4E84-9128-8FC6758B308F', N'临安燕楼民宿', N'18768414368', N'1', N'浙江省杭州市临安区昌化镇河桥镇曙光77号', N'200-460', N'20200915_141904917_ac1b74e0-60cf-4323-8de1-294d60aee2a9.jpg,20200915_141913076_a61f22d4-30ba-4555-955b-7744b466cb22.jpg,20200915_141919447_fd3af60c-08d4-4a81-9f26-4b4d6276149a.jpg', N'1', N'0', N'2020-09-15 14:27:22.9291255', N'超级管理员', N'20200915_142657281_0695ea78-bac3-409d-9b21-5cd18b826f39.png', NULL, N'119.1', N'19.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'6', N'2020-09-15 00:00:00.000', N'557511E7-6213-4E99-863E-92345A5C997E', N'僻地寒楼 ', N'18906510060', N'1', N'临安市河桥镇河桥村九江坞1号', N'1', N'20200923_144039745_82d5d1b3-2830-4e62-b1be-b5747865d93b.jpg,20200923_144114648_4bea68a9-695a-4399-9f6e-6828d1a04c1e.jpg,20200923_144325234_4602f07c-fa2e-4379-a1be-205ac45608b4.jpg', N'1', N'0', N'2020-09-15 13:45:30.4869240', N'超级管理员', N'20200923_144024413_e2801e72-f9b7-4988-8c15-9acd0db8a7ae.jpg', NULL, N'119.1', N'1.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'25', N'2020-09-24 00:00:00.000', N'A7478A04-B00C-435D-B260-9AED3DF06516', N'临安市山青水秀民宿', N'18167136998  15355004818', N'1', N'临安市河桥镇云浪村', N'150-400', N'20200924_085334368_b81b21cf-8a2e-479c-9857-9a7544c9494b.jpg,20200924_085340424_bc3b94d4-064b-45ea-a52a-89e2fda50a31.jpg,20200924_085345144_f77afcc3-f862-4f65-8707-b83d73c262ee.jpg', N'1', N'0', N'2020-09-24 08:53:46.4755533', N'超级管理员', N'20200924_085259134_11dcc2e7-e266-4b70-a99e-c3c15a6d51f6.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'5', N'2020-08-26 00:00:00.000', N'DF609246-2113-4E5C-8F4C-A016F3BC8928', N'乐活酒店', N'11111111111', N'乐活酒店整体装饰现代别致，拥有极具东南亚风格的大堂，客房布置简洁宽敞、色调柔和；房型类别多样，跃层设计布局合理，为宾客营造家一般的温馨，房内配置符合人体工程学设计的独立袋装簧床垫、高端卫浴系列，为宾客营造舒适睡眠空间', N'浙江省杭州市上城区中山中路107号(南宋御街和高银街交叉口)', N'100', N'20200831_140310219_1e12cce7-50c6-4402-bb50-cfa5efef5443.png,20200831_140317872_c7a730a7-6e9e-4184-a690-1b164ae88127.png,20200831_140325049_34e690aa-284e-490e-adb3-810e87c9fab5.png', N'1', N'1', N'2020-08-26 16:45:01.1138540', N'超级管理员', N'蒙版组31.png', NULL, N'109.441818', N'24.329697', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'47', N'2020-09-24 00:00:00.000', N'0635F071-6B09-417D-8BEC-A1AA6AC33B19', N'秀溪山庄', N'15715715757', N'秀溪山庄系華修堂健康产业集团旗下全资品牌，一期投资3000万 ，位于临安河桥镇秀溪村，占地40余亩，自然气息浓厚，是一家集餐饮、住宿、旅游观光、休闲娱乐、棋牌垂钓、亲子采摘、商务会议的主题度假休闲山庄。山庄建筑物利用自然地貌，采取环绕山头的自然布置，形成山衬水托的特点。拥有木屋别墅10栋、临水居客房1栋。各类房型共计38间。可承接各类型的旅游团队。', N'河桥镇秀溪山庄', N'1', N'20200925_095418519_218830b5-9fe3-46fd-b996-32f821fce238.png,20200925_095424465_ad87148b-c0ae-453c-aaba-e48581c44c4e.jpg,20200925_095429519_c2ce8238-6ade-4bd1-8b8a-f151a8722265.png', N'1', N'0', N'2020-09-24 09:27:52.5180070', N'超级管理员', N'20200925_095326475_f5a5c0dc-0765-4c80-b834-8331d4f63698.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'41', N'2020-09-24 00:00:00.000', N'0030B5C2-8D79-4458-B0BC-A1DA9CA83CAD', N'临安定园民宿（高老庄）', N'13645817185', N'临安定园民宿(高老庄）位于临安区河桥镇中鑫村何家10号，距周边主要景点车程在45分钟之内。本民宿主体由两幢连体别墅构成，为美式轻型木结构建筑，每幢一楼是客厅（可K歌），专用厨房，棋牌，餐厅等公共活动区域；二楼、三楼是客房，共有8个标间和6个大床房共14间客房；总体风格轻盈、大方、整洁，在周边独具一格。本民宿的农家菜追求健康、本味，做的非常地道，获得客人的一致好评，留下深刻记忆。我们能按客人要求安排的挖笋、挖地瓜、采摘、杀年猪等农事活动。', N'临安区河桥镇中鑫村上卜何家村10号', N'1', N'20200925_095658452_6dc6c408-7b78-4306-8ae0-52535e434bcb.png,20200925_095703821_3a8296a4-51c7-49c4-9f9f-0862ff319fb9.png,20200925_095709210_1d65d8b6-f372-4bb2-9efa-2346ed14e760.png', N'1', N'0', N'2020-09-24 09:16:49.5069639', N'超级管理员', N'20200925_095649463_2a1d6294-0a9b-4310-bc25-f91186b81ee3.png', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'24', N'2020-09-24 00:00:00.000', N'E1687A09-2CF5-4B99-8212-A7773869834D', N'临安市新平农家乐（官塘）', N'15715738660', N'1', N'临安区河桥镇云浪村', N'1', N'20200925_094003729_b52e7094-dba7-4bd8-b466-36a227c564a3.jpg,20200925_094009002_8460492a-a5bd-47b3-bbfc-76045a41767e.jpg,20200925_094015053_99c4cb16-dabe-4fc4-a4e8-5c89cabcc223.jpg', N'1', N'0', N'2020-09-24 08:52:23.6477088', N'超级管理员', N'20200925_093953554_720d537d-90fa-421c-8a0c-03fe779d0872.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'12', N'2020-09-15 00:00:00.000', N'7C5AAFBD-ED91-4A4D-B14D-B15CAED3800F', N'云庐民宿', N'13605705275', N'1', N'浙江省杭州市临安区河桥镇云浪村沈家11号', N'300-800', N'20200915_142347490_d44028ac-5bf0-4591-813b-456cc287c4c3.jpg,20200915_142358680_4a8d6451-35a3-4c37-bf96-c881f0451629.jpg,20200915_142413376_af6fd129-434c-4585-8f43-8f57b28b8aef.jpg', N'1', N'0', N'2020-09-15 14:24:14.3057216', N'超级管理员', N'20200915_142339835_e3d4f2aa-5159-4648-b999-cf45d6103be1.png', NULL, N'119.1', N'19.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'13', N'2020-09-15 00:00:00.000', N'98F684FA-71F6-4673-BAF5-B37C00CE58FD', N'临安柳栖民宿', N'13395813356', N'    柳栖民宿坐落于美丽的河桥古镇旁，距离河桥古镇千年老街步行2分钟。位置优越，环境宜人。拥有客房15间，客房面积从15——35平方米不等。柳栖民宿提供免费wifi，行李寄存，古镇导游，安排行程，景观自行车租赁等免费服务，让您轻松享受旅途一切的快乐！
     在河桥,柳栖民宿能为你提供一张床，几杯酒，也许还有一些朋友。这就是我们不同于经济型酒店的地方，除了提供一张干净的床之外，还有一个家庭化的吧，有书、有酒、有电影，让每一位寄居这里的旅行者都能感受有朋友的快乐。远离喧嚣，为心灵寻求一方净土。走出闹市，让疲惫的身体得短暂的休整。
     河桥镇是个江镇，除了柳溪江外，还有蜿蜒秀丽的蒲溪，河桥古镇正好处在两江合抱之中，柳栖民宿位于柳溪江畔，当初之所以叫柳栖，意思就是柳溪江畔的栖息地，柳意味着留下来，栖当然就是好好休息的意思了。', N'浙江省杭州市临安区柳溪江大道河桥镇柳溪江大道125号', N'1', N'20200925_100033042_35484947-35d5-4da9-9829-9831d0fa73ea.jpg,20200925_100040533_6bb149fe-4706-414e-adc9-4d1c8928fb6d.jpg,20200925_100047691_addb4920-1182-4ecf-9ff1-09ec05db6340.jpg', N'1', N'0', N'2020-09-15 14:26:13.0143757', N'超级管理员', N'20200925_100023109_21fab97e-187d-49c9-a845-94020213452b.jpg', NULL, N'119.1', N'19.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'44', N'2020-09-24 00:00:00.000', N'C4E320F8-33B1-4986-9B0F-B6E0DC8CE82D', N'临安江村岭民宿（新湾农家乐）', N'13656680860', N'1', N'临安区河桥镇蒲村村后新湾18-2号', N'1', N'20200924_092006983_6704c396-a512-4725-9467-b02d407ce807.jpg,20200924_092011732_523e72d4-958e-4a4a-98c6-d6b6b73a63f5.jpg,20200924_092017143_073b4e8c-91ea-430d-9c18-a740225ccf6f.jpg', N'1', N'0', N'2020-09-24 09:20:18.5054582', N'超级管理员', N'20200924_091941002_e71e925c-47c6-4997-963e-e6a07f4ed4cc.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'37', N'2020-09-24 00:00:00.000', N'9841E205-092E-48D7-8E54-BDA2D484637F', N'古埠云舍', N'18989487516', N'1', N'河桥古镇景区旁', N'1', N'20200925_093910552_76a138bf-0b8c-48cf-818c-0ab7e4d62928.JPG,20200925_093916227_07d6f152-60bb-49fc-b9e1-e209fee23539.JPG,20200925_093922386_a9e38a02-6bc1-430e-ae42-634f14f070b2.JPG', N'1', N'0', N'2020-09-24 09:10:58.1934732', N'超级管理员', N'20200925_093901301_b9889291-2242-4a19-a9b1-5f43d339975c.JPG', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'29', N'2020-09-24 00:00:00.000', N'6E3416DB-3AF1-4087-843E-BFFD7BACD89F', N'爱丽蝶', N'15068827142', N'1', N'云浪村口', N'1', N'20200924_085904459_8b4f8824-6b88-49bf-90ec-fd84ce7f06ba.jpg,20200924_085909515_b9b0759d-1668-4a0a-817e-ae3b791f442d.jpg,20200924_085915373_e35e53f3-3334-4496-8d36-79e52b0d3196.jpg', N'1', N'0', N'2020-09-24 08:59:16.8824600', N'超级管理员', N'20200924_085833205_48c674ab-43da-454f-8c38-eac67afedf1b.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'31', N'2020-09-24 00:00:00.000', N'84B8C2E6-A643-4B68-8B4B-C2C9DDCD4B2A', N'临安市古韵农家乐（南乡逸庐）', N'13750863717', N'1', N'临安市河桥镇河桥村曙光', N'1', N'20200924_090135277_783593a3-9672-4b48-a560-e75f7079e537.jpg,20200924_090140034_175ae6ab-b19f-4bca-a71d-32b3c943c843.jpg,20200924_090144973_d20d9493-6716-444c-8d2b-ed228f987dc6.jpg', N'1', N'0', N'2020-09-24 09:01:47.4551308', N'超级管理员', N'20200924_090105796_dd7b33c6-ee5c-440c-9fc0-dd2a8bdb7caf.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'48', N'2020-09-24 00:00:00.000', N'AA86F007-4E8D-42A8-A2F0-CE6FAB97D511', N'杭州临安柏舟民宿', N'18367187299', N'车到路尽头，人循山谷，心归安处。从杭州城区到临安区的柏舟民宿，开车只要90分钟。柏舟民宿座落于河桥古镇秀溪村洞坞的一个山谷里。推开柴门，一幅宋代的庭院画卷映入眼帘，松鹤呼应，小园几许，收尽春光，有桃花红，李花白，菜花黄。远远围墙，隐隐茅堂，柏舟的庭院构成了令人魂牵梦绕的中国古代士大夫生活美学。
2016年，柏舟民宿主人袁超群租下了河桥当地60亩的一个山谷，请来中国美院风景设计院的刘丰华院长做设计，花了两年多的时间改造兴建。出于自身对中国传统文化的喜爱，袁超群在改造时参考了许多宋画的设计，力图还原中国传统的建筑美学，整体的室内设计在简约之中又透着一股禅意，让人感觉住进诗经里。
改建柏舟民宿总投入了超过500万的资金，这不仅是一家有温度的民宿，更是主人自己和孩子居住生活的地方。
民宿外环绕有一座中式古典庭院，后山还有供人静心养性的禅房，从空中俯瞰，整个民宿更像是一件艺术品，并获得2019年度全国设博会民宿空间类设计金奖。
柏舟民宿的设计风格确定了它的目标客户群体是从事文化艺术行业的，民宿主人袁超群也致力于用文化艺术的形式来传播柏舟和河桥。开业后举办过几个文化艺术类雅集，在整个浙江美术界颇具影响力。因为之前在杭州从事艺术品投资，所以民宿主人出于职业敏感度发现当地的石头非常适合制成砚台，年初注册了商标“石见砚生”，作为柏舟的文化衍生品牌。', N'河桥镇秀溪村洞坞殿后坞', N'1', N'20200925_101439671_990bcc4d-5bf6-40a9-9c28-82e6f53cdaf8.jpg,20200925_101542868_13c7a2cc-9483-4bc2-bf4c-ada1ab7039cd.JPG,20200925_101548411_1c9bf784-904c-4407-93de-c8e924cb1d3a.JPG', N'1', N'0', N'2020-09-24 09:28:51.8852256', N'超级管理员', N'20200925_101314262_59d1580f-5204-4a10-90d8-fbc6d36e83e3.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'17', N'2020-09-15 00:00:00.000', N'4EDD652A-E6DA-4A54-A430-D0FF3AF08ED0', N'临安桑竹一墅民宿', N'18658182966', N'羁鸟归林栖山水，在彼桑竹牧凡心。
桑竹一墅位于临安河桥镇柳溪江畔，泥骆村吉坞里50号，拥有12间舒适高雅的客房及套房，四面环山，风光秀丽，城市喧嚣之外，一墅欧洲庄园，贵雅的建筑礼仪，呈奉给家人、孩子、友人片刻不同凡响的优雅时光，是您度假会友，休闲放松的不二之选。', N'浙江省杭州市临安区河桥镇泥骆村吉坞里50号', N'380-1280', N'20200925_100328033_3a4d1772-1e6d-4ff5-ab3c-3e7db73dbec6.png,20200925_100337067_b677c360-4440-4619-b939-e5daacc55fd0.png,20200925_100342378_0ae91670-daa0-41d6-93f6-62ed2391bef0.png', N'1', N'0', N'2020-09-15 14:35:16.7750188', N'超级管理员', N'20200925_100318150_e9049f92-32e0-4ee7-9ca2-3cb872e1654a.png', NULL, N'119.1', N'19.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'7', N'2020-09-15 00:00:00.000', N'EEDD4BF1-C77A-4129-8233-E09E72AAD8FA', N'临安玖隐空山民宿', N'13221818055', N'1', N'浙江省杭州市临安区河桥镇曹家村九江坞3号', N'1', N'20200915_134623195_e8aeb7fe-f574-4640-ae1a-d5abc63334bd.jpg,20200915_134630646_cfa096ce-5a98-4ba1-96b7-68937e34cd2f.jpg,20200915_134637690_d033cd53-9a34-4731-b586-dcff37f04d22.jpg', N'1', N'0', N'2020-09-15 13:46:39.1461793', N'超级管理员', N'20200915_134614819_1e01df37-d965-4e98-83a7-192f2511aea6.png', NULL, N'119.1', N'1.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'46', N'2020-09-24 00:00:00.000', N'B15224BA-5961-42DA-968B-E69C4653A206', N'临安一念亭民宿', N'15958101857', N'1', N'河桥镇秀溪村项家3号', N'1', N'20200924_092235830_8ac2f041-8205-4d84-b520-dc218bc11f02.jpg,20200924_092241416_c058dbf0-4a17-498a-9b4f-2e40190d005a.jpg,20200924_092246011_ec3ee618-0d06-407b-b0a5-b80935bfb2c4.jpg', N'1', N'0', N'2020-09-24 09:22:58.7533367', N'超级管理员', N'20200924_092203633_734fb364-e821-49fc-8017-2a4aeffb6441.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'49', N'2020-09-24 00:00:00.000', N'9BABC248-3CF3-4CFC-89EC-E6ED5FA74CCA', N'情韵竹隐', N'13735478602', N'1', N'金燕村南山塘6号', N'1', N'20200925_094735434_10f7ca4f-193d-4132-8438-4d6b6cdf95d8.jpg,20200925_094740762_b2a15473-65b8-4607-b4a0-fc7882781e92.jpg,20200925_094745956_a4afa66b-5ad0-4663-9052-3ae09b4aa9ac.jpg', N'1', N'0', N'2020-09-24 09:29:56.0009285', N'超级管理员', N'20200925_094701124_846fc7b3-682a-4550-8a44-c942ecb6e641.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'18', N'2020-09-15 00:00:00.000', N'DDDDE32F-B9B9-410F-89FC-E9926D03C187', N'栗溪民宿', N'13735558621', N'1', N'河桥镇河桥村20号', N'200-300', N'20200915_143500711_df82b74b-65d4-48a6-9367-63142acd3c89.jpg,20200915_143507867_8b8f942a-0904-4d1b-b7fc-20a6ed3028ed.jpg,20200915_143515133_65988c68-8d00-49ec-8f18-6b9d1cffe65c.jpg', N'1', N'0', N'2020-09-15 14:36:21.2381175', N'超级管理员', N'20200915_143434291_db90d9aa-c869-46d7-96be-fa2229061d0e.png', NULL, N'119.1', N'19.1', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'36', N'2020-09-24 00:00:00.000', N'6B6F9CEE-891E-462B-AB2A-EA1F67A6CB5E', N'杭州临安涵泓民宿（白云楼）', N'15068826128', N'1', N'临安区河桥镇河桥村曙光20号', N'1', N'20200924_090904681_af8d67c6-2e2f-48c3-81de-b91d24435f6a.jpg,20200924_090909230_affaef69-07e8-4e02-b403-8cd7709bed68.jpg,20200924_090914525_649347d4-92d9-47dd-949b-c52d3837677f.jpg', N'1', N'0', N'2020-09-24 09:09:15.8110387', N'超级管理员', N'20200924_090829601_947db727-e9bc-4625-91e7-ef0ac234949b.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'51', N'2020-09-24 00:00:00.000', N'90EE3E67-1B6A-440F-A172-EC76E0491B49', N'有缘人', N'13588438361', N'1', N'河桥九狮坞', N'1', N'20200924_093128982_26abd6a0-8324-4772-949e-18c3ac232de7.jpg,20200924_093133450_7cdedbbe-29ac-4bd2-a68a-1186fb507ff9.jpg,20200924_093138382_a11824f0-9f78-4c14-9e30-603e0a8669f0.jpg', N'1', N'0', N'2020-09-24 09:31:39.0674242', N'超级管理员', N'20200924_093120038_47326c90-50fb-4c6f-a86e-2355b32f5226.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'34', N'2020-09-24 00:00:00.000', N'B8353A7F-B9FE-477F-AA56-EE34A4C56F3E', N'临安赏心民宿（因为爱情）', N'13757117296', N'1', N'临安区河桥镇河桥村柳溪街55号', N'1', N'20200924_095246136_e34760c4-5f00-484a-baaf-d2b6c62c1c64.jpg,20200924_095250779_c22467c2-edf8-483e-9ce1-1021c3b1ad66.jpg,20200924_095300932_86067751-0349-4868-8ebf-eddc9b247c27.jpg', N'1', N'0', N'2020-09-24 09:05:48.7448952', N'超级管理员', N'20200924_095232331_317ed8e9-28e9-43da-a5ba-d85818b361c4.jpg', N'', N'111.11', N'11.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'19', N'2020-09-24 00:00:00.000', N'A5545527-30AF-426C-87A8-EE4720CC25B9', N'江尚樾', N'15924101503', N'1', N'泥骆村铁炉坞11号', N'1', N'20200924_084110986_3c0f8fbc-45a4-4458-81cf-9b91aedbc17c.jpg,20200924_084117443_152a659e-1e4e-4526-8bfe-8264e3fb7e60.jpg,20200924_084122846_637977d3-d438-4af1-b4dc-9b4b0b63b061.jpg', N'1', N'0', N'2020-09-24 08:41:24.3821301', N'超级管理员', N'20200924_084016035_d1cb0a44-02b6-42da-9fcc-ccafdeaba577.jpg', N'', N'111.111', N'80.11', NULL)
GO

INSERT INTO [dbo].[Hotel] ([ID], [CreateTime], [HotelUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [AddTime], [AddPeople], [Cover], [HotelUrl], [Lon], [Lat], [ShopId]) VALUES (N'30', N'2020-09-24 00:00:00.000', N'71410729-DAF1-4422-8F7F-FB69BAA0439E', N'临安市雅逸农家乐', N'13777837253', N'1', N'临安市河桥镇柳溪街8号', N'150-380', N'20200924_090018470_b443b80d-614d-4c4f-a7de-348b5a1d8e98.jpg,20200924_090022996_04db4086-c4f1-4c7e-8cfa-d985aec353b6.jpg,20200924_090028521_9e411340-df97-4751-824b-37ae36c0cb56.jpg', N'1', N'0', N'2020-09-24 09:00:29.3599404', N'超级管理员', N'20200924_085950896_45170da9-a9bf-449a-a82a-4d15c2a5c833.jpg', N'', N'111.11', N'11.11', NULL)
GO

SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO


-- ----------------------------
-- Table structure for HotelRoom
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[HotelRoom]') AND type IN ('U'))
	DROP TABLE [dbo].[HotelRoom]
GO

CREATE TABLE [dbo].[HotelRoom] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [HotelRoomUuid] uniqueidentifier  NOT NULL,
  [HotelRoomName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [HotelUuid] uniqueidentifier  NULL
)
GO

ALTER TABLE [dbo].[HotelRoom] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'房型名称',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom',
'COLUMN', N'HotelRoomName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'价格',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom',
'COLUMN', N'Price'
GO

EXEC sp_addextendedproperty
'MS_Description', N'房型介绍',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom',
'COLUMN', N'Introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'位置',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'酒店房型信息表',
'SCHEMA', N'dbo',
'TABLE', N'HotelRoom'
GO


-- ----------------------------
-- Records of HotelRoom
-- ----------------------------
SET IDENTITY_INSERT [dbo].[HotelRoom] ON
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'1', N'630F56EB-42E8-4732-9E92-5E73B472DF6B', N'a', N'd', N'f', N'', N'g', NULL, N'1', N'89072125-2190-42D1-A80A-06A476A60EED')
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'2', N'5182B935-46F9-4C95-9061-1B7D6326DBAB', N'a', N'd', N'f', N'', N'g', NULL, N'1', N'89072125-2190-42D1-A80A-06A476A60EED')
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'3', N'EAFA7D74-76AD-42B6-99A4-2DDDA60A47DF', N'a', N'd', N'f', N'', N'g', NULL, N'1', N'89072125-2190-42D1-A80A-06A476A60EED')
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'4', N'136C891F-B5EA-402C-B397-8C37833DD457', N'a', N'd', N'f', N'', N'g', NULL, N'1', N'89072125-2190-42D1-A80A-06A476A60EED')
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'5', N'D2B49B17-6A8B-4930-BFAD-C5129FD510B0', N'a', N'', N'', N'', N'', NULL, N'1', N'89072125-2190-42D1-A80A-06A476A60EED')
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'6', N'44C772A5-5D85-4DAC-BB18-CA5837C15A11', N'a', N'', N'', N'', N'', NULL, N'1', N'89072125-2190-42D1-A80A-06A476A60EED')
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'7', N'20238E59-1C2A-4821-A31F-8E28B6F80272', N'a', N'', N'', N'', N'20201024_200527365_7a07dd96-f04b-4bd8-a7fa-c61f4f966a2f.jpg,20201024_200623495_8dff80ae-09f0-4596-81ee-ade6e52a2e5c.jpg', NULL, N'1', N'89072125-2190-42D1-A80A-06A476A60EED')
GO

INSERT INTO [dbo].[HotelRoom] ([ID], [HotelRoomUuid], [HotelRoomName], [Price], [Introduction], [Address], [Picture], [State], [IsDelete], [HotelUuid]) VALUES (N'8', N'35056760-E203-4302-8038-4323A1607BBE', N'a', N'a', N'a', N'', N'a', NULL, N'0', N'72112E4B-A07E-45C9-8D0F-209B47820C59')
GO

SET IDENTITY_INSERT [dbo].[HotelRoom] OFF
GO


-- ----------------------------
-- Table structure for Information
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Information]') AND type IN ('U'))
	DROP TABLE [dbo].[Information]
GO

CREATE TABLE [dbo].[Information] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime2(7)  NULL,
  [InformationUUID] uniqueidentifier  NOT NULL,
  [Title] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [InformationTypeUUID] uniqueidentifier  NULL,
  [Introduce] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [StartTime] datetime  NULL,
  [Picture] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] bit  NULL,
  [IsDeleted] int  NULL,
  [Photo] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Information] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'Information',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'资讯类型',
'SCHEMA', N'dbo',
'TABLE', N'Information',
'COLUMN', N'InformationTypeUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'Information',
'COLUMN', N'Introduce'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'Information',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片(三张)',
'SCHEMA', N'dbo',
'TABLE', N'Information',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Information',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面图片(一张)',
'SCHEMA', N'dbo',
'TABLE', N'Information',
'COLUMN', N'Photo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'景区资讯',
'SCHEMA', N'dbo',
'TABLE', N'Information'
GO


-- ----------------------------
-- Table structure for InformationType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[InformationType]') AND type IN ('U'))
	DROP TABLE [dbo].[InformationType]
GO

CREATE TABLE [dbo].[InformationType] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime2(7) DEFAULT (getdate()) NULL,
  [InformationTypeUUID] uniqueidentifier  NOT NULL,
  [Name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDeleted] int  NULL
)
GO

ALTER TABLE [dbo].[InformationType] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'资讯类型',
'SCHEMA', N'dbo',
'TABLE', N'InformationType'
GO


-- ----------------------------
-- Table structure for Leavemessage
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Leavemessage]') AND type IN ('U'))
	DROP TABLE [dbo].[Leavemessage]
GO

CREATE TABLE [dbo].[Leavemessage] (
  [LeavemessageUUID] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [UserUUID] uniqueidentifier  NULL,
  [Content] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Createtime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Isdelete] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Leavemessage] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户id',
'SCHEMA', N'dbo',
'TABLE', N'Leavemessage',
'COLUMN', N'UserUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'留言内容',
'SCHEMA', N'dbo',
'TABLE', N'Leavemessage',
'COLUMN', N'Content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'留言时间',
'SCHEMA', N'dbo',
'TABLE', N'Leavemessage',
'COLUMN', N'Createtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否删除(0:未删除,1:删除)',
'SCHEMA', N'dbo',
'TABLE', N'Leavemessage',
'COLUMN', N'Isdelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'留言建议',
'SCHEMA', N'dbo',
'TABLE', N'Leavemessage'
GO


-- ----------------------------
-- Records of Leavemessage
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Leavemessage] ON
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'80818D37-B7B9-471F-965E-0B652100D881', N'24', N'423968DF-A15D-4B5F-9E25-005486496332', N'', N'2020-09-26 14:03:59', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'F2740D74-BB7C-4055-9039-2349CD3C500F', N'22', N'423968DF-A15D-4B5F-9E25-005486496332', N'aa发发发发发发发发发发发', N'2020-09-26 14:03:21', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'353973B9-9FFF-40B6-B1A2-3F5E9656F36A', N'20', N'423968DF-A15D-4B5F-9E25-005486496332', N'阿发发发', N'2020-09-26 14:02:02', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'5C7BFF59-2795-4E97-93BF-44C00C49F559', N'25', N'06026661-E6DF-4943-8449-4C116843B8CD', N'大哒哒哒', N'2020-09-26 19:12:39', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'FA0BDE8C-FC23-487F-A409-7A231D43AE4A', N'17', N'965C8F49-B909-41BB-BF5D-C26EAD9608AF', N'真正的大师永远怀着一颗学徒的心。', N'2020-08-20 16:44:56', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'A230C117-52E0-4D33-AFBE-93F155AEE297', N'18', N'965C8F49-B909-41BB-BF5D-C26EAD9608AF', N'不要被骄傲懵逼了双眼', N'2020-08-20 16:49:73', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'16DC393A-3158-4CE8-ACE6-963E270D6E16', N'23', N'423968DF-A15D-4B5F-9E25-005486496332', N'阿飞烦烦烦烦烦烦烦烦烦', N'2020-09-26 14:03:48', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'4F2BEFF7-DDA0-4867-8B97-DB6AC4D5DD0D', N'19', N'423968DF-A15D-4B5F-9E25-005486496332', N'河桥很好玩很好玩,超级喜欢,下次还来!', N'2020-08-25 13:56:50', N'0')
GO

INSERT INTO [dbo].[Leavemessage] ([LeavemessageUUID], [ID], [UserUUID], [Content], [Createtime], [Isdelete]) VALUES (N'A9E1D45D-15E0-4912-8ACD-DC52B9AD896D', N'21', N'423968DF-A15D-4B5F-9E25-005486496332', N'发发', N'2020-09-26 14:02:24', N'0')
GO

SET IDENTITY_INSERT [dbo].[Leavemessage] OFF
GO


-- ----------------------------
-- Table structure for Luxian
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Luxian]') AND type IN ('U'))
	DROP TABLE [dbo].[Luxian]
GO

CREATE TABLE [dbo].[Luxian] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [LuxianUUID] uniqueidentifier  NOT NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [Cover] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Addpeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Count] int  NULL,
  [ytype] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PlayType] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Luxian] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'价格',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Price'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Addpeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'浏览次数',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'Count'
GO

EXEC sp_addextendedproperty
'MS_Description', N'游玩类型 1.古镇游   2.周边游',
'SCHEMA', N'dbo',
'TABLE', N'Luxian',
'COLUMN', N'ytype'
GO

EXEC sp_addextendedproperty
'MS_Description', N'推荐路线表',
'SCHEMA', N'dbo',
'TABLE', N'Luxian'
GO


-- ----------------------------
-- Records of Luxian
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Luxian] ON
GO

INSERT INTO [dbo].[Luxian] ([ID], [CreateTime], [LuxianUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Addpeople], [AddTime], [Count], [ytype], [PlayType]) VALUES (N'2', N'2020-09-25 16:49:10.673', N'7CBBB709-D235-4610-AB42-157D1BC299FB', N'对对对', N'', N'大大阿达', N'', N'', N'20200925_164907194_5946a206-85d2-4cb8-8fb6-f04869d82f1a.jpg', N'0', N'0', N'', N'王也', N'', NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Luxian] ([ID], [CreateTime], [LuxianUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Addpeople], [AddTime], [Count], [ytype], [PlayType]) VALUES (N'6', N'2020-09-27 19:41:57.957', N'825157C0-DDCD-42DB-915B-767C75E88155', N'sdfs', N'', N'', N'', N'', N'20201010_170049452_ba5ecbbb-d839-46ec-9382-b07d7eaa2104.png', N'1', N'0', N'', N'admin', NULL, NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Luxian] ([ID], [CreateTime], [LuxianUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Addpeople], [AddTime], [Count], [ytype], [PlayType]) VALUES (N'4', N'2020-09-25 19:15:03.187', N'D8996B6C-A076-42B5-8048-9FEA52A1209A', N'啊大大', N'', N'大大大大大', N'', N'', N'20200925_191500446_ff3a7d42-57d4-4723-8ba9-7934329be676.jpg', N'1', N'0', N'', N'小红娘', NULL, N'1', N'1', N'1')
GO

INSERT INTO [dbo].[Luxian] ([ID], [CreateTime], [LuxianUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Addpeople], [AddTime], [Count], [ytype], [PlayType]) VALUES (N'1', N'2020-09-25 15:49:18.290', N'ABA91ADF-C24A-4721-9D21-B5A5C13AD37D', N'河桥一日游路线推荐', N'', N'大哒哒哒', N'', N'', N'20200925_154912345_34618b71-e812-4131-abcd-72b09e5ce999.jpg,20200925_154915738_503cdf93-f1c8-467a-a581-8c3f595d1081.jpg', N'1', N'0', N'', N'张三', N'', NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Luxian] ([ID], [CreateTime], [LuxianUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Addpeople], [AddTime], [Count], [ytype], [PlayType]) VALUES (N'3', N'2020-09-25 18:56:31.260', N'5D6E4FEB-0782-48C7-BD74-E25A2641DBAB', N'哒哒哒', N'', N'滴滴滴滴滴滴', N'', N'', N'20200925_185623950_27876a82-0875-4172-b7bc-251826286a0e.jpg,20200925_185627748_ec4c3e1a-a9be-49fe-8e16-ce6ae5306ea1.jpg', N'1', N'0', N'', N'二哥', NULL, NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Luxian] ([ID], [CreateTime], [LuxianUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Addpeople], [AddTime], [Count], [ytype], [PlayType]) VALUES (N'5', N'2020-09-25 19:16:49.050', N'275A840E-31BB-451D-9C11-EA8DE5206C81', N'驱蚊器', N'', N'asda 阿三大苏打', N'', N'', N'20200925_191645281_48e779be-aa36-4613-b007-c7eab6c7b5f3.jpg', N'1', N'0', N'', N'admin', NULL, N'3', N'1', N'1')
GO

SET IDENTITY_INSERT [dbo].[Luxian] OFF
GO


-- ----------------------------
-- Table structure for Mapmark
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Mapmark]') AND type IN ('U'))
	DROP TABLE [dbo].[Mapmark]
GO

CREATE TABLE [dbo].[Mapmark] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [MapmarkUUID] uniqueidentifier  NOT NULL,
  [MarkUUID] uniqueidentifier  NULL,
  [Position] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int  NULL,
  [Introduce] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Mapmark] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标识uuid',
'SCHEMA', N'dbo',
'TABLE', N'Mapmark',
'COLUMN', N'MarkUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经纬度',
'SCHEMA', N'dbo',
'TABLE', N'Mapmark',
'COLUMN', N'Position'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Mapmark',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'Mapmark',
'COLUMN', N'Introduce'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地图标识',
'SCHEMA', N'dbo',
'TABLE', N'Mapmark'
GO


-- ----------------------------
-- Records of Mapmark
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Mapmark] ON
GO

INSERT INTO [dbo].[Mapmark] ([ID], [CreateTime], [MapmarkUUID], [MarkUUID], [Position], [IsDelete], [Introduce]) VALUES (N'1', N'2020-07-28 09:39:37.810', N'1CAD7808-5D18-4123-8525-26CC4537981C', N'E3E15310-E8DD-4C91-9C01-FC8356D49842', N'120.146745,30.281057', N'0', N'浙江大学')
GO

INSERT INTO [dbo].[Mapmark] ([ID], [CreateTime], [MapmarkUUID], [MarkUUID], [Position], [IsDelete], [Introduce]) VALUES (N'2', N'2020-07-28 09:40:10.907', N'99452FB0-EC1C-405A-AC12-B338A4418FCB', N'E3E15310-E8DD-4C91-9C01-FC8356D49842', N'120.242469,30.248367', N'0', N'钱江世纪公园')
GO

INSERT INTO [dbo].[Mapmark] ([ID], [CreateTime], [MapmarkUUID], [MarkUUID], [Position], [IsDelete], [Introduce]) VALUES (N'3', N'2020-08-26 16:13:58.267', N'097AF8BD-A283-4BEA-AC10-154437432A26', N'E3E15310-E8DD-4C91-9C01-FC8356D49842', N'120.250517,30.167094', N'0', N'杭州乐园')
GO

SET IDENTITY_INSERT [dbo].[Mapmark] OFF
GO


-- ----------------------------
-- Table structure for Mark
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark]') AND type IN ('U'))
	DROP TABLE [dbo].[Mark]
GO

CREATE TABLE [dbo].[Mark] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [MarkUUID] uniqueidentifier  NOT NULL,
  [MarkName] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [MarkPicture] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int  NULL
)
GO

ALTER TABLE [dbo].[Mark] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标识名称',
'SCHEMA', N'dbo',
'TABLE', N'Mark',
'COLUMN', N'MarkName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标识图片',
'SCHEMA', N'dbo',
'TABLE', N'Mark',
'COLUMN', N'MarkPicture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Mark',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标识管理',
'SCHEMA', N'dbo',
'TABLE', N'Mark'
GO


-- ----------------------------
-- Records of Mark
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Mark] ON
GO

INSERT INTO [dbo].[Mark] ([ID], [CreateTime], [MarkUUID], [MarkName], [MarkPicture], [IsDelete]) VALUES (N'1', N'2020-07-27 16:11:54.680', N'94E30061-95DD-4291-AB0B-8FB2234C41E8', N'停车场', N'停车场.png', N'0')
GO

INSERT INTO [dbo].[Mark] ([ID], [CreateTime], [MarkUUID], [MarkName], [MarkPicture], [IsDelete]) VALUES (N'2', N'2020-07-27 16:14:55.207', N'313FD8E1-1FC9-4CD6-B5A8-670A3F3D2AD0', N'医院', N'医院.png', N'0')
GO

INSERT INTO [dbo].[Mark] ([ID], [CreateTime], [MarkUUID], [MarkName], [MarkPicture], [IsDelete]) VALUES (N'3', N'2020-08-26 16:13:24.590', N'A845CD1F-6DC4-49C7-950F-FBB3297F8EB9', N'公共厕所', N'公共厕所.png', N'0')
GO

INSERT INTO [dbo].[Mark] ([ID], [CreateTime], [MarkUUID], [MarkName], [MarkPicture], [IsDelete]) VALUES (N'4', N'2020-08-29 10:35:57.903', N'9DD63879-10D6-403F-8766-3C934BC43E8F', N'游客中心', N'游客中心.png', N'0')
GO

INSERT INTO [dbo].[Mark] ([ID], [CreateTime], [MarkUUID], [MarkName], [MarkPicture], [IsDelete]) VALUES (N'5', N'2020-08-29 10:36:28.850', N'1FBEFDAA-435F-4AAC-B228-A3409AAE3C51', N'寺庙', N'寺庙.png', N'0')
GO

INSERT INTO [dbo].[Mark] ([ID], [CreateTime], [MarkUUID], [MarkName], [MarkPicture], [IsDelete]) VALUES (N'6', N'2020-08-29 10:36:34.777', N'BEECE396-BFE5-4562-9695-2B8666D3E914', N'宝箱', N'宝箱.png', N'0')
GO

INSERT INTO [dbo].[Mark] ([ID], [CreateTime], [MarkUUID], [MarkName], [MarkPicture], [IsDelete]) VALUES (N'7', N'2020-08-29 10:37:55.340', N'E3E15310-E8DD-4C91-9C01-FC8356D49842', N'公园', N'公园.jpg', N'0')
GO

SET IDENTITY_INSERT [dbo].[Mark] OFF
GO


-- ----------------------------
-- Table structure for NaturalResources
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[NaturalResources]') AND type IN ('U'))
	DROP TABLE [dbo].[NaturalResources]
GO

CREATE TABLE [dbo].[NaturalResources] (
  [NaturalResourcesUUID] uniqueidentifier  NOT NULL,
  [Title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsRelease] bit DEFAULT ((0)) NULL,
  [ReleaseTime] datetime  NULL,
  [Cover] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime  NULL,
  [AddPeople] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsDeleted] int DEFAULT ((0)) NULL,
  [Photo] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[NaturalResources] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否发布',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'IsRelease'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'ReleaseTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'Content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否删除',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'IsDeleted'
GO

EXEC sp_addextendedproperty
'MS_Description', N'3张图片',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources',
'COLUMN', N'Photo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'自然资源',
'SCHEMA', N'dbo',
'TABLE', N'NaturalResources'
GO


-- ----------------------------
-- Records of NaturalResources
-- ----------------------------
SET IDENTITY_INSERT [dbo].[NaturalResources] ON
GO

INSERT INTO [dbo].[NaturalResources] ([NaturalResourcesUUID], [Title], [IsRelease], [ReleaseTime], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'BD580F03-7CD3-4ECE-B4DD-32F1FCA1EDC7', N'标题2', N'1', N'2020-08-23 16:00:00.000', N'20200826_181425786_b4c518c2-4da0-49f4-8024-45927aee0152.jpg,20200827_175509748_bc8f81d9-0baf-4ca7-bc99-c644a9e854b6.jpg', N'<p>内容1</p>', N'2020-08-26 18:14:33.637', NULL, N'1005', N'0', N'20200826_181314214_93943638-cd28-4526-965d-bbf76976a234.jpg,20200826_181319055_a7fdc969-4489-407a-a580-4b272f270921.jpg,20200826_181323630_8b792744-33f3-470c-a66f-77a7dcb716ab.jpg')
GO

INSERT INTO [dbo].[NaturalResources] ([NaturalResourcesUUID], [Title], [IsRelease], [ReleaseTime], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'88A8A9BC-8DBC-46A3-84F0-064EF56ABB74', N'标题3', N'1', N'2020-08-23 16:00:00.000', N'20200826_181505998_3ae60b0e-51c2-4513-bd35-df111ea9038d.jpg,20200827_175522136_ec5b83f5-432b-4f36-9d14-b18548ee68c1.jpg', N'<p>内容3</p>', N'2020-08-26 18:15:22.373', NULL, N'1006', N'0', N'20200826_181511145_188e6508-f5d8-4ee6-902b-8a70aafa6f37.jpg,20200826_181515817_8589580f-edac-46b4-b0ce-925f8467f4f1.jpg,20200826_181520673_a3879265-3a76-4c99-bb8e-bd135074cb5b.jpg')
GO

INSERT INTO [dbo].[NaturalResources] ([NaturalResourcesUUID], [Title], [IsRelease], [ReleaseTime], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'4D1994F4-4F10-428E-945D-2DF1C4474533', N'标题4', N'1', N'2020-08-23 16:00:00.000', N'20200826_181546991_56c626ea-9cfc-4ef3-b1cc-85a179b193af.jpg,20200827_175545267_5ba1b602-ccd4-452a-81af-86aca4590f98.jpg', N'<p>内容4</p>', N'2020-08-26 18:16:03.740', NULL, N'1007', N'0', N'20200826_181551809_607fee14-0fba-4319-a7ef-f604ac0a217c.jpg,20200826_181556762_0cf02285-4cd5-47f3-a4fb-e34637ea24ad.jpg,20200826_181602461_dbae06bf-c4ce-4b43-9cee-f16a80f06fca.jpg')
GO

INSERT INTO [dbo].[NaturalResources] ([NaturalResourcesUUID], [Title], [IsRelease], [ReleaseTime], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'A6B5303C-B85A-48DC-AADB-751A358CB599', N'标题5', N'1', N'2020-08-23 16:00:00.000', N'20200826_181624378_efadf5a7-a2aa-491f-8e8b-d66cc97119d6.jpg,20200827_175600187_79da288c-df11-457b-9281-dbe9bd175e85.jpg', N'<p>内容5</p>', N'2020-08-26 18:16:40.180', NULL, N'1008', N'0', N'20200826_181628877_d6526491-7fa8-44bb-b985-bed31e97efd6.jpg,20200826_181633783_0b0619d4-74b8-45d5-8593-feb86be197cd.jpg,20200826_181639019_a4862a95-4ff1-45b0-9eb5-19b65664a5fe.jpg')
GO

INSERT INTO [dbo].[NaturalResources] ([NaturalResourcesUUID], [Title], [IsRelease], [ReleaseTime], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'6CC4B742-86D2-41F8-A56B-948962D30A8F', N'标题6', N'1', N'2020-08-22 16:00:00.000', N'20200826_181659998_7a999c59-decb-48ef-95d8-a6431fe54857.jpg,20200827_175612645_52bcfe90-8c47-4d8d-be33-e20578bcce02.jpg', N'<p>内容6</p>', N'2020-08-26 18:17:16.297', NULL, N'1009', N'0', N'20200826_181705106_d96e75bf-9b12-4012-b560-025e84cd46f5.jpg,20200826_181709721_c1306c2a-5286-4121-965c-9a90793ebaa4.jpg,20200826_181714866_71cb04d5-6128-4309-b83e-aa386d1eae24.jpg')
GO

INSERT INTO [dbo].[NaturalResources] ([NaturalResourcesUUID], [Title], [IsRelease], [ReleaseTime], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'34757C61-C4D0-49B0-91BD-B7B65EC2FA44', N'标题7', N'1', N'2020-08-22 16:00:00.000', N'20200826_181803020_6516501a-4b47-4ae8-9eef-4e6216459a29.jpg,20200827_175624871_b0a2d1c1-14c4-4587-85ba-fa543f86e879.jpg', N'<p>内容7</p>', N'2020-08-26 18:18:19.803', NULL, N'1010', N'0', N'20200826_181808216_e55e02a6-c30e-4292-9b6e-936282d8915a.jpg,20200826_181812994_9dd2a7b0-21bb-48be-8ab4-245d617c1b49.jpg,20200826_181818037_d348d571-ecea-41b6-8136-7900fa59ba9e.jpg')
GO

INSERT INTO [dbo].[NaturalResources] ([NaturalResourcesUUID], [Title], [IsRelease], [ReleaseTime], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'96B2CAAA-9D20-4913-8C30-8F0B85DA2260', N'标题1', N'1', N'2020-12-15 17:01:44.630', N'20200826_182155107_91cb247e-cc61-4eb0-9f2d-863d8de4046b.jpg', N'<ul><li class="ql-align-center"><a href="标题9" rel="noopener noreferrer" target="_blank" class="ql-size-huge" style="color: rgb(230, 0, 0);">标题9</a></li></ul><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><span class="ql-size-huge" style="color: rgb(230, 0, 0);">很反感，好</span></p>', N'2020-08-26 18:22:10.023', NULL, N'1012', N'0', N'20200826_182200004_7873eb96-1213-42ec-b1c5-277b95576597.jpg,20200827_115710242_fcbd8a58-c152-4a77-9e2a-ab1163ed3fa1.jpg,20200827_140737957_96e8c687-0527-43cd-9e37-b46553c15250.jpg')
GO

SET IDENTITY_INSERT [dbo].[NaturalResources] OFF
GO


-- ----------------------------
-- Table structure for News
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type IN ('U'))
	DROP TABLE [dbo].[News]
GO

CREATE TABLE [dbo].[News] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [NewsUUID] uniqueidentifier  NOT NULL,
  [Title] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [NewsContent] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int  NULL,
  [ReleaseState] int  NULL
)
GO

ALTER TABLE [dbo].[News] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'News',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'News',
'COLUMN', N'NewsContent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'News',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'News',
'COLUMN', N'ReleaseState'
GO

EXEC sp_addextendedproperty
'MS_Description', N'消息发布',
'SCHEMA', N'dbo',
'TABLE', N'News'
GO


-- ----------------------------
-- Records of News
-- ----------------------------
SET IDENTITY_INSERT [dbo].[News] ON
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'1', N'2020-07-29 15:10:49.313', N'F7E64926-14C2-4340-AE99-E73B16D89894', N'we', N'ewr', N'0', N'1')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'2', N'2020-07-29 15:11:22.457', N'2DDD577E-D7B3-4943-A1A1-599AF46B3F25', N'dgr', N'erg', N'0', N'1')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'3', N'2020-07-29 15:17:30.607', N'D730BD81-05A7-4D80-BFB8-A575418B6619', N'测试', N'测试', N'0', N'0')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'4', N'2020-07-29 16:13:53.883', N'725F1227-0A19-44BB-8CD1-8DB379299D58', N'等分', N'二分', N'0', N'1')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'5', N'2020-07-29 16:15:27.093', N'B1F23A73-DD1E-4DE4-8C7E-E667BA7A250F', N'法国保护你', N'他给你', N'0', N'1')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'6', N'2020-07-29 16:15:57.310', N'652EE035-3C39-4AEF-824E-B2BAB68FCD10', N'给你吧', N'给你', N'0', N'0')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'7', N'2020-07-29 16:17:04.270', N'460C54A2-75B8-4EC2-927B-0EE12D110741', N'的v', N'地方v', N'1', N'1')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'8', N'2020-07-29 16:48:11.127', N'E0D16FB8-471A-4EF0-9008-91F6F684A09F', N'反对v', N'担任法国v', N'0', N'0')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'9', N'2020-07-29 16:48:18.790', N'9E13FEA6-1EE5-4B0B-8BC2-043B247A0287', N'333', N'规划', N'0', N'1')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'10', N'2020-07-29 16:51:31.180', N'6194EF62-FEFE-4F00-907D-019E0DC19DF4', N'的v从', N'违法', N'1', N'1')
GO

INSERT INTO [dbo].[News] ([ID], [CreateTime], [NewsUUID], [Title], [NewsContent], [IsDelete], [ReleaseState]) VALUES (N'11', N'2020-07-29 16:51:38.710', N'BD8D7884-021C-4D4F-B7A8-26EDE051EA0C', N'2222', N'2222', N'0', N'1')
GO

SET IDENTITY_INSERT [dbo].[News] OFF
GO


-- ----------------------------
-- Table structure for Pointer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pointer]') AND type IN ('U'))
	DROP TABLE [dbo].[Pointer]
GO

CREATE TABLE [dbo].[Pointer] (
  [PointerUuid] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsDelete] int  NULL,
  [PointerNum] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [PointerName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Pointer] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Pointer',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'设备编号',
'SCHEMA', N'dbo',
'TABLE', N'Pointer',
'COLUMN', N'PointerNum'
GO

EXEC sp_addextendedproperty
'MS_Description', N'设备名称',
'SCHEMA', N'dbo',
'TABLE', N'Pointer',
'COLUMN', N'PointerName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'Pointer',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'Pointer',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所出地址',
'SCHEMA', N'dbo',
'TABLE', N'Pointer',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'导视设备信息管理',
'SCHEMA', N'dbo',
'TABLE', N'Pointer'
GO


-- ----------------------------
-- Records of Pointer
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Pointer] ON
GO

INSERT INTO [dbo].[Pointer] ([PointerUuid], [ID], [IsDelete], [PointerNum], [PointerName], [Lon], [Lat], [Address]) VALUES (N'54C51073-01E2-4C96-A162-AC851AE5ED4C', N'2', N'0', N'd', N'a', N'd', N'd', N'd')
GO

INSERT INTO [dbo].[Pointer] ([PointerUuid], [ID], [IsDelete], [PointerNum], [PointerName], [Lon], [Lat], [Address]) VALUES (N'F0F46713-FD4C-4480-B4C9-C452638343D8', N'1', N'0', N'1', N'1', N'1', N'1', N'1')
GO

SET IDENTITY_INSERT [dbo].[Pointer] OFF
GO


-- ----------------------------
-- Table structure for Promotional
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotional]') AND type IN ('U'))
	DROP TABLE [dbo].[Promotional]
GO

CREATE TABLE [dbo].[Promotional] (
  [PromotionalUuid] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Isdeleted] int  NULL,
  [Staues] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PromotionalContent] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Video] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Promotional] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'视频标题',
'SCHEMA', N'dbo',
'TABLE', N'Promotional',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'视频内容',
'SCHEMA', N'dbo',
'TABLE', N'Promotional',
'COLUMN', N'PromotionalContent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'视频路径',
'SCHEMA', N'dbo',
'TABLE', N'Promotional',
'COLUMN', N'Video'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'Promotional',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'Promotional',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'宣传视频表',
'SCHEMA', N'dbo',
'TABLE', N'Promotional'
GO


-- ----------------------------
-- Table structure for PromotionalVideo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PromotionalVideo]') AND type IN ('U'))
	DROP TABLE [dbo].[PromotionalVideo]
GO

CREATE TABLE [dbo].[PromotionalVideo] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime2(7) DEFAULT (getdate()) NULL,
  [PromotionalVideoUUID] uniqueidentifier  NOT NULL,
  [Title] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Cover] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Video] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReleaseTime] date  NULL,
  [ReleaseState] int  NULL,
  [AddTime] datetime2(7)  NULL,
  [AddPeople] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDeleted] int  NULL,
  [IsRecommend] bit DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[PromotionalVideo] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'PromotionalVideo',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面图片',
'SCHEMA', N'dbo',
'TABLE', N'PromotionalVideo',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'视频',
'SCHEMA', N'dbo',
'TABLE', N'PromotionalVideo',
'COLUMN', N'Video'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'PromotionalVideo',
'COLUMN', N'ReleaseTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未发布 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'PromotionalVideo',
'COLUMN', N'ReleaseState'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否推荐  0否  1是',
'SCHEMA', N'dbo',
'TABLE', N'PromotionalVideo',
'COLUMN', N'IsRecommend'
GO

EXEC sp_addextendedproperty
'MS_Description', N'宣传视频',
'SCHEMA', N'dbo',
'TABLE', N'PromotionalVideo'
GO


-- ----------------------------
-- Records of PromotionalVideo
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PromotionalVideo] ON
GO

INSERT INTO [dbo].[PromotionalVideo] ([ID], [CreateTime], [PromotionalVideoUUID], [Title], [Cover], [Video], [ReleaseTime], [ReleaseState], [AddTime], [AddPeople], [IsDeleted], [IsRecommend]) VALUES (N'1', N'2020-09-26 14:02:05.6166667', N'E49E100C-B0CE-4374-92D3-ABDAC9A03809', N'xxxxx', N'20200926_140157658_b8e8447b-10ce-4489-8835-1ce68653c8ae.png', N'20200926_140220905_f95a9a52-b407-41fc-9ccd-4d6cf89c93aa.mp4', N'2020-09-25', N'1', N'2020-09-26 14:02:05.5922338', N'超级管理员', N'0', N'0')
GO

SET IDENTITY_INSERT [dbo].[PromotionalVideo] OFF
GO


-- ----------------------------
-- Table structure for Publicity
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Publicity]') AND type IN ('U'))
	DROP TABLE [dbo].[Publicity]
GO

CREATE TABLE [dbo].[Publicity] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime2(7) DEFAULT (getdate()) NOT NULL,
  [PublicityUUID] uniqueidentifier  NOT NULL,
  [Title] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PublicityTypeUUID] uniqueidentifier  NULL,
  [Introduce] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Cover] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Video] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDeleted] int  NULL,
  [State] int  NULL
)
GO

ALTER TABLE [dbo].[Publicity] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'Publicity',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型',
'SCHEMA', N'dbo',
'TABLE', N'Publicity',
'COLUMN', N'PublicityTypeUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'Publicity',
'COLUMN', N'Introduce'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面图片',
'SCHEMA', N'dbo',
'TABLE', N'Publicity',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容图片',
'SCHEMA', N'dbo',
'TABLE', N'Publicity',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'视频',
'SCHEMA', N'dbo',
'TABLE', N'Publicity',
'COLUMN', N'Video'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Publicity',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'宣传详情',
'SCHEMA', N'dbo',
'TABLE', N'Publicity'
GO


-- ----------------------------
-- Records of Publicity
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Publicity] ON
GO

INSERT INTO [dbo].[Publicity] ([ID], [CreateTime], [PublicityUUID], [Title], [PublicityTypeUUID], [Introduce], [Cover], [Picture], [Video], [IsDeleted], [State]) VALUES (N'2', N'2020-08-26 14:50:00.9300000', N'C9BC03C8-C511-4435-919D-6FD8DA65D1C4', N'标题2', N'DE084157-81B9-4280-B14C-4DBE3DD4FAE0', N'<p>内容2</p>', NULL, N'20200826_192123021_15346995-dea6-4ee6-911b-213381acddb3.jpg,20200826_192128109_2d6ca78f-fa46-493c-9edf-8404dc2e57ba.jpg,20200826_192133103_e1bf079b-daf9-4df4-8cea-8d79ae47427a.jpg', N'20200826_194331829_45f40f32-7c5d-4754-b0f0-6e3748fc6033.mp4', N'0', N'1')
GO

INSERT INTO [dbo].[Publicity] ([ID], [CreateTime], [PublicityUUID], [Title], [PublicityTypeUUID], [Introduce], [Cover], [Picture], [Video], [IsDeleted], [State]) VALUES (N'6', N'2020-08-27 08:35:15.7166667', N'316EC2C7-F0E2-47F8-A7EB-7F06D60885BC', N'标题6', N'DE084157-81B9-4280-B14C-4DBE3DD4FAE0', N'<p><strong><em>内容6</em></strong></p>', NULL, N'20200827_083442914_126d3b31-f577-49a2-933c-a57c52dbb029.jpg,20200827_083449431_50188517-86e7-41f2-99c5-acbcaeff3d41.jpg,20200827_083454870_6e5b7b25-897b-4231-a5b4-c4567667657c.jpg', N'20200827_083508552_b331aae7-d4f9-4883-bc80-1e568f6bb56b.mp4', N'0', N'1')
GO

INSERT INTO [dbo].[Publicity] ([ID], [CreateTime], [PublicityUUID], [Title], [PublicityTypeUUID], [Introduce], [Cover], [Picture], [Video], [IsDeleted], [State]) VALUES (N'1', N'2020-08-15 16:22:12.7233333', N'95607A02-3909-4008-A09B-8968013EBB0A', N'标题1', N'DE084157-81B9-4280-B14C-4DBE3DD4FAE0', N'<p>内容1</p>', NULL, N'20200826_192156301_28707ec9-f800-42c4-a36e-1d0bbcff0451.jpg,20200826_192201773_2cfdc797-2c7e-4c53-9117-51a4610a64ab.jpg,20200826_192206655_f00719c7-930c-429f-a3d7-29a4c8fb0f78.jpg', N'20200826_194316758_bb19dcfd-8106-4f8a-acf3-05737c81cc0a.mp4', N'0', N'1')
GO

INSERT INTO [dbo].[Publicity] ([ID], [CreateTime], [PublicityUUID], [Title], [PublicityTypeUUID], [Introduce], [Cover], [Picture], [Video], [IsDeleted], [State]) VALUES (N'5', N'2020-08-26 19:24:30.5533333', N'0F7085B9-E5CB-4CD6-B728-B1F8E4AE38FA', N'标题5', N'B7EFC0DA-FFB0-4EBC-ACF6-80FBF2087735', N'<p>内容5</p>', NULL, N'20200826_192407413_45f8dea0-4ac8-4515-aefa-c5bd74144c53.jpg,20200826_192412293_8f302711-f009-443f-a813-ae959a422ed9.jpg,20200826_192416914_01e77ef2-5dff-4500-8a05-992cb49c4b17.jpg', N'20200826_192425387_08311a35-ba43-4905-8acf-3f087be3ce4d.mp4', N'0', N'1')
GO

INSERT INTO [dbo].[Publicity] ([ID], [CreateTime], [PublicityUUID], [Title], [PublicityTypeUUID], [Introduce], [Cover], [Picture], [Video], [IsDeleted], [State]) VALUES (N'4', N'2020-08-26 19:23:52.1533333', N'5283669A-0141-48E4-8DAB-B26AAAE5B40A', N'标题4', N'DE084157-81B9-4280-B14C-4DBE3DD4FAE0', N'<p>内容4</p>', NULL, N'20200826_192328901_e1711c8e-4bd8-4a37-9411-fa64831357c2.jpg,20200826_192334425_e1036f4d-ab6c-4f58-9b4e-6c0fffb2b12a.jpg,20200826_192339153_30fe94b3-af1b-4580-af32-2f27167a9015.jpg', N'20200826_192346891_bdd893d1-95cf-4838-b51e-25685757942f.mp4', N'0', N'1')
GO

INSERT INTO [dbo].[Publicity] ([ID], [CreateTime], [PublicityUUID], [Title], [PublicityTypeUUID], [Introduce], [Cover], [Picture], [Video], [IsDeleted], [State]) VALUES (N'3', N'2020-08-26 19:23:09.4033333', N'55E99EBA-CF5A-4AE1-A7B9-EC876EEE9702', N'标题3', N'ACE31BF6-4C91-4158-B53C-B1D5DE4178DF', N'<p>内容3</p>', NULL, N'20200826_192244494_8ff25725-9a53-48ee-8cab-317d8ed55890.jpg,20200826_192249368_17808f10-d0e0-4606-88df-3b122fe259e6.jpg,20200826_192254935_ceb355a5-9634-4f6e-bd23-08465c5b5219.jpg', N'20200826_192303704_0dbfee85-6428-4abb-b40b-a9969bc3c1a9.mp4', N'0', N'1')
GO

SET IDENTITY_INSERT [dbo].[Publicity] OFF
GO


-- ----------------------------
-- Table structure for PublicityPicture
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicityPicture]') AND type IN ('U'))
	DROP TABLE [dbo].[PublicityPicture]
GO

CREATE TABLE [dbo].[PublicityPicture] (
  [PublicityPictureUUID] uniqueidentifier  NOT NULL,
  [Title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReleaseTime] datetime  NULL,
  [IsRelease] bit DEFAULT ((0)) NULL,
  [Cover] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime  NULL,
  [AddPeople] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsDeleted] int DEFAULT ((0)) NULL,
  [Photo] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[PublicityPicture] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'ReleaseTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否发布',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'IsRelease'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面图片',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'Content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否删除 0未删  1已删',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'IsDeleted'
GO

EXEC sp_addextendedproperty
'MS_Description', N'3张图片',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture',
'COLUMN', N'Photo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'宣传图片',
'SCHEMA', N'dbo',
'TABLE', N'PublicityPicture'
GO


-- ----------------------------
-- Records of PublicityPicture
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PublicityPicture] ON
GO

INSERT INTO [dbo].[PublicityPicture] ([PublicityPictureUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'A729EDC3-EEAF-4B28-B919-7652E1140F0E', N'图集1', N'2020-08-01 16:00:00.000', N'1', N'25.png', N'蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png', N'2020-08-20 20:44:01.677', NULL, N'1', N'0', NULL)
GO

INSERT INTO [dbo].[PublicityPicture] ([PublicityPictureUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'16340452-C4CD-4CFA-8560-0CF981A21B1F', N'图集2', N'2020-08-01 16:00:00.000', N'1', N'25.png', N'蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png', N'2020-08-20 20:44:01.677', NULL, N'2', N'0', NULL)
GO

INSERT INTO [dbo].[PublicityPicture] ([PublicityPictureUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'CF8BF786-06AC-4248-8E2A-D6630550CAEF', N'图集3', N'2020-07-30 16:00:00.000', N'1', N'25.png', N'蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png', N'2020-08-20 20:44:01.677', NULL, N'3', N'0', NULL)
GO

INSERT INTO [dbo].[PublicityPicture] ([PublicityPictureUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'EAD6CA16-5148-40F9-9969-FA22ED20D714', N'图集4', N'2020-08-01 16:00:00.000', N'1', N'25.png', N'蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png,蒙版组30.png', N'2020-08-20 20:44:01.677', NULL, N'4', N'1', NULL)
GO

INSERT INTO [dbo].[PublicityPicture] ([PublicityPictureUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'A42E3DCF-C14D-451F-A7C0-AF4A7E653B14', N'图集5', N'2020-08-23 16:00:00.000', N'1', N'20200826_182346195_78dfa5cb-1bf1-4ab8-81df-e7d4c15d4507.jpg', N'20200826_182351945_2c0575e2-5383-42e5-a932-e87ad726a27a.jpg,20200826_182356068_fe9dfb9b-337a-4e7d-813f-271ed12c0126.jpg,20200826_182400793_13245fe7-a091-4146-94ee-f3f64a1ad421.jpg,20200826_182406579_a69d4200-c85c-49f9-9378-e6ede4c423e0.jpg,20200826_182411047_935dbfab-b6d2-44f1-9126-84d06fa92fbc.jpg,20200826_182418218_427230e6-f165-407f-8556-0be3d948b75e.jpg,20200826_182423027_ed02f78f-989e-4cb3-984b-1a5cb7262ef5.jpg,20200826_182427861_ca09a2d5-b687-4693-8c4f-0153ffb00021.jpg,20200826_182432623_f57000f2-aa94-4a06-b19b-ec3e723eeb50.jpg,20200826_182437925_2a42edc3-85a8-47ce-8180-4d9433fb1187.jpg,20200826_182443099_f58dee7b-f585-47e3-9706-413dde2d5f9b.jpg,20200826_182448320_817637a3-9d95-4c75-8dd4-55070b12287e.jpg,20200826_182453388_867c1661-e781-492f-beda-e346c25bd772.jpg,20200826_182459159_5e04971e-db31-454f-b4e9-2fbb2284e85a.jpg,20200826_182503749_383e25bf-6627-4f2a-96c6-e63e2d21df8e.jpg,20200826_182508474_4186a2db-f838-4ac8-aa40-4c98fa379822.jpg,20200826_182513417_a52b53e9-f912-4c04-896a-299416aeac5b.jpg,20200826_182517988_346e6555-1166-4ad8-a7a0-2531c742b6ff.jpg,20200826_182522762_29e74d0a-1131-489f-8f12-2e0cb3f0ee93.jpg,20200826_182527436_6dca363b-562d-4034-bf9d-1ffbdb0b864e.jpg,20200826_182532127_007d8cd2-7d42-4e14-a550-1b77e01e2a24.jpg,20200826_182537404_938fe196-eef7-4eba-b1c7-47522e36f3e0.jpg,20200826_182542277_0d359f9d-1070-480c-adf7-3b572960c4f5.jpg,20200826_182546882_30260edf-6951-4acc-915b-9d46bf9e5922.jpg,20200826_182553860_654137af-4ac6-4197-ac57-ee64e2955a3d.jpg,20200826_182559031_26f16739-58c0-4c7c-aba0-ddec939baf8a.jpg,20200826_182604795_6b129272-4405-4bb7-9661-61597db87afa.jpg,20200826_182610026_7b3d0017-c4fa-47d2-a45c-ca0ac3a6a5b6.jpg,20200826_182614409_789d2668-eb13-4a71-ba31-a89305e45133.jpg,20200826_182619257_fb795444-93f1-43f3-84e9-06f09c726c1a.jpg', N'2020-08-26 15:33:29.147', NULL, N'1002', N'0', NULL)
GO

INSERT INTO [dbo].[PublicityPicture] ([PublicityPictureUUID], [Title], [ReleaseTime], [IsRelease], [Cover], [Content], [AddTime], [AddPeople], [ID], [IsDeleted], [Photo]) VALUES (N'39485947-66BC-4F51-9C30-4F775FD50956', N'图集6', N'2020-12-15 16:57:27.943', N'1', N'20200826_182735022_39ac1a8f-223f-4456-ac91-60c4a7d9227b.jpg', N'20200826_182720557_abfa3e5d-8777-4a40-b978-c8a89998532f.jpg,20200826_182724937_b1c5c573-d89c-485c-936c-fdd736fcb742.jpg,20200826_182729683_842c8bc8-145b-4cf6-9f6f-6b1bf1265575.jpg,20200826_182739993_1a509f94-38aa-4fb1-a1b5-161501c053a4.jpg,20200826_182744631_1b5ea77b-ce30-4edb-b08b-07e44c0f404c.jpg,20200826_182749188_459b4f00-1855-46a7-a063-9a8bd993d62a.jpg,20200826_182753888_da26b234-16fa-4b70-a847-760b139abc13.jpg,20200826_182800214_7fd1317f-bff0-4431-9e08-47a26dfd9105.jpg,20200826_182804761_5f023228-3154-44de-9fed-1360f5118598.jpg,20200826_182809231_a8ea6d89-7e17-490a-8dfe-3fc6bf9fc065.jpg,20200826_182813884_f68962f0-c910-4564-ac58-f52b2ef84db7.jpg,20200826_182818717_778d8b77-7d2e-4f27-93b1-e9acecf5f9c7.jpg,20200826_182824194_1ec0868e-0012-4a16-baca-df0ac0950fe8.jpg,20200826_182828870_f4d187df-8f65-4ba8-9542-ec363120d1af.jpg,20200826_182833626_16d75a9d-6646-4ff8-a60d-fa2b76caa1c4.jpg,20200826_182838240_ed48d646-2cbd-4a89-ae80-f902711a2590.jpg,20200826_182842929_2ab58ed0-f51e-49d1-9827-ab98ad56c180.jpg,20200826_182847687_c5b3b83b-1ffa-4fe7-b529-6a6555f03ab2.jpg,20200826_182852349_f4f9aba1-68ef-4df2-a127-bd8218a6956d.jpg,20200826_182857508_578055e7-9033-4e13-9105-b035cb278bb4.jpg,20200826_182902558_9fb0701b-c537-407b-9814-54d6265b425d.jpg,20200826_182907919_b8134710-fab3-457a-abab-f882bb934b8a.jpg,20200826_182912915_b6a63244-ba64-4ffc-9e64-67cbf600a003.jpg,20200826_182917742_5d923f85-5e30-4317-a6a8-3f43b88e1318.jpg,20200826_182922413_c7bbe1f1-11e5-4938-b496-858c1fc7b5d9.jpg,20200826_182927106_f58a3001-0156-415c-9291-2dd81febef78.jpg,20200826_182931881_34fc4b79-f4e4-4f27-b848-9570f0c6c232.jpg,20200826_182937361_9a354750-7a8a-4f71-a973-8ce2ed9ef34d.jpg,20200826_182942111_4771d006-3d3f-4141-8182-da8fe4c17a4d.jpg,20200826_182946710_3e9794f9-3abb-4236-972f-2fba5b5a5ac4.jpg', N'2020-08-26 18:29:49.663', NULL, N'1003', N'0', NULL)
GO

SET IDENTITY_INSERT [dbo].[PublicityPicture] OFF
GO


-- ----------------------------
-- Table structure for PublicityType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicityType]') AND type IN ('U'))
	DROP TABLE [dbo].[PublicityType]
GO

CREATE TABLE [dbo].[PublicityType] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime2(7) DEFAULT (getdate()) NULL,
  [PublicityTypeUUID] uniqueidentifier  NOT NULL,
  [Name] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDeleted] int  NULL
)
GO

ALTER TABLE [dbo].[PublicityType] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型名称',
'SCHEMA', N'dbo',
'TABLE', N'PublicityType',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'宣传类别',
'SCHEMA', N'dbo',
'TABLE', N'PublicityType'
GO


-- ----------------------------
-- Records of PublicityType
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PublicityType] ON
GO

INSERT INTO [dbo].[PublicityType] ([ID], [CreateTime], [PublicityTypeUUID], [Name], [IsDeleted]) VALUES (N'4', N'2020-08-15 15:24:54.7200000', N'DE084157-81B9-4280-B14C-4DBE3DD4FAE0', N'人文介绍', N'0')
GO

INSERT INTO [dbo].[PublicityType] ([ID], [CreateTime], [PublicityTypeUUID], [Name], [IsDeleted]) VALUES (N'1', N'2020-08-13 17:58:17.9866667', N'B7EFC0DA-FFB0-4EBC-ACF6-80FBF2087735', N'宣传视频', N'0')
GO

INSERT INTO [dbo].[PublicityType] ([ID], [CreateTime], [PublicityTypeUUID], [Name], [IsDeleted]) VALUES (N'3', N'2020-08-15 15:24:40.7200000', N'260ABE2F-49A8-4E22-A754-9DCE67412901', N'自然资源', N'0')
GO

INSERT INTO [dbo].[PublicityType] ([ID], [CreateTime], [PublicityTypeUUID], [Name], [IsDeleted]) VALUES (N'5', N'2020-08-26 14:41:36.2000000', N'ACE31BF6-4C91-4158-B53C-B1D5DE4178DF', N'消息推送1', N'1')
GO

INSERT INTO [dbo].[PublicityType] ([ID], [CreateTime], [PublicityTypeUUID], [Name], [IsDeleted]) VALUES (N'2', N'2020-08-15 15:22:51.8700000', N'689C2B99-68AC-4AE6-8E2F-FB7C0F1D8F6E', N'宣传图片', N'0')
GO

SET IDENTITY_INSERT [dbo].[PublicityType] OFF
GO


-- ----------------------------
-- Table structure for ScenicSpot
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ScenicSpot]') AND type IN ('U'))
	DROP TABLE [dbo].[ScenicSpot]
GO

CREATE TABLE [dbo].[ScenicSpot] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [ScenicSpotUUID] uniqueidentifier  NOT NULL,
  [Name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [SpotContent] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Video] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Audio] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int  NULL,
  [OrderBy] int  NULL,
  [State] int  NULL,
  [TourismUuid] uniqueidentifier  NULL,
  [Type] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsRecommend] bit DEFAULT ((0)) NOT NULL,
  [ytype] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PlayType] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ShopId] int  NULL
)
GO

ALTER TABLE [dbo].[ScenicSpot] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'SpotContent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'视频',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'Video'
GO

EXEC sp_addextendedproperty
'MS_Description', N'音频',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'Audio'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'OrderBy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属景区',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'TourismUuid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot',
'COLUMN', N'Type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'景点介绍',
'SCHEMA', N'dbo',
'TABLE', N'ScenicSpot'
GO


-- ----------------------------
-- Records of ScenicSpot
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ScenicSpot] ON
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'1', N'2020-09-24 18:51:18.503', N'507DE5CA-F186-42A5-A9E0-4E41392B6EF3', N'知青驿站', N'       位于云浪村沈家自然村景云线边，知青驿站是村庄公共空间的知青文化符号，以知青文化为载体，把知青文化植入村庄的自然肌理，通过加入知青车棚、知青廊、毛主席上山下乡语录、知青生活还原等元素，是一个集休闲、停车于一体的、公共区域和知青文化有机结合的、有态度，有主题，有情怀的公共特色活动区。', N'河桥镇云浪村', N'20201028_213618221_0384e501-877b-4e64-949e-f67a73610574.jpg,20201028_213635979_3d29bbb8-eea3-4bbc-8291-33b48c074cf9.jpg,20201028_213641535_c498d3e7-e672-4a6d-b652-b78656767f51.jpg', N'', N'20200925_181623864_32eb67d4-5429-46fd-b1c3-99a376eaebb8.mp3', N'0', N'1', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'公共设施', N'0', N'1', N'119.254349', N'30.118394', N'1', N'1150')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'2', N'2020-09-24 18:51:53.317', N'3C270397-DAD2-4F43-B62B-3766C8C45087', N'知青芳华', N'       位于云浪村沈家自然村中心。这个区块是当年知青生活的主要节点，相对完好地保留了云浪影剧院等七八十年代的生活印记。村中心“思青廊“，既是追忆青春，也是怀念知青，是一代人的共同记忆，廊柱上的对联”情牵云浪知青桥，爱伴芳华思青廊“恰如其分地表达了云浪人民对知青的深情厚意。廊前节点，以“知青芳华”为主题,注入知青文学等元素，如“知青文学列车”、知青景墙、知青文艺舞蹈雕塑等，是一个值得记忆的知青人文空间。', N'河桥镇云浪村', N'20201028_213708251_c9c264a9-315a-45bc-9c2c-bc7f3f266b91.jpg,20201028_213734643_4f14879c-1bab-4f5a-9e92-97e20e4754ef.jpg,20201028_213740340_1344823c-61a8-49aa-a56f-5f6ee2844a78.jpg', N'', N'20200925_181639160_f5d80c90-bce8-449b-8feb-1e826dbb737d.mp3', N'0', N'2', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.254307', N'30.116594', N'1', N'1152')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'3', N'2020-09-24 18:52:23.907', N'08EC1D37-1F57-4A39-9CDF-5EF081099BA6', N'知青农场', N'      位于云浪村沈家自然村景云线，知青上山下乡其实也是一场划时代的农耕实践，涌现了一大批知青农业专家，云浪知青樊国强当时在大队支持下，主持了920植物生长素的水稻种植试验，加入植物生长素的水稻，根茎明显粗壮，稻干要高出10厘米，产量也有明显的增长。知青农场充分利用现有闲置农田，新增木栈道，休息草亭、知青农作雕塑场景、木秋千等，以此来还原和追溯当年知青的农耕生活，同时，也是游客了解知青，学习当地农耕文化的', N'河桥镇云浪村', N'20201028_213826038_cdc7c2da-abea-4d05-9974-a515c54b36b0.jpg,20201028_213842181_5584d94a-37fe-42bf-8e76-cbdd28c6bd36.jpg,20201028_213847742_2bd28c59-0d8b-4ed8-822d-130277962c06.jpg', N'', N'20200925_181710062_c6d93501-58c8-43df-8f1d-45bdd3c2c4cc.mp3', N'0', N'3', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'111.11', N'11.1', N'1', N'1155')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'4', N'2020-09-24 18:56:58.543', N'641F4127-F3CB-44CB-8324-2E5B71366ACD', N'知青洗衣点', N'       位于云浪村沈家自然村。长安一片月，万户捣衣声，知青月下洗衣也是一种浓浓的乡愁。洗衣点设计以人为本，还原知青洗衣场景，新增洗漱台，开挖水沟、改造厕所，还原往日记忆，提振村民的幸福感，更加珍惜来之不易的美好生活。', N'河桥镇云浪村', N'20201028_213908610_9d63db97-dbf4-47ca-9f3f-6917d653f027.jpg,20201028_213925736_11c463c7-f038-4eb5-9800-bf326c928c4f.jpg,20201028_213931272_a705f297-cef0-46f4-af4f-bab5e82edf17.jpg', N'', N'20200925_181726539_90b04c6c-bbd5-41d1-a6ee-b0735640658d.mp3', N'0', N'4', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.253239', N'30.118069', N'1', N'1156')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'5', N'2020-09-24 18:57:33.980', N'888E3E14-EB33-4CC0-BA52-06070286DCC4', N'古杏广场', N'       古杏广场位于云浪沈家自然村西侧江堤上，以一棵古银杏为地标。古银杏立于柳溪江畔，散枝开叶，和知青桥遥遥相望，这里江面开阔，景色苍茫，汛期大江奔流，大浪淘沙，颇为壮观。古银杏树龄310年，树高18米，胸围540厘米，平均冠幅15米。边上 “杏浪亭”，取自古银杏的“杏” 字，以及“云浪村”的浪字，意寓：浪奔七月云水激，杏立千年岁月静。', N'河桥镇云浪村', N'20201028_213957922_790add1c-68b1-456c-be99-730108967888.jpg,20201028_214009370_3040b1f5-7af0-4146-9676-57c65690f954.jpg,20201028_214014168_20c2930d-f121-4796-8cdd-ef7177b29ac6.jpg', N'', N'20200925_181741175_06246a5a-8910-438f-8292-57c317d9fd14.mp3', N'0', N'5', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.251319', N'30.114116', N'1', N'1157')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'6', N'2020-09-24 18:58:01.673', N'C5934B78-54B2-4D63-816E-60E83DD05F47', N'蚕桑之路', N'       蚕桑之路是进入泥骆景区的第一个节点，地处景云线和云金线通往泥骆的三叉路口，既是村落形象的标识标志，也是泥骆蚕桑文化之旅的第一站。桑园、阡陌、竹林，一个休闲亭，取名陌上桑，“乡村四月闲人少，才了蚕桑又插田”的蚕乡气息扑面而来。节点以竹匾、蚕桑、文化主题景墙等形式，植入蚕桑文化元素，特别是几个憨态可掬的蚕宝宝的形态，打开泥骆蚕桑之路的大门，也为以后蚕桑之旅两个节点文化埋下伏笔。', N'河桥镇泥骆村', N'20201028_214309384_a9b2af34-756e-41c0-b36e-edbc0aa49166.jpg,20201028_214325024_a8073882-ddc8-4cdc-bfec-98ea881f3399.jpg,20201028_214331629_beb654dd-e867-416e-9ca1-b0d702fb9e0e.jpg', N'', N'20200925_181755680_84c4a14e-ea47-46c6-ab2c-6ae69c021cfb.mp3', N'0', N'6', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.250047', N'30.098741', N'1', N'1158')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'7', N'2020-09-24 18:58:41.660', N'3DC9B719-3C0E-4579-B83D-F72AD891A90F', N'蚕桑织梦', N'       蚕桑织梦是通往泥骆蚕桑文化园的第二个节点，这个节点是第一个节点意境的延伸，在这里，蚕宝宝变成了蚕茧。蚕把自己的梦想都织在茧里。节点采用了具象的蚕茧造型和抽象高达3米的铁板蚕茧形状，强化“织梦”意境，一块“浙江省蚕桑西进规模化示范种植基地”的铁板牌匾，以及以养蚕竹匾为特色基地介绍，进一步烘托了蚕桑文化的氛围', N'河桥镇泥骆村', N'20201028_214352346_6df2592e-f449-4a2e-8e96-5ad043677d7e.jpg,20201028_214405792_74a81fad-0203-40a9-b6eb-b6d8238ae460.jpg,20201028_214410771_66e3cf4e-f911-4e1a-95fc-f766b0e2834f.jpg', N'', N'20200925_181808567_b7ed7917-1af4-4fc0-9bb5-9d7e058ab94a.mp3', N'0', N'7', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.251217', N'30.095631', N'1', N'1159')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'8', N'2020-09-24 18:59:21.777', N'7302F26B-8604-4F9F-8E20-B5334B5599AD', N'破茧成蝶', N'       破茧成蝶是泥骆蚕桑之旅的第三个节点，通往柳溪江码头，通往丝绸之路。这是泥骆蚕桑文化意境的升华。节点造型抓住了蚕蛾挣脱蚕茧飞向天空的瞬间，把蚕桑的生命之旅刻画得栩栩如生，华美绚烂。三个节点，先声夺人，步步深入，层层升华，形象地展示了泥骆蚕桑文化的精神内核，既有美感，更有思想和哲学的高度。', N'河桥镇泥骆村', N'20201028_214437769_3c588016-43cd-4f6f-830f-9ef70e92b065.jpg,20201028_214502448_e42ec91a-5f98-4af7-bc47-bb73e15e71df.jpg,20201028_214508494_c48e2b80-3f41-4628-afab-41abc7d14fff.jpg', N'', N'20200925_181824176_67a933b4-7483-414a-92a7-70003eba5dcd.mp3', N'0', N'8', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.257144', N'30.090990', N'1', N'1162')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'9', N'2020-09-24 18:59:46.527', N'6F31240D-3229-4D28-B1C7-4049DAC08BFA', N'泥骆蚕桑文化馆', N'       位于泥骆村岭上自然村，是展示蚕桑文化的重要节点。云浪蚕桑文化馆古旧的建筑，很有年代感。展厅以源远流长、一图千秋、泥骆蚕桑、柳溪丝路、蚕的一生、桑树记忆、蚕桑民俗等七个部分，对临安及河桥蚕桑文化进行了系统的介绍。展馆以空间的变换，引出蚕桑发展的时间轴，以一斑而窥全豹，解密河桥蚕桑产业发展路径，以及河桥蚕桑在古代丝路和现代一带一路的源头意义，阐述耕织图故乡蚕业的特殊地位，可作为青少年科普基地，定期举办', N'河桥镇泥骆村', N'20201028_214540345_1170371d-354c-4932-8da8-e3e6fefc469b.jpg,20201028_214601666_6d9c766d-6fdd-448d-b0b8-bade63f6ab91.jpg,20201028_214607620_d8e3ab4f-fc29-4125-8951-1d7c20f9bbfb.jpg', N'', N'20200925_181842339_4ad774f3-3de0-458c-81e3-accd4fb5fe8f.mp3', N'0', N'9', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.250643', N'30.096866', N'1', N'1163')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'10', N'2020-09-24 19:00:17.983', N'52E49156-AFB2-4D69-AA4E-28509F335A6C', N'泥骆蚕桑文化园', N'       位于岭上自然村的中心，以荷花塘为中心展开，有嫘祖阁长廊，长廊“功启先皇化干戈而为玉帛；利在千秋养天蚕以暖百姓”这副对联形象地表达了人们对世界蚕桑丝绸的伟大发明家——黄帝元妃嫘祖的崇敬之心。 池塘周边设有水上栈道，种植荷花及相关植物，并融入耕织文化元素，展现耕织文化历史。', N'河桥镇泥骆村', N'20201028_214716944_867d5cda-3b09-404c-86b6-90c2ffd0b40d.jpg,20201028_214734307_3de02452-bdc6-4075-a1ca-f41c97022f15.jpg,20201028_214739885_49f1e21b-d4d2-4988-9387-80a585101a13.jpg', N'', N'20200925_181853551_6bb67145-f9da-46b4-a4da-7e793dbb2330.mp3', N'0', N'10', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.248701', N'30.096351', N'1', N'1165')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'11', N'2020-09-24 19:00:41.463', N'30895466-6DAC-4E26-8DA4-24D9E7288EDE', N'古井遗风', N'       泥骆村位于柳溪江畔，水源丰富，生活和农耕用水不是问题。但柳溪江因为天气和季节的不同，分为枯水期和汛期。汛期洪水泛滥，河水混浊，不能饮用；枯水期则河床下移，村里百姓去河边取水极为不便。明清年间，村里几户大户人家开始商议出资打井事宜，后几经周折，终于功垂井成，成为泥骆人饮用水的主要来源。而今老井犹存，虽弃而不用，但历代泥骆人饮水思源，恭承祖训，耕读传家，睦孝义，积德行善，古井遗风，代代相传。', N'河桥镇泥骆村', N'20201028_214808061_e0b07888-63d8-40ea-b3be-f0d307938303.jpg,20201028_214840200_9c074b1f-cd81-4aaf-9abe-2fad8e4b23b3.jpg,20201028_214845688_7e573093-3e11-40ee-aa0c-e3db792271db.jpg', N'', N'20200925_181905147_d506f8f6-82c4-4643-9b03-4f097058ad30.mp3', N'0', N'11', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.251131', N'30.096110', N'1', N'1167')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'12', N'2020-09-25 09:23:08.323', N'4910586B-6534-4F32-A10A-3CA3240C131D', N'河桥古镇', N'       南部、柳溪江畔昌化，距杭州100公里、临安区50公里。河桥古镇是古时昌化县治所在。明嘉靖年，唐昌即（昌化县）设四镇，河桥因“邑水口形胜商务独冠唐昌”被列为首位，至今镇门上“唐昌首镇”犹可见。河桥古镇景区内拥有河桥农博馆、十里红妆婚嫁习俗馆，柯宁相公殿及浙西抗战馆等景点可供参观了解河桥历史文化。', N'河桥镇古镇景区 ', N'20201028_214905693_60298d85-2e5c-4b07-842e-a3a09cffdc52.jpg,20201028_215154714_bd9e880b-7d56-4193-b517-55e37d4d6e66.jpg,20201028_215159601_df18727f-6180-47fb-b0cd-40ba3c341184.jpg', N'', N'20201024_190737124_5c0133a3-032b-41f3-bb9c-1d8287865b62.mp3', N'0', N'12', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.240816', N'30.101797', N'1', N'1129')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'13', N'2020-09-25 09:23:42.350', N'B74E5563-6486-450B-9D9E-4A642F454B9C', N'文澜阁特色文化中心', N'       文澜阁特色文化中心为于河桥老街，修建于2019年，内部有河桥摄影馆、河桥民俗非遗馆、浙西书画馆，河桥旅游图书馆等特色展陈馆，可供游客短时间内了解河桥摄影网红地，河桥全镇民俗特色物件、年俗灯队并参观书画名家的作品，是居家旅行特别是学龄儿童了解河桥历史的必经之地。', N'河桥镇河桥老街', N'20201028_215229063_dd7d7fd6-21ba-4a54-8583-b83c28c4a2f6.jpg,20201028_215248440_77be7908-5c86-4fa5-81d8-d155fe687e26.jpg,20201028_215254591_1730688c-770c-4c96-92ec-ddeb6a440ffa.jpg', N'', N'20201024_190753326_8149dd37-32ba-4bab-828b-6fea516c6b42.mp3', N'0', N'13', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.237682', N'30.100802', N'1', N'1170')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'20', N'2020-09-25 09:26:39.833', N'CEEB1C74-60A9-4339-9E7D-5D84B548DEA2', N'河桥老街', N'       河桥老街距今1300多年历史，是省级文保单位，分为上街、中街和下街，长1500多米，宽3—5米，用石板铺成，旁边设有太平沟。太平沟别处少见，宽1米，深2米，盖在上面的石条和路面平整，石条用卯榫接起来。每隔一定的距离就留一个水口，砌了石阶，便于居民取水、洗涤。老街保存着相对完好的一百多幢明清风格的古民居，呈当年“前店后坊”的风貌，在这里，你能清晰看见江南传统建筑中固有的封火墙，它们将街道分割成一家一家的店铺，而清一色的店铺排门，又无形中将整条街的商铺连成一片。
在河桥老街，还有部分民国、建国初期和文革时期的建筑，在所有的建筑体上，都留下了每一个时代的文化烙印所以，这是一个生活着、发展着的商业古镇，虽然因为水路荒废，繁荣不再，但河桥的生活气息还是延续了千年的习俗和文脉。。', N'河桥镇', N'20201028_215503377_918bc06c-7e55-4e61-bd38-cb22d3977e46.jpg,20201028_215508225_016180f5-9796-4078-9e33-8dc125058e00.jpg,20201028_215512984_e8567199-b818-435b-b289-f062f94a7166.jpg', N'', N'20200927_150735554_764d4c8e-9065-4374-8998-59cc86f8ff5b.mp3', N'0', N'14', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.239495', N'30.102929', N'1', N'1171')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'22', N'2020-09-25 09:31:30.647', N'5417E31E-691E-4778-94C8-6842F7F98CEB', N'云浪知青文化馆', N'       云浪知青文化馆是云浪村知青文化的重要载体，在原有老屋的基础上进行改建和扩建，建筑风格以六七十年代的平房农居为主，以门庭、庭院，和建筑主体三位一体，还原当初知青的生活场景，并全景式地记录80余名云浪知青从1964-1978年，横跨14年的知青生涯，从生活、劳动、理想各个侧面记录他们在云浪的青春足迹和岁月芳华，以及后知青时代，他们对云浪的回望和情感。', N'河桥镇云浪村', N'20201028_215547501_10f5a51f-2825-4330-a08c-60a4e420d2b5.jpg,20201028_215600695_799c05e2-e3e6-4873-b132-fa9cee9ce146.jpg,20201028_215605507_b6fcd41f-0ac7-418e-a06e-3d325eecceb5.jpg', N'', N'20200925_182022256_812a3932-9d19-44ef-889c-d357759dfc5e.mp3', N'0', N'15', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.253679', N'30.118445', N'1', N'1173')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'23', N'2020-09-25 14:37:54.330', N'00B844B2-8DF4-4BB5-AEAB-56B8F7BFA899', N'知青桥', N'       知青桥当年叫做河东大桥。它从河桥村的乌珠山横跨柳溪江直通云浪村，长200米，宽5.5米，高13米，为五孔水泥桥。知青桥1976年立项建设，1977年竣工，1978年通行。之所以叫“知青桥“，是因为当年浙江省交通厅对一个乡村立项造桥几乎是不可能的事，全凭云浪知青带队干部在省厅斡旋，筹资筹物，加上当初昌化区委、河桥公社鼎力支持，云浪、毕家、西鸠、泥骆四个大队村民及知青出工出力，方能完成。该桥已经完成它的历史使命，现已禁止车辆通行，桥头两侧侧建有景观主题墙，上有”知青桥“题款和知青文化元素，成为知青在云浪上山下乡的重要文物节点和见证。', N'河桥镇云浪村', N'20201028_215625726_c78008ef-0242-4692-b054-54c62d377bb4.jpg,20201028_215643389_6d685a1d-936f-4387-9c73-d699ad87206e.jpg,20201028_215648477_232f8b88-7bfb-4b65-9d69-7da9d5824e9a.jpg', N'', N'20200925_181026215_c0a2f5b5-5581-4c4d-8207-fdf594336904.mp3', N'0', N'16', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.247574', N'30.122167', N'1', N'1174')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'24', N'2020-09-25 14:38:30.003', N'1009698E-8E4E-46BB-824E-312B421B2260', N'柳溪江绿道', N'       柳溪江绿道分为休闲步行绿道，以及骑行绿道。步行绿道是依托柳溪江沿溪打造的滨水步行绿道，全长约5公里，其中已建1600米，从河桥镇政府起始，到云浪知青桥跨溪回环，一路绿野江天，风光无限；骑行主题绿道，依托昌文线、柳溪街、云金线打造，全长约6.5公里。此骑行绿道把河桥，云浪，泥骆三点串联，把当地打造的主题节点，串点成线，串珠成链，以绿道激活三村旅游资源，实现资源共享，其中唐昌首镇结合河桥古街，体现唐昌风情；绿野江天用具有视觉冲击力的江景，衬托柳溪江之美；知青驿站融入知青元素，突出云浪知青文化；桑林寻踪借助泥骆江景山色，呈现群山峡谷之秀；蚕桑织梦吸纳蚕桑元素，体现蚕桑文化之美。', N'河桥镇', N'20201028_215918123_166ed4ee-80c2-4ac7-b2dd-a1ba228792db.jpg,20201028_215923525_1570cac0-e7f4-4f67-b4f5-e8bc63167166.jpg,20201028_215928232_6f94f9d0-c27a-4f9a-8ecf-73228bf55887.jpg', N'', N'20200925_182345754_539a3f98-3642-4c84-9e2d-55d466dd67dd.mp3', N'0', N'17', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.241856', N'30.101479', N'1', N'1176')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'25', N'2020-09-25 14:42:49.660', N'E8CF9556-6550-4AB6-8901-33F0364802E5', N'柳溪江码头', N'柳溪江位于中国优秀旅游城市临安区河桥古镇，距杭州100公里，临安区50公里，交通十分便捷，三溪汇集，始成柳溪，上游沙明水净，河滩开阔，游鱼可数游；下游江湾相连，青山对峙，风光迷人，呈浙西三峡的独特风貌。上游竹筏漂流，下游快艇冲浪，缤纷游程，激情体验，吸引着各地游客纷至沓来。', N'柳溪江', N'20201028_220042772_76b95011-118a-4671-810c-aaa0466387ce.jpg,20201028_220048183_e2f512d7-7754-46f2-b897-cd74bf5db22f.jpg,20201028_220053233_90de958a-f6c0-46bf-88d7-311b428f03f7.jpg', N'', N'', N'0', N'18', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', N'1', N'119.248083', N'30.122247', N'1', N'1177')
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'26', N'2020-10-24 14:41:16.330', N'3FF94290-7714-409A-B664-A14CB3C8CC09', N'西天目', N'西天目山是国家森林和野生动物类型的自然保护区，位于杭州临安，是大自然赐予的天然尤物。景区植被覆盖率高达95%以上，森林景观独树一帜，尤以“古、大、高、稀、多、美”称绝于世。人称“天然植物园”的西天目山景区中汇集了2000多种植物。', N'杭州市临安区天目山风景名胜区', N'20201024_180248996_7c4adfd0-4355-48fd-82a0-ac2b411b8b6a.jpg,20201024_180255773_7c428fde-2c4a-404d-98e7-b75c20635f8f.jpg,20201024_180300883_3d7f14cc-f5b1-4b12-8cf4-72ee766f379c.jpg', N'', N'20201024_183756476_95de3d5d-b132-4f8e-a80e-7bb219b0db5c.mp3', N'0', N'1', N'1', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'119.430067', N'30.328645', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'27', N'2020-10-24 14:42:44.503', N'48C0C900-7195-4F25-8195-E8A58DDE3C23', N'天目山禅源寺', N'禅源寺景区以始建于明朝（1425年）的临济宗中兴祖庭——禅源寺为核心。禅源寺周围分布有建于各个时期的人文景观，也有地质景观。太子庵是儒家文化在天目山的代表，内有分经台、洗眼池等历史遗迹；浙西一中建校纪念碑、留椿屋则是对浙西抗战的直观的见证；双清溪体现大自然造物之公平性。

', N'杭州市临安区西天目山', N'20201024_180218966_65ea77d2-d9e9-430f-bc46-2d83c6ff6cc6.jpg,20201024_180224572_6e3191d6-d807-4e28-86a6-b1d33b2041df.jpg,20201024_180231801_126f9fc6-dffa-48b0-a4a4-990b634811ed.jpg', N'', N'20201024_183840172_f01d8eb5-8e3b-43ec-8d25-055890670b85.mp3', N'0', N'2', N'1', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'119.447938', N'30.320319', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'28', N'2020-10-24 15:01:09.193', N'D7DF3B9F-A7A7-47A6-AABB-18083DD10ADF', N'周恩来天目山演讲纪念亭', N'周恩来演讲纪念亭原址位于韦驮殿东“百子堂”旧址，是1989年，临安县人民政府为纪念周恩来西天目之行50周年而建造。在禅源寺复建后，新址选择在原址往后走50步左右的大雄宝殿东侧。

新建纪念亭基本保持和恢复原纪念亭的风貌。造型精巧，独具一格，周围松柏葱郁，花卉叶香。亭中仍竖有“周恩来讲演旧址”碑。

1939年3月，周恩来曾在此地向浙西行署军政人员、政工队员、干训班学员和浙西临时中学师生作团结抗日讲演。', N'杭州市临安区天目山风景名胜区', N'', N'', N'', N'1', N'3', N'0', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'111.11', N'11.11', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'29', N'2020-10-24 15:02:45.017', N'A9BAF8FF-9599-43A5-858F-C83C5739C391', N'龙门峡谷', N'4', N'杭州市临安区昌化镇清凉峰镇白果村大明山风景区', N'', N'', N'', N'1', N'4', N'0', N'8D9070DA-58F8-4950-B075-1651331046DE', N'景区设施', N'0', NULL, N'111.11', N'11.11', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'30', N'2020-10-24 15:15:24.730', N'EE6B4667-7B4D-41B9-B953-334A91068341', N'玉龙溪谷', N'5', N' 杭州市临安区昌化镇清凉峰镇白果村大明山风景区', N'', N'', N'', N'1', N'5', N'0', N'8D9070DA-58F8-4950-B075-1651331046DE', N'景区设施', N'0', NULL, N'111.11', N'11.11', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'31', N'2020-10-24 15:16:37.197', N'71C24F1C-9589-4843-9CEF-EAF55CB1C26A', N'七星潭', N'1', N' 杭州市临安区东天目山景区', N'', N'', N'', N'1', N'6', N'0', N'8A6E93FC-416B-41F2-BE68-C53FBE273389', N'景区设施', N'0', NULL, N'111.11', N'11.11', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'32', N'2020-10-24 15:17:39.053', N'613EFE1E-0A1B-456D-A4DB-C81421EF8530', N'昭明禅寺', N'7', N'杭州市临安区太湖源镇梅家村东天目山景区', N'', N'', N'', N'1', N'7', N'0', N'8A6E93FC-416B-41F2-BE68-C53FBE273389', N'景区设施', N'0', NULL, N'111.11', N'11.11', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'33', N'2020-10-24 15:18:08.927', N'78F93513-8171-48C6-A96F-D4D3C96D5C29', N'西瀑大森林', N'西瀑大森林由西崖瀑布与万松林两部分组成，总落差达360米左右，万松林也叫万松岩，是长在岩石上的一大片原始森林。瀑布与奇松构成一幅中国泼墨山水画，是昭明大禅院的外围。主要有龙女瀑、禅杖瀑、观音瀑、北斗七星、七星潭、西岭垂虹等。

西瀑大森林景区内，虹桥是观瀑最佳的位置，这里有一个独特景观叫做“西岭垂虹”。据说西瀑从大仙峰与二仙峰峰顶峡谷流出，常有彩虹，桥架两峰，水经过白云窝，像紫色的长练飘然而下，飞溅起雪白的珍珠，绵延一万丈，瀑布到这里，窜入虹桥，狂欢而去，因此得名。', N'杭州市临安区太湖源镇东天目山景区', N'20201024_181213745_9a74c9d1-58e9-4cc9-b490-fc161225c5d8.jpg,20201024_181219454_f391b152-7a0b-4363-a818-5a8fd09e50aa.jpg,20201024_181225038_b0040138-8e3c-4b85-b316-c61e766bf752.jpg', N'', N'20201024_183914189_3c37af35-a8ac-4f6d-8d53-8fa74f39bf51.mp3', N'0', N'8', N'1', N'8A6E93FC-416B-41F2-BE68-C53FBE273389', N'景区设施', N'0', NULL, N'119.526948', N'30.330649', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'34', N'2020-10-24 18:20:59.000', N'94F92EA7-75A7-4B66-8771-F96F076518C5', N'太湖源', N'太湖源位于临安天目山南麓，顾名思义是太湖的源头。这里有纯净的山涧、溪水，以清凉著称。2007年姚明夫妇在这儿拍婚纱外景，引得全国各地的记者争相报道，原本并不出名的太湖源由此成了长三角的热门景点。', N'临安天目山南麓', N'20201024_182043299_66cc0a5f-1442-4469-b950-514b7261d3ce.jpg,20201024_182049166_62691e89-6d5a-4676-aa7a-653e650ccc42.jpg,20201024_182054202_72ad25de-014b-46dd-9a94-92cf3c158f96.jpg', N'', N'20201024_183853664_05abae82-8533-4d90-a815-234f0e752192.mp3', N'1', N'3', N'1', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'111.11', N'11.11', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'35', N'2020-10-24 19:10:16.113', N'8D00CACE-6698-403F-B997-383F4D15BC9B', N'天目山风景名胜区', N'天目山景区位于临安区境内，穿过天目村，尽头便是西天目山南大门游客中心。由此可以步行经禅源寺到山上的大树王景区，也可乘坐景区交通车，由冰川大峡谷方向到达龙凤尖停车场，而后步行游览大树王景区。', N'杭州市临安区西天目山南苑', N'20201024_194053483_e71f54e8-b4e8-4088-8915-ca39ec295476.jpg,20201024_194447182_64f25245-f977-41d3-ba01-65cdd740bca1.jpg,20201024_194454103_759dd0b9-0c6c-4708-b111-fe381bedc307.jpg', N'', N'20201024_191725412_62038992-e75e-4786-9e5b-a4121344b137.mp3', N'0', N'5', N'0', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'119.430067', N'30.328645', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'36', N'2020-10-24 19:11:04.033', N'5CA73D0D-3CDE-4A28-9BDF-D82EB1276E2B', N'大明山风景区', N' 大明山位于临安西部，邻近安徽省。这里属黄山余脉，既承袭了黄山的奇峰怪石，又拥有浙西山水的明秀。春夏可踏青避暑，冬季的大明山滑雪场是滑雪胜地。穿越万米岩洞、走悬空栈道，或坐旱滑道下山，都是不错的体验。
', N'杭州市临安区清凉峰镇大明村', N'20201024_193742993_bf7e194c-6e24-46cb-9980-02224a309749.jpg,20201024_193748175_9ab2d635-b09b-4aeb-9e46-de2dcca5659e.jpg,20201024_193753615_cd1ab5b0-dec1-4790-919b-3081bbcf82a3.jpg', N'', N'20201024_191745934_4876d5c4-535b-4159-95d0-379393a62692.mp3', N'0', N'6', N'1', N'8D9070DA-58F8-4950-B075-1651331046DE', N'景区设施', N'0', NULL, N'118.997844', N'30.028484', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'37', N'2020-10-24 19:12:12.797', N'56A494C3-3F69-4EF2-995D-9CA7F8775D80', N'东天目山景区1', N'东天目山与西天目有着不同的景致，这里游人较少，山中参天的古树、潺潺的溪水、壮观的瀑布和山上的古寺，给人一种很幽静的感觉。', N'杭州市临安区老平线', N'', N'', N'20201024_191804759_69257883-bbd5-48b0-b98d-8b3a3bf2a8e0.mp3', N'1', N'7', N'0', N'8A6E93FC-416B-41F2-BE68-C53FBE273389', N'景区设施', N'0', NULL, N'111.11', N'11.11', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'38', N'2020-10-24 19:30:57.823', N'19F78053-6516-4F3C-AD9E-73B195F884EC', N'东天目山景区', N'东天目山与西天目有着不同的景致，这里游人较少，山中参天的古树、潺潺的溪水、壮观的瀑布和山上的古寺，给人一种很幽静的感觉。', N'杭州市临安区老平线', N'20201024_182253196_78060a4f-138a-4aed-a6e2-f277b1beb163.jpg,20201024_182508778_808bab2b-470e-4d8d-8a73-78129392ce4d.jpg,20201024_193043259_f4ffc38a-d953-4aa3-a306-ad0c2ca35e45.jpg', N'', N'20201024_193227850_f97be17b-7aa5-4b5e-9014-2154ded8bdfa.mp3', N'0', N'4', N'1', N'8A6E93FC-416B-41F2-BE68-C53FBE273389', N'景区设施', N'0', NULL, N'119.508832', N'30.340598', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'39', N'2020-10-24 19:47:23.420', N'51AA4A4B-9AE1-41FF-A272-7D768E30D058', N'青山湖', N'青山湖是位于临安城东四五公里的人工湖，风光清朗，湖面很开阔，并无太多修饰。湖上最值得一看的是水上森林，这些奇特的杉树在水中生长，枝繁叶茂。此外，景区内还有烧烤园、小型游乐场，可以玩玩水上降落伞等活动。', N'杭州市西郊临安区青山湖景区', N'20201024_194705772_cafc832e-8797-470e-9ec4-16e74d0e9057.jpg,20201024_194713092_608ab79c-2c66-4924-8ff9-28e1fededa03.jpg,20201024_194718079_64d9a69e-4dbb-45a6-a332-0a8ba55e5b25.jpg', N'', N'20201024_195145942_1bc994c6-4c4a-4b5e-aa51-27b01f87c729.mp3', N'0', N'9', N'1', N'2A189D23-A3D4-4278-8B44-FB73939BA2D3', N'景区设施', N'0', NULL, N'119.773346', N'30.227450', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'40', N'2020-10-25 09:55:52.397', N'F35425F8-E0E1-4EA7-A974-0ABC9F95C802', N'风之谷', N'杭州临安风之谷具体位置是在杭州临安昌化镇，这里离杭州比较远，大概还有100公里的距离。杭州临安风之谷整个园区占面积大约2382亩，由亲子运动乐园、户外营地、山地极限运动乐园、户外运动学校、户外运动大本营、凤凰巢精品酒店组成。', N'杭州临安昌化镇', N'20201025_095522459_f146b0bd-30af-4105-80a6-ca104fbbed68.jpg,20201025_095529735_5de36121-6b15-44d6-946d-ef4651387f53.jpg,20201025_095536342_c7c18665-1c7d-4ef6-ad88-5d436db00830.jpg', N'', N'20201026_112405534_65ed45ee-c7b5-450b-a466-6b75102bd254.mp3', N'0', N'7', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', NULL, N'119.239716', N'30.145741', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'41', N'2020-10-25 10:02:18.830', N'1AAA0809-979D-4F5E-86D1-8CFD1B421437', N'大明山滑雪', N'大明山滑雪场在海拔1200米的大明山顶，每年12月到次年3月，山上积雪不断，温度在零下10℃至0℃之间(夜间温度均在0℃以下，最低温度近零下20℃)，很适宜造雪；再加上旁边的大明湖，几十万立方米的库容，为造雪提供了源源不断的水源。', N'浙江省杭州市临安区大明山风景旅游区', N'20201025_100210003_bcd01856-099c-4c42-9452-e2100a478cf3.jpg,20201025_100213491_48366467-9109-4adf-80f5-d9f2fcacfa18.jpg,20201025_100216947_86dcac1b-4132-40b8-af5b-ff7132762047.jpg', N'', N'20201026_112428612_184a1092-db91-4e6b-bf63-f9cec4111f88.mp3', N'0', N'10', N'1', N'8D9070DA-58F8-4950-B075-1651331046DE', N'景区设施', N'0', NULL, N'118.995384', N'30.023335', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'42', N'2020-10-25 10:28:04.010', N'937AA737-132C-4705-832A-B78F5468A6E2', N'湍口温泉', N'湍口温泉又称天目山温泉，古亦名“芦荻泉”，早在1300多年有之。地热区面积约0.2平方公里，地下储热温度40—50度，溢出表面的水温30——32.5度，属低温热水。大气降水是温泉的主要补给来源，日出水量3000立方米。该温泉为无色、无臭、微涩、透明的低矿化度重碳酸型泉水。温泉除含有常规成分外，还富含氡、氟、锶、钡、铳等特殊成分，有很高的医疗保健价值，对心血管、内分泌、肠胃、关节、神经、皮肤等均有辅助治疗功效。湍口温泉有湍源、塘溪、沈溪、凉溪四条小溪，在盆地汇合，然后流入昌化溪。', N'浙江省杭州市临安区湍泉街188号', N'20201025_103209286_f99a8c0d-3a6a-4074-aad1-9005efb52c95.jpg,20201025_103213131_a7c72c5c-ed81-48b3-b776-c5834cefff41.jpg,20201025_103216029_606b60e4-a237-4cd7-b71e-8def65d2248d.jpg', N'', N'20201026_112447775_f3c2123a-32c4-4e42-8c66-e75c641c8fe5.mp3', N'0', N'11', N'1', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'119.165567', N'30.036335', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'43', N'2020-10-25 10:28:04.013', N'CC4A1997-B981-47A1-BCB7-93AA60021096', N'湍口温泉1', N'湍口温泉又称天目山温泉，古亦名“芦荻泉”，早在1300多年有之。地热区面积约0.2平方公里，地下储热温度40—50度，溢出表面的水温30——32.5度，属低温热水。大气降水是温泉的主要补给来源，日出水量3000立方米。该温泉为无色、无臭、微涩、透明的低矿化度重碳酸型泉水。温泉除含有常规成分外，还富含氡、氟、锶、钡、铳等特殊成分，有很高的医疗保健价值，对心血管、内分泌、肠胃、关节、神经、皮肤等均有辅助治疗功效。湍口温泉有湍源、塘溪、沈溪、凉溪四条小溪，在盆地汇合，然后流入昌化溪。', N'浙江省杭州市临安区湍泉街188号', N'', N'', N'', N'1', N'11', N'0', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'119.165567', N'30.036335', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'44', N'2020-10-25 10:28:04.020', N'FC6A9CA4-5A91-40DD-B9AD-4112E110B256', N'湍口温泉2', N'湍口温泉又称天目山温泉，古亦名“芦荻泉”，早在1300多年有之。地热区面积约0.2平方公里，地下储热温度40—50度，溢出表面的水温30——32.5度，属低温热水。大气降水是温泉的主要补给来源，日出水量3000立方米。该温泉为无色、无臭、微涩、透明的低矿化度重碳酸型泉水。温泉除含有常规成分外，还富含氡、氟、锶、钡、铳等特殊成分，有很高的医疗保健价值，对心血管、内分泌、肠胃、关节、神经、皮肤等均有辅助治疗功效。湍口温泉有湍源、塘溪、沈溪、凉溪四条小溪，在盆地汇合，然后流入昌化溪。', N'浙江省杭州市临安区湍泉街188号', N'', N'', N'', N'1', N'11', N'0', N'AFACF1F8-345F-4C06-8592-A296D841975D', N'景区设施', N'0', NULL, N'119.165567', N'30.036335', N'2', NULL)
GO

INSERT INTO [dbo].[ScenicSpot] ([ID], [CreateTime], [ScenicSpotUUID], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [TourismUuid], [Type], [IsRecommend], [ytype], [Lon], [Lat], [PlayType], [ShopId]) VALUES (N'45', N'2020-10-26 13:37:43.940', N'22AE511E-B994-43DA-891B-A8E074093EE1', N'浙西大峡谷', N'浙西大峡谷，位于浙江（浙）安徽（皖）接壤的杭州市临安区清凉峰国家级自然保护区区域内。地处浙江西北部而名"浙西"。峡谷境内山高水急，山为黄山延伸的余脉水为钱塘江水系的源流。环带状的狭谷全长83公里，沿途花木遍地，地貌奇特，奇峰秀石“生长”在落差悬殊的峡谷两旁悬崖，有“白马岩中出，黄牛壁上耕”之誉，与长江三峡相比，自有不同诗情画意的领略。', N'浙江杭州临安', N'20201026_133612727_52d65466-27c6-4bdf-ab86-9cb62fe35a66.jpg,20201026_133619270_04c0dfab-21cf-48ff-b118-5d9d1e11809f.jpg,20201026_133624527_0b7a023f-5234-470e-af78-049ba8c3a3f9.jpg', N'', N'20201026_133844658_80a5ff46-55f5-4f1a-b7db-72e9298263f3.mp3', N'0', N'12', N'1', N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'景区设施', N'0', NULL, N'119.107374', N'30.225258', N'2', NULL)
GO

SET IDENTITY_INSERT [dbo].[ScenicSpot] OFF
GO


-- ----------------------------
-- Table structure for searchl
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[searchl]') AND type IN ('U'))
	DROP TABLE [dbo].[searchl]
GO

CREATE TABLE [dbo].[searchl] (
  [guid] uniqueidentifier  NOT NULL,
  [text] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [url] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[searchl] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'关键词',
'SCHEMA', N'dbo',
'TABLE', N'searchl',
'COLUMN', N'text'
GO

EXEC sp_addextendedproperty
'MS_Description', N'跳转地址',
'SCHEMA', N'dbo',
'TABLE', N'searchl',
'COLUMN', N'url'
GO

EXEC sp_addextendedproperty
'MS_Description', N'全局搜索表',
'SCHEMA', N'dbo',
'TABLE', N'searchl'
GO


-- ----------------------------
-- Records of searchl
-- ----------------------------
INSERT INTO [dbo].[searchl]  VALUES (N'EE400E92-617D-41ED-8978-C1776F72D0EA', N'景点介绍', N'/pages/introduce/index')
GO


-- ----------------------------
-- Table structure for Sharing
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sharing]') AND type IN ('U'))
	DROP TABLE [dbo].[Sharing]
GO

CREATE TABLE [dbo].[Sharing] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [SharingUuid] uniqueidentifier  NOT NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Title] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [Cover] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [type] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sharing] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'共享单车点位',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简介',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所处位置',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'Sharing',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'共享单车站点',
'SCHEMA', N'dbo',
'TABLE', N'Sharing'
GO


-- ----------------------------
-- Records of Sharing
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sharing] ON
GO

INSERT INTO [dbo].[Sharing] ([ID], [CreateTime], [SharingUuid], [Name], [Title], [Introduction], [Address], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [type]) VALUES (N'1', N'2020-10-14 16:23:39.903', N'735C0C5A-BC2F-42C6-8AF4-1A7E46E9161B', N'河桥镇镇府旁租车点', N'', N'', N'河桥镇镇府旁', N'20201014_162302565_819a16bd-94c8-42d3-b807-fe45374c91ed.jpg,20201014_162307170_08be82d5-89c8-4e89-8ced-0a36adab4c27.jpg,20201014_162314184_b4bccbb0-2949-4ed5-adda-01f44933b16e.jpg', N'1', N'0', N'20201014_162222742_01358b54-ae13-4feb-8886-1a2a41fc778b.jpg', N'111.11', N'11.1', NULL)
GO

INSERT INTO [dbo].[Sharing] ([ID], [CreateTime], [SharingUuid], [Name], [Title], [Introduction], [Address], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [type]) VALUES (N'2', N'2020-10-14 16:51:55.207', N'1136B19E-6609-4D1E-8A9D-EF351EFFB034', N'河桥古镇旅游景点小蓝车租车点', N'', N'', N'河桥古镇旅游景点', N'20201014_165141692_eefbf7dc-3d2b-4241-838e-4e3042a6b13c.jpg,20201014_165146612_a695af6b-681b-47a9-a3a5-b69fc8428160.jpg,20201014_165153795_8d14687a-4453-4e0d-bd11-518ef7597796.jpg', N'1', N'0', N'20201014_165111354_dd216a72-680e-4bfc-998e-ac03c9e85435.jpg', N'111.111', N'11.11', NULL)
GO

SET IDENTITY_INSERT [dbo].[Sharing] OFF
GO


-- ----------------------------
-- Table structure for SpecialPick
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SpecialPick]') AND type IN ('U'))
	DROP TABLE [dbo].[SpecialPick]
GO

CREATE TABLE [dbo].[SpecialPick] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [SpecialPickUUID] uniqueidentifier  NOT NULL,
  [Name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Introduction] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [State] int  NULL,
  [IsDelete] int  NULL,
  [Cover] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Lat] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ytype] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PlayType] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[SpecialPick] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Introduction'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'价格',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Price'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Cover'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经度',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Lon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'纬度',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'Lat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'游玩类型 1.古镇游   2.周边游',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick',
'COLUMN', N'ytype'
GO

EXEC sp_addextendedproperty
'MS_Description', N'特色采摘',
'SCHEMA', N'dbo',
'TABLE', N'SpecialPick'
GO


-- ----------------------------
-- Records of SpecialPick
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SpecialPick] ON
GO

INSERT INTO [dbo].[SpecialPick] ([ID], [CreateTime], [SpecialPickUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [ytype], [PlayType]) VALUES (N'1', N'2020-09-24 00:00:00.000', N'93C6CC3F-F56F-4761-ADEF-8C3E6EE16344', N'聚秀蓝莓', N'13515811309', N'基地位于聚秀村，昌文线旁，交通方便，地势平坦，蓝莓品种优良，口感好，是一个纯绿色纯天然的采摘园，   5月中旬开始采摘，欢迎您的到来。', N'正常经营', N'0', N'20200924_182029796_1c341ef6-4475-4c03-984b-bde741c43d0b.jpg,20200924_182035609_5460e818-27a0-42fc-993a-2fb21dda3fc6.jpg,20200924_182041126_a2e678fc-7314-427e-ad64-20c919878fdb.jpg', N'1', N'0', N'20200924_182019257_ef8acc80-8e0a-4983-9ef9-d6fa0d8b9630.jpg', N'111.11', N'11.11', N'1', N'1')
GO

INSERT INTO [dbo].[SpecialPick] ([ID], [CreateTime], [SpecialPickUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [ytype], [PlayType]) VALUES (N'2', N'2020-09-24 00:00:00.000', N'4169EC43-4F88-4D31-ACC6-7748A5911EB2', N'中鑫村蓝莓基地', N'18868193897', N'中鑫村蓝莓基地位于河桥古镇与湍口温泉的黄金旅游线上，环抱昌南溪，目前占地40余亩，蓝莓挂果期从5月初至7月底，采用无公害模式，树下套种麦冬草、绿叶菜等草本植物，园区采用人工拔草，有助于种植土的保湿的同时，美化园区环境，提升采摘游体验感，也为周边民宿景区提供优质农产品和采摘游体验等旅游配套服务。', N'正常经营', N'0', N'20200924_182145739_2da6aae5-8b3e-4900-9328-e6ef6805fed9.jpg,20200924_182151291_bfdb31cb-812c-45d7-8cc2-2ef8f32be6d7.jpg,20200924_182157869_60cb94b1-5667-4a9e-8016-10b2ca2efd19.jpg', N'1', N'0', N'20200924_182111726_2d771f94-123a-45fb-91fb-c052890fda07.jpg', N'111.11', N'11.11', N'1', N'2')
GO

INSERT INTO [dbo].[SpecialPick] ([ID], [CreateTime], [SpecialPickUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [ytype], [PlayType]) VALUES (N'3', N'2020-09-24 00:00:00.000', N'E28292A7-9408-47B3-BC2C-6BF59DAC0C4B', N'杭州临安益坑家庭农场', N'13515811309', N'农场位于七都村赤石益坑坞，果园面积70余亩，种有樱桃(4月中旬采摘)，水果桑椹（5月上旬采摘），蓝莓（5月中旬），水蜜桃（7月上旬），梨（7月中旬），黄桃（8月中旬），软枣猕猴桃（9月上旬），八月炸（9月下旬），九月黄（10中旬），红心猕猴桃（10月上旬）。我们以“果品质量第一，奉顾客为上帝”为经营目标，欢迎您的光临。', N'正常经营', N'0', N'20200924_182313420_5faaacf9-5f35-4794-a3f1-c48a588f94e0.jpg,20200924_182319052_290dca1c-deca-4beb-a9d7-035330bc46f1.jpg,20200924_182324683_d85b149e-0e9a-4857-bc2e-d2f34f53a7fe.jpg', N'1', N'0', N'20200924_182240459_90c8fbbf-7b41-48d9-8b38-e2ef53cbd4d0.jpg', N'111.11', N'11.11', N'1', N'1')
GO

INSERT INTO [dbo].[SpecialPick] ([ID], [CreateTime], [SpecialPickUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [ytype], [PlayType]) VALUES (N'4', N'2020-09-24 00:00:00.000', N'A2FAD21E-B7A1-4281-8971-3AEAF8EB8F60', N'杭州临安博鼎农林开发有限公司', N'18857170527', N'基地位于云浪村，峡谷间高山流水，环境优美空气清新。主要种植红心猕猴桃，无公害基地，提供观光采摘、农事体验。', N'正常经营', N'0', N'20200924_182359862_4ed5b8e0-b912-4616-af4a-9e02c8bd85dc.jpg,20200924_182405079_d3bcbd93-63de-4284-900a-d097171d085d.jpg,20200924_182412870_cd514e18-444f-4378-97f7-6454a00d8d0b.jpg', N'1', N'0', N'20200924_182351914_d48ff588-db01-46fb-b6cb-43022ed1cdad.jpg', N'111.11', N'11.11', N'1', N'1')
GO

INSERT INTO [dbo].[SpecialPick] ([ID], [CreateTime], [SpecialPickUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [ytype], [PlayType]) VALUES (N'5', N'2020-09-24 00:00:00.000', N'FF2AA3EC-388B-4251-AA94-C6CFA08306A8', N'杭州临安五都源种植园', N'13516829577', N'五都源黄蜜桃位于临安区河桥镇石瑞蒲村老屋里，生长在海拔1200米的高山上，这是来自大山的淳朴味道！高山上空气清新，夏季凉爽，昼夜温差大，泥土芬芳，森林覆盖率达到了99%，到处都是甘甜的山泉水，采用了土家肥，全程人工除草，所以孕育出了优质的高山黄桃。果实饱满，又脆又甜水分充足。8月初开始采摘。', N'正常经营', N'0', N'20200924_182536797_6c29e097-bf39-463f-8f7d-8e66e36c266e.jpg,20200924_182545559_a009ffe9-b5d6-4f6a-adc8-0dfcf6381a9a.jpg,20200924_182551222_a915a92a-1b7b-49c3-a60b-94c8340c6ad6.jpg', N'1', N'0', N'20200924_182502887_294b3b15-15dd-4b92-b7aa-581b06829895.jpg', N'111.11', N'11.11', N'1', N'1')
GO

INSERT INTO [dbo].[SpecialPick] ([ID], [CreateTime], [SpecialPickUUID], [Name], [Phone], [Introduction], [Address], [Price], [Picture], [State], [IsDelete], [Cover], [Lon], [Lat], [ytype], [PlayType]) VALUES (N'6', N'2020-09-24 00:00:00.000', N'AD147FB5-62D8-4937-AEA6-679DA1751BD0', N'临安甜梅家庭农场', N'15967151852', N'农场位于中鑫村上卜，面积约80亩，种植品种有葡萄（7月中旬至10月），梨子（7月中旬至10月），桃子（5月下旬至10月）。提供自由采摘、礼盒包装一条龙服务。在这里您不仅可以呼吸新鲜的空气，还可以随手采摘新鲜的水果。', N'正常经营', N'0', N'20200924_182701493_b47dcfe7-f660-4e5d-8b4e-0da7810004aa.jpg,20200924_182706258_28c75cb6-33b7-4c43-a99f-6e4195e2edd9.jpg,20200924_182709427_28bdaf11-7335-491b-8902-98174a0e9dee.jpg', N'1', N'0', N'20200924_182627042_f991a850-dd6c-4dac-87b9-e4071977abbf.jpg', N'111.11', N'11.11', N'1', N'1')
GO

SET IDENTITY_INSERT [dbo].[SpecialPick] OFF
GO


-- ----------------------------
-- Table structure for Strategy
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Strategy]') AND type IN ('U'))
	DROP TABLE [dbo].[Strategy]
GO

CREATE TABLE [dbo].[Strategy] (
  [StrategyUuid] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Isdelete] int  NULL,
  [Staues] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [SystemUserUUID] uniqueidentifier  NULL,
  [Title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [StrategyContent] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [PhotoUrl] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AuditStaues] int  NULL,
  [ThroughStaues] int  NULL,
  [TipsType] int  NULL,
  [Count] int  NULL,
  [ytype] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PlayType] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Strategy] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户UUID',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'SystemUserUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'攻略标题',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'攻略内容',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'StrategyContent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片路径',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'PhotoUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核状态 0,未审核  1.已审核',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'AuditStaues'
GO

EXEC sp_addextendedproperty
'MS_Description', N'通过状态 0,通过  1.不通过 2.暂未审核',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'ThroughStaues'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1.攻略 2.自驾路线',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'TipsType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'浏览次数',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'Count'
GO

EXEC sp_addextendedproperty
'MS_Description', N'游玩类型 1.古镇游   2.周边游',
'SCHEMA', N'dbo',
'TABLE', N'Strategy',
'COLUMN', N'ytype'
GO

EXEC sp_addextendedproperty
'MS_Description', N'攻略发布表',
'SCHEMA', N'dbo',
'TABLE', N'Strategy'
GO


-- ----------------------------
-- Records of Strategy
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Strategy] ON
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'8C26D314-771C-4958-8821-2BA2320395A5', N'15', N'0', NULL, N'4F4F5288-6964-4197-801B-772C649847B2', N'xxxx', N'xxxxx', N'20201214_161527222_496e7aad-5c59-4e31-957d-e5ec9652433a.png', NULL, N'2020-12-14', N'0', N'2', NULL, N'1', NULL, N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'D0327025-9588-497F-B64B-47470EA966FD', N'16', N'0', NULL, N'4F4F5288-6964-4197-801B-772C649847B2', N'xxx2', N'xxx2', N'20201214_161800538_9085d048-7912-4bee-bfd7-0ae1decd8b40.png', NULL, N'2020-12-14', N'1', N'0', NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'429254A0-2861-424B-B48E-7E4F494070F1', N'12', N'0', NULL, N'5C38E21E-5BCE-4B6D-ACFD-48B3A9C2BA08', N'大苏打', N'dd撒大苏打撒旦', N'20201016_173715328_d7266457-a081-4b8f-a5bf-f6ebfa9adc60.jpg', NULL, N'2020-10-16', N'1', N'0', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'C8483CB5-FC15-45FF-B0F3-8B080737B58D', N'7', N'0', NULL, N'06026661-E6DF-4943-8449-4C116843B8CD', N'学校学校', N'啊大大 ', N'20200926_191823276_7dc5cfb3-df05-43a9-bcc8-588fab3a06ff.jpg', N'admin', N'2020-09-26 19:18:24', N'1', N'0', N'1', N'4', N'1', N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'47D9AF7D-21C6-4711-A864-A2FA8D26EC56', N'9', N'0', NULL, N'06026661-E6DF-4943-8449-4C116843B8CD', N'烦烦烦烦烦烦', N'发烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦法啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊反反复复烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦服务祈福祈福完全放弃撒擦撒v加强劫富济贫去哦就放弃无法', N'20200930_151701767_f9291d36-bc37-4892-a8a6-2926048f1fb3.jpg,20200930_151704115_caf2fd04-7fe9-4cbd-980a-797bf8331e3b.jpg,20200930_151708138_72c718d6-770d-4a04-bdea-977d81082cb1.jpg,20200930_151710903_6e74e5fb-ce17-41dc-88dc-3119495f4b35.jpg', NULL, N'2020-09-30', N'1', N'0', N'1', NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'12AD73E3-66DE-49BC-BF73-B5079C910365', N'14', N'0', NULL, N'28ED78CC-0A4C-467C-B9A0-A1FF2D3F8DA8', N'2', N'2', N'20201211_183152272_7907d2a9-713e-47b2-9c50-ba60a64aa02e.jpg', NULL, N'2020-12-11', N'0', N'2', NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'6F3B63E5-F27F-41EB-8C4F-BC4C7FE1B012', N'11', N'0', NULL, N'06026661-E6DF-4943-8449-4C116843B8CD', N'撒法啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊分放放2发啊发撒法发', N'阿萨飒飒', N'20200930_155801751_736b7db2-2166-47d1-9406-251db3f1f759.jpg', NULL, N'2020-09-30', N'1', N'0', N'1', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'2A22345E-9CCF-43E3-9101-C105C6DEC6E8', N'13', N'0', NULL, N'28ED78CC-0A4C-467C-B9A0-A1FF2D3F8DA8', N'1', N'1', N'20201211_161453695_49df860f-3b6e-4124-90be-b8789fd154b4.png', NULL, N'2020-12-11', N'1', N'0', NULL, N'5', NULL, N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'68058CB5-DD32-44EA-86DD-DF6939B131C8', N'17', N'0', NULL, N'4F4F5288-6964-4197-801B-772C649847B2', N'xxx3', N'xxx3', N'20201214_161821723_bddf6ccf-26e6-4487-8974-7369ffb649dc.jpg', NULL, N'2020-12-14', N'1', N'1', NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'2E2C2BEF-DF4B-4FDC-A373-E06B5C019B1C', N'8', N'0', NULL, N'A108EF0E-A393-4F53-A3CB-59B7CD545572', N'aasuidga', N'auasjkdghali', N'20200927_142746271_a092e517-dfd9-4727-91f8-534ff0119c0e.png', N'admin', N'2020-09-27 14:27:47', N'1', N'0', N'1', NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'FE24A14C-952E-439C-A975-E2F6339D8A08', N'10', N'0', NULL, N'06026661-E6DF-4943-8449-4C116843B8CD', N'啊发发', N'发发发发发发发发', N'20200930_152157851_bc4488b4-a6e8-4cb3-9e2e-1c43a656bfca.jpg', NULL, N'2020-09-30', N'1', N'0', N'1', NULL, N'1', N'1')
GO

INSERT INTO [dbo].[Strategy] ([StrategyUuid], [ID], [Isdelete], [Staues], [SystemUserUUID], [Title], [StrategyContent], [PhotoUrl], [AddPeople], [AddTime], [AuditStaues], [ThroughStaues], [TipsType], [Count], [ytype], [PlayType]) VALUES (N'B73CEF1D-30BC-4EB2-9421-FEFAA3A6BF51', N'3', N'0', NULL, N'423968DF-A15D-4B5F-9E25-005486496332', N'哒哒哒', N'发发发发', N'20200926_140104385_9a3830ce-ef65-4a73-b3ed-0fe86877072e.jpg,20200926_140106612_dd59720b-61e9-4dd0-80c4-f2ac0517d301.jpg', N'申鹏兴', N'2020-09-26 14:01:07', N'1', N'0', N'1', N'16', N'1', N'1')
GO

SET IDENTITY_INSERT [dbo].[Strategy] OFF
GO


-- ----------------------------
-- Table structure for SystemIcon
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemIcon]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemIcon]
GO

CREATE TABLE [dbo].[SystemIcon] (
  [SystemIconUUID] uniqueidentifier  NOT NULL,
  [Code] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Size] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Color] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Custom] nvarchar(60) COLLATE Chinese_PRC_CI_AS  NULL,
  [Description] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Status] int  NOT NULL,
  [IsDeleted] int  NOT NULL,
  [CreatedOn] datetime2(7)  NOT NULL,
  [CreatedByUserGuid] uniqueidentifier  NOT NULL,
  [CreatedByUserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifiedOn] datetime2(7)  NULL,
  [ModifiedByUserGuid] uniqueidentifier  NULL,
  [ModifiedByUserName] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE [dbo].[SystemIcon] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'图标',
'SCHEMA', N'dbo',
'TABLE', N'SystemIcon'
GO


-- ----------------------------
-- Records of SystemIcon
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemIcon] ON
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7A12CD96-8B14-4191-9F9A-3EB0222974F7', N'ios-add', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.0159312', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'4')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'89D23773-43A5-4110-AE27-FB9B18D7A717', N'md-paper-plane', N'1', N'#0285FF', NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1401204', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2018-11-20 14:58:37.9302860', NULL, N'', N'5')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F64ECAB4-8FF7-4FFF-875B-224C5DEE6FFF', N'ios-partly-sunny', N'1', N'#FA9B07', NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1401576', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2018-11-20 14:58:21.0896581', NULL, N'', N'6')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E1FD3733-59BC-427C-BB7A-A7DBDC461BD2', N'ios-partly-sunny-outline', N'1', N'#D4090E', NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1401904', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2018-11-28 09:33:15.8399050', NULL, N'', N'7')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'02950D2B-A00B-4371-8A1C-0ED7107519E6', N'md-partly-sunny', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1402228', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'8')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'50A1BC80-D0F8-4DF5-A267-5BC052ED4787', N'ios-pause', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1402556', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'9')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F04ADE7B-43DB-4B08-9942-37E0EEF9EEC2', N'ios-pause-outline', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1402921', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'10')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D3CCCCF3-5952-4E71-AAD3-7B025E152110', N'md-pause', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1403259', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'11')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D72E4C8E-2586-4050-902E-FA0212520BDC', N'ios-paw', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1403583', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'12')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4E61CE4F-1382-4D3B-8643-B92EA3C87ACD', N'ios-paw-outline', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1403911', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'13')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'87B31B98-8EFD-4F3E-ACD0-95225CBDD5A0', N'md-paw', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1404235', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'14')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F0C736F2-EBDB-49D4-8787-6192B3284574', N'ios-paper-plane-outline', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1400880', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'15')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B27FD74C-D267-4B7F-AC80-C5A6EAD90A5A', N'ios-people', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1404611', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'16')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EEE9FA60-0465-4A93-8DC0-9121B8B9E0D5', N'md-people', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1405263', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'17')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DE671611-9549-4BC2-A662-C42112B35BB7', N'ios-person', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1405587', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'18')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'26177477-7B81-48FA-830E-B5D8F658B0B7', N'ios-person-outline', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1406082', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'19')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4022F553-80E9-4699-8824-24C31A820F98', N'md-person', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1406430', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'20')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F9111E33-AC66-4EA6-A108-FFAA641D750E', N'ios-person-add', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1406761', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'21')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AB079C97-4367-4678-AE2B-30659E7A7758', N'ios-person-add-outline', N'1', NULL, NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1407089', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'22')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C033297C-E537-43FE-8707-B6AE4A87BB13', N'md-person-add', N'1', N'#00E5FF', NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1407454', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-11-07 09:57:55.1869130', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'系统管理员', N'23')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'23487C62-635E-48F6-8567-C369CAC375A5', N'ios-phone-landscape', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1407792', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'24')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5855794C-8039-4A2D-99A4-6175C6513B54', N'md-phone-landscape', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1408120', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'25')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B6DED301-AC3F-4467-881F-073E45C08558', N'ios-phone-portrait', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1408447', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'26')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9D8DCAA7-F978-4A7E-BAA5-152C49667078', N'ios-people-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1404938', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'27')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5F8ACCAB-C03A-47C2-8C42-7DB37F0C93B1', N'ios-paper-plane', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1400552', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'28')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DCF6A091-1920-4D63-8BAA-DE154F38E968', N'md-paper', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1400221', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'29')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A5758762-C693-417B-B990-1E728A1D8C0A', N'ios-paper-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1399805', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'30')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8322384D-8311-4124-91BC-1583DCDDE772', N'ios-notifications-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1391466', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'31')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8338CA68-6570-4BBE-B6CD-EB149FCAA483', N'md-notifications', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1391794', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'32')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'77B2A3C0-823F-4F5A-9AE1-78BFF59DD92F', N'ios-notifications-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1392163', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'33')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BB05D780-67AA-4E21-B133-3AF5D4D504A8', N'ios-notifications-off-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1392497', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'34')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'26BA8BB4-5AAC-4A41-88B0-A2BFD0790469', N'md-notifications-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1392821', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'35')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'91BD64CD-B4F4-40FC-AF06-3FAD3066A486', N'md-notifications-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1393146', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'36')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4D60C481-0DDE-41AB-926C-0DEC6F4ED04C', N'ios-nuclear', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1393511', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'37')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A14A483E-0EDD-4589-A7FF-436B409D943D', N'ios-nuclear-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1393845', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'38')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2D957CB3-1533-46CC-BED3-64824EBF473B', N'md-nuclear', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1394170', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'39')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ABD092FC-5F45-4F65-9D59-E7BE8C558C96', N'ios-nutrition', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1394494', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'40')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A78C80CA-42B2-4D74-882C-DFDB15C6D07A', N'ios-nutrition-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1394856', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'41')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7ABFF376-3D2B-4956-9899-A06E9BBF47BF', N'md-nutrition', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1395190', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'42')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7D8D3550-5A5C-43FA-BCAF-714E14BC492A', N'logo-octocat', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1395514', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'43')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'38DE5263-5049-49B6-ABD1-3688A431112D', N'ios-open', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1395842', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'44')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0CE14F1C-F0C0-48FB-B243-EE2FD5BC4EE4', N'ios-open-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1396166', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'45')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AE6470AA-C4DF-4221-B5D5-AE6E58A18957', N'md-open', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1396542', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'46')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E3B0B8A2-FAFF-4E63-A8EE-F687EE9015F8', N'ios-options', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1396869', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'47')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'95561655-9E12-416E-9CA9-00859AB2C016', N'ios-options-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1397194', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'48')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'342B2EB1-D519-4F44-BA9F-465ACC044417', N'md-options', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1397726', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'49')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CAC3FC27-4D3D-4EEE-875D-BBDED830D46E', N'ios-outlet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1398201', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'50')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9A8EBC99-B938-4C0F-A919-BE445F2B1B81', N'ios-outlet-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1398549', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'51')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4C29A5AE-556E-4012-8D40-B657BEBFF89D', N'md-outlet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1398883', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'52')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B292FA3D-13B8-4F3F-BFE4-6F5A8AADDE52', N'ios-paper', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1399422', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'53')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A51AD4D1-EBFC-4CCB-BC69-CF8A0A61B200', N'md-phone-portrait', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1416459', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'54')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6303B4DE-372C-4FAE-A490-B0CED532DCA2', N'ios-photos', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1417490', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'55')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C22B9DE3-BEF9-4739-917F-74BFC32E9EF1', N'ios-photos-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1417838', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'56')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3E2E9754-54AB-447F-9615-A40611D39334', N'md-photos', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1418169', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'57')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3EBBEF48-E72A-4123-9F1C-3E0F47B72FAE', N'ios-power-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1441205', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'58')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B5DB011F-3FE1-4462-9D42-ACDB5A88F92E', N'md-power', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1442946', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'59')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'518AB41E-CCC7-4E7F-9DC6-455FDF125411', N'ios-pricetag', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1443301', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'60')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F17DF227-7669-4C76-86E0-23917B57BF71', N'ios-pricetag-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1443635', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'61')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'618E7138-6842-4E78-A338-E54A6A5FBD35', N'md-pricetag', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1443970', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'62')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'46EF30FD-B6C1-4E2E-B1D2-9A256BCF0765', N'ios-pricetags', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1444431', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'63')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ECD73E26-4302-41B7-B699-A0EFDEB575F0', N'ios-pricetags-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1444762', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'64')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'07337BAB-A701-4C15-A712-EEC7E21FEED2', N'md-pricetags', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1445093', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'65')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'628CB0A0-32DB-4291-BB94-E50A78ABD4D0', N'ios-print', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1445530', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'66')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B14D4E5C-B2B8-434A-BDB8-EB1040ADF3D7', N'ios-print-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1445929', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'67')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A29D4A10-6683-4A91-9724-2E5781E4D4AE', N'md-print', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1446264', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'68')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'91D8E5D3-40B4-43E5-A17D-CBEFD9D66FC1', N'ios-pulse', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1446598', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'69')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'86BBC1A2-67C5-422B-9FCE-C59E96A25FB8', N'ios-pulse-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1446929', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'70')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F5CAA14A-C576-49C0-AC39-2DD19765E6FF', N'md-pulse', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1448028', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'71')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'13D44F4C-5097-498E-84F4-ADC1BCBB2990', N'logo-python', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1448544', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'72')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B1E068DB-9AE5-4F76-8EE8-92CEBF5BA9AD', N'ios-qr-scanner', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1448888', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'73')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A6A7654A-8DC4-452B-9281-155E6884668F', N'md-qr-scanner', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1449261', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'74')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9704DE75-8A6E-49D8-A1B3-6FD3A39CDC1C', N'ios-quote', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1449595', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'75')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4E9069FF-43AE-4ACA-B24D-4A1B70D2C4B8', N'ios-quote-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1450080', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'76')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3EE8B42E-4309-4391-9840-90B5FB77391A', N'md-quote', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1450421', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'77')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F71ECAB6-0AD8-4DB6-A87D-286036E3635F', N'ios-radio', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1450752', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'78')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5AB3C2F7-F19A-41D7-BCD9-83A25A54020A', N'ios-radio-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1451080', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'79')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D8B32278-2BD8-418A-B76F-1D327DB05026', N'md-radio', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1451449', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'80')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7BE59486-9CE5-437E-B5AD-66BFC51714A1', N'ios-power', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1440567', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'81')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'122F4C12-45CB-4B4E-9DD0-DDA66DD38A53', N'ios-notifications', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1391142', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'82')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6998FEFE-6282-4D15-BBD5-88DDFDBA54A8', N'md-podium', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1429832', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'83')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B1526EB0-5972-41B0-84EC-108BC02D9A28', N'ios-podium', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1427387', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'84')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8A657269-06C8-42F4-BF13-8B67C7819437', N'ios-pie', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1418496', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'85')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'88D6141C-E074-410A-B3CE-FB4743E4A2EB', N'ios-pie-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1418998', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'86')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B1749C20-BE87-4008-A130-568B5AC84476', N'md-pie', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1419400', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'87')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'25914AF9-45A7-4F5C-8B5B-A345611D42AF', N'ios-pin', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1419742', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'88')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'681F1D11-F4AD-4C56-B8C5-D889B01EFEDD', N'ios-pin-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1420073', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'89')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CA63533A-559F-4F4D-BE1F-FB042B80CFB9', N'md-pin', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1420441', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'90')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4DF71671-669E-4C7D-A293-6F53FBBBDF6B', N'ios-pint', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1420786', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'91')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C9C75983-3328-4D8D-BE2D-2E3C4C38A8DE', N'ios-pint-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1421117', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'92')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'85F7087C-00B6-45AE-9E4C-0ACE708417CB', N'md-pint', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1421776', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'93')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9D848E8D-968C-46CB-82B2-685C7F397FEE', N'logo-pinterest', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1422172', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'94')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'51C26F68-BB08-4214-BE39-D49818119A8C', N'ios-pizza', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1422575', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'95')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ED123849-0A85-46B7-AD7B-2BC77B921B99', N'ios-pizza-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1422906', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'96')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B58261AA-AB72-45BD-9FDE-9A653ADBC37D', N'md-pizza', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1423237', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'97')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'451401FB-6211-4E4E-A537-CD5981CAB8D7', N'ios-plane', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1423565', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'98')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9B2387DD-5A1A-463B-A814-577F1D9AC876', N'ios-plane-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1423933', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'99')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'65114679-754E-4694-A672-47CE0C1DFB77', N'md-plane', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1424281', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'100')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9D096853-0E65-4901-8A5D-7498DC916AFF', N'ios-planet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1424616', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'101')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C7DBC8AD-8625-4CAF-BFCE-03CBE688F734', N'ios-planet-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1424944', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'102')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'992CDB26-4125-4583-AB48-354FD9A40A40', N'md-planet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1425278', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'103')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1B29ED6F-B74C-47C8-88C8-A2B13586C60E', N'ios-play', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1425742', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'104')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8F2EDD46-1010-4FA3-89B5-4345FF52CB4C', N'ios-play-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1426084', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'105')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ACF44866-23D2-45A5-96AE-97955189494C', N'md-play', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1426415', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'106')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A7B60FF1-779D-4E45-8564-CB37C01F6A77', N'logo-playstation', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1426742', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'107')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AF15EC81-264D-45A5-99E8-19D7FCA4080B', N'ios-podium-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1429057', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'108')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4AB1B36E-55C0-4EB5-9B3D-B07DF7CA3E3D', N'logo-nodejs', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1390811', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'109')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AC43542B-4587-411E-8F22-0DCE093D7026', N'md-no-smoking', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1390456', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'110')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6CE861C4-ECC9-458D-AC98-FA3F8AD483CA', N'ios-no-smoking-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1390039', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'111')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'36D3F3D4-DC50-453E-9D67-A754FD4F9165', N'md-link', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1362323', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'112')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4E2E5382-0993-4E1C-8260-DD01B31E03E5', N'logo-linkedin', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1362688', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'113')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F35865D4-7263-420C-9538-B14866FACE21', N'ios-list', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1363023', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'114')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C081C944-BA21-4E0E-AE90-46CFBD12BAA8', N'md-list', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1363347', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'115')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'71E042FE-8C99-4F2E-B1F2-80B9FDF5C67A', N'ios-list-box', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1363671', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'116')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'30AACCC5-38A8-43B3-8323-0459711A8B18', N'ios-list-box-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1363996', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'117')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9BCCE9DE-06A1-421F-96A9-9317E324699E', N'md-list-box', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1364351', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'118')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'53570BEB-DFC3-4929-AA37-486C44F947DE', N'ios-locate', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1364678', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'119')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B0F9D30F-4AFB-4856-A415-FA6DF5A0BC73', N'ios-locate-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1365081', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'120')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EC8EDEBB-3AFA-47BD-AD92-C037DFD33A92', N'md-locate', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1365429', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'121')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F565B4CC-5286-4BA8-A96A-0784CDA0324B', N'ios-lock', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1365753', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'122')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C852E0DA-7B0C-42AD-83F2-E4B80C6D847C', N'ios-lock-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1366078', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'123')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9B4EFE05-A7C8-4F54-8ACD-FE4A2543C7A4', N'md-lock', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1366402', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'124')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7476B046-90B1-468C-B462-9FB830D4120E', N'ios-log-in', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1366825', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'125')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'17720AFD-9D08-4A20-9C78-06EF49BC1C2C', N'md-log-in', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1367156', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'126')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EE95ABCF-DAA2-49DC-963B-F2E8CEC3FF71', N'ios-log-out', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1367481', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'127')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'621E3658-7F6C-4E70-BED7-2E96E0A0BF05', N'md-log-out', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1367805', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'128')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2CD3C5C5-F1F4-4CF1-B5A2-A7856058DB1A', N'ios-magnet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1368167', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'129')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4D701715-993E-4726-9974-70CBAA02BD3A', N'ios-magnet-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1368501', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'130')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'690B8698-0329-46AB-82C0-CE16692FA1C0', N'md-magnet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1368825', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'131')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F4A427E4-15FB-4B52-92F3-61D2D473A9AD', N'ios-mail', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1369229', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'132')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3849082C-C431-434D-86B4-9ECB86C47E0E', N'ios-mail-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1370625', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'133')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9CDDD4DF-6B82-45CE-9523-B656A4C6EDDC', N'md-mail', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1371000', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'134')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CA87B1F5-0287-4CBC-B640-CE617633E4A3', N'ios-link-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1361999', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'135')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C901D050-0FF9-46CE-8B4B-0A3B4F4C9479', N'ios-mail-open', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1371331', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'136')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0C2B494A-8806-407D-95FA-6EBCB6D2CEEE', N'ios-link', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1361675', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'137')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'18D52CDE-8D7F-4955-9218-A45D43AE7AAD', N'ios-leaf-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1360982', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'138')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1D9929B5-CBF6-470B-84F2-5E64FAD86701', N'ios-information-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1353121', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'139')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'33EBD39B-4AF0-48DB-95B4-454582A7F209', N'ios-information-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1353480', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'140')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3D450E7E-804D-474B-AFC0-AD247F30EECE', N'md-information-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1353862', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'141')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9571E8BA-2165-4D8B-8815-D9CE5C9C3115', N'logo-instagram', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1354197', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'142')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2FB58DDA-A98F-4675-B0F0-297D6F00E892', N'ios-ionic', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1354524', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'143')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F8ED2B91-1114-4D29-B497-97A6E02AFB1C', N'ios-ionic-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1354852', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'144')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F35079D7-B650-4052-A90E-EF073FDDB0CE', N'md-ionic', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1355214', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'145')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A73E209A-B5A5-4CC5-8F63-FE469B8441B5', N'ios-ionitron', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1355548', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'146')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'880731BE-AF36-4B12-A443-7EEB2C02162C', N'ios-ionitron-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1355876', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'147')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9B2D34BA-35CD-4002-ADFE-3F29A910AC0B', N'md-ionitron', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1356210', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'148')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D09BDA2D-4A63-41C3-9C01-173BBFD653B6', N'logo-javascript', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1356542', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'149')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'949F4823-E0A3-4B9F-A510-CBCD40F7E120', N'ios-jet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1356914', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'150')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C45D9B0F-4DA0-4A84-92C1-759E2BFFE554', N'ios-jet-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1357241', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'151')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A8732411-C8CC-418F-945F-A7D1EF20DC2E', N'md-jet', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1357566', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'152')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'431B610A-62F9-4BFD-A69B-2093F74D64DA', N'ios-key', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1357890', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'153')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5E441735-6B68-4BC9-A4DF-E9CF6B845AE9', N'ios-key-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1358258', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'154')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'83830EAA-ADCF-4398-9FEB-4B11B004E086', N'md-key', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1358590', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'155')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'14B68505-CF43-46CB-A75F-8A7804A33D6C', N'ios-keypad', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1358914', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'156')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EACB9D4A-3358-427D-B49C-9ADD0CED7C21', N'ios-keypad-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1359289', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'157')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4B270D50-B24F-4CFE-82E9-6F27395769AB', N'md-keypad', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1359661', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'158')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EDF9C871-C95A-42DC-B94E-4E27EF85EC2D', N'ios-laptop', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1360002', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'159')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'061D42AC-9FAE-45BB-8C94-290B25339086', N'md-laptop', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1360326', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'160')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D8034A7A-9FA0-48D0-B1C8-B7237D56F479', N'ios-leaf', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1360657', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'161')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F6A784A9-A2E3-4640-9287-581B88961BB7', N'md-leaf', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1361347', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'162')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FE309E84-8BF6-48F9-B6B2-1EB72E1A29C9', N'ios-radio-button-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1451787', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'163')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'41AD16FD-5307-4B32-A238-00CF14D160D9', N'ios-mail-open-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1371659', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'164')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'61874335-3C66-47FF-8E2C-D9B66136D48B', N'ios-male', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1372362', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'165')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'152A17A1-F01B-4770-85FF-3A68925C3F84', N'ios-mic-off-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1381895', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'166')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'69D5A70A-E4A8-42B3-B10B-1C58DD5837AB', N'md-mic-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1382220', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'167')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B3D56776-5F49-4915-8764-456EF85563BE', N'ios-microphone', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1382585', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'168')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7D3DAAE8-47CE-4ADF-B0F1-3B8D37AF3A8E', N'ios-microphone-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1382923', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'169')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9191232F-5024-4223-A8D4-CDC39117B8AF', N'md-microphone', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1383251', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'170')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'508C98B3-99F0-48ED-BF5D-F2039C4FA15D', N'ios-moon', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1383585', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'171')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7159CEF0-4670-41DC-B5A2-DF9D318CFA5B', N'ios-moon-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1383916', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'172')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A3581892-0EEE-4FA7-98BD-F56C129D50C9', N'md-moon', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1384292', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'173')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'006DF199-65DA-409B-867B-0AD2B2115242', N'ios-more', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1384619', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'174')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'19AFABDC-9BF7-4A53-B342-EE70AB370422', N'ios-more-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1384947', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'175')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'57815F14-8996-4E4D-A8B3-8832A6BB164F', N'md-more', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1385278', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'176')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CBDF610B-34DC-4A02-AE4E-9BD04E0F700F', N'ios-move', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1385643', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'177')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'51443053-686C-4D3E-90B6-4A1A7F838411', N'md-move', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1385978', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'178')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0BDE7CD8-A1FC-4A1F-911B-767DF979C176', N'ios-musical-note', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1386305', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'179')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BCE17E9D-B61E-4E92-B29A-A5CFAE33D73C', N'ios-musical-note-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1386633', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'180')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'21C86E92-233A-4CAA-944B-DCCEE29D4FC8', N'md-musical-note', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1386957', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'181')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D17A50CE-7478-4B3C-830F-C8F2CACDD044', N'ios-musical-notes', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1387405', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'182')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DFC9D2D7-8D32-4CF5-98D8-BC955262A735', N'ios-musical-notes-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1387736', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'183')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F81EEB39-190B-46F7-8370-A9F47537A323', N'md-musical-notes', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1388074', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'184')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C32F0A37-081C-4980-A2EE-BA94D714588F', N'ios-navigate', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1388401', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'185')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'747F5BDC-95CB-4863-BD9B-A6004AD1014C', N'ios-navigate-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1388777', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'186')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C8CFD994-EA77-412E-8BE3-AC29FF658737', N'md-navigate', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1389302', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'187')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CA8BF719-DCFB-4626-8130-CC766798654F', N'ios-no-smoking', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1389708', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'188')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'06B115A9-753B-43FE-B722-97BB4EA1F7AA', N'ios-mic-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1381568', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'189')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A2F9632A-9691-4D1A-9A8D-D98E444D43CD', N'md-mail-open', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1371987', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'190')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F8D1F7FF-3241-405B-B656-EE1BDC9BF6F0', N'md-mic', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1381237', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'191')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CC869C15-3F1C-4539-B3C8-762A82F5F86D', N'ios-mic', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1380547', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'192')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'944D769A-B7B3-4F48-B581-C4EA300A8112', N'md-male', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1372693', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'193')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3CF11ADB-9198-4AE2-9FD8-F21DC558FCCA', N'ios-man', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1373021', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'194')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DBDC579A-5CF7-4646-9CFB-2D2A0B431953', N'ios-man-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1373345', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'195')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7E5365B5-8162-46C0-BDA1-DF5532814275', N'md-man', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1373710', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'196')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1480F00B-E97A-4CC8-88F3-C98F5EFBA390', N'ios-map', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1374045', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'197')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'192C7560-E27B-45D5-8128-65986A5BB4D3', N'ios-map-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1374373', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'198')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CF24D116-354C-44D5-9B86-5BF6E6FC753C', N'md-map', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1374697', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'199')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0ECF778D-D1BC-4664-92A2-9BF82BDAFF9D', N'logo-markdown', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1375021', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'200')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E97C92B0-6C3A-486B-9664-6690F9EB0863', N'ios-medal', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1375393', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'201')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'16314C6A-5CA6-43BC-9957-4071580C9788', N'ios-medal-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1375721', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'202')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'846D15FE-ED27-4A3D-9A45-035F9E946B04', N'md-medal', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1376052', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'203')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'667CFE7B-FCBC-4E69-97DB-DBF947D1E031', N'ios-medical', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1376380', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'204')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8B52A7D2-2AAB-493F-A61E-3802E70E1D76', N'ios-medical-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1376758', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'205')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'046ED2A5-B914-4113-AD0B-8FC3A29D2FDC', N'md-medical', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1377086', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'206')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ED01B6DE-E14C-4403-A421-188DD608DF58', N'ios-medkit', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1377414', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'207')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9D1C7813-AF73-4577-AD04-415FEC11C6F4', N'ios-medkit-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1377741', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'208')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3567A4F0-ED03-49D1-ACB0-6993D4567ED6', N'md-medkit', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1378154', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'209')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3B19E7D9-8C32-4886-81B7-15A149155833', N'ios-megaphone', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1378506', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'210')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F4B4A075-C6DD-4988-8585-DE6774983745', N'ios-megaphone-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1378837', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'211')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'41AC9965-B981-4ADF-B20B-2A6F118AC2A5', N'md-megaphone', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1379182', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'212')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6CDFFA74-A657-4587-9999-884CEF2EAE45', N'ios-menu', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1379510', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'213')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BB3D506B-6BA5-45BF-9D7B-54980AE4AFA0', N'ios-menu-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1379888', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'214')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'62A94543-275D-4DCF-AB16-42FA571052F3', N'md-menu', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1380220', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'215')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F488E23C-E520-40EA-B728-8C9B71DAE3D4', N'ios-mic-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1380871', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'216')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7AB87D00-F7CE-4B7E-859B-87A5FBD8DAFB', N'md-information', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1352398', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'217')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1D312644-694E-4B60-B6C8-B98733251520', N'md-radio-button-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1452114', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'218')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1A8487E8-0BF7-4D72-BD1B-652707C83A03', N'md-radio-button-on', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1452766', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'219')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'78055A4F-6253-4454-B70A-47A7D02C4A4F', N'md-thumbs-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1505378', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'220')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DBDC5A0B-4E8C-4595-BFAC-93DDBD7E0B4F', N'ios-thunderstorm', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1505713', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'221')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'78209727-8583-457D-82BF-06B821286F9D', N'ios-thunderstorm-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1506041', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'222')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E9C9930E-2F1D-4B6D-B2ED-D8D3BA7645A7', N'md-thunderstorm', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1506368', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'223')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2697DA0E-1247-408F-9201-B71CF731B21B', N'ios-time', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1506693', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'224')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2740BF29-4C6D-495A-8CE7-07959553535E', N'ios-time-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1507065', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'225')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'154AB3DD-0F14-41C9-B4F1-98A62CB863F1', N'md-time', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1507392', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'226')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'831AB0F8-1F34-42BC-8F52-AB4B6C3C56B0', N'ios-timer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1507720', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'227')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7D75B1D3-8F6E-40B7-AB90-4B4F561F00FB', N'ios-timer-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1508044', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'228')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'922206A7-6F60-494F-9299-98E97C52E246', N'md-timer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1508413', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'229')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B8EB4D18-E69F-4264-AFC2-910F501FB14A', N'ios-thumbs-up-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1505006', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'230')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'19D57340-1E6A-450B-A966-2E18C1553DA3', N'ios-train', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1508741', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'231')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'431E4C88-08B9-4D2C-A6D3-039C4E4E9F45', N'md-train', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1509413', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'232')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D4538873-A562-4197-8438-457F07CAD663', N'ios-transgender', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1509813', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'233')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'44382553-CF26-4942-B8F0-0E345CC2FB1E', N'md-transgender', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1510164', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'234')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B1ABEE81-2927-4012-8A7D-35A9061ED79D', N'ios-trash', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1510495', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'235')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EFAC2AE3-A8F2-409A-904E-F83CB240F6C9', N'ios-trash-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1510820', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'236')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'27B97721-4B65-46E6-9EFD-716FFB6DBC0C', N'md-trash', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1511144', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'237')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9AFB4322-F0A9-47E0-9933-45EDCAE5629F', N'ios-trending-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1511516', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'238')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2D7059ED-5967-496D-A51F-FABA4C25F95B', N'md-trending-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1511847', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'239')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A9C8DDB9-DC89-4D84-B5C1-270474DC77DA', N'ios-trending-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1512175', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'240')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A9BA9339-1719-4224-827E-748396857B59', N'md-trending-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1512506', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'241')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BC3F7767-DFE4-44E8-858B-F204D42E3584', N'ios-train-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1509082', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'242')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C57041ED-BC77-4B10-A1C3-18D39E824030', N'ios-thumbs-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1504682', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'243')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A1891F4B-5579-4B94-B2CB-1324C22ACEB6', N'md-thumbs-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1504358', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'244')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BC75D30B-E64E-4FE4-85AE-2BDAA9245E7B', N'ios-thumbs-down-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1504027', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'245')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'74EC531C-57D4-4BFC-B560-5079E36AC7EE', N'ios-sunny-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1495945', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'246')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5EC91B3D-4181-454E-B51C-77FC9FCD67A0', N'md-sunny', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1496505', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'247')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'71A72AC2-4009-4420-BB94-FADAED2E5655', N'ios-swap', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1496842', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'248')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'05146AB3-8809-42EC-8A74-5BE71A51B655', N'md-swap', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1497170', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'249')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8E6C165B-822B-4C84-964E-BAF8C2C9673C', N'ios-switch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1497498', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'250')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DC0ACDF5-DFA2-41BB-A8FC-53149C3B1815', N'ios-switch-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1497904', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'251')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'74B89D91-84B7-46A8-8EC4-09A76F1E45C1', N'md-switch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1498259', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'252')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B600A7C3-2361-47EF-B028-B386361BC839', N'ios-sync', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1498593', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'253')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'20D6B4C6-C3E0-4A66-8AC5-15143EACE4DA', N'md-sync', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1498925', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'254')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2CF34285-0589-441B-A972-2E2591F95B06', N'ios-tablet-landscape', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1499275', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'255')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9F25C76D-A848-4165-BB0D-D1DCCD8A8CD5', N'md-tablet-landscape', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1499651', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'256')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'306D4D3F-428D-4A79-A8E0-A36FB9643825', N'ios-tablet-portrait', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1499982', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'257')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'51EDAD38-950A-4B90-A1F0-4B5DD12AA0C1', N'md-tablet-portrait', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1500310', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'258')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1C740E4E-46AF-45AB-BE40-B18022964487', N'ios-tennisball', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1500637', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'259')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'09FFCE91-E6FC-4B90-99BC-FCA50162EF0C', N'ios-tennisball-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1500999', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'260')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DA7D9EE6-1BA9-42B4-B5DA-075B2F7D5244', N'md-tennisball', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1501334', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'261')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'22789CDB-05C3-4B05-91A7-B98CF41D1406', N'ios-text', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1501661', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'262')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BB5292D0-299F-478C-8D89-4570F164D2C5', N'ios-text-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1501986', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'263')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7A8DBB38-C2A2-4DED-91AE-51378CEDCA0D', N'md-text', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1502344', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'264')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'00546748-6157-4343-89FF-9059295B9823', N'ios-thermometer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1502682', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'265')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D858F567-A2A1-4693-ADAC-732F54C8EE1A', N'ios-thermometer-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1503006', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'266')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CC4B838B-0689-4225-979E-F5FD3C9A5332', N'md-thermometer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1503334', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'267')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D9E4703C-6F08-4746-98FC-097C59DE35D7', N'ios-thumbs-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1503658', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'268')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E55CD6EE-F1E4-4313-AECD-10E23749133B', N'ios-trophy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1512871', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'269')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2C6563B0-17C0-48D9-8ECD-C23ECC258D9E', N'ios-trophy-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1513209', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'270')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'663D432F-A6D8-4A23-9A85-459CB2A03A4C', N'md-trophy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1513537', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'271')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3CB3CEDF-0E54-4A40-9E12-DCD319CFF1A6', N'logo-tumblr', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1513861', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'272')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8F94C295-7F07-4EA6-A2E4-EDEF70727213', N'ios-warning', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1523626', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'273')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4B6AB215-BC5D-48F3-B10E-95FBB8426874', N'ios-warning-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1523954', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'274')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'13C80ECF-2C95-4197-A751-7D49DCE0A225', N'md-warning', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1524282', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'275')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6B4D6DB3-5AC4-4BB0-8B6B-3BDACAB5A1A8', N'ios-watch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1524609', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'276')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CEBD7FD6-9DAC-4068-824A-CC08EDB8C5F1', N'md-watch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1524988', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'277')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A564CAF2-E18C-407C-963F-CA5E8084627F', N'ios-water', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1525326', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'278')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F5722D2E-21CC-4A70-8B92-6ADF479C73E2', N'ios-water-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1525654', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'279')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2FAED7AB-1D52-4DCD-9FFD-37F064807CD3', N'md-water', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1525985', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'280')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'16194A72-15FC-4171-A7A1-C8555CF06BD5', N'logo-whatsapp', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1526343', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'281')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3F78D242-9152-4E2E-B465-5755C9A86CBD', N'ios-wifi', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1526681', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'282')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F275DAF1-A4A2-4862-B0BB-BE3AD02C39D3', N'ios-wifi-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1527009', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'283')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'37E56077-39A7-4D20-8A12-3AD7DB6ABA70', N'md-wifi', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1527333', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'284')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'59F1F5FA-13B0-48E8-BA9E-007B5709E686', N'logo-windows', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1527657', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'285')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'97F49B5D-B014-4751-AF7E-5C63A70385EA', N'ios-wine', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1528033', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'286')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D6EC7B1B-96D1-46EA-951B-2C70A58024B6', N'ios-wine-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1528360', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'287')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DAC6821C-6D51-4003-AFE9-91D93CA8254D', N'md-wine', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1528685', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'288')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'268490A1-1216-4C69-BE25-69FD73842038', N'ios-woman', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1529102', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'289')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E5E14924-8BF9-49E7-A97E-37578DC7546F', N'ios-woman-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1529511', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'290')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A13DB01E-ECCE-4161-B0F1-EB7EAFE882B9', N'md-woman', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1529849', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'291')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8F31952E-CE11-4BBA-BB04-E3F380BEB46C', N'logo-wordpress', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1530180', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'292')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'32AFA322-C53B-425F-B1F5-6DCD520AB704', N'logo-xbox', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1530504', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'293')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3B59428F-8BEB-4C27-874D-97D3BD0690A2', N'logo-yahoo', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1530829', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'294')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'80ADE1E9-F2C9-4B2E-B261-8D2BB3066E84', N'logo-yen', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1531201', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'295')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DE863DB8-C3D7-4B39-827D-8A61BB511530', N'md-walk', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1523251', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'296')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BD01930B-5B90-4C8E-B4F6-5AA6E1564571', N'ios-sunny', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1495617', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'297')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FEDDE63B-644F-4B93-95CA-C5CC2D6A1D0E', N'ios-walk', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1522923', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'298')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A47A5975-9AFE-47E1-8D59-71DC12FD06FA', N'ios-volume-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1522264', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'299')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D13A6720-83A6-460A-820F-7FB6FB11D4AB', N'logo-tux', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1514230', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'300')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'51121910-A7FB-4E21-921F-C2A492117509', N'logo-twitch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1514567', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'301')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F0C035F3-5484-4476-8889-9CBD76E56717', N'logo-twitter', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1514895', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'302')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5BF4320B-C44C-421F-BF7F-12B09F005C18', N'ios-umbrella', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1515226', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'303')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'344ECF2E-EC2E-4D56-BDD9-CBEEDB5B4A2F', N'ios-umbrella-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1515550', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'304')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'417086C4-47DB-4110-9C02-ADB76DB5CE98', N'md-umbrella', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1515970', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'305')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EF93BCD5-5954-44A9-B64D-081EE27EC4EC', N'ios-undo', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1516305', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'306')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'41BFC90D-F1F0-468B-848B-90FC7AF35BFE', N'ios-undo-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1516629', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'307')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'75562097-5416-4EF3-B2A7-4B3829F810FC', N'md-undo', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1516957', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'308')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'230BD625-229E-4D10-B1E2-2FD63212BF6C', N'ios-unlock', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1517322', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'309')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9C82E6FD-A967-47FC-8E6E-250922555DEC', N'ios-unlock-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1517656', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'310')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2A1A37CB-8D17-4486-9D85-63324616E78B', N'md-unlock', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1517981', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'311')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7DBB154E-9992-4BDB-8FE9-6F70B262DCBB', N'logo-usd', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1518305', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'312')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'893B5170-4B16-4D09-AB8A-2D52E4806E3E', N'ios-videocam', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1518633', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'313')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DFC30ED2-742B-4F1D-BE54-527D8F518D53', N'ios-videocam-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1519011', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'314')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'67170B57-EDBE-4362-9068-CC88B20F2397', N'md-videocam', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1519479', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'315')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'499E7CFC-4E62-4CA4-82EF-D055DEF76362', N'logo-vimeo', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1519810', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'316')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C1F598BA-60B0-4801-BDB7-1B156EDE281A', N'ios-volume-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1520141', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'317')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E19D97F9-409F-4A21-BE92-914B57AFC454', N'md-volume-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1520523', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'318')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'145DBFFE-13B9-4864-993B-C04936DB2C2E', N'ios-volume-mute', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1520858', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'319')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9A9E9FDC-4E22-4821-9199-EDAFC2285888', N'md-volume-mute', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1521186', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'320')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7B452480-44E0-492C-9EAF-4E662CD188FC', N'ios-volume-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1521513', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'321')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'05A66FBA-6448-4E69-81C1-E2C8E1BF7C37', N'md-volume-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1521913', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'322')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'31A04A3E-AD7F-4C04-AD04-3038D95E784B', N'md-volume-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1522595', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'323')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'422B3A1A-4429-4485-B6AB-C4FFE342DDCF', N'md-subway', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1495289', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'324')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4F58CBFC-AAC3-4F0A-A05E-3E60BF24B479', N'ios-subway-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1494958', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'325')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B3806973-2DEE-461E-9BFE-7ED51B9993E8', N'ios-subway', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1494620', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'326')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D7C07E52-08D5-4E6F-9C7B-C0797DCA9FFA', N'ios-restaurant-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1463251', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'327')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FD748843-A58A-4075-B9FF-D3765B4CEF59', N'md-restaurant', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1463582', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'328')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'65CD9469-2559-47A6-AE94-353BFBC459C1', N'ios-return-left', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1463907', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'329')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'998E57C1-C290-449B-9785-D5997E8301CC', N'md-return-left', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1464415', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'330')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'108FC91C-0E3F-4773-80CA-EB043A5AB182', N'ios-return-right', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1464774', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'331')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7AAD120D-FC07-4783-B4EA-382356FC39D6', N'md-return-right', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1465105', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'332')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A5B09788-FB1E-4802-B1F8-2FA4958D8CB1', N'ios-reverse-camera', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1465432', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'333')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1703AB5A-C9DD-4F52-B4FB-4B172B650040', N'ios-reverse-camera-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1465757', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'334')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9F10DC1F-E7EC-4370-97FB-32AAF80E313B', N'md-reverse-camera', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1466132', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'335')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AA269D28-EAC7-4044-A39F-813D8A9BD284', N'ios-rewind', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1466463', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'336')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7B075255-504E-4824-9580-D957C2A582C8', N'ios-rewind-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1466787', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'337')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7990D3A0-AAEC-46EF-9BE9-9429D72E2BA5', N'md-rewind', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1467122', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'338')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'79D33CA9-AC71-4C3D-ABEB-4034A307C061', N'ios-ribbon', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1467497', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'339')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BF4D6EB2-C8CB-4718-B488-37C52E510E85', N'ios-ribbon-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1467828', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'340')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'314CB57C-349A-4D86-A508-348B39FA5CF3', N'md-ribbon', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1468153', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'341')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F09400E5-2323-4BC2-B8FC-7653440BCCDD', N'ios-rose', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1468480', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'342')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DD4C9DA8-244E-4600-81F7-71056D475AF6', N'ios-rose-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1468846', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'343')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'871D8EFC-FDE2-49BF-A0CA-48D91B0FC9D6', N'md-rose', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1469614', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'344')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F346E347-3FEE-4C4C-AA0D-A048ECC799A0', N'logo-rss', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1470129', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'345')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C4CD06C4-DCAA-457A-AEC0-2CDB5CD17848', N'ios-sad', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1470467', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'346')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3B3A077C-8CDB-4B6F-A6ED-FCD10B727559', N'ios-sad-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1470798', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'347')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0E32FC73-8BE5-48F9-8A6A-4C5E3F333E96', N'md-sad', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1471204', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'348')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'669635BB-2F90-48B0-A0F0-5098A94B67FC', N'logo-sass', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1471535', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'349')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F49C589A-681C-412F-A70D-6E5DD5F3B26E', N'ios-restaurant', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1462924', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'350')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B1AE91BB-899C-42BB-8B3F-DEC8042860A7', N'ios-school', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1471863', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'351')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A0933F37-E618-4501-95A1-54DA419B4BE7', N'md-resize', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1462541', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'352')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BE106E7D-9D53-41E0-AECC-544F6AC041F3', N'md-repeat', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1461869', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'353')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'19CF8B0F-A118-4D0C-BD50-A15CA3F74CEA', N'ios-rainy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1453149', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'354')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'12C9F72D-261B-4E03-9A23-75B2C4EE7E7D', N'ios-rainy-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1453476', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'355')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9D7F2EEB-28FC-4B70-8647-1A38E9D384BD', N'md-rainy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1453801', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'356')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'519CC7AD-1CFD-4F1F-BF70-AD01A0072F3F', N'ios-recording', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1454125', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'357')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5764FA8E-7E46-45BD-B4C3-1475628E8403', N'ios-recording-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1454767', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'358')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5DA6A654-F263-41F5-A173-F63B7DA9DB76', N'md-recording', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1455108', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'359')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'16396301-129D-480A-9FA5-473823898FEE', N'logo-reddit', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1455432', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'360')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5457A000-A3EB-45B1-BA5A-E6357468B1BB', N'ios-redo', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1455756', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'361')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'02AC333F-1FCC-4D17-A0CD-8970021CE959', N'ios-redo-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1456128', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'362')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3DD63F92-5395-4584-A82F-DB41BB1EBB12', N'md-redo', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1456463', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'363')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'17BC53A6-3E62-4867-942F-9755BDDCDF61', N'ios-refresh', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1456787', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'364')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A0E3D81C-AC43-40BC-A02C-357D8C4B4ED4', N'md-refresh', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1457111', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'365')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DA422054-7B51-44A0-8982-BAA1261281E8', N'ios-refresh-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1457436', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'366')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D6D053C9-1940-447D-AC4C-836A00D7A80A', N'ios-refresh-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1457811', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'367')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'31A30A4C-9E83-4F39-96A4-D5E9244E4F18', N'md-refresh-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1458139', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'368')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F463FA92-670D-4E4F-92B0-72DE9D1F3DCD', N'ios-remove', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1458460', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'369')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B8C3A9D2-A381-4142-9D77-FCBAFE8D60AC', N'md-remove', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1458781', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'370')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AB875520-1079-435A-8A1B-D8AC65B25F81', N'ios-remove-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1459227', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'371')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'849AB78E-AFEE-4D13-BB9D-1A315BED209A', N'ios-remove-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1459684', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'372')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'12B757DA-77A0-4E55-BC22-8ED6B69C902D', N'md-remove-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1460384', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'373')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7739E9CB-606A-4B11-A8FD-6F155FD4BF85', N'ios-reorder', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1460732', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'374')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DA20550F-3450-4689-934B-56162C75A42E', N'md-reorder', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1461169', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'375')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F234D6FB-A33B-4601-BEF0-D8A23E9E87C6', N'ios-repeat', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1461534', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'376')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EE6005B3-8AFD-43A0-9C09-00B547D5E3FC', N'ios-resize', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1462197', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'377')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A2783360-B5ED-4135-A353-909D6B958A32', N'ios-radio-button-on', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1452442', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'378')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B97D1E32-26BC-4866-82A3-E3A5C5DB6CB2', N'ios-school-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1472249', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'379')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B438CCDA-88A6-4880-88B2-1CE6CE6E2DA6', N'ios-search', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1473027', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'380')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'71339C75-CD3C-4161-ADCB-EA95A67E3F6E', N'ios-snow', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1486756', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'381')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'30AB460D-E43F-4B0C-863A-FDC3EF00A573', N'ios-snow-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1487083', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'382')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AC1927C0-76A4-4460-BCC6-82976CFAE3E6', N'md-snow', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1487455', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'383')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'701E09F3-D58E-4121-A361-B35F9860A3A5', N'ios-speedometer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1487790', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'384')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F8E2F8E2-3DAA-4EC1-B0D2-2130D960108C', N'ios-speedometer-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1488121', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'385')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'35898D3E-56C7-43C3-A234-78E8BD1F60F7', N'md-speedometer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1488449', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'386')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'79DC11A8-3CBD-47FA-8C1E-4B3BF0590E0B', N'ios-square', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1488821', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'387')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9F5D4018-0B2C-4CCC-B835-06E4EC8748D9', N'ios-square-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1489173', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'388')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9D0E87A9-17E0-4469-BFD9-93204E796AE8', N'md-square', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1489504', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'389')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D83BB7E3-7C94-41DD-826D-CCC95A933FC1', N'md-square-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1489832', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'390')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4B55C821-BB28-4803-B3D5-1493E97FB889', N'ios-star', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1490197', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'391')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4D827491-1E09-4E36-A8EE-67F3D980FA0E', N'ios-star-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1490535', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'392')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9A5E5ED3-0575-4BFB-A6E6-9396979BD0C7', N'md-star', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1490869', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'393')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C572DDB4-4214-44AB-B306-505C1C81BD97', N'ios-star-half', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1491193', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'394')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BBE8DEB0-E44D-4629-9103-BD5A003AA186', N'md-star-half', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1491521', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'395')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F97E97E1-6F31-4354-B43E-B6BC8160839B', N'md-star-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1491897', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'396')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3996D78B-8B48-43C2-A887-E2B67C96387A', N'ios-stats', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1492224', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'397')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A49B0B6B-FCD5-4288-9C99-E2A549E7E631', N'ios-stats-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1492552', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'398')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'113451A3-DBBC-42E6-AF4A-6D936C7ACF1B', N'md-stats', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1492876', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'399')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CB4BC704-431A-471E-ADD2-046390DC36D2', N'logo-steam', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1493245', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'400')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A9ED620F-EFBB-4C5F-9BB8-F25843311A3F', N'ios-stopwatch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1493579', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'401')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ECDD72FC-002A-4761-9B5C-4BA887CAAB57', N'ios-stopwatch-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1493924', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'402')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F8318EAD-44CE-432D-BD05-6F8FD30ABE85', N'md-stopwatch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1494255', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'403')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1367A36C-029C-423C-BA25-22003CE05C49', N'logo-snapchat', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1486428', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'404')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5712A0B8-40E8-4502-9645-B0E5EC97B8D3', N'md-school', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1472679', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'405')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7CBA931D-4D58-41A1-A019-1074CF5D7108', N'logo-skype', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1486097', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'406')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'33749156-198D-4A73-8AC2-BE8D341206F5', N'ios-skip-forward-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1485298', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'407')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4EF88803-C1BF-455B-92C2-4A1D7F4A6215', N'ios-search-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1473358', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'408')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DD4743B0-BB1A-4BF9-949E-36137B887E0F', N'md-search', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1473682', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'409')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B0B1FA5B-6267-450C-A194-BE6BCD3F0671', N'ios-send', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1474048', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'410')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'22E27D06-0EB1-42E7-85F7-89D8993F1B73', N'ios-send-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1474447', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'411')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AA8630F8-93A0-4868-987F-95BB2FAEE730', N'md-send', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1474778', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'412')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DBC8647E-B328-43C6-8DEC-0F1E24FEA7D1', N'ios-settings', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1475102', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'413')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'952B1E1C-1771-4015-9D76-95FA73B282F4', N'ios-settings-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1475430', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'414')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8B43A5E5-BD92-44A7-ABB7-26F9F7D2CA5F', N'md-settings', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1475802', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'415')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FF59FC59-35D6-403A-9002-4CAF3BB91CDE', N'ios-share', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1476130', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'416')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4BECE97E-9E52-4547-A76B-D40DBD14E219', N'ios-share-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1477382', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'417')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'32B24C20-5505-46C3-B1F2-FA434E8C9D17', N'md-share', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1478000', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'418')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'89772F1D-B33F-42D5-A084-924F3CC30755', N'ios-share-alt', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1479724', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'419')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9EDD2F70-FA7B-4A27-89FA-55585AAA8887', N'ios-share-alt-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1480564', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'420')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EA40087E-97CB-46C7-964E-051C88B68F46', N'md-share-alt', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1480915', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'421')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'700E468B-D702-4615-AF3C-AC1D49B71007', N'ios-shirt', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1481253', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'422')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C04F5B10-944C-415A-9A34-21C3FB19DBB2', N'ios-shirt-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1481584', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'423')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CAD99A72-55AA-43EB-99F0-5B6A32570F8D', N'md-shirt', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1482571', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'424')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4E635A57-E8B3-433F-A516-2731E76D5F31', N'ios-shuffle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1483240', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'425')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DBBFEF19-06B4-4FE8-B8FB-D5030AA3F7BF', N'md-shuffle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1483588', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'426')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AAC8071E-68E6-4029-8075-96402CA0FF92', N'ios-skip-backward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1483916', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'427')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'54B2743F-033F-4E61-8FEA-4723DAB55DE7', N'ios-skip-backward-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1484305', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'428')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B8303AAB-00A2-45E8-851C-52EB6F7A4E2D', N'md-skip-backward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1484636', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'429')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'12BAD201-80D3-4385-8A38-0D68237F6773', N'ios-skip-forward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1484970', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'430')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9EDB8FE1-DB0E-49D1-B84D-8EE03B45C419', N'md-skip-forward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1485738', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'431')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1D0F5F38-6609-46F7-9EC6-0ED6D292414B', N'ios-information', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1352070', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'432')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'03FFABA6-2274-4EE2-9DD3-CEBB0AA629AC', N'md-infinite', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1351732', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'433')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E2FF935A-3A52-4652-A1C9-E7B5057B3FD9', N'ios-infinite-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1351364', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'434')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'49F9EE8C-8973-4139-9B75-5F445CCE1581', N'ios-bug-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1238093', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'435')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C61A1380-3624-431D-84C9-CC59DFCB6C5B', N'md-bug', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1238427', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'436')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D2EA5289-A885-45C7-AEC3-02C39A32E5C6', N'ios-build', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1238755', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'437')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E115836D-BE73-4E01-BB22-90C38E402CBB', N'ios-build-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1239144', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'438')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'114EE7C5-5231-4B7D-B451-54251584C7E7', N'md-build', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1239540', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'439')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6492ED74-13C0-4D28-9F7D-9FD020513722', N'ios-bulb', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1239881', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'440')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E7F7CC4F-F8A0-40CD-A136-E0DB5477FFDE', N'ios-bulb-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1240209', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'441')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'918CEB4C-1119-4728-A604-6B33E8B0A106', N'md-bulb', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1240861', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'442')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'32DC9ADF-DB36-4D11-95F9-3D6CBF16CB67', N'ios-bus', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1241229', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'443')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C7407FCF-F86D-43E0-BE73-FF0AA48D8747', N'ios-bus-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1241612', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'444')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B907050D-AA8B-4896-99A0-BF8DDF7BCF1A', N'ios-bug', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1237649', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'445')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'90DAF26C-84A3-413B-A97A-F42638A83891', N'md-bus', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1243175', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'446')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B352A937-C7FD-4E2E-8E04-B88F736B988A', N'ios-cafe-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1243837', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'447')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FA6EC177-C9EC-491F-A616-32E740D93C7D', N'md-cafe', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1244295', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'448')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5B71E033-4FD6-4755-BB02-F1C067580317', N'ios-calculator', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1244629', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'449')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'36A90261-55D6-463C-B70C-676F457DD1B7', N'ios-calculator-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1244981', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'450')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DA13CE77-6492-4291-B98C-D79F53E38632', N'md-calculator', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1245319', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'451')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CECC7C53-1803-444E-9F25-8BE92389FAB6', N'ios-calendar', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1246974', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'452')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E76581D9-E0B5-49DF-B4EF-C0374D66591A', N'ios-calendar-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1247360', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'453')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D27C9007-036E-4FE6-9C2B-24B45B909911', N'md-calendar', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1247691', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'454')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5FED8E96-F6CA-490A-BA94-7DA880EE219B', N'ios-call', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1248019', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'455')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0C98B8F1-62B9-4DFA-B453-81B0582C7190', N'ios-call-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1248346', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'456')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'368F2D24-959D-476B-9348-B4E481BFF11B', N'ios-cafe', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1243510', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'457')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8D015C58-4ACE-485D-8A43-1B466821E570', N'logo-buffer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1237315', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'458')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7FC9A9BE-7E28-4C9B-A9D9-ABC079033635', N'md-brush', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1236953', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'459')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7BC547B4-D7CE-404E-B51D-38715816BA68', N'ios-brush-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1236188', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'460')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D4A02F37-FDD7-41CE-BE02-ED33E9F85E61', N'md-body', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1228412', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'461')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B40CE25A-3B54-43F3-B3A5-179D78A8D460', N'ios-bonfire', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1228784', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'462')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C3F21FAD-DD87-435A-B9ED-676EE90D6CC4', N'ios-bonfire-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1229126', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'463')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'62B807C6-F1EA-4DA1-B18F-0B6ABC6B071A', N'md-bonfire', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1229457', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'464')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'66454BE0-F527-4B55-84BC-7571303A7E4C', N'ios-book', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1229781', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'465')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3A28EA10-6B21-4238-A057-7831139C3600', N'ios-book-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1230150', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'466')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'47977F18-344A-4167-BFF0-DA6899898E95', N'md-book', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1230481', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'467')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D5C7E99C-CFF7-49FE-AF3C-C1987C84E92A', N'ios-bookmark', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1230805', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'468')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3CC76DC1-D62C-4CE3-8A31-C45615C8FE0C', N'ios-bookmark-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1231130', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'469')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D9515982-9730-4D93-A3E4-54356E26EE97', N'md-bookmark', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1231488', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'470')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5075FCD3-E469-4FFC-88D8-15B559D0A4A9', N'ios-bookmarks', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1231823', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'471')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D64CF6EC-1F7E-4612-B571-704AA46427AA', N'ios-bookmarks-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1232150', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'472')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5DF222CB-6098-4E40-8B8E-BA2EE42B2B85', N'md-bookmarks', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1232475', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'473')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'99ABC844-8C4E-4B63-A2DC-8F3AE7FD9D8B', N'ios-bowtie', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1232795', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'474')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6C326BBF-007A-43AB-BDEC-75847B61F151', N'ios-bowtie-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1233167', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'475')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F59B4BD1-D82A-4CA3-82C2-C0092A0D480E', N'md-bowtie', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1233492', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'476')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'77B0BAEB-02A3-4032-B2D9-DE5421702CF3', N'ios-briefcase', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1233816', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'477')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3F1F29B6-E1FB-47D9-816A-B43D7E6DA26D', N'ios-briefcase-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1234140', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'478')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BC0BA4C3-04A7-4AC5-9B12-3A7F75E7A020', N'md-briefcase', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1234502', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'479')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8C640B43-32E9-4FA7-8D07-373D50B0C40D', N'ios-browsers', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1234833', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'480')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0EAD151E-B837-4FA7-91D8-D037180EE853', N'ios-browsers-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1235161', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'481')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'29122A81-06F9-4AD6-BA88-C873E52C26B8', N'md-browsers', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1235485', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'482')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3370DCF2-B4EE-4A3A-920E-63304761405A', N'ios-brush', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1235847', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'483')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DD4680DE-102E-4C19-9661-A5B03123F38A', N'md-call', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1248718', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'484')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8B1ADC74-536B-4A11-87C3-067238E1F0B9', N'ios-camera', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1249049', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'485')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D16DFD77-7FAF-42BF-853D-E863CB21814A', N'ios-camera-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1249462', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'486')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FDFA77DB-9DEF-4717-B769-3B65196BB404', N'md-camera', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1249793', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'487')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0CFCCCA7-1A8E-4CE2-B125-F06BDBF9C282', N'md-checkmark-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1260587', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'488')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A9C05123-755F-4E4E-8D7C-EE84FDAFC8C8', N'logo-chrome', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1261017', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'489')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2BF06F7E-2968-472F-9379-D47D1EDD4C69', N'ios-clipboard', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1261351', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'490')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7E760817-DFA2-4AAE-8EDE-283CC22CDB7A', N'ios-clipboard-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1262065', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'491')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E6A3990C-CB0D-4EF7-96F4-1B8EEC280580', N'md-clipboard', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1262792', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'492')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5936089B-3BCE-494C-BB42-DB3DA7543BA0', N'ios-clock', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1263153', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'493')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FEFCFB29-8533-4415-8E83-627AD63A65E6', N'ios-clock-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1263484', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'494')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3AF56628-F7EE-435C-909C-82E116606645', N'md-clock', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1263812', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'495')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4952E02D-C3D4-446B-9A88-8F4CA75CFAE7', N'ios-close', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1264188', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'496')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A0D35A88-862D-4A89-AB19-1FD913B503E7', N'md-close', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1264686', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'497')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7FFA3051-C793-4AB8-B312-34E246978D62', N'ios-close-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1265031', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'498')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'07C54305-CDAE-46FB-857E-56360EF7C3D8', N'ios-close-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1265406', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'499')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5B44F795-FF48-4BD0-9279-B52E7975D37F', N'md-close-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1265741', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'500')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D8A70D42-A74E-4F46-ACF5-BD6B2223A482', N'ios-closed-captioning', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1266075', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'501')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4976BCC9-E123-4EAB-B167-00006DFF529B', N'ios-closed-captioning-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1266403', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'502')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'389F33ED-9278-4E30-A6D3-66E4A5F24941', N'md-closed-captioning', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1266737', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'503')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'512A07FB-F2A0-40AE-AD3C-7DCA943A81C1', N'ios-cloud', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1267068', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'504')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8B8A268C-162C-4EDF-9317-5744FD0EDF27', N'ios-cloud-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1267519', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'505')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'01D922D7-5F79-46FD-A484-842D64CCD854', N'md-cloud', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1267867', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'506')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'41CDA08B-3C34-4F5C-8668-9F6AC1EAB08C', N'ios-cloud-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1268195', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'507')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'80C6FB36-85BF-4321-AB04-EFE570A1D259', N'ios-cloud-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1268516', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'508')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B7A6D6AB-44D3-4DED-933C-1B8D83942E15', N'md-cloud-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1268901', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'509')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F5DE8FE2-9705-446A-A788-98BBA129FA70', N'ios-cloud-done', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1269269', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'510')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BBE0C419-D98E-4462-8707-B197E55CBF70', N'md-checkmark-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1259723', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'511')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CB03EB3E-4890-4646-BB42-BD83417335E7', N'ios-body-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1228091', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'512')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4762332A-312A-4AA0-972B-61A483E0BBC8', N'ios-checkmark-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1258842', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'513')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'13366172-83BB-451A-954B-B5779B1C165D', N'md-checkmark', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1258193', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'514')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3D73FC34-2BE6-4025-B4B3-76A20BEE2CAA', N'ios-car', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1250172', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'515')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0238D08C-24CB-442E-8081-61E6E232C273', N'ios-car-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1250506', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'516')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'74B6ACDB-AF80-46DD-9D59-720A034FA7EB', N'md-car', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1250831', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'517')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0490043F-269E-4FB5-A981-527BFBF485A2', N'ios-card', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1251155', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'518')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'296FA6C6-DC7C-481C-8838-AD4BB0F09125', N'ios-card-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1251513', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'519')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'987E8CC4-2096-4D06-8CA1-C4707E02C42B', N'md-card', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1251851', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'520')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4CB32864-3C6E-45BD-8588-FA3C3E5FC11E', N'ios-cart', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1252179', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'521')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DBE8AA35-EC8F-4F5E-BD15-D0AC83BE8425', N'ios-cart-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1252503', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'522')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AB4FD9BC-D1F4-494B-B1C3-27C61B765561', N'md-cart', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1252827', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'523')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C41B1B7F-5229-49E3-B986-EA7F8E78DEEC', N'ios-cash', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1253199', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'524')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'596DE06A-78E2-464B-8280-40FC8D684ED9', N'ios-cash-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1253527', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'525')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9FE2B254-00B0-4691-9BE7-2CF14E075013', N'md-cash', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1253851', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'526')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3CEC493D-BABD-4B1E-86D5-8CD38E2FAB07', N'ios-chatboxes', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1254172', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'527')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A55939B3-7D87-4ABB-ABD1-AF5BE4F8B0D4', N'ios-chatboxes-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1254534', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'528')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4955B354-DBEB-4EDB-B940-261D39D692DA', N'md-chatboxes', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1254868', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'529')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'911C22F6-C25D-424F-B855-2A1FC1401E43', N'ios-chatbubbles', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1255193', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'530')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4D06565D-53C5-4E14-9892-DBF919CA0C78', N'ios-chatbubbles-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1255520', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'531')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3452D883-87BB-43CD-8447-64DE9D3A9208', N'md-chatbubbles', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1255845', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'532')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'88D0CA6D-CC3E-4D3A-824C-4EC0309136AB', N'ios-checkbox', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1256445', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'533')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'41EB9C3E-6375-4AA4-B9F3-1E1BD2C6A2BD', N'ios-checkbox-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1256777', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'534')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'11C7D717-C275-42FD-8A1A-CF7D29E958F1', N'md-checkbox', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1257104', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'535')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3A0ABBB5-12B1-49EC-834B-CC855A74E280', N'md-checkbox-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1257425', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'536')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'78A5456F-CCBD-4D9F-B505-2F25B1887277', N'ios-checkmark', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1257855', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'537')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D9166BC8-44B4-4017-9726-C7CE05FF8D25', N'ios-checkmark-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1258517', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'538')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'12CEF8A7-A68D-45BF-8922-EE9AA8DA6F65', N'ios-body', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1227767', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'539')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'52383546-FFF7-469B-943C-6C4382BAC5FA', N'md-boat', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1227439', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'540')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'79B90449-C211-4115-87BA-663C063CD944', N'ios-boat-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1227091', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'541')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1217952A-7C82-4683-A92E-486495E990A3', N'md-apps', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1199945', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'542')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DB88137E-B254-49D9-8DEA-A283F6F4C3A9', N'ios-appstore', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1200277', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'543')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'85F97616-4180-43D3-BAC5-1E8903109AFE', N'ios-appstore-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1200608', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'544')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'52A28F3E-369E-4D8E-A16B-ABA13E4FE8DD', N'md-appstore', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1201014', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'545')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'97D7E1B3-DFCE-4388-80AA-1311B48FC149', N'ios-archive', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1201345', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'546')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'24CE1306-AD74-4D7C-A6F8-DF004192FDFB', N'ios-archive-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1201673', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'547')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'022D3304-5E73-4220-8A3D-96E4CBCB5224', N'md-archive', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1201997', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'548')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'815AE0B0-7301-4D12-8D9C-76E765A59AF0', N'ios-arrow-back', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1202362', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'549')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BA5A028F-FF55-4830-A1F9-E251C5EF1833', N'md-arrow-back', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1202697', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'550')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'91E1C5EF-BA3A-4744-BE0C-3EB6121AF711', N'ios-arrow-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1203024', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'551')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'89AC98BA-2EAA-4763-B10D-8A3A386C98FF', N'md-arrow-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1203417', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'552')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C30B25F5-E0EA-4624-B8A9-8DE512E59EC3', N'ios-arrow-dropdown', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1203755', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'553')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'03C28167-6A75-44FA-9430-6FD0CDA2DCF6', N'md-arrow-dropdown', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1204082', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'554')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7E6DE161-2488-4CA9-BE40-E06BECAF92D8', N'ios-arrow-dropdown-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1204485', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'555')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3AADA10F-E07C-4E59-938E-AD1562D1610B', N'md-arrow-dropdown-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1204837', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'556')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'80C129C4-EB0A-49B1-864B-6A9085CB1775', N'ios-arrow-dropleft', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1205168', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'557')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FF9DB65D-6767-4ABC-8766-E4464A38DF1E', N'md-arrow-dropleft', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1205495', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'558')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4B31F0DA-3B31-46D0-93EE-B66F5F4C6F79', N'ios-arrow-dropleft-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1205823', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'559')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C5EA3354-2077-4E49-85FA-184098DF42CE', N'md-arrow-dropleft-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1206308', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'560')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'126E354E-B4D1-4D4C-90AE-0324658D67F9', N'ios-arrow-dropright', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1206642', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'561')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ACE0251B-9119-42E8-A371-9C8BC86F268B', N'md-arrow-dropright', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1206970', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'562')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'83C4EB88-90DF-446E-B82F-8E7808ECE555', N'ios-arrow-dropright-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1207298', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'563')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'28C411A7-294E-4556-B104-BBCF20CFE56A', N'md-arrow-dropright-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1207673', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'564')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F63BFAA7-7AAB-4D30-B9D7-5FABEF61F8C1', N'ios-apps-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1199614', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'565')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9237E19D-B4C7-4C7B-9D33-CF24CF83EC8A', N'ios-arrow-dropup', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1208004', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'566')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'811B63BB-DDEC-43EA-AFDA-A2FF8B00EC8A', N'ios-apps', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1199273', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'567')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A591B57E-1323-43C8-8FD6-6E2BF12BA861', N'md-aperture', N'1', N'#01F2FF', NULL, NULL, N'1', N'0', N'2018-11-20 14:57:54.1198556', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-11-07 10:06:47.9677721', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'系统管理员', N'568')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'30B92A77-C018-4EA3-AA63-CA499ACBCBB2', N'md-add', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1179500', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'569')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3C2E15FF-02C7-414B-BFB5-731D73D798B4', N'ios-add-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1190344', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'570')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D0CA11B7-B7EE-4F0E-98B5-7EE0B964C0D0', N'ios-add-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1191067', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'571')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'500F819E-D25E-4811-A601-5C1C587FD107', N'md-add-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1191467', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'572')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'03C562B7-59BE-424E-A584-D4CFEAD2C039', N'ios-alarm', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1191804', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'573')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DE4837CA-EFA8-4738-A2CC-11852A84BF81', N'ios-alarm-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1192190', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'574')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D5A0F4A9-BA20-4BA8-83E4-6EFA6B411375', N'md-alarm', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1192538', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'575')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E02B8EE3-FB4F-46F5-BEA0-58DBE514370C', N'ios-albums', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1192883', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'576')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DED76D79-5D64-4F53-8FBF-F0D813961224', N'ios-albums-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1193214', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'577')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'857EB0C4-CFD8-4E02-872C-DE897B1DBD10', N'md-albums', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1193641', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'578')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8D3C5E85-28E5-448F-BBFB-77D3E2494051', N'ios-alert', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1193989', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'579')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'56F3F4FB-5596-4E0A-B788-344EADABAF6A', N'ios-alert-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1194320', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'580')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8743881C-B5CD-4253-B2FD-F5631EC7B2C4', N'md-alert', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1194648', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'581')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'95A1930B-719B-435A-BDDE-F3F3298DE38D', N'ios-american-football', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1195013', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'582')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9DDCE2E4-2283-44AD-8C10-36895EE62331', N'ios-american-football-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1195358', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'583')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D1CE2F45-62B5-4706-BF51-488741D942EF', N'md-american-football', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1195689', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'584')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EFECA6D6-6290-452A-9E02-571374D00F8F', N'ios-analytics', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1196016', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'585')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FDB3B3E9-965B-4F0D-A30F-8A0FF88D2465', N'ios-analytics-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1196406', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'586')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8526B240-D547-47CB-B75A-6ACB17C1D939', N'md-analytics', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1196815', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'587')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A31CD203-2FA9-4BE2-ADED-DEBFFC5B1C18', N'logo-android', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1197174', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'588')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E71DF871-73C5-40C2-91E1-D07D5687BCE8', N'logo-angular', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1197511', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'589')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'86043D86-332A-4B47-9105-96DD0BBAC07A', N'ios-aperture', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1197890', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'590')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'43DA6810-F8C5-404F-851C-B2C180972606', N'ios-aperture-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1198228', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'591')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BEA014A6-E04D-499A-A9E6-EA64EF01FD4C', N'logo-apple', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1198884', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'592')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'26CF5246-026B-4688-933C-BA018D1FD2C6', N'ios-cloud-done-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1269614', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'593')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'15366407-C165-4780-B849-5E1F69052235', N'md-arrow-dropup', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1208332', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'594')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0EFBF66A-F9B0-4EF4-88C2-28FBB035AFDF', N'md-arrow-dropup-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1209025', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'595')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'271CE0CF-658F-413C-8305-C4E36864D318', N'ios-basket-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1218599', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'596')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A531C6FB-DB82-44D0-A104-5EAA80E905A1', N'md-basket', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1218927', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'597')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'95B404E7-F271-42B7-9B55-B5B14F80B2DC', N'ios-basketball', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1219398', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'598')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'32F3929C-62FC-4504-A4CD-400FB5090410', N'ios-basketball-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1219797', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'599')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'97504E63-A928-4CA2-BD79-EA3C70F7427A', N'md-basketball', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1220128', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'600')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C0A3A8A2-D31B-426E-9A88-A3BB2A25F809', N'ios-battery-charging', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1220456', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'601')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EE76A4CA-F8F6-4CEE-83D9-A54FDDFA2653', N'md-battery-charging', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1220777', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'602')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C0AF7687-D814-4A7D-BC38-BA4DFB1EFEBD', N'ios-battery-dead', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1221142', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'603')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'30C57670-FCC6-4508-A6CB-EDBBF6FFFE61', N'md-battery-dead', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1221538', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'604')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C80245B5-E755-4481-B663-989B7394CAA4', N'ios-battery-full', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1221876', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'605')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'731211D2-F47F-4ED4-A1AF-6558A80D72CE', N'md-battery-full', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1222241', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'606')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9C5CE639-C4E7-4A60-B184-51270D6C46C0', N'ios-beaker', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1222572', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'607')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D4738D3E-9867-4BED-8813-18582E30CBAE', N'ios-beaker-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1222903', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'608')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B1C212B6-9F2B-4B0E-986F-F6C8C8F04932', N'md-beaker', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1223231', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'609')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'18165A1D-3EDC-461B-9E33-53D7C06551B1', N'ios-beer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1223784', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'610')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4901F5EB-1A0B-4F37-AEBB-1692C205DC67', N'ios-beer-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1224207', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'611')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'36FDD46F-8B62-4A3A-9422-D4249CBE587B', N'md-beer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1224548', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'612')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3DEE80C7-2CEF-4669-9207-F11ED2C07E0A', N'ios-bicycle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1224972', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'613')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'19B3D224-4468-4985-BF41-526B7A3ED344', N'md-bicycle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1225344', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'614')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'426D8CC5-7E7B-4A4A-9FFC-403172801561', N'logo-bitcoin', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1225726', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'615')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'828ECCBA-B8F0-499D-A89B-7CD39FB4E0D9', N'ios-bluetooth', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1226050', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'616')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8C6F3301-2577-47E7-9F21-FC3594C673E0', N'md-bluetooth', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1226375', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'617')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A0D64365-BB13-493F-A1D1-D7A823C4B9FB', N'ios-boat', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1226695', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'618')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9606E363-F4A4-441F-B412-C4138E25BD15', N'ios-basket', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1218271', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'619')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'07194175-E62E-422A-89BB-36CD927A4E1B', N'ios-arrow-dropup-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1208660', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'620')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DDD0305D-1644-47E0-9919-5A3E084F6C89', N'md-baseball', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1217896', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'621')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'63CD4076-E569-43AC-B785-A3032F1489F3', N'ios-baseball', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1217244', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'622')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2176BEFE-110D-437A-AC1A-6ADEFD3A2F19', N'ios-arrow-forward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1209376', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'623')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'607F8345-36D4-41A2-A40D-068D56699BB0', N'md-arrow-forward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1209707', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'624')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'62726F6C-82FA-427E-8BDD-A8C056A8CF1D', N'ios-arrow-round-back', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1210042', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'625')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'50D3969A-3495-468B-8BFB-AFF8E2921935', N'md-arrow-round-back', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1210376', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'626')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1B4A93F1-F6A2-45E7-895E-01B05191E6D5', N'ios-arrow-round-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1210759', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'627')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4EFB02E5-779A-4C55-A213-FE6E185E60BD', N'md-arrow-round-down', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1211086', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'628')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'06B75E3D-74A8-4120-B86B-E125E4C7CA7E', N'ios-arrow-round-forward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1211414', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'629')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5F2A3B10-A45D-4156-998E-7B6125ABFFC0', N'md-arrow-round-forward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1211786', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'630')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5175532F-78B7-4DE5-BEBE-1086C721C316', N'ios-arrow-round-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1212161', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'631')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CD109996-B361-44CA-9324-9EBB2E6D6F77', N'md-arrow-round-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1212496', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'632')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'882CF3A8-47AA-41E2-B1EE-C92A6AB2129B', N'ios-arrow-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1212820', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'633')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ABF77D5C-7FB4-42BB-82D2-862C7317BCFC', N'md-arrow-up', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1213148', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'634')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E4875D67-5B0C-4B8E-B004-816D39F2775A', N'ios-at', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1213506', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'635')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'373AB36A-97B9-4521-A717-18C5D710AAE8', N'ios-at-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1213841', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'636')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3A5A78F4-E815-4E84-A339-974DEB0A3EA1', N'md-at', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1214169', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'637')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'133FFE60-5182-4B8E-9A5B-3E8F425437A9', N'ios-attach', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1214496', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'638')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FE047F27-2119-422D-99C5-B444FFC609F2', N'md-attach', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1214820', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'639')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0C9B2535-F5B0-43BB-9B9D-15FDD9F2B056', N'ios-backspace', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1215189', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'640')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FD301819-EA5D-46C3-B2C0-D81487D943E1', N'ios-backspace-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1215517', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'641')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A4656898-D783-4409-B51F-DB55762ED239', N'md-backspace', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1215841', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'642')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'71E9AB9D-9917-47C9-9247-12B57625546D', N'ios-barcode', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1216169', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'643')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F603D3EF-5979-452B-A8E2-746DB7D4175C', N'ios-barcode-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1216568', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'644')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1FC9B15A-9E2F-49FC-8059-801C0E7784CE', N'md-barcode', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1216916', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'645')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6201375F-D631-4A27-B5E4-5BC96EBEF368', N'ios-baseball-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1217568', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'646')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0762491D-1666-4BE6-B15D-93A616CD0352', N'md-cloud-done', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1269942', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'647')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'23A410A5-F193-446B-9D30-64D55BFCD151', N'ios-cloud-download', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1270269', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'648')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5ED56B62-F2E6-479B-BA6D-AD886D39F907', N'ios-cloud-download-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1270665', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'649')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C087EA63-0A2E-41D8-9670-173C1F3D9B0A', N'ios-football', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1324282', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'650')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5BF400FE-52CF-4CD4-AC49-1B947B7DC290', N'ios-football-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1324616', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'651')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EAC36391-1733-4103-9CF5-F4734570B584', N'md-football', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1324944', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'652')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F0B6A974-2113-4517-A52D-9E457B6A82B2', N'logo-foursquare', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1325265', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'653')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'28F26081-C4A9-47F6-8373-2FE36F531CD4', N'logo-freebsd-devil', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1325644', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'654')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A838DA02-EDF7-4EB6-89DA-A1D251AA3717', N'ios-funnel', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1325971', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'655')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F7FD4DD2-1DB7-48D9-A509-B0F1807F5162', N'ios-funnel-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1326296', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'656')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'47499A4A-399B-4750-82A4-3F8B5C3C96E1', N'md-funnel', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1326620', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'657')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8E52F9B3-517B-40F4-AACF-B117E2935445', N'ios-game-controller-a', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1326982', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'658')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'485F6396-EE2E-4212-B2FA-2D1764CB22D5', N'ios-game-controller-a-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1327316', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'659')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5BA50496-7C7B-4BAB-8ACF-8FF38DD4C0AB', N'md-game-controller-a', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1327644', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'660')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'71DF36E6-3D12-441F-8594-D4D07C0D8B78', N'ios-game-controller-b', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1327968', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'661')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'237C7499-288E-4C64-B340-D29883EA4E11', N'ios-game-controller-b-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1328296', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'662')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'775255E7-E65C-41AA-BFDC-0C4667CC850B', N'md-game-controller-b', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1328685', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'663')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F774DC8F-05C3-4AAC-B9C0-B9854F573B1E', N'ios-git-branch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1329016', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'664')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D19AC2D4-15A3-4BD9-BDD5-243089EA65BC', N'md-git-branch', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1329365', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'665')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8E2135B0-8BA0-435D-BBA7-2C62DE07CF94', N'ios-git-commit', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1329699', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'666')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'87DAE742-9C7A-4E66-BBC7-1C86E191DDD8', N'md-git-commit', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1330071', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'667')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D9BB6C02-4856-47E6-871A-728B660E6293', N'ios-git-compare', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1330406', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'668')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CD164115-12AB-4C4D-A465-93D9C20029A5', N'md-git-compare', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1330733', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'669')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6BE5B105-E8AA-4C11-9526-D09F65C2A132', N'ios-git-merge', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1331064', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'670')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'372313C5-5A4C-4950-9128-26A61344787F', N'md-git-merge', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1331430', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'671')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F60A0F5C-5415-4EF5-8ABF-002A8E7EFD3C', N'ios-git-network', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1331764', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'672')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'95AA3DF4-AD52-47F1-ACD7-177BAB97840E', N'md-folder-open', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1323889', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'673')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3E2E5FB6-5B98-47F2-A05F-DFF5679B3741', N'md-git-network', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1332088', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'674')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9FA311DF-F96C-422D-A214-E60215A89282', N'ios-folder-open-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1323326', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'675')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A42EB8A5-6962-4D92-A98C-9D78CD7E521B', N'md-folder', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1322674', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'676')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DD60DDC4-37B8-4AC5-93FF-04BF77446E22', N'md-filing', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1314957', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'677')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'417A9424-2675-4EF5-A337-62A4131A8388', N'ios-film', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1315288', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'678')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'93044959-9CA5-4056-B2C2-161CAE60CEF7', N'ios-film-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1315616', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'679')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'86EC3F4C-63F3-40B1-BCE5-56D4A0B4B896', N'md-film', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1315937', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'680')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'31C66C4F-E64F-42BF-BEC3-4DA7DAE4C0B1', N'ios-finger-print', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1316261', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'681')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'AA1F5504-EE8E-4C7C-8C1D-BADC477B97A2', N'md-finger-print', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1316626', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'682')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0658EEEC-A408-4DF4-AE0E-5BF355384B3C', N'ios-flag', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1316954', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'683')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6797E34B-74F8-4E4D-92F2-21F536D6EA86', N'ios-flag-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1317278', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'684')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'143B2451-E2CB-4196-A01B-A6EF181D746E', N'md-flag', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1317599', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'685')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'44E53737-957C-4E92-9B47-9FE40F80F8EB', N'ios-flame', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1317975', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'686')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'94CD7164-0279-4672-A0F7-3E4ABA6D8AA2', N'ios-flame-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1318302', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'687')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BE4F7C17-3D2E-4A5E-862C-03B8FD1C671E', N'md-flame', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1318627', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'688')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4BEEFCE7-A233-4DA3-BB26-034A16BC13C2', N'ios-flash', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1318951', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'689')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6CA62F78-F953-48DC-A4F2-A6BB6FB74887', N'ios-flash-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1319326', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'690')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F7A6E77C-9B21-49DD-B973-3F67BE249A67', N'md-flash', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1319660', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'691')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DD7B77D8-7042-47FA-9C46-6F3EE8759D94', N'ios-flask', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1319988', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'692')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8D884CBD-2740-4696-BE5B-8D992AF08CC3', N'ios-flask-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1320312', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'693')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'957BF0F3-44CF-4A31-AA4B-EF7E38ACA43D', N'md-flask', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1320636', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'694')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F9D909E6-EBA5-402D-AFE1-DA84A22CDD4E', N'ios-flower', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1321005', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'695')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2E28EEA0-5F48-4D7E-A7ED-278DD642DA99', N'ios-flower-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1321336', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'696')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'75EE7D1B-7B7D-4182-A811-B403D6990BF6', N'md-flower', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1321657', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'697')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4AC74D3C-15DC-4B68-9A0E-3CA5883C3115', N'ios-folder', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1321981', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'698')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A0DD8B9A-CAF2-4D56-9609-5368066ED910', N'ios-folder-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1322343', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'699')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A931F88A-3260-42E6-82FF-D0D865505004', N'ios-folder-open', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1323002', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'700')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4E65AB5F-5778-4B7A-8754-D3D8E6FFFD5C', N'ios-filing-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1314592', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'701')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'611754D2-026F-4504-A215-99975AE22D38', N'ios-git-pull-request', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1332416', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'702')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'275F193C-0538-4B80-8202-B2ACECA1790A', N'logo-github', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1333123', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'703')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'32079208-3520-4EAC-91C7-484C3FC63C50', N'md-heart-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1343489', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'704')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'034B24D3-9778-45C9-A154-57B759492F8C', N'ios-help', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1343817', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'705')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'078505F2-8BA3-46FC-9EB7-C9D1AC641F4F', N'md-help', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1344186', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'706')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9F052D2E-3385-4BDE-9025-107A85AE1CC4', N'ios-help-buoy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1344520', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'707')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5323816D-FB57-499A-954A-9CBF221A09BF', N'ios-help-buoy-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1344855', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'708')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'29AE01AE-5204-42C1-9EF0-78CE22452B6A', N'md-help-buoy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1345182', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'709')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B60040EA-68FB-42B6-9D2D-C5406FF13C4A', N'ios-help-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1345506', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'710')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7FBB6A60-19E0-421C-928B-B01F67291586', N'ios-help-circle-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1345879', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'711')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6E88176E-89FB-427B-9303-BF13D2BD5431', N'md-help-circle', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1346206', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'712')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2FD43661-F738-45DE-A3C3-9A72287892B4', N'ios-home', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1346530', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'713')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D0DD870C-1FAC-4365-86B5-32D91E1EE04E', N'ios-home-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1346855', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'714')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B32A7015-6490-4164-9676-D64A7F5F21A8', N'md-home', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1347217', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'715')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5838B339-83FE-4479-9DE6-D491FC39AF38', N'logo-html5', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1347551', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'716')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FD32090A-9894-4C60-90F8-26D3AEB8CD13', N'ios-ice-cream', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1347879', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'717')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1ABD61D2-7C9F-48E5-8F28-A3F9014B296B', N'ios-ice-cream-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1348203', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'718')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8BB1C910-CF8D-4477-99CB-FA8431681CDB', N'md-ice-cream', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1348565', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'719')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BFD39B20-7820-42C9-832F-8C1D192E9309', N'ios-image', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1348903', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'720')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6F2D047B-8C3B-4A11-8568-FCED331D6C99', N'ios-image-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1349281', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'721')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E37564BE-C21B-4E55-9487-149D13A4E8D3', N'md-image', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1349619', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'722')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D7968A5F-EC1B-420B-A5F9-3D9A8FC5B20F', N'ios-images', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1349947', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'723')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DD97C302-F395-4DB6-8A88-6DFC0D1386FA', N'ios-images-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1350377', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'724')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4A4F99A0-869A-4D85-9B75-124472984FD3', N'md-images', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1350712', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'725')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'34FB15DF-FC55-4A7B-AB31-380B80A5FCB1', N'ios-infinite', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1351039', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'726')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'4F0715A2-F2CA-4A4F-B3F0-50990E0CF89B', N'md-heart', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1343165', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'727')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5B4DC208-F53F-4387-B11B-AE5C30DD9988', N'md-git-pull-request', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1332744', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'728')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'51E57527-FAFB-4B2E-B6AB-5D61910E607E', N'ios-heart-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1342837', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'729')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EC6FEA57-5DA5-4EEE-B73D-C26A2311819F', N'md-headset', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1342138', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'730')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5E8A02BD-F4D7-4F60-B4D4-80554105DB5C', N'ios-glasses', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1333454', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'731')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'336F6DE0-0203-4C3E-A62E-061A070AEC93', N'ios-glasses-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1333785', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'732')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D8021C36-F59E-407C-8587-EF0E11452DF7', N'md-glasses', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1334109', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'733')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'231384D3-418A-4A83-8BC7-AFAF6FF31E84', N'ios-globe', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1334478', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'734')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0493B128-D370-49A5-BF83-96D615AFD1E3', N'ios-globe-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1334809', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'735')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'332A92E7-736B-40AE-8163-5FEEBEC22C7E', N'md-globe', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1335136', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'736')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D47F9B22-C27E-4573-BA11-8CC0C068C85A', N'logo-google', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1335461', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'737')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'40EE1F28-3EF0-4674-9589-284E081EAABE', N'logo-googleplus', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1335945', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'738')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8AE33FA0-6835-4760-98A4-01DD128F1DCC', N'ios-grid', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1336556', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'739')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5FC79D70-E701-4BFB-81EE-085C1C0485C6', N'ios-grid-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1337007', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'740')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B3653768-A2D9-40FE-A2DC-D9C6A2B06546', N'md-grid', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1337341', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'741')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'52DBDE73-EADA-4EE3-BC95-7F3FD2541CD8', N'logo-hackernews', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1337673', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'742')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BF1CA0D6-3555-44E5-A946-F83FBED0640C', N'ios-hammer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1338348', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'743')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'628D421A-A09C-4A9C-8DE8-374903778D4C', N'ios-hammer-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1338690', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'744')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C88791C4-14C7-4DA0-AAE0-D27898BA232B', N'md-hammer', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1339017', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'745')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F9D378EE-074E-4D0E-8363-3AE22D931164', N'ios-hand', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1339410', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'746')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CBDFBB00-6EC9-44C9-BF0A-468E62C3F048', N'ios-hand-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1339786', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'747')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'61ED3EAD-8440-4A79-8DF3-15C901980C60', N'md-hand', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1340127', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'748')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0ED068AC-744B-41BC-9A60-DEE65892BC12', N'ios-happy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1340455', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'749')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9F24E6CF-A3F2-41AE-B3D9-708E7DEF132F', N'ios-happy-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1340779', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'750')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'260FC72B-74B6-4F1C-A631-2CF2326B6BE8', N'md-happy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1341110', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'751')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F5DACC52-2D9D-4754-962F-A8F81BA47766', N'ios-headset', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1341486', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'752')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'48BFE01F-019A-4420-B27A-101B2EFEDAD3', N'ios-headset-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1341813', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'753')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E9E4D1CB-2211-4D2F-B6D3-5F75B103CD20', N'ios-heart', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1342465', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'754')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'91BE81E7-F6C5-4FC0-A426-A048AAABBF6E', N'logo-youtube', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1531525', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'755')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9FF04644-AADE-4B1E-8BC1-C97FEAEE7371', N'ios-filing', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1314268', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'756')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E52B5421-AECA-4FCD-9B4E-7A0DD2A0E249', N'ios-female', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1313612', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'757')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D3665444-798B-4A58-9A43-3B2A3034C9F9', N'ios-color-palette', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1281988', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'758')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'20B5EB52-7991-4191-9A69-F179C775B1D6', N'ios-color-palette-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1282579', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'759')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1F3721F6-8B18-46F2-80BC-E4ABFEC772C4', N'md-color-palette', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1283029', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'760')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5689ACB5-5079-4CA7-A2F7-5594606580AA', N'ios-color-wand', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1283381', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'761')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B27A098D-2D28-428B-B4DF-0C009DFCD1C1', N'ios-color-wand-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1283712', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'762')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C7988FF5-3E06-4092-B13A-1B53AC7FF7A4', N'md-color-wand', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1284507', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'763')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'676C67FC-DAC6-4547-9F3D-02154FE268B0', N'ios-compass', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1285306', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'764')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6C126160-91FF-4D2B-9A6A-FFE73D677F72', N'ios-compass-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1286477', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'765')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'171992B6-2075-4133-A4CF-061630357F0E', N'md-compass', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1287040', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'766')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F1645201-2F34-4A3E-92A3-C8D41987B6F3', N'ios-construct', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1287381', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'767')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A3795586-F1D8-481E-9A43-49C1C8810BA9', N'ios-construct-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1287712', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'768')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E369C1E5-F93B-45A3-9E86-7344E6DF693B', N'md-construct', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1288091', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'769')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0D32DD90-FACD-483F-BC36-36897EA81002', N'ios-contact', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1288432', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'770')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F4CC7EED-658C-41D7-BA3C-FE3BB6DABBC1', N'ios-contact-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1288760', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'771')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1B71835A-3303-4034-88D3-59465B6B0C2E', N'md-contact', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1289135', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'772')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9293E573-2E7C-4CC4-A75B-231F87D97ADD', N'ios-contacts', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1289476', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'773')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'502A3AD1-897C-46DD-A6BF-9772F60E86EC', N'ios-contacts-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1289865', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'774')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EF25EDE8-4270-493E-9507-82FDD4ECA2D0', N'md-contacts', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1290193', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'775')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'324C767D-AA9C-42AD-B5A7-4D028D59E1CF', N'ios-contract', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1290521', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'776')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'66DCD5A2-97F2-40E8-AF1A-36A1D9307DEC', N'md-contract', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1290848', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'777')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8CCC2408-45D5-4169-8E82-CEAC1737FD3B', N'ios-contrast', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1291220', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'778')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'836749F6-4A23-4203-84E8-C5BA89703B13', N'md-contrast', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1291552', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'779')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3153BBA9-C227-437A-859B-E205715AFAB8', N'ios-copy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1291883', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'780')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CE70B22F-9B6A-4EA3-A0B6-00A40C17C0A0', N'md-color-filter', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1281650', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'781')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F82CA649-2E5A-4294-A4BE-875D5D596AAE', N'ios-copy-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1292207', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'782')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'B169738F-7BAF-4DC1-8EC7-2DC1E267CFF3', N'ios-color-filter-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1281234', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'783')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'73B6C8A6-5BB4-4390-B615-E14BA737B295', N'md-color-fill', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1280063', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'784')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1CE17C78-74E2-4DF5-8D88-2450A2C923F3', N'md-cloud-download', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1270996', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'785')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'3DF1D86A-21B4-4FCB-8D5B-A9ED1369BD06', N'md-cloud-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1271321', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'786')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'659FD353-6B32-4983-8952-5834E73D7D2D', N'ios-cloud-upload', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1271648', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'787')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'EB40691C-30EB-43D6-8390-6039608D971F', N'ios-cloud-upload-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1272392', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'788')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A2275A78-91AF-4E0E-B004-D4D79B2B962E', N'md-cloud-upload', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1272771', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'789')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6DC10F02-330D-4620-B11C-E8BDD6327853', N'ios-cloudy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1273102', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'790')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F119181D-9146-449D-90BE-4E41988938D8', N'ios-cloudy-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1273430', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'791')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0D3C7056-B80F-4336-8ABE-41DBA0A05C57', N'md-cloudy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1273768', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'792')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'609AD96F-2B9D-4A3D-BDC7-7BEC77006BB4', N'ios-cloudy-night', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1274171', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'793')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CB4242BE-AE26-49B3-B2C9-A8CDEE0B3A96', N'ios-cloudy-night-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1274502', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'794')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9B5237FE-B4C4-4543-8258-C6D830D2FF9F', N'md-cloudy-night', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1274830', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'795')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'375B264B-4551-42C7-8A5D-25EEAF79F877', N'ios-code', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1275157', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'796')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0D398506-59CA-4B1B-9AA9-4284A773A85B', N'md-code', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1275533', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'797')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'11EB4E7A-AF1A-44C9-9170-AD38FDBFF6DF', N'ios-code-download', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1275864', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'798')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E25DD727-E010-4F29-A4CB-8ED048A34998', N'md-code-download', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1276188', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'799')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2941AC84-FC53-4356-8BF2-4A0A3BE18E9C', N'ios-code-working', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1276512', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'800')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2C109C87-3F00-4D92-8923-F073FDD467A1', N'md-code-working', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1276881', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'801')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CAD01277-B73D-490E-8D1F-56606582C73D', N'logo-codepen', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1277219', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'802')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'27DB6304-67A3-45C4-B8D6-569F1950A83C', N'ios-cog', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1277543', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'803')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9B6F4D0C-9A07-48DD-945B-58A582022C5A', N'ios-cog-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1277867', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'804')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'95EE186F-5FF5-4C8E-8151-B57471725761', N'md-cog', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1278427', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'805')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'80A4E9F0-E7BE-4F5D-9767-7BCBEB2E2330', N'ios-color-fill', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1278970', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'806')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A3281AE0-6CC3-45B8-AA3B-A3C93334A6AF', N'ios-color-fill-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1279701', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'807')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C5B6DF3A-68A9-4326-AB3E-4EECB4CC9169', N'ios-color-filter', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1280394', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'808')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2371EC00-7EE6-4D4F-B447-F6B708399C48', N'md-female', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1313944', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'809')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C0CBEC10-31F8-44D1-8EFB-6919460F923A', N'md-copy', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1292576', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'810')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C59E837A-E81B-461B-B00D-F7017A7D9A03', N'ios-create-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1293238', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'811')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A3A5CEF7-D6FB-48CF-9EA9-AC4A299BA054', N'logo-dropbox', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1305645', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'812')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'6AC235FB-914A-43A7-A93C-66E03A54E554', N'ios-easel', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1306021', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'813')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7C9E9A77-E4C3-41EA-BC49-D7F9F4A4F3CD', N'ios-easel-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1306352', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'814')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BC34203D-2C9B-49D6-BC78-867A9A7471FD', N'md-easel', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1306690', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'815')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0727ABDD-B082-4F6F-9F32-531EF74CA57A', N'ios-egg', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1307017', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'816')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A14DB401-6D49-4346-A4FA-0AAC3C8EA85C', N'ios-egg-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1307383', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'817')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1CD44896-D811-4803-A4A4-291E320E042D', N'md-egg', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1307720', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'818')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9C3C5CC0-0066-45F0-BFB6-DF784E780100', N'logo-euro', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1308048', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'819')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C287E761-8258-4C6A-91CE-82B54DFAF7B2', N'ios-exit', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1308372', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'820')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A07F1017-669F-4473-B3C8-833D2F9B78CF', N'ios-exit-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1308697', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'821')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'30969B8D-6932-417F-A063-68A68B35646E', N'md-exit', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1309175', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'822')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'902F147F-68E1-4A94-9931-B8AAB91DAADA', N'ios-expand', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1309510', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'823')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'485EC242-28F5-44C9-9605-7511D8B86B51', N'md-expand', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1309834', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'824')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'ECCB2E91-832A-4A6E-B9BC-E6A60B29D3F4', N'ios-eye', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1310155', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'825')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F7AB286D-0147-4AC1-B996-857DD63AA65E', N'ios-eye-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1310523', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'826')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'CB156741-3A3E-4CE5-BB1E-3F4A91BAB3BE', N'md-eye', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1310851', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'827')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1517A97A-1F97-42BF-B5B3-FA3CAF04F8A9', N'ios-eye-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1311175', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'828')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C2E13DD1-FB26-416C-932B-B6EBB0A0EDC3', N'ios-eye-off-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1311500', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'829')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2093ABC2-70DE-4752-A90E-ADEA1C2E1E7C', N'md-eye-off', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1311909', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'830')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C048149B-186A-400E-8A85-99F03E3CCFE3', N'logo-facebook', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1312268', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'831')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'36B72DF2-96FA-49C1-9E8D-1CD2B47A18FA', N'ios-fastforward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1312592', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'832')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9F76220A-13EF-4C93-9F06-EB5713686FAB', N'ios-fastforward-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1312920', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'833')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BEABE3D5-D138-4272-8F42-616998FB9E61', N'md-fastforward', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1313244', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'834')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8A95E477-3341-435A-8263-416B2653E869', N'logo-dribbble', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1305317', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'835')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'7B911021-6B65-4FB4-B250-7C6A492855D9', N'ios-create', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1292913', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'836')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'66D97DFE-356D-4112-BF94-5C5AE53901A9', N'md-download', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1304990', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'837')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'FE84B026-AE5A-4C7C-9DD7-544286C8154B', N'ios-download', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1304072', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'838')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9BD185C6-2D4C-4EE0-A7FC-151DA3D293D5', N'md-create', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1293569', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'839')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'79C4D357-17BA-441D-9646-D4CE9ADAECFA', N'ios-crop', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1293965', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'840')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'0B002F6E-4DA1-4F05-B02D-A579B21901EA', N'ios-crop-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1294354', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'841')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BF1AEBBF-4637-4090-A011-C06739F5B493', N'md-crop', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1294685', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'842')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'BB18122E-975C-43DC-A25C-9AACC3DABED2', N'logo-css3', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1295013', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'843')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'DAA1B63C-9E58-44AF-8E45-7C756545CC61', N'ios-cube', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1295395', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'844')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'2C0AD0BF-6CC7-458B-B500-6099311046D7', N'ios-cube-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1297378', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'845')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'883795D1-3443-45C4-B264-7993851BACE8', N'md-cube', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1297805', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'846')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'55A23221-33A7-4B1E-A112-2A6A71AE68AE', N'ios-cut', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1298139', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'847')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'005967B1-8C56-4671-BE5F-8277598E0DED', N'ios-cut-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1298467', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'848')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'46953413-DA76-49C5-B3B1-BB43871D6EB0', N'md-cut', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1298904', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'849')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C782A28A-4025-4F64-9813-51028645A4B1', N'logo-designernews', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1299334', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'850')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'27FBD0A0-4CD6-4124-8011-ADDFC0D43F04', N'ios-desktop', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1299685', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'851')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D251AA71-32A3-44E1-AD03-32588669B17F', N'ios-desktop-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1300013', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'852')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'54BEE93E-2E5F-465F-91EF-3FC1FDE76BA5', N'md-desktop', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1300337', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'853')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8DF827A6-7775-4954-9F57-9CB4A3728FF5', N'ios-disc', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1300716', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'854')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'1A634C62-47D4-44A5-B570-69D92556759E', N'ios-disc-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1301044', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'855')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'54DCED0A-2B2B-4BC4-BE4E-763439E5B250', N'md-disc', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1301392', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'856')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'48FD6F5D-3B37-49DD-8BF6-E095D3A24A4A', N'ios-document', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1301730', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'857')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'81C67599-7778-40AB-B66B-F3F80D56ABF8', N'ios-document-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1302099', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'858')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'C60B2474-51F1-414C-95BB-B72DEE0716B0', N'md-document', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1302440', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'859')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8BA4E4A8-6031-49E0-8114-1CDD158B4BA1', N'ios-done-all', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1303321', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'860')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'E160A968-1C03-4F22-80D2-746807384755', N'md-done-all', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1303737', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'861')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'D79BBE76-CAE5-4507-9E0E-D1854D53CA40', N'ios-download-outline', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1304659', N'00000000-0000-0000-0000-000000000000', N'超级管理员', NULL, NULL, NULL, N'862')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'A141F7C0-B18F-451E-AF82-08507B574023', N'ios-loading', N'1', NULL, NULL, NULL, N'0', N'0', N'2018-11-20 14:57:54.1531853', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-11-07 10:08:18.1699441', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'系统管理员', N'863')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'F2069B33-A022-4FD3-8AB6-BB5BC6F5E6BD', N'11', N'1', N'', N'111', N'123', N'1', N'1', N'2019-10-10 16:48:23.5720660', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'系统管理员', N'2019-10-15 09:27:20.5467932', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'系统管理员', N'864')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'8432479D-D0A3-4AFA-B86E-DB1FEF0DE46E', N'1', N'1', NULL, NULL, NULL, N'1', N'1', N'2019-10-11 11:16:03.2504211', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'超级管理员', NULL, NULL, NULL, N'865')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'9CA68FC6-2956-4864-AF3E-DA21190B44E3', N'2', N'1', NULL, NULL, NULL, N'0', N'1', N'2019-10-11 11:16:03.5183202', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'超级管理员', NULL, NULL, NULL, N'866')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'289705AF-79AD-4FAE-9095-5AA4DEBF563E', N'3', N'1', NULL, NULL, NULL, N'0', N'1', N'2019-10-11 11:16:03.5190909', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'超级管理员', NULL, NULL, NULL, N'867')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'5C278FF5-4714-4D19-8F83-47A30F564F30', N'4', N'1', NULL, NULL, NULL, N'0', N'1', N'2019-10-11 11:16:03.5193528', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'超级管理员', NULL, NULL, NULL, N'868')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'54E8F426-44E2-4D3E-B4D6-FBA1D10B54BC', N'asdfsadf', N'1', N'#5E88B5', NULL, NULL, N'1', N'1', N'2019-11-08 11:06:14.5638932', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'系统管理员', NULL, NULL, NULL, N'869')
GO

INSERT INTO [dbo].[SystemIcon] ([SystemIconUUID], [Code], [Size], [Color], [Custom], [Description], [Status], [IsDeleted], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [ID]) VALUES (N'30C11748-604E-4A9A-A46F-EFA212F720C4', N'dddd', N'24', N'', N'', N'', N'1', N'0', N'2019-11-08 11:13:06.0743408', N'20263DA4-AED4-4ABA-A6CC-B985C016858E', N'系统管理员', NULL, NULL, NULL, N'870')
GO

SET IDENTITY_INSERT [dbo].[SystemIcon] OFF
GO


-- ----------------------------
-- Table structure for SystemLog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemLog]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemLog]
GO

CREATE TABLE [dbo].[SystemLog] (
  [SystemLogUUID] uniqueidentifier DEFAULT (newid()) NOT NULL,
  [UserID] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserIDType] int  NULL,
  [UserName] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [OperationTime] datetime  NULL,
  [OperationContent] text COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [IPAddress] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Type] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [IsDelete] int  NOT NULL,
  [AddTime] datetime  NOT NULL,
  [AddPeople] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE [dbo].[SystemLog] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作用户ID',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'UserID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名和类型',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'UserIDType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作用户用户名',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'UserName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作时间',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'OperationTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作内容',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'OperationContent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'IP地址',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'IPAddress'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作类型(增删改查)',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'Type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标记删除1，未删除2，已删除',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统日志表',
'SCHEMA', N'dbo',
'TABLE', N'SystemLog'
GO


-- ----------------------------
-- Records of SystemLog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemLog] ON
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'56BBCF0A-0A1C-4B01-B1CD-06598B518F84', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:03:49.740', N'成功:查询:系统菜单管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:03:49.740', N'系统日志', N'1')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'D6878148-B7B4-4A4D-BA9A-FFF1985D1B98', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:05:06.360', N'成功:添加:系统菜单管理列表数据', NULL, N'添加', N'0', N'2020-11-24 15:05:06.360', N'系统日志', N'2')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'60FBF1C4-6CF5-4255-81EA-946756B0AA6C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:05:06.510', N'成功:查询:系统菜单管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:05:06.510', N'系统日志', N'3')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'87EEA6DC-84D6-4495-A43B-81638C66F3D7', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:05:09.747', N'成功:查询:系统菜单管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:05:09.747', N'系统日志', N'4')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'90EBC3C1-8F4B-434E-BD79-55D01F54D067', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:05:12.443', N'成功:查询:系统权限管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:05:12.443', N'系统日志', N'5')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'18A526D4-74F7-4C32-A1D7-B6A74CFE3A9B', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:25:42.473', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:25:42.473', N'系统日志', N'6')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'3F595899-F8A1-44E0-ADFA-B678F3B1E8BE', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:25:45.827', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:25:45.827', N'系统日志', N'7')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'DC458A25-9A12-4D1D-9F05-6B44E71833EC', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:25:46.810', N'成功:查询:留言建议管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:25:46.810', N'系统日志', N'8')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'A85F24BE-0EF5-40F4-A0A7-84D8D15DB87C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:25:47.667', N'成功:查询:推荐路线管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:25:47.667', N'系统日志', N'9')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'37E79110-172D-48DE-B60A-13FCB23D1950', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:25:51.673', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:25:51.673', N'系统日志', N'10')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'08821C28-6696-4E64-A845-2E6836E2EEEA', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:25:52.143', N'成功:查询:留言建议管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:25:52.143', N'系统日志', N'11')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'892D72A2-F04F-451A-BD3C-4097C09D9FE9', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 15:25:52.713', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-11-24 15:25:52.713', N'系统日志', N'12')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'DF4666BB-2325-41F1-842E-E36866A2089E', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:14:11.953', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:14:11.953', N'系统日志', N'13')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'122549F5-9803-4D20-A98A-C54488CACAED', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:14:13.053', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:14:13.053', N'系统日志', N'14')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'A87A1FD1-87EC-439D-B84C-FA24B74E48D3', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:14:37.570', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:14:37.570', N'系统日志', N'15')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C20D7C44-D7EF-4FB2-BE19-E224CEA79DDA', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:14:38.253', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:14:38.253', N'系统日志', N'16')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'7AD7A320-FF18-46B5-B1C1-350CE914D4DF', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:14:46.087', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:14:46.087', N'系统日志', N'17')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'D48467B7-9C1D-4271-9D8C-4936B9B90BFF', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:15:21.937', N'成功:查询:推荐路线管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:15:21.937', N'系统日志', N'18')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'A2910597-9260-4FB8-BB1F-402A804BEF81', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:15:46.177', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-11-24 16:15:46.177', N'系统日志', N'19')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'AE79D5D2-5B82-439D-BFAA-2C70DA46B5C2', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:15:47.210', N'成功:查询:游客服务导游管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:15:47.210', N'系统日志', N'20')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'82EF9C21-C460-4AC8-B753-4424446AC0CC', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:15:48.580', N'成功:查询:人文介绍列表数据', NULL, N'查询', N'0', N'2020-11-24 16:15:48.580', N'系统日志', N'21')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'012E0A82-5F09-413D-82C5-DE193D451643', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:15:50.110', N'成功:查询:自然资源列表数据', NULL, N'查询', N'0', N'2020-11-24 16:15:50.110', N'系统日志', N'22')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'7069F510-E751-424D-8230-C427C3A9E98D', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:15:51.520', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-11-24 16:15:51.520', N'系统日志', N'23')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'4C2B31BD-ED8A-45B8-81C3-3E817CF07D39', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:15:59.213', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-11-24 16:15:59.213', N'系统日志', N'24')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'990C1784-8EA8-4260-9280-65F700283D65', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:00.380', N'成功:查询:景区资讯列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:00.380', N'系统日志', N'25')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'8F97B3BF-AB10-424A-9654-C471D5C8A341', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:01.503', N'成功:查询:导视设备信息列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:01.503', N'系统日志', N'26')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'9F01BC69-5B2F-46DA-8C43-67943CE8C287', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:02.390', N'成功:查询:宣传视频列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:02.390', N'系统日志', N'27')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'EAE6908B-98E0-4270-A85D-0E08A413F722', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:03.083', N'成功:查询:导视设备信息列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:03.083', N'系统日志', N'28')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'93B11F37-E3B6-498D-B76B-B15C57D15DCE', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:07.327', N'成功:查询:宣传视频列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:07.327', N'系统日志', N'29')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'CC994EE6-2BCB-4845-818C-526EC8011EE6', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:17.577', N'成功:查询:标识管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:17.577', N'系统日志', N'30')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'ED6B3C8C-3609-4853-B6E4-96C2DD352A6C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:18.413', N'成功:查询:地图标识列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:18.413', N'系统日志', N'31')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'F76A0B6B-8883-4D11-BD56-8C88975F7207', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:18.920', N'成功:查询:语音导览管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:18.920', N'系统日志', N'32')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'74D2AC5D-438A-4197-A2CF-11D5981701EA', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:19.450', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:19.450', N'系统日志', N'33')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'38A3BE72-5D0A-4FC5-B5D3-9BFD89DB9786', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:19.903', N'成功:查询:特色采摘列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:19.903', N'系统日志', N'34')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'4D594E78-6D60-4595-AEDE-5C5D7A47466C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:20.210', N'成功:查询:停车场列表信息数据', NULL, N'查询', N'0', N'2020-11-24 16:16:20.210', N'系统日志', N'35')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'9A665F69-610A-4A41-9C60-E686B8341BAB', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:20.657', N'成功:查询:酒店民宿列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:20.657', N'系统日志', N'36')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'EE8DCF02-54D3-4DD4-8698-09E166E44D00', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:16:21.420', N'成功:查询:公交路线管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:16:21.420', N'系统日志', N'37')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'DEEF873B-DC6D-4040-8A82-1EE1E639AD80', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:36:28.990', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:36:28.990', N'系统日志', N'38')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'57CF2203-F295-45B7-9891-3941330FBD40', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 16:36:29.473', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-24 16:36:29.473', N'系统日志', N'39')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'83505DAE-2DF8-456D-AF92-10B0B4EA1184', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 17:09:22.583', N'成功:查询:系统角色管理列表数据', NULL, N'查询', N'0', N'2020-11-24 17:09:22.583', N'系统日志', N'40')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'820C0A0F-ACBA-425F-9615-F901B24F85F5', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 17:09:24.580', N'成功:查询:系统用户管理列表数据', NULL, N'查询', N'0', N'2020-11-24 17:09:24.580', N'系统日志', N'41')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'130D3BB6-999A-4CC5-891F-66E9D21F3A8B', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 17:09:37.043', N'成功:查询:系统权限管理列表数据', NULL, N'查询', N'0', N'2020-11-24 17:09:37.043', N'系统日志', N'42')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C28268DE-E541-4140-A16F-5CD8F2FC3047', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-24 17:10:22.010', N'成功:查询:系统权限管理列表数据', NULL, N'查询', N'0', N'2020-11-24 17:10:22.010', N'系统日志', N'43')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'72A20FBF-FE09-482B-A7D2-D168312B4446', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:00:01.823', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:00:01.823', N'系统日志', N'44')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C16755F0-691A-4352-92A5-77A6785F2878', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:00:02.807', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:00:02.807', N'系统日志', N'45')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'679A2D5C-D919-4098-B9F9-BC44B85EBD2E', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:00:05.027', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:00:05.027', N'系统日志', N'46')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'E6899205-ECB6-4490-8C1B-B2224F495F92', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:01:05.997', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:01:05.997', N'系统日志', N'47')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'43FC3596-F12C-4B8A-B7B9-4B6F3F99F104', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:01:07.080', N'成功:查询:留言建议管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:01:07.080', N'系统日志', N'48')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'AD4C3228-1F29-4223-8FC5-9BBAA169D93A', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:01:08.830', N'成功:查询:推荐路线管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:01:08.830', N'系统日志', N'49')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'FC76AF36-BBAE-49B5-A1E7-6013204ADE01', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:01:24.180', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-11-25 10:01:24.180', N'系统日志', N'50')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'32D8D706-2F07-471F-95C2-92526FB24EA8', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:01:25.320', N'成功:查询:游客服务导游管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:01:25.320', N'系统日志', N'51')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'DA0ADF00-2090-48A3-B9BF-376D6F118D2A', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:03:57.627', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:03:57.627', N'系统日志', N'52')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'10D32967-4DCD-4D66-9804-4AA5CFBBFF1E', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:06:46.877', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:06:46.877', N'系统日志', N'53')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'E6F91C76-4670-4AC6-AA6D-BD85DCE192AA', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:07:06.637', N'成功:查询:推荐路线管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:07:06.637', N'系统日志', N'54')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'F071DC68-774C-421B-8DEC-5C53C172558A', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:08:05.257', N'成功:查询:标识管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:08:05.257', N'系统日志', N'55')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'DA8FF5E0-046F-4192-83BD-B5D28F829DC8', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:08:11.207', N'成功:查询:地图标识列表数据', NULL, N'查询', N'0', N'2020-11-25 10:08:11.207', N'系统日志', N'56')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'FA74420C-F21B-461B-BFB7-0F15EDEEC20D', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:08:25.080', N'成功:查询:语音导览管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:08:25.080', N'系统日志', N'57')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'AB655DC9-5F99-45F3-A7EE-09A963A84FCE', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:08:50.723', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-11-25 10:08:50.723', N'系统日志', N'58')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'6D261CD6-768B-4A5B-9182-AC68EB9E6C5B', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:08:52.407', N'成功:查询:停车场列表信息数据', NULL, N'查询', N'0', N'2020-11-25 10:08:52.407', N'系统日志', N'59')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'7F3CE425-3562-4ECB-9BDA-593C88063B13', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:09:17.133', N'成功:查询:共享单车点位管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:09:17.133', N'系统日志', N'60')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'7CC0532A-2C0D-4C83-8BFA-5DB14BAB9132', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:09:18.877', N'成功:查询:停车场列表信息数据', NULL, N'查询', N'0', N'2020-11-25 10:09:18.877', N'系统日志', N'61')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'7CE8F347-696B-411E-A12E-7180AEC76A39', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:09:37.767', N'成功:查询:银行管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:09:37.767', N'系统日志', N'62')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'B81EF051-DF3C-44CE-A770-6B9A3A368D96', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:09:38.793', N'成功:查询:卫生所管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:09:38.793', N'系统日志', N'63')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'A4971D60-4155-445E-85AD-6220C62046C2', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:09:39.527', N'成功:查询:3A公厕管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:09:39.527', N'系统日志', N'64')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'60B1FB60-D58F-4376-83D6-05C7CD04B29A', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:10:38.873', N'成功:查询:文章类型列表数据', NULL, N'查询', N'0', N'2020-11-25 10:10:38.873', N'系统日志', N'65')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C1D6A121-1220-4A13-8770-BE669A776705', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:10:39.563', N'成功:查询:文章管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:10:39.563', N'系统日志', N'66')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'F426434E-521E-480C-B7C2-0A04A7761F27', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:10:44.483', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:10:44.483', N'系统日志', N'67')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'AC3963E5-97D2-4947-89F8-074EC4994230', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:10:45.957', N'成功:查询:留言建议管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:10:45.957', N'系统日志', N'68')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'9CCA0DF3-3DC7-4749-8853-508148FB515C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:10:48.030', N'成功:查询:推荐路线管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:10:48.030', N'系统日志', N'69')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'22B5827B-EE83-4347-8D23-E0A38B496B21', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:10:49.350', N'成功:查询:留言建议管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:10:49.350', N'系统日志', N'70')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'84B20331-B1A4-4931-A0C8-0B0842F49F3D', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:11:00.700', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:11:00.700', N'系统日志', N'71')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'31F03F3C-84C3-4F7E-BA4D-79C1687B09D5', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:11:01.583', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:11:01.583', N'系统日志', N'72')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'BE8564CC-ACBA-4BD9-998A-ACC3FA6CA0FA', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:11:05.170', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:11:05.170', N'系统日志', N'73')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'CD5ECBDB-75BF-4A8E-BAC6-A1899F7FD10F', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:11:07.263', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:11:07.263', N'系统日志', N'74')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'6469CDD1-FEDB-4289-B244-F1C03DA3EED7', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:12:04.867', N'成功:查询:景区管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:12:04.867', N'系统日志', N'75')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'FDD3DB0C-0264-4590-AC68-082AABECB42A', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:14:34.987', N'成功:查询:景点介绍管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:14:34.987', N'系统日志', N'76')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'2474894B-E904-4DED-9C52-A0858812D2D1', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:32:15.537', N'成功:查询:系统菜单管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:32:15.537', N'系统日志', N'77')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'BB6E02CE-27C7-407F-914D-7CE7CA395C92', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:32:22.017', N'成功:查询:系统菜单管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:32:22.017', N'系统日志', N'78')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'ED7DD9EC-674E-4AF6-B50E-8DEDB738E97E', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:34:46.813', N'成功:查询:系统用户管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:34:46.813', N'系统日志', N'79')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'AA7104A7-22E8-40B2-8903-0756DED1987D', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:34:46.973', N'成功:查询:系统角色管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:34:46.973', N'系统日志', N'80')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C6F92B7B-2586-4747-AC0D-C94A1DF1A84C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-11-25 10:34:47.560', N'成功:查询:系统权限管理列表数据', NULL, N'查询', N'0', N'2020-11-25 10:34:47.560', N'系统日志', N'81')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'89ED561C-1936-4012-A480-4BFF8FE66F8B', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 16:11:09.720', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 16:11:09.720', N'系统日志', N'82')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'24259020-3295-4305-8410-6A63370BCEDD', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 16:11:11.623', N'成功:查询:特色采摘列表数据', NULL, N'查询', N'0', N'2020-12-10 16:11:11.623', N'系统日志', N'83')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'48C0A63E-3BC1-420C-ADE0-4348C2394594', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 16:11:13.373', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 16:11:13.373', N'系统日志', N'84')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'D2C05D31-F3B0-4996-AE9C-C99EDAAAC60B', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 16:15:10.610', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 16:15:10.610', N'系统日志', N'85')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'38EF7F25-42C7-4159-A6E2-511A8F78FB24', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 16:26:40.717', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 16:26:40.717', N'系统日志', N'86')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'E3F51449-43E0-443D-9531-C8E1F85B269F', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 17:09:16.857', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 17:09:16.857', N'系统日志', N'87')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'8427E953-33ED-4018-B058-70DEFD59FD56', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 20:14:35.167', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 20:14:35.167', N'系统日志', N'88')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'D80B0B22-27F1-408D-8509-4AEBA5CC2739', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 20:14:45.933', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 20:14:45.933', N'系统日志', N'89')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'423F5AC4-1DCA-40F0-9DC5-59FE20ECFD5C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 20:15:07.637', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 20:15:07.637', N'系统日志', N'90')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C4E93DE6-367C-457C-85F1-16FA27554B87', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-10 20:18:25.493', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-10 20:18:25.493', N'系统日志', N'91')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'BEAFE0FC-AFBB-4DE8-912A-A4E2F79A3A30', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-11 10:18:03.743', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-11 10:18:03.743', N'系统日志', N'92')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'9FE4DCC8-A9DB-47F7-BA0F-B81904021FA3', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-11 10:18:23.293', N'成功:编辑:美食特产列表数据', NULL, N'编辑', N'0', N'2020-12-11 10:18:23.293', N'系统日志', N'93')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'0B178ABD-93EC-42E8-A2F0-2ACC851BB3F0', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-11 10:18:23.473', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-11 10:18:23.473', N'系统日志', N'94')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'4C36479E-9142-4AF1-816C-354C77D72688', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-11 16:25:59.290', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-12-11 16:25:59.290', N'系统日志', N'95')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'46A8BF9D-D250-4A84-8C2F-08413C809245', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-11 16:26:21.743', N'成功:审核:攻略发布管理列表数据', NULL, N'审核', N'0', N'2020-12-11 16:26:21.743', N'系统日志', N'96')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'631BA5D4-93BA-4AB9-8600-49D88C91B52F', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-11 16:26:21.840', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-12-11 16:26:21.840', N'系统日志', N'97')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'3F1E27D9-F28A-4955-9BC1-7A5C6EF6398C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 12:00:09.387', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 12:00:09.387', N'系统日志', N'98')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'3FDEB2E4-3C53-4EBA-AE84-BA2036951F51', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 12:01:23.607', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 12:01:23.607', N'系统日志', N'99')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'DF62E9C6-4B19-413D-91BE-48DEAB898F2E', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 12:01:50.740', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 12:01:50.740', N'系统日志', N'100')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'A129B001-68E6-46F2-BEFB-E4DACECF86FE', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 12:01:55.500', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 12:01:55.500', N'系统日志', N'101')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'872C4EA0-DD45-45BC-9F7C-40FDF214E887', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 14:30:11.133', N'成功:查询:特色采摘列表数据', NULL, N'查询', N'0', N'2020-12-14 14:30:11.133', N'系统日志', N'102')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'F294F30F-15E0-41B4-9662-90BCC7E626C9', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 14:30:13.720', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 14:30:13.720', N'系统日志', N'103')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'D4813260-6F92-4B6C-B553-5AA6BD10366B', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 14:57:00.260', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 14:57:00.260', N'系统日志', N'104')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'DCB7858E-39E9-492B-A8B9-B27B7D95C0CC', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 14:57:04.873', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 14:57:04.873', N'系统日志', N'105')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'511A33F4-F90C-490C-A270-39AA82A82680', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 15:39:43.107', N'成功:编辑:美食特产列表数据', NULL, N'编辑', N'0', N'2020-12-14 15:39:43.107', N'系统日志', N'106')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'EC32A53B-1D34-48B0-8F93-21328BDB4907', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 15:39:43.237', N'成功:查询:美食特产列表数据', NULL, N'查询', N'0', N'2020-12-14 15:39:43.237', N'系统日志', N'107')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C2AD4D42-7571-4263-B728-1788ACE5827F', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 16:18:46.453', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-12-14 16:18:46.453', N'系统日志', N'108')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'0F71048A-C4CC-49BC-A801-697F070652A3', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 16:44:13.113', N'成功:审核:攻略发布管理列表数据', NULL, N'审核', N'0', N'2020-12-14 16:44:13.113', N'系统日志', N'109')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'205B0E64-E036-4167-85E9-97DEB921B869', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 16:44:13.353', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-12-14 16:44:13.353', N'系统日志', N'110')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'EE576406-3394-4423-8D70-01C7B1D04700', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 16:44:17.773', N'成功:审核:攻略发布管理列表数据', NULL, N'审核', N'0', N'2020-12-14 16:44:17.773', N'系统日志', N'111')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'40ACDF4F-2C61-40D8-AC20-E0DE96407F9D', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-14 16:44:17.883', N'成功:查询:攻略发布管理列表数据', NULL, N'查询', N'0', N'2020-12-14 16:44:17.883', N'系统日志', N'112')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'0A16288A-EC2C-41A0-9341-C01D11F883B1', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:44:31.637', N'成功:查询:自然资源列表数据', NULL, N'查询', N'0', N'2020-12-15 16:44:31.637', N'系统日志', N'113')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'1947C508-7E70-4BF5-9380-A44308387FFD', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:44:55.493', N'成功:查询:人文介绍列表数据', NULL, N'查询', N'0', N'2020-12-15 16:44:55.493', N'系统日志', N'114')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'1620ECF5-D509-4EFC-882E-FB1C21F32530', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:47:48.550', N'成功:编辑:人文介绍列表数据', NULL, N'编辑', N'0', N'2020-12-15 16:47:48.550', N'系统日志', N'115')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'2800EA06-5B70-489E-8237-B8330CC18695', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:47:48.770', N'成功:查询:人文介绍列表数据', NULL, N'查询', N'0', N'2020-12-15 16:47:48.770', N'系统日志', N'116')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'290FC2A4-B4B1-4A7C-A058-BC8C0A1B49DC', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:53:21.337', N'成功:查询:自然资源列表数据', NULL, N'查询', N'0', N'2020-12-15 16:53:21.337', N'系统日志', N'117')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'69B0A348-88D8-4ACE-B28C-39C3DFB4BAEB', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:53:32.647', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-12-15 16:53:32.647', N'系统日志', N'118')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'74094809-CEEE-49EF-9248-64DF283275E5', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:53:37.873', N'成功:编辑:文章管理列表数据', NULL, N'编辑', N'0', N'2020-12-15 16:53:37.873', N'系统日志', N'119')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'5278EA94-5984-4412-9178-3F9AB964AC68', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:53:37.983', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-12-15 16:53:37.983', N'系统日志', N'120')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'A0136516-F7C6-4D4C-ACDF-9A264C423430', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:53:52.120', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-12-15 16:53:52.120', N'系统日志', N'121')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C2BF7A8D-A612-4F13-BAC3-8F2A0CAAEBF8', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:56:37.413', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-12-15 16:56:37.413', N'系统日志', N'122')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C98C9CA0-4CBC-478D-A9C6-A7D5104AF24B', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:57:28.080', N'成功:编辑:文章管理列表数据', NULL, N'编辑', N'0', N'2020-12-15 16:57:28.080', N'系统日志', N'123')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'58A610C7-142E-47FE-8953-029C0339C4C0', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:57:28.347', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-12-15 16:57:28.347', N'系统日志', N'124')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'582C4138-3AA7-400D-9FD6-A5020DE5AB79', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:59:37.520', N'成功:查询:自然资源列表数据', NULL, N'查询', N'0', N'2020-12-15 16:59:37.520', N'系统日志', N'125')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'25B1F1F3-820A-44DD-8A46-F7132D552334', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:59:53.897', N'成功:编辑:自然资源列表数据', NULL, N'编辑', N'0', N'2020-12-15 16:59:53.897', N'系统日志', N'126')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'94560E21-C78B-4BCE-953F-303897C3C608', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 16:59:54.010', N'成功:查询:自然资源列表数据', NULL, N'查询', N'0', N'2020-12-15 16:59:54.010', N'系统日志', N'127')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'713490FC-8429-4D31-8883-008BF7461B4C', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:00:44.663', N'成功:查询:宣传图片列表数据', NULL, N'查询', N'0', N'2020-12-15 17:00:44.663', N'系统日志', N'128')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'6BFEF5C3-99FD-4749-9ECB-4B3A0CFCB7F0', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:00:46.063', N'成功:查询:自然资源列表数据', NULL, N'查询', N'0', N'2020-12-15 17:00:46.063', N'系统日志', N'129')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'FF84B34B-9FA2-4616-BAE0-1A44A0394CAA', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:01:44.770', N'成功:编辑:自然资源列表数据', NULL, N'编辑', N'0', N'2020-12-15 17:01:44.770', N'系统日志', N'130')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'3F6CA98A-08AB-413D-9531-9B325296DDB1', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:01:45.007', N'成功:查询:自然资源列表数据', NULL, N'查询', N'0', N'2020-12-15 17:01:45.007', N'系统日志', N'131')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'A34108F3-8A5C-4E24-B9EF-B820EDC25EBA', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:02:28.803', N'成功:查询:人文介绍列表数据', NULL, N'查询', N'0', N'2020-12-15 17:02:28.803', N'系统日志', N'132')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'5D82A735-EC41-46B7-83A1-C553E81BDDED', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:02:33.580', N'成功:编辑:人文介绍列表数据', NULL, N'编辑', N'0', N'2020-12-15 17:02:33.580', N'系统日志', N'133')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'E8786CBD-701C-4C91-88E6-FA2641526BDF', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:02:33.673', N'成功:查询:人文介绍列表数据', NULL, N'查询', N'0', N'2020-12-15 17:02:33.673', N'系统日志', N'134')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'40D9D97F-1D30-4322-AC27-C1723B4CDEFF', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:03:18.130', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:03:18.130', N'系统日志', N'135')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'CBDFE3DC-276C-4C67-B8D1-DBF78E206CD5', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:05:09.980', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:05:09.980', N'系统日志', N'136')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'1C477B1B-B07F-4656-AE1C-225D37219D0D', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:05:13.510', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:05:13.510', N'系统日志', N'137')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'F8EDF13F-4782-42A7-8D85-F521655E52F7', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:05:40.683', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:05:40.683', N'系统日志', N'138')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'943FC131-7DB2-42D8-96A2-DEC149F0B4CF', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:05:55.933', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:05:55.933', N'系统日志', N'139')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'EF079422-E209-4196-8697-CA8016AD694E', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:07:41.657', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:07:41.657', N'系统日志', N'140')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'B9F68B12-7505-48AA-9EF5-6FABDD2B9C4E', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:08:00.127', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:08:00.127', N'系统日志', N'141')
GO

INSERT INTO [dbo].[SystemLog] ([SystemLogUUID], [UserID], [UserIDType], [UserName], [OperationTime], [OperationContent], [IPAddress], [Type], [IsDelete], [AddTime], [AddPeople], [ID]) VALUES (N'C8D1B116-34D4-4CF4-AC29-741D4D844D64', N'423968df-a15d-4b5f-9e25-005486496332', NULL, N'admin', N'2020-12-15 17:08:07.807', N'成功:查询:游客服务列表列表数据', NULL, N'查询', N'0', N'2020-12-15 17:08:07.807', N'系统日志', N'142')
GO

SET IDENTITY_INSERT [dbo].[SystemLog] OFF
GO


-- ----------------------------
-- Table structure for SystemMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemMenu]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemMenu]
GO

CREATE TABLE [dbo].[SystemMenu] (
  [SystemMenuUUID] uniqueidentifier  NOT NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Url] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Alias] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Icon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentGuid] uniqueidentifier  NULL,
  [ParentName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Level] int  NULL,
  [Description] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sort] int  NULL,
  [Status] int  NULL,
  [IsDeleted] int  NULL,
  [IsDefaultRouter] int  NULL,
  [CreatedOn] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreatedByUserGuid] uniqueidentifier  NULL,
  [CreatedByUserName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifiedOn] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifiedByUserGuid] uniqueidentifier  NULL,
  [ModifiedByUserName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Component] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [HideInMenu] int  NULL,
  [NotCache] int  NULL,
  [BeforeCloseFun] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE [dbo].[SystemMenu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单表',
'SCHEMA', N'dbo',
'TABLE', N'SystemMenu'
GO


-- ----------------------------
-- Records of SystemMenu
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemMenu] ON
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'10E1E5FF-C422-4172-A6D4-04C1043CD9FA', N'菜单管理', N'rbac/menu', N'rbac_menu_page', N'md-menu', N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'用户权限管理', N'1', N'', N'0', N'1', N'0', N'1', N'2018-11-29 15:28:58.9791695', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-10-11 13:57:30.3935479', N'423968DF-A15D-4B5F-9E25-005486496332', N'系统管理员', N'/rbac/menu.vue', N'0', N'0', N'', N'1')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'6F5B8AAE-0385-4686-9DAF-1C67914D8191', N'角色管理', N'rbac/role', N'rbac_role_page', N'md-contacts', N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'用户权限管理', N'1', N'', N'0', N'1', N'0', N'0', N'2018-11-29 15:28:03.7683462', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2020-06-30', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/rbac/role.vue', N'0', N'0', N'', N'2')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'FB49CF5F-6161-4F41-9F3C-2E9BC4C7B1BB', N'图标管理', N'rbac/icon', N'rbac_icon_page', N'logo-codepen', N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'用户权限管理', N'1', N'', N'0', N'0', N'0', N'0', N'2018-12-13 11:55:14.0321126', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2020-04-14', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/rbac/icon.vue', N'0', N'0', N'', N'3')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'335DF74F-1944-47C0-AF45-421E2108AA71', N'角色权限分配', N'rbac/role-permission', N'rbac_role_permission_page', N'md-aperture', N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'用户权限管理', N'1', N'', N'0', N'1', N'0', N'0', N'2018-12-11 15:23:35.3297552', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-05-04 16:54:55.6121480', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/rbac/role-permission.vue', N'0', N'0', N'', N'4')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'54705AB2-7CFA-48A6-BB84-4E8462E1BAE6', N'错误页面(500)', N'error_500', N'error_500', N'md-settings', N'11CD774B-42D9-4386-AF84-C9D86E9BFD3A', N'默认路由管理', N'1', N'', N'0', N'0', N'0', N'1', N'2018-12-13 15:34:26.3676747', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2018-12-22 16:52:07.4335183', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'0', N'0', N'', N'5')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'793E0F5D-0846-46DE-968D-5E59D919B153', N'系统设置', N'system/settings', N'system_settings', N'md-settings', N'A99F7DE6-94BC-4DF1-87D9-A1A6D117B653', N'系统管理', N'1', N'', N'0', N'0', N'0', N'0', N'2018-11-20 17:24:31.5589935', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-05-04 16:56:35.1874889', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'0', N'0', N'', N'6')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'系统管理', N'rbac', N'rbac', N'ios-contacts', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'1', N'', N'10', N'1', N'0', N'0', N'2018-11-20 17:21:44.5754399', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-09-07 17:46:17.2956018', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'0', N'0', N'', N'7')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'09DB3972-7BBC-44B8-B022-6C8B8BDD9D54', N'权限管理', N'rbac/permission', N'rbac_permission_page', N'md-apps', N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'用户权限管理', N'1', N'', N'0', N'1', N'0', N'0', N'2018-11-29 15:28:39.9135871', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-05-04 16:55:11.9651340', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/rbac/permission.vue', N'0', N'0', N'', N'8')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'A99F7DE6-94BC-4DF1-87D9-A1A6D117B653', N'系统管理', N'system', N'system', N'md-cog', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'1', N'', N'10', N'0', N'0', N'0', N'2018-11-20 17:20:39.8179612', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-09-07 18:12:23.0094240', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'1', N'0', N'', N'9')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'2F458429-3976-408F-8A4F-AACBFE7D82CC', N'用户管理', N'rbac/user', N'rbac_user_page', N'md-contact', N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'用户权限管理', N'1', N'', N'0', N'1', N'0', N'0', N'2018-11-29 15:27:42.3759148', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-05-04 16:55:28.7549212', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/rbac/user.vue', N'0', N'0', N'', N'10')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'693D91A5-642E-4EAF-9151-ACECC7C8BE32', N'错误页面(401)', N'error_401', N'error_401', N'md-warning', N'11CD774B-42D9-4386-AF84-C9D86E9BFD3A', N'默认路由管理', N'1', N'', N'0', N'0', N'0', N'1', N'2018-12-13 15:33:09.0694228', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2018-12-22 16:51:42.7342256', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'0', N'0', N'', N'11')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'F5C4D99E-9552-48A5-A1E5-C13EEA256DF3', N'错误页面(404)', N'error_404', N'error_404', N'md-eye-off', N'11CD774B-42D9-4386-AF84-C9D86E9BFD3A', N'默认路由管理', N'1', N'', N'0', N'0', N'0', N'1', N'2018-12-13 15:34:00.4081314', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2018-12-22 16:51:48.4673496', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'0', N'0', N'', N'12')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'11CD774B-42D9-4386-AF84-C9D86E9BFD3A', N'默认路由管理', N'default-router', N'default_router', N'md-planet', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'1', N'', N'0', N'0', N'0', N'0', N'2018-12-13 15:29:01.3529460', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2019-09-07 17:41:10.0048392', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'1', N'0', N'', N'13')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'093B5CB0-B518-4CBD-9B2A-ECE7B11A3507', N'首页', N'home', N'home', N'md-home', N'11CD774B-42D9-4386-AF84-C9D86E9BFD3A', N'默认路由管理', N'1', N'', N'0', N'1', N'0', N'0', N'2018-12-13 15:29:35.5748712', N'00000000-0000-0000-0000-000000000000', N'超级管理员', N'2018-12-22 16:52:17.9674346', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'0', N'0', NULL, N'15')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'2DCAE7BC-1587-41F4-8EFA-1430F541370F', N'景区管理', N'scene', N'scene', N'ios-camera', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'1', N'', N'0', N'1', N'0', N'0', N'2020-07-24', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-29', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, N'0', N'0', NULL, N'16')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'A42979B1-CE56-47B7-A2F1-BFA9B85C3321', N'景点设施管理', N'scene/scenicspot', N'scene_scenicspot', N'ios-camera-outline', N'2DCAE7BC-1587-41F4-8EFA-1430F541370F', N'景点管理', N'1', N'', N'2', N'1', N'0', N'0', N'2020-07-24', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-29', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/scene/scenicspot.vue', N'0', N'0', NULL, N'17')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'C339BD4B-A8CB-4D8F-8198-BEABFF4CA156', N'消息管理', N'news', N'news', N'ios-text', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'1', N'', N'0', N'1', N'1', N'0', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, N'0', N'0', NULL, N'18')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'260B933C-901D-4F50-9D9D-BFB4D43F1BD0', N'消息管理', N'news/news', N'new', N'ios-text-outline', N'C339BD4B-A8CB-4D8F-8198-BEABFF4CA156', N'消息管理', N'1', N'', N'0', N'1', N'1', N'0', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/news/news.vue', N'0', N'0', NULL, N'19')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'intelligentguide', N'intelligentguide', N'ios-ionitron-outline', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'1', N'', N'1', N'1', N'0', N'0', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, N'0', N'0', NULL, N'20')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'C9158F5F-5F0B-42CE-AEDC-29D53062028F', N'标点管理', N'intelligentguide/mark', N'intelligentguide_mark', N'logo-markdown', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'1', N'', N'0', N'1', N'0', N'0', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-07-28', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/intelligentguide/mark.vue', N'0', N'0', NULL, N'21')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'CA09CC3A-F42E-41FB-A39D-E8F4804E2740', N'语音设置', N'intelligentguide/videomark', N'intelligentguide_videomark', N'ios-volume-up', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'1', N'', N'2', N'1', N'0', N'0', N'2020-07-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-07-28', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/intelligentguide/videomark.vue', N'0', N'0', NULL, N'22')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'B8B22862-F396-4D8A-96C1-DC64CA467430', N'标点设置', N'intelligentguide/mapmark', N'intelligentguide_mapmark', N'md-map', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'1', N'1', N'0', N'0', N'2020-07-28', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/intelligentguide/mapmark.vue', N'0', N'0', NULL, N'23')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'79066B95-452C-4029-A9C9-7C62887F4D42', N'美食特产', N'intelligentguide/food', N'intelligentguide_food', N'ios-ice-cream', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'3', N'1', N'0', N'0', N'2020-07-28', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/intelligentguide/food.vue', N'0', N'0', NULL, N'24')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'BA1A8D51-CC2A-4978-8A13-5FA00933E9B1', N'特色采摘', N'intelligentguide/specialpick', N'intelligentguide_specialpick', N'md-cut', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'4', N'1', N'0', N'0', N'2020-07-28', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/intelligentguide/specialpick.vue', N'0', N'0', NULL, N'25')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'D3B63D2E-3242-49A7-A90F-1517088B6EEE', N'停车场', N'intelligentguide/carpark', N'intelligentguide_carpark', N'ios-car', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'5', N'1', N'0', N'0', N'2020-07-28', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/intelligentguide/carpark.vue', N'0', N'0', NULL, N'26')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'78F90822-52A9-4356-A566-F5B8F0C5F24F', N'消息管理', N'newManage', N'newManage', N'ios-text', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'0', N'', N'0', N'1', N'0', N'0', N'2020-07-29', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, NULL, N'0', N'0', NULL, N'27')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'AA2AC198-BACD-4C0F-8AF5-1867114DC98A', N'消息发布', N'newManage/newRelease', N'newRelease', N'ios-cloud-upload-outline', N'78F90822-52A9-4356-A566-F5B8F0C5F24F', N'消息管理', N'1', N'', N'0', N'1', N'0', N'0', N'2020-07-29', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-07-29', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/newManage/newRelease.vue', N'0', N'0', NULL, N'28')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'776EDF3D-E775-446D-A518-2011AD7C12A8', N'景区宣传', N'spotpublicity', N'spotpublicity', N'ios-albums', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'1', N'', N'0', N'0', N'0', N'0', N'2020-08-13', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'', N'1', N'0', NULL, N'29')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'4D11EA74-6472-463E-9E5E-30BB983E4832', N'宣传类别', N'spotpublicity/publicitytype', N'spotpublicity_publicitytype', N'md-medal', N'776EDF3D-E775-446D-A518-2011AD7C12A8', N'景区宣传', N'1', N'', N'0', N'0', N'0', N'0', N'2020-08-13', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/spotpublicity/publicitytype.vue', N'1', N'0', NULL, N'30')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'233AF090-B574-4B22-B692-B67531A4D010', N'宣传管理', N'spotpublicity/publicity', N'spotpublicity_publicity', N'md-phone-landscape', N'776EDF3D-E775-446D-A518-2011AD7C12A8', N'景区宣传', N'1', N'', N'1', N'0', N'0', N'0', N'2020-08-15', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/spotpublicity/publicity.vue', N'1', N'0', NULL, N'31')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'8DE96B3E-D11A-47FB-837E-F5A67D26911B', N'个人中心', N'', N'PersonalCenter', N'ios-person', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, NULL, N'0', N'0', NULL, N'32')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'455987E4-6AC6-4D78-BAE2-42B028267E2F', N'宝藏记录', N'personalCenter/baozang', N'personalCenter_baozang', N'ios-calendar-outline', N'8DE96B3E-D11A-47FB-837E-F5A67D26911B', N'个人中心', N'1', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/personalCenter/baozang.vue', N'0', N'0', NULL, N'33')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'', N'daoshixit', N'md-ribbon', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, NULL, N'0', N'0', NULL, N'34')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'BDCD5D00-C8C1-46CC-AC58-BB4FA1426419', N'游客服务', N'', N'youkefuwu', N'md-people', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, NULL, N'0', N'0', NULL, N'35')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'279CE827-00E7-4D44-9933-381D7161D702', N'咨询', N'consult/consult', N'zixun', N'md-notifications-outline', N'BDCD5D00-C8C1-46CC-AC58-BB4FA1426419', N'游客服务', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/consult/consult.vue', N'0', N'0', NULL, N'36')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'66842287-F8D1-4363-A49F-98C85F24EA2F', N'攻略发布', N'Strategy/Strategy', N'Strategy_Page', N'logo-playstation', N'8DE96B3E-D11A-47FB-837E-F5A67D26911B', N'个人中心', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Strategy/Strategy.vue', N'0', N'0', NULL, N'37')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'4178AD1D-D0E7-4A36-AA2F-4FAFA2C02EC7', N'导视系统', N'Guide', N'Guide', N'logo-windows', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'0', N'', N'0', N'1', N'1', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, NULL, N'0', N'0', NULL, N'38')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'03FD32C2-F290-4224-A636-D6828901B537', N'人文介绍', N'Guide/culturalIntroduc', N'guide_culturalIntroduc', N'md-paper', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Guide/culturalIntroduc.vue', N'0', N'0', NULL, N'39')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'39C359BB-87D6-409B-BC7E-483466FB761E', N'导游服务', N'tourGuide/tourGuide', N'daoyoufuwu', N'ios-paper-plane-outline', N'BDCD5D00-C8C1-46CC-AC58-BB4FA1426419', N'游客服务', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/tourGuide/tourGuide.vue', N'0', N'0', NULL, N'40')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'D959CF34-50C1-4FAD-80E9-C79A57CFDA44', N'留言建议', N'personalCenter/liuyan', N'personalCenter_liuyan', N'md-information-circle', N'8DE96B3E-D11A-47FB-837E-F5A67D26911B', N'个人中心', N'1', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/personalCenter/liuyan.vue', N'0', N'0', NULL, N'41')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'150CD92D-FF22-4A60-AFEA-01D82AB85D10', N'文章管理', N'article', N'article', N'ios-paper-outline', N'00000000-0000-0000-0000-000000000000', N'顶级菜单', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, NULL, N'0', N'0', NULL, N'42')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'B99824B1-041E-4D1B-92FA-86CA34474F0A', N'管理文章', N'articlemanagement/article', N'articlemanagement_article', N'ios-paper-outline', N'150CD92D-FF22-4A60-AFEA-01D82AB85D10', N'文章管理', N'1', N'', N'2', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/articlemanagement/article.vue', N'0', N'0', NULL, N'43')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'8BE1FB23-DD3E-4A10-A201-571D889ECBC5', N'自然资源', N'Guide/naturalResources', N'guide_naturalResources', N'md-leaf', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Guide/naturalResources.vue', N'0', N'0', NULL, N'44')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'6DD9C5DF-ABFC-4535-8EBE-65E7344CBFEA', N'首页宣传视频', N'Promotional/Promotional', N'Promotional_Page', N'md-play', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'1', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-25', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/Promotional/Promotional.vue', N'0', N'0', NULL, N'45')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'0E257202-6112-4F33-A4B5-903904AA3BF4', N'宣传图片', N'Guide/publicityPicture', N'Guide_publicityPicture', N'md-photos', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Guide/publicityPicture.vue', N'0', N'0', NULL, N'46')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'CB760228-DBB2-4B1F-85CC-8A23C2CB2554', N'类型管理', N'articlemanagement/articletype', N'articlemanagement_articletype', N'ios-list-box-outline', N'150CD92D-FF22-4A60-AFEA-01D82AB85D10', N'文章管理', N'0', N'', N'0', N'1', N'0', N'0', N'2020-08-21', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/articlemanagement/articletype.vue', N'0', N'0', NULL, N'47')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'90FEFF1B-67FC-48B0-AE83-6756101295A5', N'宣传视频', N'promotional/promotionalvideo', N'promotional_promotionalvideo', N'ios-videocam-outline', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'0', N'', N'6', N'1', N'0', N'0', N'2020-08-25', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Promotional/promotionalvideo.vue', N'0', N'0', NULL, N'48')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'98388747-BEFD-4DAE-9ED1-214B3A421645', N'酒店民宿', N'intelligentguide/hotel', N'intelligentguide_hotel', N'ios-home', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'6', N'1', N'0', N'0', N'2020-08-25', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/intelligentguide/hotel.vue', N'0', N'0', NULL, N'49')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'321CF38F-8512-443F-B763-FD14AD20A86C', N'景区资讯', N'Guide/ScienZixun', N'Guide/ScienZixun_Page', N'ios-paw', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'1', N'', N'0', N'1', N'0', N'0', N'2020-08-27', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-08-31', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/Guide/ScienZixun.vue', N'0', N'0', NULL, N'1048')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'68B942F7-E6BF-4E6C-9F9A-05513035A911', N'景区管理', N'Tourismiffo/Tourismiffo', N'Tourismiffo_Page', N'md-paper-plane', N'2DCAE7BC-1587-41F4-8EFA-1430F541370F', N'景点管理', N'0', N'', N'1', N'1', N'0', N'0', N'2020-08-29', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Tourismiffo/Tourismiffo.vue', N'0', N'0', NULL, N'1049')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'F3960869-5845-40D9-97B2-70BED5368B30', N'路线推荐', N'Strategy/TjLuxian', N'luxiantuijian', N'ios-navigate-outline', N'8DE96B3E-D11A-47FB-837E-F5A67D26911B', N'个人中心', N'0', N'', N'0', N'1', N'0', N'0', N'2020-09-25', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Strategy/TjLuxian.vue', N'0', N'0', NULL, N'1050')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'A3D5267A-5AFD-4591-BE7F-650E74AD740C', N'公交线路', N'Walk/Bus', N'businfo_Page', N'ios-link-outline', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'1', N'', N'7', N'1', N'0', N'0', N'2020-10-14', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-10-14', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/Walk/Bus.vue', N'0', N'0', NULL, N'1051')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'5B143070-CFBE-47B6-91BF-8235848F520A', N'共享单车', N'Walk/Sharing', N'Sharinginfo_Page', N'logo-freebsd-devil', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'1', N'', N'8', N'1', N'0', N'0', N'2020-10-14', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'2020-10-14', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', N'/Walk/Sharing.vue', N'0', N'0', NULL, N'1052')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'86C9BBA1-25C4-4213-93F7-3D4FA4436427', N'3A公厕', N'lifefile/gtoilet', N'lifefile_gtoilet_Page', N'logo-octocat', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'9', N'1', N'0', N'0', N'2020-10-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'admin', NULL, NULL, NULL, N'/lifefile/gtoilet.vue', N'0', N'0', NULL, N'1053')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'E7728440-6947-4438-B0A8-2BD3310C375B', N'银行信息', N'lifefile/bankInfo', N'lifefile_bankInfo_Page', N'logo-playstation', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'10', N'1', N'0', N'0', N'2020-10-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'admin', NULL, NULL, NULL, N'/lifefile/bankInfo.vue', N'0', N'0', NULL, N'1054')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'E71246D7-E3D9-4218-A508-18D808004B98', N'卫生所信息', N'lifefile/hospitalInfo', N'lifefile_hospitalInfo_Page', N'logo-python', N'A6FC1015-558E-416B-9EBA-B6197D3B35ED', N'智能导览', N'0', N'', N'11', N'1', N'0', N'0', N'2020-10-20', N'423968DF-A15D-4B5F-9E25-005486496332', N'admin', NULL, NULL, NULL, N'/lifefile/hospitalInfo.vue', N'0', N'0', NULL, N'1055')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'8FE0BED5-DB20-4C6F-831C-D78FD17779BE', N'导视屏设备管理', N'Guide/PointerInfo', N'Guide_PointerInfo_Page', N'logo-buffer', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'导视系统', N'0', N'', N'0', N'1', N'0', N'0', N'2020-10-28', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/Guide/PointerInfo.vue', N'0', N'0', NULL, N'1056')
GO

INSERT INTO [dbo].[SystemMenu] ([SystemMenuUUID], [Name], [Url], [Alias], [Icon], [ParentGuid], [ParentName], [Level], [Description], [Sort], [Status], [IsDeleted], [IsDefaultRouter], [CreatedOn], [CreatedByUserGuid], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [Component], [HideInMenu], [NotCache], [BeforeCloseFun], [ID]) VALUES (N'B5893A1F-B85C-4B27-820A-C9595FDDD546', N'全局配置', N'rbac/global', N'quanjupeizhi', N'md-medal', N'71A53FA6-C271-4834-9B92-6BA4E187C03A', N'系统管理', N'0', N'', N'0', N'1', N'0', N'0', N'2020-11-24', N'423968DF-A15D-4B5F-9E25-005486496332', N'超级管理员', NULL, NULL, NULL, N'/rbac/global.vue', N'0', N'0', NULL, N'1057')
GO

SET IDENTITY_INSERT [dbo].[SystemMenu] OFF
GO


-- ----------------------------
-- Table structure for SystemPermission
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemPermission]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemPermission]
GO

CREATE TABLE [dbo].[SystemPermission] (
  [SystemPermissionUUID] uniqueidentifier  NOT NULL,
  [SystemMenuUUID] uniqueidentifier  NULL,
  [Name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ActionCode] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Icon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Description] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Status] int  NULL,
  [IsDeleted] int  NULL,
  [Type] int  NULL,
  [CreatedByUserGuid] uniqueidentifier  NULL,
  [CreatedOn] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreatedByUserName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifiedOn] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifiedByUserGuid] uniqueidentifier  NULL,
  [ModifiedByUserName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [CaPower] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE [dbo].[SystemPermission] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'权限表',
'SCHEMA', N'dbo',
'TABLE', N'SystemPermission'
GO


-- ----------------------------
-- Records of SystemPermission
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemPermission] ON
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'347C945D-D500-4FEB-8CB7-CD26EE5EE4B4', N'0820B975-FEE1-43F0-BC6B-DA39E145F8BC', N'查看', N'daoshixitong', NULL, N'', N'1', N'0', N'0', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'1')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'0050AC92-63DA-412D-AF38-47BC26FF7F80', N'BDCD5D00-C8C1-46CC-AC58-BB4FA1426419', N'查看', N'youkefuwu', NULL, N'', N'1', N'0', N'0', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'2')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'090F367E-98BD-40C8-B485-381141BAF652', N'39C359BB-87D6-409B-BC7E-483466FB761E', N'查看', N'view', NULL, N'', N'1', N'0', N'0', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'3')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'E6BC3FFC-DE84-42F2-97C0-2F0B603A8B1F', N'39C359BB-87D6-409B-BC7E-483466FB761E', N'删除', N'delete', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'4')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'E015E92C-EE62-44CD-BECC-A3CA2713C55F', N'39C359BB-87D6-409B-BC7E-483466FB761E', N'添加', N'create', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'5')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'A11BAE75-3B06-423A-A13B-04A03A631092', N'39C359BB-87D6-409B-BC7E-483466FB761E', N'编辑', N'edit', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'6')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'11E730D7-E5ED-4B1E-9EF5-7A90E421ABE8', N'39C359BB-87D6-409B-BC7E-483466FB761E', N'详情', N'show', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'7')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'21D2A872-39F1-4C1F-BAAC-AB24D198DEE7', N'279CE827-00E7-4D44-9933-381D7161D702', N'查看', N'view', NULL, N'', N'1', N'0', N'0', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'8')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'D4808CA6-9D1B-4BD1-9570-65302F291954', N'279CE827-00E7-4D44-9933-381D7161D702', N'删除', N'delete', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'9')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'C6815FB3-A2D7-457D-A365-34106D01F91D', N'279CE827-00E7-4D44-9933-381D7161D702', N'添加', N'create', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'10')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'DD3580EF-E143-4CA7-8B1B-BFABCAFEE454', N'279CE827-00E7-4D44-9933-381D7161D702', N'编辑', N'edit', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'11')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'96AA4FFB-F852-43F8-9A61-0DD73D9E14BA', N'279CE827-00E7-4D44-9933-381D7161D702', N'详情', N'show', NULL, N'', N'1', N'0', N'1', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'12')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'43812D64-276E-4CA1-A3F1-C294A8F311E4', N'90FEFF1B-67FC-48B0-AE83-6756101295A5', N'查看', N'shouyexcss', NULL, N'', N'1', N'0', N'0', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'13')
GO

INSERT INTO [dbo].[SystemPermission] ([SystemPermissionUUID], [SystemMenuUUID], [Name], [ActionCode], [Icon], [Description], [Status], [IsDeleted], [Type], [CreatedByUserGuid], [CreatedOn], [CreatedByUserName], [ModifiedOn], [ModifiedByUserGuid], [ModifiedByUserName], [CaPower], [ID]) VALUES (N'4DF57567-47D2-434C-A369-4D8CD51904BD', N'66842287-F8D1-4363-A49F-98C85F24EA2F', N'查看', N'gongluefabu', NULL, N'', N'1', N'0', N'0', N'423968DF-A15D-4B5F-9E25-005486496332', N'2020-08-26', N'超级管理员', NULL, NULL, NULL, NULL, N'14')
GO

SET IDENTITY_INSERT [dbo].[SystemPermission] OFF
GO


-- ----------------------------
-- Table structure for SystemRole
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemRole]
GO

CREATE TABLE [dbo].[SystemRole] (
  [SystemRoleUUID] uniqueidentifier  NOT NULL,
  [RoleName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDeleted] int  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IsFixation] int DEFAULT ((0)) NULL,
  [SchoolUUID] uniqueidentifier  NULL,
  [IsCreEdu] int DEFAULT ((0)) NULL
)
GO

ALTER TABLE [dbo].[SystemRole] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否内置  0否,1是',
'SCHEMA', N'dbo',
'TABLE', N'SystemRole',
'COLUMN', N'IsFixation'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否由管理者创建',
'SCHEMA', N'dbo',
'TABLE', N'SystemRole',
'COLUMN', N'IsCreEdu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色表',
'SCHEMA', N'dbo',
'TABLE', N'SystemRole'
GO


-- ----------------------------
-- Records of SystemRole
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemRole] ON
GO

INSERT INTO [dbo].[SystemRole] ([SystemRoleUUID], [RoleName], [AddTime], [AddPeople], [IsDeleted], [ID], [IsFixation], [SchoolUUID], [IsCreEdu]) VALUES (N'99F78FD8-2C2A-4C31-A9D9-0684535C083C', N'超级管理员', N'2019-12-17', N'超级管理员', N'0', N'1', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[SystemRole] ([SystemRoleUUID], [RoleName], [AddTime], [AddPeople], [IsDeleted], [ID], [IsFixation], [SchoolUUID], [IsCreEdu]) VALUES (N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'微信用户', N'2020-07-28', N'超级管理员', N'0', N'2', N'0', NULL, N'0')
GO

SET IDENTITY_INSERT [dbo].[SystemRole] OFF
GO


-- ----------------------------
-- Table structure for SystemRolePermissionMapping
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRolePermissionMapping]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemRolePermissionMapping]
GO

CREATE TABLE [dbo].[SystemRolePermissionMapping] (
  [SystemRoleUUID] uniqueidentifier  NOT NULL,
  [SystemPermissionUUID] uniqueidentifier  NOT NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE [dbo].[SystemRolePermissionMapping] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色权限关系',
'SCHEMA', N'dbo',
'TABLE', N'SystemRolePermissionMapping'
GO


-- ----------------------------
-- Records of SystemRolePermissionMapping
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemRolePermissionMapping] ON
GO

INSERT INTO [dbo].[SystemRolePermissionMapping] ([SystemRoleUUID], [SystemPermissionUUID], [AddTime], [AddPeople], [ID]) VALUES (N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'4DF57567-47D2-434C-A369-4D8CD51904BD', N'2020-08-31', NULL, N'1')
GO

INSERT INTO [dbo].[SystemRolePermissionMapping] ([SystemRoleUUID], [SystemPermissionUUID], [AddTime], [AddPeople], [ID]) VALUES (N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'347C945D-D500-4FEB-8CB7-CD26EE5EE4B4', N'2020-08-31', NULL, N'2')
GO

INSERT INTO [dbo].[SystemRolePermissionMapping] ([SystemRoleUUID], [SystemPermissionUUID], [AddTime], [AddPeople], [ID]) VALUES (N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'0050AC92-63DA-412D-AF38-47BC26FF7F80', N'2020-08-31', NULL, N'3')
GO

INSERT INTO [dbo].[SystemRolePermissionMapping] ([SystemRoleUUID], [SystemPermissionUUID], [AddTime], [AddPeople], [ID]) VALUES (N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'21D2A872-39F1-4C1F-BAAC-AB24D198DEE7', N'2020-08-31', NULL, N'4')
GO

INSERT INTO [dbo].[SystemRolePermissionMapping] ([SystemRoleUUID], [SystemPermissionUUID], [AddTime], [AddPeople], [ID]) VALUES (N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'96AA4FFB-F852-43F8-9A61-0DD73D9E14BA', N'2020-08-31', NULL, N'5')
GO

INSERT INTO [dbo].[SystemRolePermissionMapping] ([SystemRoleUUID], [SystemPermissionUUID], [AddTime], [AddPeople], [ID]) VALUES (N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'43812D64-276E-4CA1-A3F1-C294A8F311E4', N'2020-08-31', NULL, N'6')
GO

SET IDENTITY_INSERT [dbo].[SystemRolePermissionMapping] OFF
GO


-- ----------------------------
-- Table structure for SystemSetting
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemSetting]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemSetting]
GO

CREATE TABLE [dbo].[SystemSetting] (
  [ClobalUuid] uniqueidentifier  NOT NULL,
  [ClobalName] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Globalurl] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime2(7)  NULL,
  [AppPeople] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [isDelete] int  NULL,
  [GlobalLogo] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY NOT NULL
)
GO

ALTER TABLE [dbo].[SystemSetting] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of SystemSetting
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemSetting] ON
GO

INSERT INTO [dbo].[SystemSetting] ([ClobalUuid], [ClobalName], [Globalurl], [AddTime], [AppPeople], [isDelete], [GlobalLogo], [ID]) VALUES (N'FC3B4E24-CFD3-4DAB-BC2F-BA4C829B866B', N'海看旅游导视系统和旅游小程序管理后台', NULL, N'2020-11-24 17:07:17.8710336', N'admin', N'0', N'UploadFiles\20201124_150843867_6bcb0c5b-27d2-4bcc-83e2-5743ff143bd5.png', N'0')
GO

SET IDENTITY_INSERT [dbo].[SystemSetting] OFF
GO


-- ----------------------------
-- Table structure for SystemUser
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemUser]
GO

CREATE TABLE [dbo].[SystemUser] (
  [SystemUserUUID] uniqueidentifier  NOT NULL,
  [LoginName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [RealName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserIdCard] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [PassWord] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserType] int  NULL,
  [SchoolUUID] uniqueidentifier  NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDeleted] int  NULL,
  [ManageDepartment] text COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [ZaiGang] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sex] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [InTime] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Types] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [SystemRoleUUid] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remarks] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [StaffNum] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Wechat] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Topic] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Content] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Train] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Main] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Job] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [HealthCertificate] int  NULL,
  [IsStaff] int DEFAULT ((0)) NULL,
  [IsCreEdu] int DEFAULT ((0)) NULL,
  [Placeofresidence] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Age] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Nickname] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[SystemUser] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录名',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'LoginName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'真实姓名',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'RealName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'身份证',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'UserIdCard'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'PassWord'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1 超管 2其他',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'UserType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学校UUID',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'SchoolUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'注册时间',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加人',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'AddPeople'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0正常 1删除',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'IsDeleted'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'ZaiGang'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'邮箱',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Email'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Sex'
GO

EXEC sp_addextendedproperty
'MS_Description', N'入职时间',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'InTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Types'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色id,用逗号分隔',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'SystemRoleUUid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'职工号',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'StaffNum'
GO

EXEC sp_addextendedproperty
'MS_Description', N'微信',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Wechat'
GO

EXEC sp_addextendedproperty
'MS_Description', N'会议主题',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Topic'
GO

EXEC sp_addextendedproperty
'MS_Description', N'职务',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Job'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否有健康证    0无   1有',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'HealthCertificate'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否为食堂工作人员 0否   1是',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'IsStaff'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否由管理级别创建  0否   1是',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'IsCreEdu'
GO

EXEC sp_addextendedproperty
'MS_Description', N'居住地',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Placeofresidence'
GO

EXEC sp_addextendedproperty
'MS_Description', N'年龄',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Age'
GO

EXEC sp_addextendedproperty
'MS_Description', N'头像',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户昵称',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Nickname'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统用户',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser'
GO


-- ----------------------------
-- Records of SystemUser
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemUser] ON
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'423968DF-A15D-4B5F-9E25-005486496332', N'admin', N'超级管理员', N'452235199807256362', N'B245C6AE607156A1', N'0', NULL, N'2019-12-11', N'超级管理员', N'0', NULL, N'2', N'1', N'17876342332', N'43345', N'男', NULL, NULL, N'3', N'99f78fd8-2c2a-4c31-a9d9-0684535c083c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', NULL, N'安徽省-合肥市-瑶海区', N'23', NULL, N'超管')
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'DFAC501A-D975-4562-B4CA-9484D3ABF3C0', N'二十', N'额热', N'', N'B245C6AE607156A1', N'0', NULL, N'2020-07-27', N'超级管理员', N'1', NULL, N'3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'99f78fd8-2c2a-4c31-a9d9-0684535c083c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'66FF0C62-0A8E-45D6-AF1A-DC209ACA2654', N'石头锅', N'', NULL, NULL, N'5', NULL, N'2020-07-28', NULL, N'0', NULL, N'4', NULL, NULL, NULL, N'男', NULL, NULL, NULL, N'843afb0e-3c3a-449d-91b6-36c7ba46b606', NULL, NULL, N'oywvV5FEbMBJplGPx4yyD2Vjjykk', NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'965C8F49-B909-41BB-BF5D-C26EAD9608AF', N'aqy', N'爱企业', N'', N'05F769D00ED3D54E65A817F741001650', N'2', NULL, N'2020-08-20', N'超级管理员', N'0', NULL, N'5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'843afb0e-3c3a-449d-91b6-36c7ba46b606', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', NULL, NULL, NULL, N'aaqy')
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'A108EF0E-A393-4F53-A3CB-59B7CD545572', N'官方提醒', N'', NULL, NULL, N'5', NULL, N'2020-09-27', NULL, N'0', NULL, N'8', NULL, NULL, NULL, N'男', NULL, NULL, NULL, N'843afb0e-3c3a-449d-91b6-36c7ba46b606', NULL, NULL, N'oklno5dfnTIge0-opfLrzVcd_8SI', NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', NULL, NULL, NULL, N'官方提醒')
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'5C38E21E-5BCE-4B6D-ACFD-48B3A9C2BA08', N'嘻嘻', N'', NULL, NULL, N'5', NULL, N'2020-10-16', NULL, N'0', NULL, N'10', NULL, NULL, NULL, N'男', NULL, NULL, NULL, N'843afb0e-3c3a-449d-91b6-36c7ba46b606', NULL, NULL, N'oklno5cUVLIJPe3aXNrGOBP1eqUw', NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', NULL, NULL, NULL, N'嘻嘻')
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'4F4F5288-6964-4197-801B-772C649847B2', N'萌亚特兰蒂', N'', NULL, NULL, N'5', NULL, N'2020-12-10', NULL, N'0', NULL, N'11', NULL, NULL, NULL, N'未知', NULL, NULL, NULL, N'843afb0e-3c3a-449d-91b6-36c7ba46b606', NULL, NULL, N'oklno5T_nfNYdFicMZRVjqJb9uRQ', NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', NULL, NULL, NULL, N'萌亚特兰蒂')
GO

INSERT INTO [dbo].[SystemUser] ([SystemUserUUID], [LoginName], [RealName], [UserIdCard], [PassWord], [UserType], [SchoolUUID], [AddTime], [AddPeople], [IsDeleted], [ManageDepartment], [ID], [ZaiGang], [Phone], [Email], [Sex], [InTime], [Types], [Address], [SystemRoleUUid], [Remarks], [StaffNum], [Wechat], [Topic], [Content], [Train], [Main], [Job], [HealthCertificate], [IsStaff], [IsCreEdu], [Placeofresidence], [Age], [Picture], [Nickname]) VALUES (N'28ED78CC-0A4C-467C-B9A0-A1FF2D3F8DA8', N'石头锅', N'', NULL, NULL, N'5', NULL, N'2020-12-11', NULL, N'0', NULL, N'12', NULL, NULL, NULL, N'男', NULL, NULL, NULL, N'843afb0e-3c3a-449d-91b6-36c7ba46b606', NULL, NULL, N'oklno5UGzleyeHJumlRgh9UBDzik', NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', NULL, NULL, NULL, N'石头锅')
GO

SET IDENTITY_INSERT [dbo].[SystemUser] OFF
GO


-- ----------------------------
-- Table structure for SystemUserRoleMapping
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUserRoleMapping]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemUserRoleMapping]
GO

CREATE TABLE [dbo].[SystemUserRoleMapping] (
  [SystemUserUUID] uniqueidentifier  NOT NULL,
  [SystemRoleUUID] uniqueidentifier  NOT NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ID] int  IDENTITY(1,1) NOT NULL
)
GO

ALTER TABLE [dbo].[SystemUserRoleMapping] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户角色关系',
'SCHEMA', N'dbo',
'TABLE', N'SystemUserRoleMapping'
GO


-- ----------------------------
-- Records of SystemUserRoleMapping
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SystemUserRoleMapping] ON
GO

INSERT INTO [dbo].[SystemUserRoleMapping] ([SystemUserUUID], [SystemRoleUUID], [AddTime], [AddPeople], [ID]) VALUES (N'423968DF-A15D-4B5F-9E25-005486496332', N'99F78FD8-2C2A-4C31-A9D9-0684535C083C', N'2020-07-01', NULL, N'1')
GO

INSERT INTO [dbo].[SystemUserRoleMapping] ([SystemUserUUID], [SystemRoleUUID], [AddTime], [AddPeople], [ID]) VALUES (N'DFAC501A-D975-4562-B4CA-9484D3ABF3C0', N'99F78FD8-2C2A-4C31-A9D9-0684535C083C', N'2020-07-27', N'超级管理员', N'2')
GO

INSERT INTO [dbo].[SystemUserRoleMapping] ([SystemUserUUID], [SystemRoleUUID], [AddTime], [AddPeople], [ID]) VALUES (N'965C8F49-B909-41BB-BF5D-C26EAD9608AF', N'843AFB0E-3C3A-449D-91B6-36C7BA46B606', N'2020-08-31', N'超级管理员', N'4')
GO

SET IDENTITY_INSERT [dbo].[SystemUserRoleMapping] OFF
GO


-- ----------------------------
-- Table structure for TourGuide
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TourGuide]') AND type IN ('U'))
	DROP TABLE [dbo].[TourGuide]
GO

CREATE TABLE [dbo].[TourGuide] (
  [ID] int  IDENTITY NOT NULL,
  [TourGuideUUID] uniqueidentifier  NOT NULL,
  [TourGuideName] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Phone] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReleaseTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [ReleaseState] int  NULL,
  [IsDeleted] int DEFAULT ((0)) NULL,
  [AddTime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [FMPicture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[TourGuide] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'导游名称',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide',
'COLUMN', N'TourGuideName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide',
'COLUMN', N'Phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide',
'COLUMN', N'ReleaseTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布状态',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide',
'COLUMN', N'ReleaseState'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide',
'COLUMN', N'Content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'封面图片',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide',
'COLUMN', N'FMPicture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'游客服务导游',
'SCHEMA', N'dbo',
'TABLE', N'TourGuide'
GO


-- ----------------------------
-- Records of TourGuide
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TourGuide] ON
GO

INSERT INTO [dbo].[TourGuide] ([ID], [TourGuideUUID], [TourGuideName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople], [Picture], [Content], [FMPicture]) VALUES (N'0', N'727E1D9D-E3BC-46CB-A5A1-ECDF00995BF0', N'王海', N'15474147474', N'2020-08-27 08:39', N'1', N'0', N'2020-08-20 16:16:00', N'超级管理员', N'20200820_161846109_d8cc9deb-a7d2-4ccb-8ed7-686b7b3ead61.jpg,20200820_162405177_5033fb6f-fb12-437b-9574-cefd860f6b14.jpg,20200820_175213387_28760699-3b9b-42fc-97e3-05e9976eb556.jpg', N'<p><s>dadad</s></p><p><u>大大撒旦飒飒</u></p><p><strong>十大大苏打的是</strong></p>', N'20200827_083903044_335edff8-cd87-4615-aeba-5b88b33a0414.jpg')
GO

INSERT INTO [dbo].[TourGuide] ([ID], [TourGuideUUID], [TourGuideName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople], [Picture], [Content], [FMPicture]) VALUES (N'2', N'9590E910-82D2-4A49-A484-E62132F70EDF', N'张大帅', N'13598457613', N'2020-08-27 16:13', N'1', N'0', N'2020-08-20 17:40:51', N'超级管理员', N'20200820_161846109_d8cc9deb-a7d2-4ccb-8ed7-686b7b3ead61.jpg,20200820_162405177_5033fb6f-fb12-437b-9574-cefd860f6b14.jpg,20200820_175158469_87f13d18-1492-4ddf-9642-1c895a9324c1.jpg', N'', N'蒙版组27.png')
GO

INSERT INTO [dbo].[TourGuide] ([ID], [TourGuideUUID], [TourGuideName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople], [Picture], [Content], [FMPicture]) VALUES (N'4', N'C91006EA-7CD1-4740-B622-59EB8847E153', N'张三', N'14725836900', N'2020-08-27 08:38', N'1', N'0', N'2020-08-26 14:56:53', N'超级管理员', N'20200826_145635919_992b6708-3440-4523-9fcc-205d8752d26f.png,20200826_145643533_262e11cb-4275-460c-aaec-1356f1c695b4.png,20200826_145652123_1ab1b9e1-a145-4def-84b8-ac7da1a94c00.png', N'', N'20200827_083833314_b2cb7e87-b683-4ebc-90a4-94673a92d2c3.jpg')
GO

INSERT INTO [dbo].[TourGuide] ([ID], [TourGuideUUID], [TourGuideName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople], [Picture], [Content], [FMPicture]) VALUES (N'5', N'996CF109-DAE6-43D9-BA71-290C340934B2', N'王五', N'14725836900', N'2020-08-27 16:21', N'1', N'0', N'2020-08-26 14:57:43', N'超级管理员', N'20200826_145635919_992b6708-3440-4523-9fcc-205d8752d26f.png,20200826_145643533_262e11cb-4275-460c-aaec-1356f1c695b4.png,20200826_145652123_1ab1b9e1-a145-4def-84b8-ac7da1a94c00.png', N'', N'20200827_083822380_194c88f4-dabc-465b-b113-272117593d12.jpg')
GO

INSERT INTO [dbo].[TourGuide] ([ID], [TourGuideUUID], [TourGuideName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople], [Picture], [Content], [FMPicture]) VALUES (N'6', N'F9423965-C9EA-4C3E-942F-54EC16FF3AA4', N'李四', N'14725836900', N'2020-08-27 08:38', N'1', N'0', N'2020-08-26 14:58:18', N'超级管理员', N'20200826_145635919_992b6708-3440-4523-9fcc-205d8752d26f.png,20200826_145643533_262e11cb-4275-460c-aaec-1356f1c695b4.png,20200826_145652123_1ab1b9e1-a145-4def-84b8-ac7da1a94c00.png', N'', N'20200827_083802437_1ba7f81d-9a42-402e-be46-192f4ba70c38.jpg')
GO

INSERT INTO [dbo].[TourGuide] ([ID], [TourGuideUUID], [TourGuideName], [Phone], [ReleaseTime], [ReleaseState], [IsDeleted], [AddTime], [AddPeople], [Picture], [Content], [FMPicture]) VALUES (N'7', N'90C34372-B39D-4087-AB62-67FC36795AC6', N'王五', N'15478945644', N'2020-09-25 09:24', N'1', N'0', N'2020-08-26 15:12:33', N'超级管理员', N'20200826_151222678_b4ff2c61-959b-4f65-88d8-92d7828b063e.png,20200826_151227473_66ae4517-1717-4cb9-89d3-410c3f2f0885.png,20200826_151230888_877512d0-760d-4c43-b090-74d25966fcb0.png', N'<p>这是第一个</p>', N'20200827_083737533_2d96f89b-934e-49d2-b054-ac1185b82a61.jpg')
GO

SET IDENTITY_INSERT [dbo].[TourGuide] OFF
GO


-- ----------------------------
-- Table structure for Tourism
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Tourism]') AND type IN ('U'))
	DROP TABLE [dbo].[Tourism]
GO

CREATE TABLE [dbo].[Tourism] (
  [TourismUuid] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [Name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [SpotContent] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Picture] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Video] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [Audio] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int  NULL,
  [OrderBy] int  NULL,
  [State] int  NULL,
  [AddTime] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddPeople] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Tourism] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'介绍',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'SpotContent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地址',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'Picture'
GO

EXEC sp_addextendedproperty
'MS_Description', N'视频',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'Video'
GO

EXEC sp_addextendedproperty
'MS_Description', N'音频',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'Audio'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'OrderBy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.保存中 1.已发布',
'SCHEMA', N'dbo',
'TABLE', N'Tourism',
'COLUMN', N'State'
GO

EXEC sp_addextendedproperty
'MS_Description', N'景区介绍',
'SCHEMA', N'dbo',
'TABLE', N'Tourism'
GO


-- ----------------------------
-- Records of Tourism
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Tourism] ON
GO

INSERT INTO [dbo].[Tourism] ([TourismUuid], [ID], [CreateTime], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [AddTime], [AddPeople]) VALUES (N'DFE3675E-75A6-42B4-BE3D-1DF7F96633A0', N'6', N'2020-09-24 18:49:00.250', N'柳溪江绿道', N'柳溪江绿道分为休闲步行绿道，以及骑行绿道。步行绿道是依托柳溪江沿溪打造的滨水步行绿道，全长约5公里，其中已建1600米，从河桥镇政府起始，到云浪知青桥跨溪回环，一路绿野江天，风光无限；骑行主题绿道，依托昌文线、柳溪街、云金线打造，全长约6.5公里。此骑行绿道把河桥，云浪，泥骆三点串联，把当地打造的主题节点，串点成线，串珠成链，以绿道激活三村旅游资源，实现资源共享，其中唐昌首镇结合河桥古街，体现唐昌', N'河桥镇', N'', N'', N'', N'1', N'4', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Tourism] ([TourismUuid], [ID], [CreateTime], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [AddTime], [AddPeople]) VALUES (N'D42AD869-20C0-49D2-85D8-1E24DA8BCBBF', N'3', N'2020-09-24 18:46:25.560', N'河桥古镇', N'南部、柳溪江畔昌化，距杭州100公里、临安市区50公里。河桥古镇是古时昌化县治所在。明嘉靖年，唐昌即（昌化县）设四镇，河桥因“邑水口形胜商务独冠唐昌”被列为首位，至今镇门上“唐昌首镇”犹可见。河桥古镇景区内拥有河桥农博馆、十里红妆婚嫁习俗馆，柯宁相公殿及浙西抗战馆等景点可供参观了解河桥历史文化。', N'河桥镇古镇景区 ', N'20200924_184557804_666cf345-2ecf-4412-9542-06435b0bbfd9.jpg', N'', N'', N'0', N'1', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Tourism] ([TourismUuid], [ID], [CreateTime], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [AddTime], [AddPeople]) VALUES (N'46475DA7-E3A6-411C-B751-329ECC72EE76', N'4', N'2020-09-24 18:46:53.040', N'文澜阁特色文化中心', N'文澜阁特色文化中心为于河桥老街，修建于2019年，内部有河桥摄影馆、河桥民俗非遗馆、浙西书画馆，河桥旅游图书馆等特色展陈馆，可供游客短时间内了解河桥摄影网红地，河桥全镇民俗特色物件、年俗灯队并参观书画名家的作品，是居家旅行特别是学龄儿童了解河桥历史的必经之地。', N'河桥镇河桥老街', N'', N'', N'', N'1', N'2', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Tourism] ([TourismUuid], [ID], [CreateTime], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [AddTime], [AddPeople]) VALUES (N'E71D67E3-5266-423B-97DB-495AC6C5F3F2', N'8', N'2020-09-24 18:50:03.650', N'云浪知青文化馆', N'云浪知青文化馆是云浪村知青文化的重要载体，在原有老屋的基础上进行改建和扩建，建筑风格以六七十年代的平房农居为主，以门庭、庭院，和建筑主体三位一体，还原当初知青的生活场景，并全景式地记录80余名云浪知青从1964-1978年，横跨14年的知青生涯，从生活、劳动、理想各个侧面记录他们在云浪的青春足迹和岁月芳华，以及后知青时代，他们对云浪的回望和情感。', N'河桥镇云浪村', N'', N'', N'', N'1', N'6', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Tourism] ([TourismUuid], [ID], [CreateTime], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [AddTime], [AddPeople]) VALUES (N'0C593B0A-9C1D-41DB-B1CE-5B797F1869ED', N'5', N'2020-09-24 18:47:50.470', N'河桥老街', N'1', N'河桥镇', N'', N'', N'', N'1', N'3', N'1', NULL, NULL)
GO

INSERT INTO [dbo].[Tourism] ([TourismUuid], [ID], [CreateTime], [Name], [SpotContent], [Address], [Picture], [Video], [Audio], [IsDelete], [OrderBy], [State], [AddTime], [AddPeople]) VALUES (N'FD5EE593-434E-4010-870F-AE7224EFEB88', N'7', N'2020-09-24 18:49:31.123', N'知青桥', N'知青桥当年叫做河东大桥。它从河桥村的乌珠山横跨柳溪江直通云浪村，长200米，宽5.5米，高13米，为五孔水泥桥。知青桥1976年立项建设，1977年竣工，1978年通行。之所以叫“知青桥“，是因为当年浙江省交通厅对一个乡村立项造桥几乎是不可能的事，全凭云浪知青带队干部在省厅斡旋，筹资筹物，加上当初昌化区委、河桥公社鼎力支持，云浪、毕家、西鸠、泥骆四个大队村民及知青出工出力，方能完成。该桥已经完成它', N'河桥镇云浪村', N'', N'', N'', N'1', N'5', N'1', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Tourism] OFF
GO


-- ----------------------------
-- Table structure for Treasurerecord
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Treasurerecord]') AND type IN ('U'))
	DROP TABLE [dbo].[Treasurerecord]
GO

CREATE TABLE [dbo].[Treasurerecord] (
  [TreasurerecordUUID] uniqueidentifier  NOT NULL,
  [ID] int  IDENTITY(1,1) NOT NULL,
  [UserUUID] uniqueidentifier  NULL,
  [Content] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [Createtime] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Treasurerecord] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户id',
'SCHEMA', N'dbo',
'TABLE', N'Treasurerecord',
'COLUMN', N'UserUUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'宝藏内容',
'SCHEMA', N'dbo',
'TABLE', N'Treasurerecord',
'COLUMN', N'Content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'获取时间',
'SCHEMA', N'dbo',
'TABLE', N'Treasurerecord',
'COLUMN', N'Createtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'宝藏记录表',
'SCHEMA', N'dbo',
'TABLE', N'Treasurerecord'
GO


-- ----------------------------
-- Records of Treasurerecord
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Treasurerecord] ON
GO

INSERT INTO [dbo].[Treasurerecord] ([TreasurerecordUUID], [ID], [UserUUID], [Content], [Createtime]) VALUES (N'936B61FA-CE64-4192-BAC7-0D9C0DE2CD2B', N'15', N'965C8F49-B909-41BB-BF5D-C26EAD9608AF', N'打开一个宝箱获得一个优惠券', N'2020-08-20 14:50:32')
GO

INSERT INTO [dbo].[Treasurerecord] ([TreasurerecordUUID], [ID], [UserUUID], [Content], [Createtime]) VALUES (N'7835132E-FA73-4D27-AF38-8E91985DFF16', N'16', N'965C8F49-B909-41BB-BF5D-C26EAD9608AF', N'打开一个宝箱获得一个优惠券', N'2020-08-20 14:51:35')
GO

SET IDENTITY_INSERT [dbo].[Treasurerecord] OFF
GO


-- ----------------------------
-- Table structure for Videomark
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Videomark]') AND type IN ('U'))
	DROP TABLE [dbo].[Videomark]
GO

CREATE TABLE [dbo].[Videomark] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL,
  [VideomarkUUID] uniqueidentifier  NOT NULL,
  [VideoName] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [VideoPath] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Position] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] int  NULL
)
GO

ALTER TABLE [dbo].[Videomark] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'Videomark',
'COLUMN', N'VideoName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'路径',
'SCHEMA', N'dbo',
'TABLE', N'Videomark',
'COLUMN', N'VideoPath'
GO

EXEC sp_addextendedproperty
'MS_Description', N'经纬度',
'SCHEMA', N'dbo',
'TABLE', N'Videomark',
'COLUMN', N'Position'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0.未删 1.已删',
'SCHEMA', N'dbo',
'TABLE', N'Videomark',
'COLUMN', N'IsDelete'
GO

EXEC sp_addextendedproperty
'MS_Description', N'语音导览',
'SCHEMA', N'dbo',
'TABLE', N'Videomark'
GO


-- ----------------------------
-- Records of Videomark
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Videomark] ON
GO

INSERT INTO [dbo].[Videomark] ([ID], [CreateTime], [VideomarkUUID], [VideoName], [VideoPath], [Position], [IsDelete]) VALUES (N'1', N'2020-07-27 16:50:47.143', N'7CC980FB-B3F6-45E5-8BE4-BAB318D1B588', N'sss', N'20200826_161951907_87830907-6e33-4f62-97ac-b373efb70637.mp3', N'11111.32222,222.333', N'0')
GO

INSERT INTO [dbo].[Videomark] ([ID], [CreateTime], [VideomarkUUID], [VideoName], [VideoPath], [Position], [IsDelete]) VALUES (N'2', N'2020-08-26 16:21:51.523', N'64F4BA90-4283-4E09-ADE1-61D42F5B583B', N'小爱同学', N'', N'119.454.45,30.45245', N'0')
GO

SET IDENTITY_INSERT [dbo].[Videomark] OFF
GO


-- ----------------------------
-- View structure for Cabinet
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Cabinet]') AND type IN ('V'))
	DROP VIEW [dbo].[Cabinet]
GO

CREATE VIEW [dbo].[Cabinet] AS select ROW_NUMBER() OVER(ORDER BY getdate() DESC) AS ID,x.* from (select ss.ScenicSpotUUID as Uuid ,ss.Name as Title,ss.SpotContent as Content,'simg' as [Type],ss.Picture as Url,ss.IsRecommend,ss.IsDelete as IsDel,ss.CreateTime as [Time] from ScenicSpot ss where ss.IsDelete =0
union
select pv.PromotionalVideoUUID as Uuid ,pv.Title as Title,'' as Content,'video' as [Type],pv.Video as Url,pv.IsRecommend ,pv.IsDeleted as IsDel,pv.CreateTime as [Time] from PromotionalVideo pv where pv.IsDeleted =0
union 
select am.ArticleUUID as Uuid,am.ArticleTitle  as Title,am.ArticleName as Content,'aimg' as [Type],am.CoverPhoto as Url,am.IsRecommend,am.IsDelete as IsDel,am.AddTime as [Time] from ArticlesManagement am where am.IsDelete =0)x
GO


-- ----------------------------
-- View structure for View_Menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_Menu]') AND type IN ('V'))
	DROP VIEW [dbo].[View_Menu]
GO

CREATE VIEW [dbo].[View_Menu] AS SELECT   M.SystemMenuUUID, M.Name, M.Url, M.Alias, M.Icon, M.ParentGuid, M.ParentName, M.[Level], M.Description, M.Sort, 
                M.Status, M.IsDeleted, M.IsDefaultRouter, M.CreatedOn, M.CreatedByUserGuid, M.CreatedByUserName, M.ModifiedOn, 
                M.ModifiedByUserGuid, M.ModifiedByUserName, M.Component, M.HideInMenu, M.NotCache, M.BeforeCloseFun, 
                P.Type AS pt, P.Status AS ps, P.IsDeleted AS pd, RPM.SystemRoleUUID
FROM      dbo.SystemRolePermissionMapping AS RPM LEFT OUTER JOIN
                dbo.SystemPermission AS P ON P.SystemPermissionUUID = RPM.SystemPermissionUUID INNER JOIN
                dbo.SystemMenu AS M ON M.SystemMenuUUID = P.SystemMenuUUID
GO


-- ----------------------------
-- View structure for View_SystemPermissionWithMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_SystemPermissionWithMenu]') AND type IN ('V'))
	DROP VIEW [dbo].[View_SystemPermissionWithMenu]
GO

CREATE VIEW [dbo].[View_SystemPermissionWithMenu] AS SELECT   RPM.SystemRoleUUID, P.SystemPermissionUUID AS PermissionCode, P.ActionCode AS PermissionActionCode, 
                P.Name AS PermissionName, P.Type AS PermissionType, M.Name AS MenuName, M.SystemMenuUUID AS MenuGuid, 
                M.Alias AS MenuAlias, M.IsDefaultRouter, P.IsDeleted AS pd, P.Status AS ps
FROM      dbo.SystemRolePermissionMapping AS RPM LEFT OUTER JOIN
                dbo.SystemPermission AS P ON P.SystemPermissionUUID = RPM.SystemPermissionUUID INNER JOIN
                dbo.SystemMenu AS M ON M.SystemMenuUUID = P.SystemMenuUUID
GO


-- ----------------------------
-- View structure for View_SystemPermissionWithMenu2
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_SystemPermissionWithMenu2]') AND type IN ('V'))
	DROP VIEW [dbo].[View_SystemPermissionWithMenu2]
GO

CREATE VIEW [dbo].[View_SystemPermissionWithMenu2] AS SELECT   P.SystemPermissionUUID AS PermissionCode, P.ActionCode AS PermissionActionCode, P.Name AS PermissionName, 
                P.Type AS PermissionType, M.Name AS MenuName, M.SystemMenuUUID AS MenuGuid, M.Alias AS MenuAlias, 
                M.IsDefaultRouter, P.IsDeleted AS pd, P.Status AS ps
FROM      dbo.SystemPermission AS P INNER JOIN
                dbo.SystemMenu AS M ON M.SystemMenuUUID = P.SystemMenuUUID
GO


-- ----------------------------
-- Indexes structure for table ActiveQuantity
-- ----------------------------
CREATE CLUSTERED INDEX [IX_ActiveQuantity]
ON [dbo].[ActiveQuantity] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table ActiveQuantity
-- ----------------------------
ALTER TABLE [dbo].[ActiveQuantity] ADD CONSTRAINT [PK__ActiveQu__EA8C91A73056A008] PRIMARY KEY NONCLUSTERED ([ActiveQuantityUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ArticlesManagement
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_ArticlesManagement]
ON [dbo].[ArticlesManagement] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table ArticlesManagement
-- ----------------------------
ALTER TABLE [dbo].[ArticlesManagement] ADD CONSTRAINT [PK__Articles__3214EC27B5A5775A] PRIMARY KEY NONCLUSTERED ([ArticleUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ArticleType
-- ----------------------------
ALTER TABLE [dbo].[ArticleType] ADD CONSTRAINT [PK__ArticleT__3214EC27FEDBA788] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Attractions
-- ----------------------------
ALTER TABLE [dbo].[Attractions] ADD CONSTRAINT [PK__Attracti__C1A2C22B51D5B2E4] PRIMARY KEY CLUSTERED ([AttractionsUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table AttractRanking
-- ----------------------------
ALTER TABLE [dbo].[AttractRanking] ADD CONSTRAINT [PK__AttractR__1BE958AA093F4ACC] PRIMARY KEY CLUSTERED ([AttractRankingUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Bank
-- ----------------------------
ALTER TABLE [dbo].[Bank] ADD CONSTRAINT [PK__Bank__B721ECE65FC98891] PRIMARY KEY CLUSTERED ([BankUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Bus
-- ----------------------------
ALTER TABLE [dbo].[Bus] ADD CONSTRAINT [PK__Bus__38B050402D3B9B39] PRIMARY KEY CLUSTERED ([BusUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table CarPark
-- ----------------------------
CREATE CLUSTERED INDEX [IX_CarPark]
ON [dbo].[CarPark] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table CarPark
-- ----------------------------
ALTER TABLE [dbo].[CarPark] ADD CONSTRAINT [PK__CarPark__515660106A869B26] PRIMARY KEY NONCLUSTERED ([CarParkUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Complaints
-- ----------------------------
CREATE CLUSTERED INDEX [IX_Complaints]
ON [dbo].[Complaints] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table Complaints
-- ----------------------------
ALTER TABLE [dbo].[Complaints] ADD CONSTRAINT [PK__Complain__9ACA9CD32444148A] PRIMARY KEY NONCLUSTERED ([ComplaintsUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Consult
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_Consult]
ON [dbo].[Consult] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table Consult
-- ----------------------------
ALTER TABLE [dbo].[Consult] ADD CONSTRAINT [PK__Consult__E9E22B709B0FD069] PRIMARY KEY NONCLUSTERED ([ConsultUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table CulturalIntroduc
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_CulturalIntroduc]
ON [dbo].[CulturalIntroduc] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table CulturalIntroduc
-- ----------------------------
ALTER TABLE [dbo].[CulturalIntroduc] ADD CONSTRAINT [PK__Cultural__5FAEDC3D34EFC8E4] PRIMARY KEY NONCLUSTERED ([CulturalIntroducUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Food
-- ----------------------------
CREATE CLUSTERED INDEX [IX_Food]
ON [dbo].[Food] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table Food
-- ----------------------------
ALTER TABLE [dbo].[Food] ADD CONSTRAINT [PK__Food__D03930DBC472C86F] PRIMARY KEY NONCLUSTERED ([FoodUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Gtoilet
-- ----------------------------
ALTER TABLE [dbo].[Gtoilet] ADD CONSTRAINT [PK__Gtoilet__C81D756B80F23569] PRIMARY KEY CLUSTERED ([GtoiletUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Hospital
-- ----------------------------
ALTER TABLE [dbo].[Hospital] ADD CONSTRAINT [PK__Hospital__1446BB33336F28A5] PRIMARY KEY CLUSTERED ([HospitalUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Hotel
-- ----------------------------
ALTER TABLE [dbo].[Hotel] ADD CONSTRAINT [PK__Hotel__761534FD249D1BC0] PRIMARY KEY CLUSTERED ([HotelUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table HotelRoom
-- ----------------------------
CREATE CLUSTERED INDEX [IX_HotelRoom]
ON [dbo].[HotelRoom] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table HotelRoom
-- ----------------------------
ALTER TABLE [dbo].[HotelRoom] ADD CONSTRAINT [PK__HotelRoo__F5371ACAF7AEF021] PRIMARY KEY NONCLUSTERED ([HotelRoomUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Information
-- ----------------------------
ALTER TABLE [dbo].[Information] ADD CONSTRAINT [PK__Informat__0AE607DC7D2DAAFE] PRIMARY KEY CLUSTERED ([InformationUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table InformationType
-- ----------------------------
ALTER TABLE [dbo].[InformationType] ADD CONSTRAINT [PK__Informat__DA68CD74ABDBA564] PRIMARY KEY CLUSTERED ([InformationTypeUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Leavemessage
-- ----------------------------
ALTER TABLE [dbo].[Leavemessage] ADD CONSTRAINT [PK__Leavemes__F0C1A4928159ECAA] PRIMARY KEY CLUSTERED ([LeavemessageUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Luxian
-- ----------------------------
ALTER TABLE [dbo].[Luxian] ADD CONSTRAINT [PK__Luxian__CBDCA2C1FE5611FD] PRIMARY KEY CLUSTERED ([LuxianUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Mapmark
-- ----------------------------
CREATE CLUSTERED INDEX [IX_Mapmark]
ON [dbo].[Mapmark] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table Mapmark
-- ----------------------------
ALTER TABLE [dbo].[Mapmark] ADD CONSTRAINT [PK__Mapmark__E3C33BC2996109D5] PRIMARY KEY NONCLUSTERED ([MapmarkUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Mark
-- ----------------------------
CREATE CLUSTERED INDEX [IX_Mark]
ON [dbo].[Mark] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table Mark
-- ----------------------------
ALTER TABLE [dbo].[Mark] ADD CONSTRAINT [PK__Mark__8201776D3CC73577] PRIMARY KEY NONCLUSTERED ([MarkUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table NaturalResources
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_NaturalResources]
ON [dbo].[NaturalResources] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table NaturalResources
-- ----------------------------
ALTER TABLE [dbo].[NaturalResources] ADD CONSTRAINT [PK__NaturalR__88904D0860741C18] PRIMARY KEY NONCLUSTERED ([NaturalResourcesUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table News
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_News]
ON [dbo].[News] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table News
-- ----------------------------
ALTER TABLE [dbo].[News] ADD CONSTRAINT [PK__News__95B8416C583889E1] PRIMARY KEY NONCLUSTERED ([NewsUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Pointer
-- ----------------------------
ALTER TABLE [dbo].[Pointer] ADD CONSTRAINT [PK__Pointer__ABA5D8F0F40F5406] PRIMARY KEY CLUSTERED ([PointerUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Promotional
-- ----------------------------
ALTER TABLE [dbo].[Promotional] ADD CONSTRAINT [PK__Promotio__D6D4BCBC61FF6ADB] PRIMARY KEY CLUSTERED ([PromotionalUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table PromotionalVideo
-- ----------------------------
ALTER TABLE [dbo].[PromotionalVideo] ADD CONSTRAINT [PK__Promotio__C91CC775C17EEBC7] PRIMARY KEY CLUSTERED ([PromotionalVideoUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Publicity
-- ----------------------------
ALTER TABLE [dbo].[Publicity] ADD CONSTRAINT [PK__Publicit__6D89C5C30D4E7BEF] PRIMARY KEY CLUSTERED ([PublicityUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table PublicityPicture
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_PublicityPicture]
ON [dbo].[PublicityPicture] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table PublicityPicture
-- ----------------------------
ALTER TABLE [dbo].[PublicityPicture] ADD CONSTRAINT [PK__Publicit__7C53D74B3BC469C0] PRIMARY KEY NONCLUSTERED ([PublicityPictureUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table PublicityType
-- ----------------------------
ALTER TABLE [dbo].[PublicityType] ADD CONSTRAINT [PK__Publicit__3132BECF7C91DA36] PRIMARY KEY CLUSTERED ([PublicityTypeUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table ScenicSpot
-- ----------------------------
CREATE CLUSTERED INDEX [IX_ScenicSpot]
ON [dbo].[ScenicSpot] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table ScenicSpot
-- ----------------------------
ALTER TABLE [dbo].[ScenicSpot] ADD CONSTRAINT [PK__ScenicSp__8631451253BCCBE4] PRIMARY KEY NONCLUSTERED ([ScenicSpotUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table searchl
-- ----------------------------
ALTER TABLE [dbo].[searchl] ADD CONSTRAINT [PK__search__497F6CB4B8FCE125] PRIMARY KEY CLUSTERED ([guid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sharing
-- ----------------------------
ALTER TABLE [dbo].[Sharing] ADD CONSTRAINT [PK__Sharing__FF18238810FB386F] PRIMARY KEY CLUSTERED ([SharingUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SpecialPick
-- ----------------------------
CREATE CLUSTERED INDEX [IX_SpecialPick]
ON [dbo].[SpecialPick] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SpecialPick
-- ----------------------------
ALTER TABLE [dbo].[SpecialPick] ADD CONSTRAINT [PK__SpecialP__356D48E6AF8F25E3] PRIMARY KEY NONCLUSTERED ([SpecialPickUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Strategy
-- ----------------------------
ALTER TABLE [dbo].[Strategy] ADD CONSTRAINT [PK__Strategy__B3C3A5A2A035CB8C] PRIMARY KEY CLUSTERED ([StrategyUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemIcon
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemIcon]
ON [dbo].[SystemIcon] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemIcon
-- ----------------------------
ALTER TABLE [dbo].[SystemIcon] ADD CONSTRAINT [PK__SystemIc__540CED9CA9C5EF3A] PRIMARY KEY NONCLUSTERED ([SystemIconUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemLog
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemLog]
ON [dbo].[SystemLog] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemLog
-- ----------------------------
ALTER TABLE [dbo].[SystemLog] ADD CONSTRAINT [PK__SystemLo__EC98D064570938F6] PRIMARY KEY NONCLUSTERED ([SystemLogUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemMenu
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemMenu]
ON [dbo].[SystemMenu] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemMenu
-- ----------------------------
ALTER TABLE [dbo].[SystemMenu] ADD CONSTRAINT [PK__SystemMe__859EB749BD38D1AA] PRIMARY KEY NONCLUSTERED ([SystemMenuUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemPermission
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemPermission]
ON [dbo].[SystemPermission] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemPermission
-- ----------------------------
ALTER TABLE [dbo].[SystemPermission] ADD CONSTRAINT [PK__SystemPe__44671AD2FBD363BB] PRIMARY KEY NONCLUSTERED ([SystemPermissionUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemRole
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemRole]
ON [dbo].[SystemRole] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemRole
-- ----------------------------
ALTER TABLE [dbo].[SystemRole] ADD CONSTRAINT [PK__SystemRo__68ACD1AFF45C10EA] PRIMARY KEY NONCLUSTERED ([SystemRoleUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemRolePermissionMapping
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemRolePermissionMapping]
ON [dbo].[SystemRolePermissionMapping] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemRolePermissionMapping
-- ----------------------------
ALTER TABLE [dbo].[SystemRolePermissionMapping] ADD CONSTRAINT [PK__SystemRo__4CEAA00283521FC9] PRIMARY KEY NONCLUSTERED ([SystemRoleUUID], [SystemPermissionUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SystemSetting
-- ----------------------------
ALTER TABLE [dbo].[SystemSetting] ADD CONSTRAINT [SystemSetting_PK] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemUser
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemUser]
ON [dbo].[SystemUser] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemUser
-- ----------------------------
ALTER TABLE [dbo].[SystemUser] ADD CONSTRAINT [PK__SystemUs__0BD86B9580F5647F] PRIMARY KEY NONCLUSTERED ([SystemUserUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table SystemUserRoleMapping
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_SystemUserRoleMapping]
ON [dbo].[SystemUserRoleMapping] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table SystemUserRoleMapping
-- ----------------------------
ALTER TABLE [dbo].[SystemUserRoleMapping] ADD CONSTRAINT [PK__SystemUs__FD52A68F37AD580B] PRIMARY KEY NONCLUSTERED ([SystemUserUUID], [SystemRoleUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table TourGuide
-- ----------------------------
CREATE UNIQUE CLUSTERED INDEX [IX_TourGuide]
ON [dbo].[TourGuide] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table TourGuide
-- ----------------------------
ALTER TABLE [dbo].[TourGuide] ADD CONSTRAINT [PK__TourGuid__AF258A567A7E2EEC] PRIMARY KEY NONCLUSTERED ([TourGuideUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Tourism
-- ----------------------------
ALTER TABLE [dbo].[Tourism] ADD CONSTRAINT [PK__Tourism__E0C2EBC601C39806] PRIMARY KEY CLUSTERED ([TourismUuid])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Treasurerecord
-- ----------------------------
ALTER TABLE [dbo].[Treasurerecord] ADD CONSTRAINT [PK__Treasure__71FB5240A2B59BC9] PRIMARY KEY CLUSTERED ([TreasurerecordUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Videomark
-- ----------------------------
CREATE CLUSTERED INDEX [IX_Videomark]
ON [dbo].[Videomark] (
  [ID] ASC
)  
FILESTREAM_ON [NULL]
GO


-- ----------------------------
-- Primary Key structure for table Videomark
-- ----------------------------
ALTER TABLE [dbo].[Videomark] ADD CONSTRAINT [PK__Videomar__22513F5BFF630013] PRIMARY KEY NONCLUSTERED ([VideomarkUUID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Mapmark
-- ----------------------------
ALTER TABLE [dbo].[Mapmark] ADD CONSTRAINT [FK__Mapmark__MarkUUI__0AF29B96] FOREIGN KEY ([MarkUUID]) REFERENCES [dbo].[Mark] ([MarkUUID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Publicity
-- ----------------------------
ALTER TABLE [dbo].[Publicity] ADD CONSTRAINT [FK__Publicity__Publi__0BE6BFCF] FOREIGN KEY ([PublicityTypeUUID]) REFERENCES [dbo].[PublicityType] ([PublicityTypeUUID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table SystemPermission
-- ----------------------------
ALTER TABLE [dbo].[SystemPermission] ADD CONSTRAINT [FK__SystemPer__Syste__0CDAE408] FOREIGN KEY ([SystemMenuUUID]) REFERENCES [dbo].[SystemMenu] ([SystemMenuUUID]) ON DELETE SET NULL ON UPDATE CASCADE
GO

