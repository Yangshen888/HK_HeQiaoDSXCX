using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// �οͷ�����
	/// </summary>
	[Serializable]
	public partial class TourGuide
	{
		public TourGuide()
		{}
		#region Model
		private int _id;
		private Guid _tourguideuuid;
		private string _tourguidename;
		private string _phone;
		private string _releasetime;
		private int? _releasestate;
		private int? _isdeleted=0;
		private string _addtime;
		private string _addpeople;
		private string _picture;
		private string _content;
		private string _fmpicture;
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
		public Guid TourGuideUUID
		{
			set{ _tourguideuuid=value;}
			get{return _tourguideuuid;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public string TourGuideName
		{
			set{ _tourguidename=value;}
			get{return _tourguidename;}
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
		/// ����ʱ��
		/// </summary>
		public string ReleaseTime
		{
			set{ _releasetime=value;}
			get{return _releasetime;}
		}
		/// <summary>
		/// ����״̬
		/// </summary>
		public int? ReleaseState
		{
			set{ _releasestate=value;}
			get{return _releasestate;}
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
		/// 
		/// </summary>
		public string AddTime
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
		/// ͼƬ
		/// </summary>
		public string Picture
		{
			set{ _picture=value;}
			get{return _picture;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// ����ͼƬ
		/// </summary>
		public string FMPicture
		{
			set{ _fmpicture=value;}
			get{return _fmpicture;}
		}
		#endregion Model

	}
}

