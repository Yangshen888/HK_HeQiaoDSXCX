using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 景点介绍
	/// </summary>
	[Serializable]
	public partial class ScenicSpot
	{
		public ScenicSpot()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _scenicspotuuid;
		private string _name;
		private string _spotcontent;
		private string _address;
		private string _picture;
		private string _video;
		private string _audio;
		private int? _isdelete;
		private int? _orderby;
		private int? _state;
		private Guid _tourismuuid;
		private string _type;
		private bool _isrecommend= false;
		private string _ytype;
		private string _lon;
		private string _lat;
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
		public Guid ScenicSpotUUID
		{
			set{ _scenicspotuuid=value;}
			get{return _scenicspotuuid;}
		}
		/// <summary>
		/// 名称
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 介绍
		/// </summary>
		public string SpotContent
		{
			set{ _spotcontent=value;}
			get{return _spotcontent;}
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
		/// 图片
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// 视频
		/// </summary>
		public string Video
		{
			set{ _video=value;}
			get{return _video;}
		}
		/// <summary>
		/// 音频
		/// </summary>
		public string Audio
		{
			set{ _audio=value;}
			get{return _audio;}
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
		/// 排序
		/// </summary>
		public int? OrderBy
		{
			set{ _orderby=value;}
			get{return _orderby;}
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
		/// 所属景区
		/// </summary>
		public Guid TourismUuid
		{
			set{ _tourismuuid=value;}
			get{return _tourismuuid;}
		}
		/// <summary>
		/// 类型
		/// </summary>
		public string Type
		{
			set{ _type=value;}
			get{return _type;}
		}
		/// <summary>
		/// 是否推荐   0否  1是
		/// </summary>
		public bool IsRecommend
		{
			set{ _isrecommend=value;}
			get{return _isrecommend;}
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

