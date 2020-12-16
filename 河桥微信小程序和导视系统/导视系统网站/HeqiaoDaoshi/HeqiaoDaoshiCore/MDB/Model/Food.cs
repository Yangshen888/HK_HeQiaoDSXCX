using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 美食特产
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
		/// 发布时间
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
		/// 名称
		/// </summary>
		public string FoodName
		{
			set{ _foodname=value;}
			get{return _foodname;}
		}
		/// <summary>
		/// 简介
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 介绍
		/// </summary>
		public string Introduction
		{
			set{ _introduction=value;}
			get{return _introduction;}
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
		/// 价格
		/// </summary>
		public string Price
		{
			set{ _price=value;}
			get{return _price;}
		}
		/// <summary>
		/// 图片
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// 0.保存中 1.已发布
		/// </summary>
		public int? State
		{
			set{ _state=value;}
			get{return _state;}
		}
		/// <summary>
		/// 0.未删 1.已删
		/// </summary>
		public int? IsDelete
		{
			set{ _isdelete=value;}
			get{return _isdelete;}
		}
		/// <summary>
		/// 0.美食 1.特产
		/// </summary>
		public int? FoodorTechan
		{
			set{ _foodortechan=value;}
			get{return _foodortechan;}
		}
		/// <summary>
		/// 封面
		/// </summary>
		public string Cover
		{
			set{ _cover=value;}
			get{return _cover;}
		}
		/// <summary>
		/// 经度
		/// </summary>
		public string Lon
		{
			set{ _lon=value;}
			get{return _lon;}
		}
		/// <summary>
		/// 纬度
		/// </summary>
		public string Lat
		{
			set{ _lat=value;}
			get{return _lat;}
		}
		/// <summary>
		/// 游玩类型 1.古镇游   2.周边游
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
		/// 商城所对应ID
		/// </summary>
		public int? ShopId
		{
			set{ _shopid=value;}
			get{return _shopid;}
		}
		#endregion Model

	}
}

