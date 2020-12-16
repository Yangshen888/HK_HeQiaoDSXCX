using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ������Ѷ
	/// </summary>
	[Serializable]
	public partial class Information
	{
		public Information()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime;
		private Guid _informationuuid;
		private string _title;
		private Guid _informationtypeuuid;
		private string _introduce;
		private string _address;
		private DateTime? _starttime;
		private string _picture;
		private bool _state;
		private int? _isdeleted;
		private string _photo;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid InformationUUID
		{
			set{ _informationuuid=value;}
			get{return _informationuuid;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ��Ѷ����
		/// </summary>
		public Guid InformationTypeUUID
		{
			set{ _informationtypeuuid=value;}
			get{return _informationtypeuuid;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Introduce
		{
			set{ _introduce=value;}
			get{return _introduce;}
		}
		/// <summary>
		/// ��ַ
		/// </summary>
		public string Address
		{
			set{ _address=value;}
			get{return _address;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? StartTime
		{
			set{ _starttime=value;}
			get{return _starttime;}
		}
		/// <summary>
		/// ͼƬ(����)
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// 0.������ 1.�ѷ���
		/// </summary>
		public bool State
		{
			set{ _state=value;}
			get{return _state;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// ����ͼƬ(һ��)
		/// </summary>
		public string Photo
		{
			set{ _photo=value;}
			get{return _photo;}
		}
		#endregion Model

	}
}

