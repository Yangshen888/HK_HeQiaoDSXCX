using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// �Ƽ�·�߱�
	/// </summary>
	[Serializable]
	public partial class Luxian
	{
		public Luxian()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _luxianuuid;
		private string _name;
		private string _phone;
		private string _introduction;
		private string _address;
		private string _price;
		private string _picture;
		private int? _state;
		private int? _isdelete;
		private string _cover;
		private string _addpeople;
		private string _addtime;
		private int? _count;
		private string _ytype;
		private string _playtype;
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
		public Guid LuxianUUID
		{
			set{ _luxianuuid=value;}
			get{return _luxianuuid;}
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
		/// ����
		/// </summary>
		public string Cover
		{
			set{ _cover=value;}
			get{return _cover;}
		}
		/// <summary>
		/// �����
		/// </summary>
		public string Addpeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		/// <summary>
		/// ���ʱ��
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// �������
		/// </summary>
		public int? Count
		{
			set{ _count=value;}
			get{return _count;}
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
		#endregion Model

	}
}

