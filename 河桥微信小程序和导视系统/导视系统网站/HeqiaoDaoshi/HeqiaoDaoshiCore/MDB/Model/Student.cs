using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// Student:ʵ����(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
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
		/// ѧ��ID
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ѧ��
		/// </summary>
		public string stuid
		{
			set{ _stuid=value;}
			get{return _stuid;}
		}
		/// <summary>
		/// ���ڰ༶id
		/// </summary>
		public int? classid
		{
			set{ _classid=value;}
			get{return _classid;}
		}
		/// <summary>
		/// ѧ������
		/// </summary>
		public string stuname
		{
			set{ _stuname=value;}
			get{return _stuname;}
		}
		/// <summary>
		/// ѧ���Ա�
		/// </summary>
		public string sex
		{
			set{ _sex=value;}
			get{return _sex;}
		}
		/// <summary>
		/// ѧ���绰
		/// </summary>
		public string phone
		{
			set{ _phone=value;}
			get{return _phone;}
		}
		/// <summary>
		/// Ժϵ
		/// </summary>
		public string belong
		{
			set{ _belong=value;}
			get{return _belong;}
		}
		/// <summary>
		/// ѧ����ѧʱ��
		/// </summary>
		public DateTime? inschool
		{
			set{ _inschool=value;}
			get{return _inschool;}
		}
		/// <summary>
		/// ѧ������
		/// </summary>
		public DateTime? birthday
		{
			set{ _birthday=value;}
			get{return _birthday;}
		}
		/// <summary>
		/// ѧ����¼��
		/// </summary>
		public string username
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// ѧ����¼����
		/// </summary>
		public string userpassword
		{
			set{ _userpassword=value;}
			get{return _userpassword;}
		}
		/// <summary>
		/// ����(�ֱ��������о���)
		/// </summary>
		public string type
		{
			set{ _type=value;}
			get{return _type;}
		}
		/// <summary>
		/// �Ƿ����
		/// </summary>
		public string isaudite
		{
			set{ _isaudite=value;}
			get{return _isaudite;}
		}
		/// <summary>
		/// ����Ȩ��
		/// </summary>
		public int? roleid
		{
			set{ _roleid=value;}
			get{return _roleid;}
		}
		/// <summary>
		/// ��Ƭ
		/// </summary>
		public string photo
		{
			set{ _photo=value;}
			get{return _photo;}
		}
		/// <summary>
		/// ����¼ʱ��
		/// </summary>
		public DateTime? lasttime
		{
			set{ _lasttime=value;}
			get{return _lasttime;}
		}
		/// <summary>
		/// ״̬������/���ߣ�
		/// </summary>
		public string linestate
		{
			set{ _linestate=value;}
			get{return _linestate;}
		}
		/// <summary>
		/// �ʼ���ַ
		/// </summary>
		public string Email
		{
			set{ _email=value;}
			get{return _email;}
		}
		/// <summary>
		/// ��ʦ
		/// </summary>
		public string teachers
		{
			set{ _teachers=value;}
			get{return _teachers;}
		}
		/// <summary>
		/// ѧ����
		/// </summary>
		public string studentcard
		{
			set{ _studentcard=value;}
			get{return _studentcard;}
		}
		/// <summary>
		/// �о���
		/// </summary>
		public string core
		{
			set{ _core=value;}
			get{return _core;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string classes
		{
			set{ _classes=value;}
			get{return _classes;}
		}
		/// <summary>
		/// ѧ������
		/// </summary>
		public string SecondTeacher
		{
			set{ _secondteacher=value;}
			get{return _secondteacher;}
		}
		/// <summary>
		/// ѧ������
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
		/// ������
		/// </summary>
		public string tezhengma
		{
			set{ _tezhengma=value;}
			get{return _tezhengma;}
		}
		#endregion Model

	}
}

