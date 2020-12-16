using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ����·��
	/// </summary>
	[Serializable]
	public partial class Bus
	{
		public Bus()
		{}
		#region Model
		private int _id;
		private DateTime? _createtime= DateTime.Now;
		private Guid _busuuid;
		private string _name;
		private string _passsite;
		private string _introduction;
		private string _address;
		private string _picture;
		private int? _state;
		private int? _isdelete;
		private string _begaintime;
		private string _endtime;
		private string _begainsite;
		private string _endsite;
		private string _type;
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
		public Guid BusUuid
		{
			set{ _busuuid=value;}
			get{return _busuuid;}
		}
		/// <summary>
		/// ������·����
		/// </summary>
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
		}
		/// <summary>
		/// վ������
		/// </summary>
		public string PassSite
		{
			set{ _passsite=value;}
			get{return _passsite;}
		}
		/// <summary>
		/// ��·����
		/// </summary>
		public string Introduction
		{
			set{ _introduction=value;}
			get{return _introduction;}
		}
		/// <summary>
		/// ����λ��
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
		/// ��ʼʱ��
		/// </summary>
		public string BegainTime
		{
			set{ _begaintime=value;}
			get{return _begaintime;}
		}
		/// <summary>
		/// ĩ��ʱ��
		/// </summary>
		public string EndTime
		{
			set{ _endtime=value;}
			get{return _endtime;}
		}
		/// <summary>
		/// ��ʼվ
		/// </summary>
		public string BegainSite
		{
			set{ _begainsite=value;}
			get{return _begainsite;}
		}
		/// <summary>
		/// �յ�վ
		/// </summary>
		public string EndSite
		{
			set{ _endsite=value;}
			get{return _endsite;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string type
		{
			set{ _type=value;}
			get{return _type;}
		}
		#endregion Model

	}
}

