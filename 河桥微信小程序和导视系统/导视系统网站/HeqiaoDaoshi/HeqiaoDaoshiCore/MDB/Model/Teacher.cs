using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// Teacher:ʵ����(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
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
		/// ʦ�ʶ���ID
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ��ʦ����
		/// </summary>
		public string teacherName
		{
			set{ _teachername=value;}
			get{return _teachername;}
		}
		/// <summary>
		/// �Ա�
		/// </summary>
		public string sex
		{
			set{ _sex=value;}
			get{return _sex;}
		}
		/// <summary>
		/// ͼƬ
		/// </summary>
		public string photo
		{
			set{ _photo=value;}
			get{return _photo;}
		}
		/// <summary>
		/// ͼƬ
		/// </summary>
		public int? jobPosition
		{
			set{ _jobposition=value;}
			get{return _jobposition;}
		}
		/// <summary>
		/// ��ʦְ��
		/// </summary>
		public string jobTitles
		{
			set{ _jobtitles=value;}
			get{return _jobtitles;}
		}
		/// <summary>
		/// ��ʦְ��
		/// </summary>
		public string discipline
		{
			set{ _discipline=value;}
			get{return _discipline;}
		}
		/// <summary>
		/// �칫��
		/// </summary>
		public string office
		{
			set{ _office=value;}
			get{return _office;}
		}
		/// <summary>
		/// �ֻ�
		/// </summary>
		public string mobile
		{
			set{ _mobile=value;}
			get{return _mobile;}
		}
		/// <summary>
		/// �����ʼ�
		/// </summary>
		public string email
		{
			set{ _email=value;}
			get{return _email;}
		}
		/// <summary>
		/// �����ʼ�
		/// </summary>
		public string teacherdetail
		{
			set{ _teacherdetail=value;}
			get{return _teacherdetail;}
		}
		/// <summary>
		/// �û�����
		/// </summary>
		public string username
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// �û�����
		/// </summary>
		public string userpassword
		{
			set{ _userpassword=value;}
			get{return _userpassword;}
		}
		/// <summary>
		/// ���
		/// </summary>
		public string isaudite
		{
			set{ _isaudite=value;}
			get{return _isaudite;}
		}
		/// <summary>
		/// ��ʦ���
		/// </summary>
		public string teachernum
		{
			set{ _teachernum=value;}
			get{return _teachernum;}
		}
		/// <summary>
		/// ��ɫ���
		/// </summary>
		public int? roleid
		{
			set{ _roleid=value;}
			get{return _roleid;}
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
		/// ѧ��
		/// </summary>
		public string college
		{
			set{ _college=value;}
			get{return _college;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string teachercard
		{
			set{ _teachercard=value;}
			get{return _teachercard;}
		}
		/// <summary>
		/// �༶
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

