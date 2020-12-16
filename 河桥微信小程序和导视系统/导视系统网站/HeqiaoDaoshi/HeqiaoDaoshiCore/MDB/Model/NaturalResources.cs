using System;
namespace HeqiaoDaoshiCore.Model
{
	/// <summary>
	/// ��Ȼ��Դ
	/// </summary>
	[Serializable]
	public partial class NaturalResources
	{
		public NaturalResources()
		{}
		#region Model
		private Guid _naturalresourcesuuid;
		private string _title;
		private bool _isrelease= false;
		private DateTime? _releasetime;
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
		public Guid NaturalResourcesUUID
		{
			set{ _naturalresourcesuuid=value;}
			get{return _naturalresourcesuuid;}
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
		/// �Ƿ񷢲�
		/// </summary>
		public bool IsRelease
		{
			set{ _isrelease=value;}
			get{return _isrelease;}
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
		/// ����
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

