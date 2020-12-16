using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ��������
	/// </summary>
	[Serializable]
	public partial class Tourism
	{
		public Tourism()
		{}
		#region Model
		private Guid _tourismuuid;
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private string _name;
		private string _spotcontent;
		private string _address;
		private string _picture;
		private string _video;
		private string _audio;
		private int? _isdelete;
		private int? _orderby;
		private int? _state;
		private string _addtime;
		private string _addpeople;
		/// <summary>
		/// 
		/// </summary>
		public Guid TourismUuid
		{
			set{ _tourismuuid=value;}
			get{return _tourismuuid;}
		}
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
		/// ����
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string SpotContent
		{
			set{ _spotcontent=value;}
			get{return _spotcontent;}
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
		/// ͼƬ
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
		/// ��Ƶ
		/// </summary>
		public string Audio
		{
			set{ _audio=value;}
			get{return _audio;}
		}
		/// <summary>
		/// 0.δɾ 1.��ɾ
		/// </summary>
		public int? IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public int? OrderBy
		{
			set{ _orderby=value;}
			get{return _orderby;}
		}
		/// <summary>
		/// 0.������ 1.�ѷ���
		/// </summary>
		public int? State
		{
			set{ _state=value;}
			get{return _state;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		#endregion Model

	}
}

