using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 系统用户
	/// </summary>
	[Serializable]
	public partial class SystemUser
	{
		public SystemUser()
		{}
		#region Model
		private Guid _systemuseruuid;
		private string _loginname;
		private string _realname;
		private string _useridcard;
		private string _password;
		private int? _usertype;
		private Guid _schooluuid;
		private string _addtime;
		private string _addpeople;
		private int? _isdeleted;
		private string _managedepartment;
		private int _id;
		private string _zaigang;
		private string _phone;
		private string _email;
		private string _sex;
		private string _intime;
		private string _types;
		private string _address;
		private string _systemroleuuid;
		private string _remarks;
		private string _staffnum;
		private string _wechat;
		private string _topic;
		private string _content;
		private string _train;
		private string _main;
		private string _job;
		private int? _healthcertificate;
		private int? _isstaff=0;
		private int? _iscreedu=0;
		private string _placeofresidence;
		private string _age;
		private string _picture;
		private string _nickname;
		/// <summary>
		/// 
		/// </summary>
		public Guid SystemUserUUID
		{
			set{ _systemuseruuid=value;}
			get{return _systemuseruuid;}
		}
		/// <summary>
		/// 登录名
		/// </summary>
		public string LoginName
		{
			set{ _loginname=value;}
			get{return _loginname;}
		}
		/// <summary>
		/// 真实姓名
		/// </summary>
		public string RealName
		{
			set{ _realname=value;}
			get{return _realname;}
		}
		/// <summary>
		/// 身份证
		/// </summary>
		public string UserIdCard
		{
			set{ _useridcard=value;}
			get{return _useridcard;}
		}
		/// <summary>
		/// 密码
		/// </summary>
		public string PassWord
		{
			set{ _password=value;}
			get{return _password;}
		}
		/// <summary>
		/// 1 超管 2其他
		/// </summary>
		public int? UserType
		{
			set{ _usertype=value;}
			get{return _usertype;}
		}
		/// <summary>
		/// 学校UUID
		/// </summary>
		public Guid SchoolUUID
		{
			set{ _schooluuid=value;}
			get{return _schooluuid;}
		}
		/// <summary>
		/// 注册时间
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 添加人
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		/// <summary>
		/// 0正常 1删除
		/// </summary>
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ManageDepartment
		{
			set{ _managedepartment=value;}
			get{return _managedepartment;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 状态
		/// </summary>
		public string ZaiGang
		{
			set{ _zaigang=value;}
			get{return _zaigang;}
		}
		/// <summary>
		/// 电话
		/// </summary>
		public string Phone
		{
			set{ _phone=value;}
			get{return _phone;}
		}
		/// <summary>
		/// 邮箱
		/// </summary>
		public string Email
		{
			set{ _email=value;}
			get{return _email;}
		}
		/// <summary>
		/// 性别
		/// </summary>
		public string Sex
		{
			set{ _sex=value;}
			get{return _sex;}
		}
		/// <summary>
		/// 入职时间
		/// </summary>
		public string InTime
		{
			set{ _intime=value;}
			get{return _intime;}
		}
		/// <summary>
		/// 部门
		/// </summary>
		public string Types
		{
			set{ _types=value;}
			get{return _types;}
		}
		/// <summary>
		/// 地址
		/// </summary>
		public string Address
		{
			set{ _address=value;}
			get{return _address;}
		}
		/// <summary>
		/// 角色id,用逗号分隔
		/// </summary>
		public string SystemRoleUUid
		{
			set{ _systemroleuuid=value;}
			get{return _systemroleuuid;}
		}
		/// <summary>
		/// 备注
		/// </summary>
		public string Remarks
		{
			set{ _remarks=value;}
			get{return _remarks;}
		}
		/// <summary>
		/// 职工号
		/// </summary>
		public string StaffNum
		{
			set{ _staffnum=value;}
			get{return _staffnum;}
		}
		/// <summary>
		/// 微信
		/// </summary>
		public string Wechat
		{
			set{ _wechat=value;}
			get{return _wechat;}
		}
		/// <summary>
		/// 会议主题
		/// </summary>
		public string Topic
		{
			set{ _topic=value;}
			get{return _topic;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Train
		{
			set{ _train=value;}
			get{return _train;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Main
		{
			set{ _main=value;}
			get{return _main;}
		}
		/// <summary>
		/// 职务
		/// </summary>
		public string Job
		{
			set{ _job=value;}
			get{return _job;}
		}
		/// <summary>
		/// 是否有健康证    0无   1有
		/// </summary>
		public int? HealthCertificate
		{
			set{ _healthcertificate=value;}
			get{return _healthcertificate;}
		}
		/// <summary>
		/// 是否为食堂工作人员 0否   1是
		/// </summary>
		public int? IsStaff
		{
			set{ _isstaff=value;}
			get{return _isstaff;}
		}
		/// <summary>
		/// 是否由管理级别创建  0否   1是
		/// </summary>
		public int? IsCreEdu
		{
			set{ _iscreedu=value;}
			get{return _iscreedu;}
		}
		/// <summary>
		/// 居住地
		/// </summary>
		public string Placeofresidence
		{
			set{ _placeofresidence=value;}
			get{return _placeofresidence;}
		}
		/// <summary>
		/// 年龄
		/// </summary>
		public string Age
		{
			set{ _age=value;}
			get{return _age;}
		}
		/// <summary>
		/// 头像
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// 用户昵称
		/// </summary>
		public string Nickname
		{
			set{ _nickname=value;}
			get{return _nickname;}
		}
		#endregion Model

	}
}

