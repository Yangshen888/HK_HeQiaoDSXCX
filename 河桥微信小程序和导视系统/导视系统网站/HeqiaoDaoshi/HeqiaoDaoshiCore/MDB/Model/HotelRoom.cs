using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 酒店房型信息表
	/// </summary>
	[Serializable]
	public partial class HotelRoom
	{
		public HotelRoom()
		{}
		#region Model
		private int _id;
		private Guid _hotelroomuuid;
		private string _hotelroomname;
		private string _price;
		private string _introduction;
		private string _address;
		private string _picture;
		private int? _state;
		private int? _isdelete;
		private Guid _hoteluuid;
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
		public Guid HotelRoomUuid
		{
			set{ _hotelroomuuid=value;}
			get{return _hotelroomuuid;}
		}
		/// <summary>
		/// 房型名称
		/// </summary>
		public string HotelRoomName
		{
			set{ _hotelroomname=value;}
			get{return _hotelroomname;}
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
		/// 房型介绍
		/// </summary>
		public string Introduction
		{
			set{ _introduction=value;}
			get{return _introduction;}
		}
		/// <summary>
		/// 位置
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
		/// 
		/// </summary>
		public Guid HotelUuid
		{
			set{ _hoteluuid=value;}
			get{return _hoteluuid;}
		}
		#endregion Model

	}
}

