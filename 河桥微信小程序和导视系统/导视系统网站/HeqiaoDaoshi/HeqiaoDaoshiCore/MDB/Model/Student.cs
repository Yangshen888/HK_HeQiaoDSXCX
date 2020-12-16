using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// Student:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Student
	{
		public Student()
		{}
		#region Model
		private int _id;
		private string _stuid;
		private int? _classid=0;
		private string _stuname;
		private string _sex;
		private string _phone;
		private string _belong;
		private DateTime? _inschool;
		private DateTime? _birthday;
		private string _username;
		private string _userpassword;
		private string _type;
		private string _isaudite;
		private int? _roleid;
		private string _photo;
		private DateTime? _lasttime= DateTime.Now;
		private string _linestate;
		private string _email;
		private string _teachers;
		private string _studentcard;
		private string _core;
		private string _classes;
		private string _secondteacher;
		private string _studenttype;
		private DateTime? _date;
		private string _tezhengma;
		/// <summary>
		/// 学生ID
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 学号
		/// </summary>
		public string stuid
		{
			set{ _stuid=value;}
			get{return _stuid;}
		}
		/// <summary>
		/// 所在班级id
		/// </summary>
		public int? classid
		{
			set{ _classid=value;}
			get{return _classid;}
		}
		/// <summary>
		/// 学生姓名
		/// </summary>
		public string stuname
		{
			set{ _stuname=value;}
			get{return _stuname;}
		}
		/// <summary>
		/// 学生性别
		/// </summary>
		public string sex
		{
			set{ _sex=value;}
			get{return _sex;}
		}
		/// <summary>
		/// 学生电话
		/// </summary>
		public string phone
		{
			set{ _phone=value;}
			get{return _phone;}
		}
		/// <summary>
		/// 院系
		/// </summary>
		public string belong
		{
			set{ _belong=value;}
			get{return _belong;}
		}
		/// <summary>
		/// 学生入学时间
		/// </summary>
		public DateTime? inschool
		{
			set{ _inschool=value;}
			get{return _inschool;}
		}
		/// <summary>
		/// 学生生日
		/// </summary>
		public DateTime? birthday
		{
			set{ _birthday=value;}
			get{return _birthday;}
		}
		/// <summary>
		/// 学生登录名
		/// </summary>
		public string username
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// 学生登录密码
		/// </summary>
		public string userpassword
		{
			set{ _userpassword=value;}
			get{return _userpassword;}
		}
		/// <summary>
		/// 类型(分本科生和研究生)
		/// </summary>
		public string type
		{
			set{ _type=value;}
			get{return _type;}
		}
		/// <summary>
		/// 是否审核
		/// </summary>
		public string isaudite
		{
			set{ _isaudite=value;}
			get{return _isaudite;}
		}
		/// <summary>
		/// 所属权限
		/// </summary>
		public int? roleid
		{
			set{ _roleid=value;}
			get{return _roleid;}
		}
		/// <summary>
		/// 照片
		/// </summary>
		public string photo
		{
			set{ _photo=value;}
			get{return _photo;}
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
		/// 邮件地址
		/// </summary>
		public string Email
		{
			set{ _email=value;}
			get{return _email;}
		}
		/// <summary>
		/// 教师
		/// </summary>
		public string teachers
		{
			set{ _teachers=value;}
			get{return _teachers;}
		}
		/// <summary>
		/// 学生号
		/// </summary>
		public string studentcard
		{
			set{ _studentcard=value;}
			get{return _studentcard;}
		}
		/// <summary>
		/// 研究所
		/// </summary>
		public string core
		{
			set{ _core=value;}
			get{return _core;}
		}
		/// <summary>
		/// 分数
		/// </summary>
		public string classes
		{
			set{ _classes=value;}
			get{return _classes;}
		}
		/// <summary>
		/// 学生二导
		/// </summary>
		public string SecondTeacher
		{
			set{ _secondteacher=value;}
			get{return _secondteacher;}
		}
		/// <summary>
		/// 学生类型
		/// </summary>
		public string StudentType
		{
			set{ _studenttype=value;}
			get{return _studenttype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? date
		{
			set{ _date=value;}
			get{return _date;}
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

