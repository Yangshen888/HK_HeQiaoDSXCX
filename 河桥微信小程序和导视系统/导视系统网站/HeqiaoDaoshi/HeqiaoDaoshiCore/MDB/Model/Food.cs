using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ��ʳ�ز�
	/// </summary>
	[Serializable]
	public partial class Food
	{
		public Food()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _fooduuid;
		private string _foodname;
		private string _title;
		private string _introduction;
		private string _address;
		private string _price;
		private string _picture;
		private int? _state;
		private int? _isdelete;
		private int? _foodortechan;
		private string _cover;
		private string _lon;
		private string _lat;
		private string _ytype;
		private string _playtype;
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
		public Guid FoodUUID
		{
			set{ _fooduuid=value;}
			get{return _fooduuid;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string FoodName
		{
			set{ _foodname=value;}
			get{return _foodname;}
		}
		/// <summary>
		/// ���
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
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
		/// 0.��ʳ 1.�ز�
		/// </summary>
		public int? FoodorTechan
		{
			set{ _foodortechan=value;}
			get{return _foodortechan;}
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
		/// �������� 1.������   2.�ܱ���
		/// </summary>
		public string ytype
		{
			set{ _ytype=value;}
			get{return _ytype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PlayType
		{
			set{ _playtype=value;}
			get{return _playtype;}
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

