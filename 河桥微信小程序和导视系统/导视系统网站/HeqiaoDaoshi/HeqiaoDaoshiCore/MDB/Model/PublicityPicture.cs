using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ����ͼƬ
	/// </summary>
	[Serializable]
	public partial class PublicityPicture
	{
		public PublicityPicture()
		{}
		#region Model
		private Guid _publicitypictureuuid;
		private string _title;
		private DateTime? _releasetime;
		private bool _isrelease= false;
		private string _cover;
		private string _content;
		private DateTime? _addtime;
		private string _addpeople;
		private int _id;
		private int? _isdeleted=0;
		private string _photo;
		/// <summary>
		/// 
		/// </summary>
		public Guid PublicityPictureUUID
		{
			set{ _publicitypictureuuid=value;}
			get{return _publicitypictureuuid;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public DateTime? ReleaseTime
		{
			set{ _releasetime=value;}
			get{return _releasetime;}
		}
		/// <summary>
		/// �Ƿ񷢲�
		/// </summary>
		public bool IsRelease
		{
			set{ _isrelease=value;}
			get{return _isrelease;}
		}
		/// <summary>
		/// ����ͼƬ
		/// </summary>
		public string Cover
		{
			set{ _cover=value;}
			get{return _cover;}
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
		/// ���ʱ��
		/// </summary>
		public DateTime? AddTime
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
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// �Ƿ�ɾ�� 0δɾ  1��ɾ
		/// </summary>
		public int? IsDeleted
		{
			set{ _isdeleted=value;}
			get{return _isdeleted;}
		}
		/// <summary>
		/// 3��ͼƬ
		/// </summary>
		public string Photo
		{
			set{ _photo=value;}
			get{return _photo;}
		}
		#endregion Model

	}
}

