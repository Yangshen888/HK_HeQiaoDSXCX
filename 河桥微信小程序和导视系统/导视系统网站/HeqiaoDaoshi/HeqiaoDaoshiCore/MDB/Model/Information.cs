using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 景区资讯
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
		/// 标题
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 资讯类型
		/// </summary>
		public Guid InformationTypeUUID
		{
			set{ _informationtypeuuid=value;}
			get{return _informationtypeuuid;}
		}
		/// <summary>
		/// 介绍
		/// </summary>
		public string Introduce
		{
			set{ _introduce=value;}
			get{return _introduce;}
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
		/// 
		/// </summary>
		public DateTime? StartTime
		{
			set{ _starttime=value;}
			get{return _starttime;}
		}
		/// <summary>
		/// 图片(三张)
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// 0.保存中 1.已发布
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
		/// 封面图片(一张)
		/// </summary>
		public string Photo
		{
			set{ _photo=value;}
			get{return _photo;}
		}
		#endregion Model

	}
}

