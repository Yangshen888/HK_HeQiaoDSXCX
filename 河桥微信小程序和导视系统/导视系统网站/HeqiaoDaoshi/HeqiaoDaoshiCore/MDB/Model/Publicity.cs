using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ��������
	/// </summary>
	[Serializable]
	public partial class Publicity
	{
		public Publicity()
		{}
		#region Model
		private int _id;
		private DateTime _createtime= DateTime.Now;
		private Guid _publicityuuid;
		private string _title;
		private Guid _publicitytypeuuid;
		private string _introduce;
		private string _cover;
		private string _picture;
		private string _video;
		private int? _isdeleted;
		private int? _state;
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
		public DateTime CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid PublicityUUID
		{
			set{ _publicityuuid=value;}
			get{return _publicityuuid;}
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
		/// ����
		/// </summary>
		public Guid PublicityTypeUUID
		{
			set{ _publicitytypeuuid=value;}
			get{return _publicitytypeuuid;}
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
		/// ����ͼƬ
		/// </summary>
		public string Cover
		{
			set{ _cover=value;}
			get{return _cover;}
		}
		/// <summary>
		/// ����ͼƬ
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// ��Ƶ
		/// </summary>
		public string Video
		{
			set{ _video=value;}
			get{return _video;}
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
		/// 0.������ 1.�ѷ���
		/// </summary>
		public int? State
		{
			set{ _state=value;}
			get{return _state;}
		}
		#endregion Model

	}
}

