using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// �Ž���
	/// </summary>
	[Serializable]
	public partial class EntranceGuard
	{
		public EntranceGuard()
		{}
		#region Model
		private int _id;
		private string _gnamelistid;
		private string _entcardnumber;
		private string _ip;
		private int? _usb;
		private DateTime? _stime;
		private DateTime? _etime;
		private string _gnamelistname;
		private string _studenlistid;
		private string _studentlistname;
		private string _entcardtype;
		private string _port;
		/// <summary>
		/// ��ʶ����ID
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ����Ա����
		/// </summary>
		public string GNameListID
		{
			set{ _gnamelistid=value;}
			get{return _gnamelistid;}
		}
		/// <summary>
		/// �Ž����
		/// </summary>
		public string Entcardnumber
		{
			set{ _entcardnumber=value;}
			get{return _entcardnumber;}
		}
		/// <summary>
		/// IP��ַ
		/// </summary>
		public string ip
		{
			set{ _ip=value;}
			get{return _ip;}
		}
		/// <summary>
		/// �˿ں�
		/// </summary>
		public int? USB
		{
			set{ _usb=value;}
			get{return _usb;}
		}
		/// <summary>
		/// ��ʼʱ��
		/// </summary>
		public DateTime? stime
		{
			set{ _stime=value;}
			get{return _stime;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public DateTime? etime
		{
			set{ _etime=value;}
			get{return _etime;}
		}
		/// <summary>
		/// ��������Ա���Ƽ���
		/// </summary>
		public string GNameListName
		{
			set{ _gnamelistname=value;}
			get{return _gnamelistname;}
		}
		/// <summary>
		/// ѧ��ID����
		/// </summary>
		public string StudenListID
		{
			set{ _studenlistid=value;}
			get{return _studenlistid;}
		}
		/// <summary>
		/// ѧ����������
		/// </summary>
		public string StudentListName
		{
			set{ _studentlistname=value;}
			get{return _studentlistname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string EntcardType
		{
			set{ _entcardtype=value;}
			get{return _entcardtype;}
		}
		/// <summary>
		/// �˿�
		/// </summary>
		public string Port
		{
			set{ _port=value;}
			get{return _port;}
		}
		#endregion Model

	}
}

