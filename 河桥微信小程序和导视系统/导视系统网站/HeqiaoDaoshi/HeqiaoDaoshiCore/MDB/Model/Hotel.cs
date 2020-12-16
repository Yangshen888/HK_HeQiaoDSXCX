using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// �Ƶ����ޱ�
	/// </summary>
	[Serializable]
	public partial class Hotel
	{
		public Hotel()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _hoteluuid;
		private string _name;
		private string _phone;
		private string _introduction;
		private string _address;
		private string _price;
		private string _picture;
		private int? _state;
		private int? _isdelete;
		private DateTime? _addtime;
		private string _addpeople;
		private string _cover;
		private string _hotelurl;
		private string _lon;
		private string _lat;
		private int? _shopid;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public DateTime? CreateTime
		{
			set{ _createtime=value;}
			get{return _createtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid HotelUUID
		{
			set{ _hoteluuid=value;}
			get{return _hoteluuid;}
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
		/// �绰
		/// </summary>
		public string Phone
		{
			set{ _phone=value;}
			get{return _phone;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Introduction
		{
			set{ _introduction=value;}
			get{return _introduction;}
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
		/// �۸�
		/// </summary>
		public string Price
		{
			set{ _price=value;}
			get{return _price;}
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
		/// 0.������ 1.�ѷ���
		/// </summary>
		public int? State
		{
			set{ _state=value;}
			get{return _state;}
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
		/// 
		/// </summary>
		public DateTime? AddTime
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
		/// <summary>
		/// ����
		/// </summary>
		public string Cover
		{
			set{ _cover=value;}
			get{return _cover;}
		}
		/// <summary>
		/// �Ƶ�����
		/// </summary>
		public string HotelUrl
		{
			set{ _hotelurl=value;}
			get{return _hotelurl;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Lon
		{
			set{ _lon=value;}
			get{return _lon;}
		}
		/// <summary>
		/// γ��
		/// </summary>
		public string Lat
		{
			set{ _lat=value;}
			get{return _lat;}
		}
		/// <summary>
		/// �̳�����ӦID
		/// </summary>
		public int? ShopId
		{
			set{ _shopid=value;}
			get{return _shopid;}
		}
		#endregion Model

	}
}

