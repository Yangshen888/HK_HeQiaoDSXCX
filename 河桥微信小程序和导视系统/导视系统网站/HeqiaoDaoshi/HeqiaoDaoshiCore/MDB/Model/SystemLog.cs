using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ϵͳ��־��
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
		/// �����û�ID
		/// </summary>
		public string UserID
		{
			set{ _userid=value;}
			get{return _userid;}
		}
		/// <summary>
		/// �û���������
		/// </summary>
		public int? UserIDType
		{
			set{ _useridtype=value;}
			get{return _useridtype;}
		}
		/// <summary>
		/// �����û��û���
		/// </summary>
		public string UserName
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public DateTime? OperationTime
		{
			set{ _operationtime=value;}
			get{return _operationtime;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public string OperationContent
		{
			set{ _operationcontent=value;}
			get{return _operationcontent;}
		}
		/// <summary>
		/// IP��ַ
		/// </summary>
		public string IPAddress
		{
			set{ _ipaddress=value;}
			get{return _ipaddress;}
		}
		/// <summary>
		/// ��������(��ɾ�Ĳ�)
		/// </summary>
		public string Type
		{
			set{ _type=value;}
			get{return _type;}
		}
		/// <summary>
		/// ���ɾ��1��δɾ��2����ɾ��
		/// </summary>
		public int IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// ���ʱ��
		/// </summary>
		public DateTime AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// �����
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

