using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ���Ľ���
	/// </summary>
	[Serializable]
	public partial class CulturalIntroduc
	{
		public CulturalIntroduc()
		{}
		#region Model
		private Guid _culturalintroducuuid;
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
		public Guid CulturalIntroducUUID
		{
			set{ _culturalintroducuuid=value;}
			get{return _culturalintroducuuid;}
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
		/// ����״̬  0δ����  1�ѷ���
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
		/// �Ƿ�ɾ��
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

