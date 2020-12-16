using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 停车场
	/// </summary>
	[Serializable]
	public partial class CarPark
	{
		public CarPark()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _carparkuuid;
		private string _name;
		private string _specification;
		private string _address;
		private string _price;
		private string _picture;
		private int? _state;
		private int? _isdelete;
		private int? _truckspace=0;
		private int? _surplusts=0;
		private decimal? _lon=0M;
		private decimal? _lat=0M;
		private decimal? _onep=0M;
		private decimal? _twop=0M;
		private decimal? _threep=0M;
		private decimal? _fourp=0M;
		private decimal? _outfp=0M;
		private string _chargesnotes;
		private DateTime? _addtime;
		private string _addpeople;
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
		public Guid CarParkUUID
		{
			set{ _carparkuuid=value;}
			get{return _carparkuuid;}
		}
		/// <summary>
		/// 停车场名称
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// 规格
		/// </summary>
		public string Specification
		{
			set{ _specification=value;}
			get{return _specification;}
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
		/// 状态0.保存中 1.已发布
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
		/// 总车位
		/// </summary>
		public int? TruckSpace
		{
			set{ _truckspace=value;}
			get{return _truckspace;}
		}
		/// <summary>
		/// 剩余车位
		/// </summary>
		public int? SurplusTS
		{
			set{ _surplusts=value;}
			get{return _surplusts;}
		}
		/// <summary>
		/// 经度
		/// </summary>
		public decimal? Lon
		{
			set{ _lon=value;}
			get{return _lon;}
		}
		/// <summary>
		/// 纬度
		/// </summary>
		public decimal? Lat
		{
			set{ _lat=value;}
			get{return _lat;}
		}
		/// <summary>
		/// 1小时收费
		/// </summary>
		public decimal? OneP
		{
			set{ _onep=value;}
			get{return _onep;}
		}
		/// <summary>
		/// 2小时收费
		/// </summary>
		public decimal? TwoP
		{
			set{ _twop=value;}
			get{return _twop;}
		}
		/// <summary>
		/// 3小时收费
		/// </summary>
		public decimal? ThreeP
		{
			set{ _threep=value;}
			get{return _threep;}
		}
		/// <summary>
		/// 4小时收费
		/// </summary>
		public decimal? FourP
		{
			set{ _fourp=value;}
			get{return _fourp;}
		}
		/// <summary>
		/// 超4小时收费
		/// </summary>
		public decimal? OutFP
		{
			set{ _outfp=value;}
			get{return _outfp;}
		}
		/// <summary>
		/// 收费说明
		/// </summary>
		public string ChargesNotes
		{
			set{ _chargesnotes=value;}
			get{return _chargesnotes;}
		}
		/// <summary>
		/// 添加时间
		/// </summary>
		public DateTime? AddTime
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
		#endregion Model

	}
}

