using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// 3A������Ϣ��
	/// </summary>
	[Serializable]
	public partial class Gtoilet
	{
		public Gtoilet()
		{}
		#region Model
		private Guid _gtoiletuuid;
		private int _id;
		private int? _isdeleted;
		private string _gtoiletname;
		private string _gtoiletaddress;
		private string _lon;
		private string _lat;
		private string _gtoiletstaues;
		private string _kongqizhil;
		private string _wateryujin;
		private string _addtime;
		private string _addpeople;
		private string _picture;
		/// <summary>
		/// 
		/// </summary>
		public Guid GtoiletUuid
		{
			set{ _gtoiletuuid=value;}
			get{return _gtoiletuuid;}
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
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string GtoiletName
		{
			set{ _gtoiletname=value;}
			get{return _gtoiletname;}
		}
		/// <summary>
		/// λ��
		/// </summary>
		public string GtoiletAddress
		{
			set{ _gtoiletaddress=value;}
			get{return _gtoiletaddress;}
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
		/// ʹ�����
		/// </summary>
		public string GtoiletStaues
		{
			set{ _gtoiletstaues=value;}
			get{return _gtoiletstaues;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public string KongqiZhil
		{
			set{ _kongqizhil=value;}
			get{return _kongqizhil;}
		}
		/// <summary>
		/// ˮ��Ԥ��
		/// </summary>
		public string WaterYujin
		{
			set{ _wateryujin=value;}
			get{return _wateryujin;}
		}
		/// <summary>
		/// ע��ʱ��
		/// </summary>
		public string AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// �����
		/// </summary>
		public string AddPeople
		{
			set{ _addpeople=value;}
			get{return _addpeople;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		#endregion Model

	}
}

