using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// Teacher:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Teacher
	{
		public Teacher()
		{}
		#region Model
		private int _id;
		private string _teachername;
		private string _sex;
		private string _photo;
		private int? _jobposition;
		private string _jobtitles;
		private string _discipline;
		private string _office;
		private string _mobile;
		private string _email;
		private string _teacherdetail;
		private string _username;
		private string _userpassword;
		private string _isaudite;
		private string _teachernum;
		private int? _roleid;
		private DateTime? _lasttime= DateTime.Now;
		private string _linestate;
		private string _college;
		private string _teachercard;
		private string _classes;
		private string _pushid= "0";
		private string _teachtype;
		private string _tezhengma;
		/// <summary>
		/// 师资队伍ID
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 教师名称
		/// </summary>
		public string teacherName
		{
			set{ _teachername=value;}
			get{return _teachername;}
		}
		/// <summary>
		/// 性别
		/// </summary>
		public string sex
		{
			set{ _sex=value;}
			get{return _sex;}
		}
		/// <summary>
		/// 图片
		/// </summary>
		public string photo
		{
			set{ _photo=value;}
			get{return _photo;}
		}
		/// <summary>
		/// 图片
		/// </summary>
		public int? jobPosition
		{
			set{ _jobposition=value;}
			get{return _jobposition;}
		}
		/// <summary>
		/// 教师职称
		/// </summary>
		public string jobTitles
		{
			set{ _jobtitles=value;}
			get{return _jobtitles;}
		}
		/// <summary>
		/// 教师职称
		/// </summary>
		public string discipline
		{
			set{ _discipline=value;}
			get{return _discipline;}
		}
		/// <summary>
		/// 办公室
		/// </summary>
		public string office
		{
			set{ _office=value;}
			get{return _office;}
		}
		/// <summary>
		/// 手机
		/// </summary>
		public string mobile
		{
			set{ _mobile=value;}
			get{return _mobile;}
		}
		/// <summary>
		/// 电子邮件
		/// </summary>
		public string email
		{
			set{ _email=value;}
			get{return _email;}
		}
		/// <summary>
		/// 电子邮件
		/// </summary>
		public string teacherdetail
		{
			set{ _teacherdetail=value;}
			get{return _teacherdetail;}
		}
		/// <summary>
		/// 用户名称
		/// </summary>
		public string username
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// 用户密码
		/// </summary>
		public string userpassword
		{
			set{ _userpassword=value;}
			get{return _userpassword;}
		}
		/// <summary>
		/// 编号
		/// </summary>
		public string isaudite
		{
			set{ _isaudite=value;}
			get{return _isaudite;}
		}
		/// <summary>
		/// 教师编号
		/// </summary>
		public string teachernum
		{
			set{ _teachernum=value;}
			get{return _teachernum;}
		}
		/// <summary>
		/// 角色编号
		/// </summary>
		public int? roleid
		{
			set{ _roleid=value;}
			get{return _roleid;}
		}
		/// <summary>
		/// 最后登录时间
		/// </summary>
		public DateTime? lasttime
		{
			set{ _lasttime=value;}
			get{return _lasttime;}
		}
		/// <summary>
		/// 状态（在线/离线）
		/// </summary>
		public string linestate
		{
			set{ _linestate=value;}
			get{return _linestate;}
		}
		/// <summary>
		/// 学会
		/// </summary>
		public string college
		{
			set{ _college=value;}
			get{return _college;}
		}
		/// <summary>
		/// 卡号
		/// </summary>
		public string teachercard
		{
			set{ _teachercard=value;}
			get{return _teachercard;}
		}
		/// <summary>
		/// 班级
		/// </summary>
		public string classes
		{
			set{ _classes=value;}
			get{return _classes;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PushID
		{
			set{ _pushid=value;}
			get{return _pushid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TeachType
		{
			set{ _teachtype=value;}
			get{return _teachtype;}
		}
		/// <summary>
		/// 特征码
		/// </summary>
		public string tezhengma
		{
			set{ _tezhengma=value;}
			get{return _tezhengma;}
		}
		#endregion Model

	}
}

