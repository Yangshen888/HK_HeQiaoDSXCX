using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 系统日志表
	/// </summary>
	[Serializable]
	public partial class SystemLog
	{
		public SystemLog()
		{}
		#region Model
		private Guid _systemloguuid;
		private string _userid;
		private int? _useridtype;
		private string _username;
		private DateTime? _operationtime;
		private string _operationcontent;
		private string _ipaddress;
		private string _type;
		private int _isdelete;
		private DateTime _addtime;
		private string _addpeople;
		private int _id;
		/// <summary>
		/// 
		/// </summary>
		public Guid SystemLogUUID
		{
			set{ _systemloguuid=value;}
			get{return _systemloguuid;}
		}
		/// <summary>
		/// 操作用户ID
		/// </summary>
		public string UserID
		{
			set{ _userid=value;}
			get{return _userid;}
		}
		/// <summary>
		/// 用户名和类型
		/// </summary>
		public int? UserIDType
		{
			set{ _useridtype=value;}
			get{return _useridtype;}
		}
		/// <summary>
		/// 操作用户用户名
		/// </summary>
		public string UserName
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// 操作时间
		/// </summary>
		public DateTime? OperationTime
		{
			set{ _operationtime=value;}
			get{return _operationtime;}
		}
		/// <summary>
		/// 操作内容
		/// </summary>
		public string OperationContent
		{
			set{ _operationcontent=value;}
			get{return _operationcontent;}
		}
		/// <summary>
		/// IP地址
		/// </summary>
		public string IPAddress
		{
			set{ _ipaddress=value;}
			get{return _ipaddress;}
		}
		/// <summary>
		/// 操作类型(增删改查)
		/// </summary>
		public string Type
		{
			set{ _type=value;}
			get{return _type;}
		}
		/// <summary>
		/// 标记删除1，未删除2，已删除
		/// </summary>
		public int IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// 添加时间
		/// </summary>
		public DateTime AddTime
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
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		#endregion Model

	}
}

