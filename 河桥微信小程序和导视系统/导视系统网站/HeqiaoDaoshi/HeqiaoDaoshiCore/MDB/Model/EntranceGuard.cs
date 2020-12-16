using System;
namespace Haikan.LabSystemCore.Model
{
	/// <summary>
	/// 门禁表
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
		/// 标识主键ID
		/// </summary>
		public int id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 管理员姓名
		/// </summary>
		public string GNameListID
		{
			set{ _gnamelistid=value;}
			get{return _gnamelistid;}
		}
		/// <summary>
		/// 门禁编号
		/// </summary>
		public string Entcardnumber
		{
			set{ _entcardnumber=value;}
			get{return _entcardnumber;}
		}
		/// <summary>
		/// IP地址
		/// </summary>
		public string ip
		{
			set{ _ip=value;}
			get{return _ip;}
		}
		/// <summary>
		/// 端口号
		/// </summary>
		public int? USB
		{
			set{ _usb=value;}
			get{return _usb;}
		}
		/// <summary>
		/// 开始时间
		/// </summary>
		public DateTime? stime
		{
			set{ _stime=value;}
			get{return _stime;}
		}
		/// <summary>
		/// 结束时间
		/// </summary>
		public DateTime? etime
		{
			set{ _etime=value;}
			get{return _etime;}
		}
		/// <summary>
		/// 所属管理员名称集合
		/// </summary>
		public string GNameListName
		{
			set{ _gnamelistname=value;}
			get{return _gnamelistname;}
		}
		/// <summary>
		/// 学生ID集合
		/// </summary>
		public string StudenListID
		{
			set{ _studenlistid=value;}
			get{return _studenlistid;}
		}
		/// <summary>
		/// 学生姓名集合
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
		/// 端口
		/// </summary>
		public string Port
		{
			set{ _port=value;}
			get{return _port;}
		}
		#endregion Model

	}
}

