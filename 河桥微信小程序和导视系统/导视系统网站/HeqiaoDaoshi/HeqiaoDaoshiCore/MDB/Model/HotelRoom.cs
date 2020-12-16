using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// �Ƶ귿����Ϣ��
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
		/// ��������
		/// </summary>
		public string HotelRoomName
		{
			set{ _hotelroomname=value;}
			get{return _hotelroomname;}
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
		/// ���ͽ���
		/// </summary>
		public string Introduction
		{
			set{ _introduction=value;}
			get{return _introduction;}
		}
		/// <summary>
		/// λ��
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
		public Guid HotelUuid
		{
			set{ _hoteluuid=value;}
			get{return _hoteluuid;}
		}
		#endregion Model

	}
}

